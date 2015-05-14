module program_counter (output reg [31:0] program_address
	,input reset, input CLK
	,input [31:0] in_address);

	always @(posedge CLK) begin
		if(reset == 1) begin
			program_address <= 32'h003ffffc;
		end
		else begin
			program_address <= in_address;
		end
	end
endmodule