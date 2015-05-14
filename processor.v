`include "program_counter.v"
`include "adder.v"
`include "inst_rom.v"
`include "controller.v"
`include "mux.v"
`include "register.v"
`include "signextender.v"
`include "alu.v"
`include "data_memory.v"

module processor(
	input clock
	, input reset
	, input [7:0] serial_in
	, input serial_valid_in
	, input serial_ready_in
	, output serial_rden_out
	, output [7:0] serial_out
	, output serial_wren_out);

	wire [31:0] program_addr_in;
	wire [31:0] program_addr;

	program_counter program_counter_modl(
		program_addr
		, reset, clock
		, program_addr_in);

	adder adder_modl(
		program_addr_in
		, program_addr);

	wire [31:0] instruction;

	inst_rom inst_rom_modl(
		clock, reset
		, program_addr_in
		, instruction);

	wire RegDst;
	wire Branch;
	wire MemRead;
	wire MemtoReg;
	wire MemWrite;
	wire ALUSrc;
	wire RegWrite;
	wire [5:0] ALUSelectFunc;

	controller controller_modl(
		RegDst
		, Branch
		, MemRead
		, MemtoReg
		, MemWrite
		, ALUSrc
		, RegWrite
		, ALUSelectFunc
		, instruction[31:26]
		, instruction[5:0]);

	wire [4:0] write_reg_addr;

	mux #(5) mux_WriteRegisterSrc_modl (
		write_reg_addr
		, RegDst
		, instruction[20:16]
		, instruction[15:11]);

	wire [31:0] read_reg1;
	wire [31:0] read_reg2;
	wire [31:0] write_reg_data;

	register register_modl(
		read_reg1, read_reg2
		, reset, clock, RegWrite
		, instruction[25:21], instruction[20:16]
		, write_reg_addr, write_reg_data);

	wire [31:0] imm_input;

	signextender signextender_modl(
		imm_input
		, instruction[15:0]);

	wire [31:0] ALU_B_in;

	mux #(32) mux_B_in_modl (
		ALU_B_in
		, ALUSrc
		, read_reg2
		, imm_input);

	wire [31:0] ALU_result;
	wire Branch_out;
	wire Jump_out;

	alu alu_modl(
		ALUSelectFunc
		, read_reg1
		, read_reg2
		, ALU_result
		, Branch_out
		, Jump_out);

	wire [31:0] read_mem_data;

	data_memory data_memory_modl(
		clock, reset
		, ALU_result
		, read_reg2
		, MemRead
		, MemWrite
		, 2'b11
		, read_mem_data
		, serial_in
		, serial_ready_in
		, serial_valid_in
		, serial_out
		, serial_rden_out
		, serial_wren_out);

	mux #(32) mux_writeBack_reg_modl(
		write_reg_data
		, MemtoReg
		, ALU_result
		, read_mem_data);

endmodule