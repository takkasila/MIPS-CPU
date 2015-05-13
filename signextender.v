module signextender(output reg [31:0] extended_bits
	, input [15:0] input_bits);
	
	always @(input_bits) begin
		if(input_bits[15] == 1) begin
			extended_bits = 32'hffffffff & input_bits;		
		end
		else begin
			extended_bits = 32'h00000000 & input_bits;
		end
	end


endmodule