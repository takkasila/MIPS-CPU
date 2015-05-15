module adder(output reg [31:0] addr_out
	, input [31:0] addr_in);

	always @(addr_in) begin
		addr_out = addr_in + 4;
	end

endmodule