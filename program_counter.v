module program_counter #(parameter W = 32) (output reg [W-1:0] program_address
	,input reset, input CLK
	,input [W-1:0] in_address);

	always @(posedge CLK) begin
		if(reset == 1) begin
			program_address <= 32'h003ffffc;
		end
		else begin
			program_address <= in_address;
		end
	end
endmodule