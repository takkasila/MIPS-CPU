module signextender(output reg [31:0] extended_bits
	, input [15:0] input_bits);
  
	always @(input_bits) begin
   		extended_bits[15:0] <= input_bits[15:0];
		if(input_bits[15] == 1) begin
          extended_bits[31:16] = 16'b1111111111111111;		
		end
		else begin
          extended_bits[31:16] = 16'b0;
		end
	end
endmodule