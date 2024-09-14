module mst2icn (
	input clk_i,
	input rst_i,
	axi_if.Master axi_mst
);
    localparam [2: 0] R_WAIT_ADDR = 3'b001, R_WAIT_ACC = 3'b010, R_DONE = 3'b100;
    // localparam [2: 0] W_WAIT_ADDR = 3'b001, W_WAIT_DATA = 3'b010, W_WAIT_DONE = 3'b100;

    reg[1: 0] r_state, r_next;
    reg[2: 0] w_state, w_next;

    wire ar_hs, r_hs, aw_hs, w_hs, b_hs;

    // ---------------------- read state machine ----------------------------
    always @(posedge clk_i) begin
        if (rst_i == `ysyx_23060251_rst_enable) begin
            r_state <= R_WAIT_ADDR;
        end else begin
            r_state <= r_next;
        end
    end

    always_comb begin
        if (r_state == R_WAIT_ADDR) begin
            if (ar_hs)
                r_next = R_WAIT_ACC;
            else
                r_next = R_WAIT_ADDR;
        end else if (r_state == R_WAIT_ACC) begin
            if (count == 0)
                r_next = R_DONE;
            else
                r_next = R_WAIT_ACC;
        end else begin // r_state == R_DONE
            if (r_hs)
                r_next = R_WAIT_ADDR;
            else
                r_next = R_DONE;
        end
    end
    // ---------------------- state machine end -------------------------------
endmodule