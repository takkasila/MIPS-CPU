module mux #(parameter W = 32) (output reg [W-1:0]
	,input select_in
	,input [W-1:0] in1 ,input [W-1:0] in2);
	
	always @(*) begin
		out= 32'h00000000;

		if(select_in == 1) begin
			out = in1;
		end
		else begin
			out = in2;
		end
	end

endmodule