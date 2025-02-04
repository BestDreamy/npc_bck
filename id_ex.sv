module id_ex (
    input  [`ysyx_23060251_opinfo_bus]     d_opinfo_i,
    input  [`ysyx_23060251_alu_bus]        d_alu_info_i,
    input  [`ysyx_23060251_branch_bus]     d_branch_info_i,
    input  [`ysyx_23060251_sys_bus]        d_sys_info_i,
    input                                  d_wenReg_i,
    input                                  d_wenCsr_i,
    input  [`ysyx_23060251_rs_bus]         d_rd_i,
    input  [`ysyx_23060251_reg_bus]  	   d_src1_i,
    input  [`ysyx_23060251_reg_bus] 	   d_src2_i,
    input  [`ysyx_23060251_imm_bus]        d_imm_i,
    input                                  d_is_load_signed_i,
    input                                  d_wenMem_i,
    input                                  d_renMem_i,
    input  [`ysyx_23060251_mask_bus]       d_mask_i,

    input                                  d_valid_i, // from idu
    output                                 E_ready_o, // to idu

    output [`ysyx_23060251_opinfo_bus]     e_opinfo_o,
    output [`ysyx_23060251_alu_bus]        e_alu_info_o,
    output [`ysyx_23060251_branch_bus]     e_branch_info_o,
    output [`ysyx_23060251_sys_bus]        e_sys_info_o,
    output                                 e_wenReg_o,
    output                                 e_wenCsr_o,
    output [`ysyx_23060251_rs_bus]         e_rd_o,
    output [`ysyx_23060251_reg_bus]  	   e_src1_o,
    output [`ysyx_23060251_reg_bus] 	   e_src2_o,
    output [`ysyx_23060251_imm_bus]        e_imm_o,
    output                                 e_is_load_signed_o,
    output                                 e_wenMem_o,
    output                                 e_renMem_o,
    output [`ysyx_23060251_mask_bus]       e_mask_o,

    output                                 E_valid_o, // to exu
    input                                  e_ready_i, // from exu

    input   							   clk_i,
    input 								   rst_i
);
	pipe #(
		.DATA_WIDTH(`ysyx_23060251_opinfo)
	) opinfo_pipe (
		.clk        (clk_i),
		.rstn       (rst_i),
		.pin_valid  (d_valid_i),
		.pin_data   (d_opinfo_i),
		.pin_ready  (E_ready_o),
		.pout_valid (E_valid_o),
		.pout_data  (e_opinfo_o),
		.pout_ready (e_ready_i)
	);

	pipe #(
		.DATA_WIDTH(`ysyx_23060251_alu)
	) alu_info_pipe (
		.clk        (clk_i),
		.rstn       (rst_i),
		.pin_valid  (d_valid_i),
		.pin_data   (d_alu_info_i),
		.pin_ready  (E_ready_o),
		.pout_valid (E_valid_o),
		.pout_data  (e_alu_info_o),
		.pout_ready (e_ready_i)
	);

	pipe #(
		.DATA_WIDTH(`ysyx_23060251_branch)
	) branch_info_pipe (
		.clk        (clk_i),
		.rstn       (rst_i),
		.pin_valid  (d_valid_i),
		.pin_data   (d_branch_info_i),
		.pin_ready  (E_ready_o),
		.pout_valid (E_valid_o),
		.pout_data  (e_branch_info_o),
		.pout_ready (e_ready_i)
	);

	pipe #(
		.DATA_WIDTH(`ysyx_23060251_sys)
	) sys_info_pipe (
		.clk        (clk_i),
		.rstn       (rst_i),
		.pin_valid  (d_valid_i),
		.pin_data   (d_sys_info_i),
		.pin_ready  (E_ready_o),
		.pout_valid (E_valid_o),
		.pout_data  (e_sys_info_o),
		.pout_ready (e_ready_i)
	);

	pipe #(
		.DATA_WIDTH(1)
	) wenReg_pipe (
		.clk        (clk_i),
		.rstn       (rst_i),
		.pin_valid  (d_valid_i),
		.pin_data   (d_wenReg_i),
		.pin_ready  (E_ready_o),
		.pout_valid (E_valid_o),
		.pout_data  (e_wenReg_o),
		.pout_ready (e_ready_i)
	);

	pipe #(
		.DATA_WIDTH(1)
	) wenCsr_pipe (
		.clk        (clk_i),
		.rstn       (rst_i),
		.pin_valid  (d_valid_i),
		.pin_data   (d_wenCsr_i),
		.pin_ready  (E_ready_o),
		.pout_valid (E_valid_o),
		.pout_data  (e_wenCsr_o),
		.pout_ready (e_ready_i)
	);

	pipe #(
		.DATA_WIDTH(`ysyx_23060251_opinfo)
	) opinfo_pipe (
		.clk        (clk_i),
		.rstn       (rst_i),
		.pin_valid  (d_valid_i),
		.pin_data   (d_opinfo_i),
		.pin_ready  (E_ready_o),
		.pout_valid (E_valid_o),
		.pout_data  (e_opinfo_o),
		.pout_ready (e_ready_i)
	);

	pipe #(
		.DATA_WIDTH(`ysyx_23060251_opinfo)
	) opinfo_pipe (
		.clk        (clk_i),
		.rstn       (rst_i),
		.pin_valid  (d_valid_i),
		.pin_data   (d_opinfo_i),
		.pin_ready  (E_ready_o),
		.pout_valid (E_valid_o),
		.pout_data  (e_opinfo_o),
		.pout_ready (e_ready_i)
	);

	pipe #(
		.DATA_WIDTH(`ysyx_23060251_opinfo)
	) opinfo_pipe (
		.clk        (clk_i),
		.rstn       (rst_i),
		.pin_valid  (d_valid_i),
		.pin_data   (d_opinfo_i),
		.pin_ready  (E_ready_o),
		.pout_valid (E_valid_o),
		.pout_data  (e_opinfo_o),
		.pout_ready (e_ready_i)
	);
endmodule
