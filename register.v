module register (
	output reg [31:0] read_reg1
	, output reg [31:0] read_reg2
	, input reset, input CLK, input write_en
	, input [4:0] read_reg_addr1, input [4:0] read_reg_addr2
	, input [4:0] write_reg_addr, input [31:0] write_reg_data);

	reg [31:0] regs [31:0];
	reg i;

	always @(*) begin
		read_reg1 = regs[read_reg_addr1];
		read_reg2 = regs[read_reg_addr2];

	end

	always @(posedge CLK) begin
		if(reset) begin
			for(i=0; i<32; i=i+1) begin
				regs[i] <= 0;
			end
		end
		else if(write_en) begin
			if(write_reg_data != 0) begin
				if(write_reg_addr == 0)
					regs[write_reg_addr] <= 0;
				else
					regs[write_reg_addr] <= write_reg_data;
			end
		end
	end

endmodule