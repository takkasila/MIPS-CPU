module controller (
	output reg RegDst
	, output reg Branch
	, output reg MemRead
	, output reg MemtoReg
	, output reg MemWrite
	, output reg ALUSrc
	, output reg RegWrite
	, output reg [5:0] ALUSelect_out
	, input [5:0] OPCode_in
	, input [5:0] ALUSelect_in);

	always @(*) begin
		case (OPCode_in)

	        6'b000000: begin //sll,srl,sra,sllv,srlv,srav,mfhi,mthi,mflo,mtlo,mult,multu,div,divu,add,addu,sub,subu,and,or,xor,nor,slt,sltu
	            RegDst <= 1'b1;
	            RegWrite <= 1'b1;
	            ALUSrc <= 1'b0;
	            MemRead <= 1'b0;
	            MemWrite <= 1'b0;
	            MemtoReg <= 1'b0;
	            Branch <= 1'b0;
	            if (ALUSelect_in == 6'b000000) begin
	              ALUSelect_out <= 6'b100000;
	            end
	            else begin
	              ALUSelect_out <= ALUSelect_in;
	            end
	        end
	        6'b000100: begin //beq            
	          	RegDst <= 1'bx;
	            RegWrite <= 1'b0;
	            ALUSrc <= 1'b0;
	            MemRead <= 1'b0;
	            MemWrite <= 1'b0;
	            MemtoReg <= 1'bx;
	            Branch <= 1'b0;
	        end
	        6'b000101: begin //bne            
	          	RegDst <= 1'bx;
	            RegWrite <= 1'b0;
	            ALUSrc <= 1'b0;
	            MemRead <= 1'b0;
	            MemWrite <= 1'b0;
	            MemtoReg <= 1'bx;
	            Branch <= 1'b0;
	        end
	        6'b000110: begin //blez            
	          	RegDst <= 1'bx;
	            RegWrite <= 1'b0;
	            ALUSrc <= 1'b0;
	            MemRead <= 1'b0;
	            MemWrite <= 1'b0;
	            MemtoReg <= 1'bx;
	            Branch <= 1'b0;
	        end
	        6'b000111: begin //bgtz            
	          	RegDst <= 1'bx;
	            RegWrite <= 1'b0;
	            ALUSrc <= 1'b0;
	            MemRead <= 1'b0;
	            MemWrite <= 1'b0;
	            MemtoReg <= 1'bx;
	            Branch <= 1'b0;
	        end
	        6'b001000: begin //addi            
	          	RegDst <= 1'b0;
	            RegWrite <= 1'b1;
	            ALUSrc <= 1'b1;
	            MemRead <= 1'b0;
	            MemWrite <= 1'b0;
	            MemtoReg <= 1'b0;
	            Branch <= 1'b0;
	            ALUSelect_out <= 6'b100000;
	        end
	        6'b001001: begin //addiu            
	          	RegDst <= 1'b0;
	            RegWrite <= 1'b1;
	            ALUSrc <= 1'b1;
	            MemRead <= 1'b0;
	            MemWrite <= 1'b0;
	            MemtoReg <= 1'b0;
	            Branch <= 1'b0;
	            ALUSelect_out <= 6'b100000;            
	        end
	        6'b001010: begin //slti            
	          	RegDst <= 1'b0;
	            RegWrite <= 1'b1;
	            ALUSrc <= 1'b1;
	            MemRead <= 1'b0;
	            MemWrite <= 1'b0;
	  	        MemtoReg <= 1'b0;
	            Branch <= 1'b0;
	            ALUSelect_out <= 6'b101000;
	        end
	        6'b001011: begin //sltiu            
	          	RegDst <= 1'b0;
	            RegWrite <= 1'b1;
	            ALUSrc <= 1'b1;
	            MemRead <= 1'b0;
	            MemWrite <= 1'b0;
	            MemtoReg <= 1'b0;
	            Branch <= 1'b0;
	            ALUSelect_out <= 6'b101001;
	        end
	        6'b001100: begin //andi            
	          	RegDst <= 1'b0;
	            RegWrite <= 1'b1;
	            ALUSrc <= 1'b1;
	            MemRead <= 1'b0;
	            MemWrite <= 1'b0;
	            MemtoReg <= 1'b0;
	            Branch <= 1'b0;
	            ALUSelect_out <= 6'b100100;
	        end
	        6'b001101: begin //ori            
	          	RegDst <= 1'b0;
	            RegWrite <= 1'b1;
	            ALUSrc <= 1'b1;
	            MemRead <= 1'b0;
	            MemWrite <= 1'b0;
	            MemtoReg <= 1'b0;
	            Branch <= 1'b0;
	            ALUSelect_out <= 6'b100101;
	        end
	        6'b001110: begin //xori            
	          	RegDst <= 1'b0;
	            RegWrite <= 1'b1;
	            ALUSrc <= 1'b1;
	            MemRead <= 1'b0;
	            MemWrite <= 1'b0;
	            MemtoReg <= 1'b0;
	            Branch <= 1'b0;
	            ALUSelect_out <= 6'b100000;
	        end
	        6'b011001: begin //lhi            
	          	RegDst <= 1'b0;
	            RegWrite <= 1'b1;
	            ALUSrc <= 1'b1;
	            MemRead <= 1'b1;
	            MemWrite <= 1'b0;
	            MemtoReg <= 1'b1;
	            Branch <= 1'b0;
	            ALUSelect_out <= 6'b100000;
	        end
	        6'b100000: begin //lb            
	          	RegDst <= 1'b0;
	            RegWrite <= 1'b1;
	            ALUSrc <= 1'b0;
	            MemRead <= 1'b1;
	            MemWrite <= 1'b0;
	            MemtoReg <= 1'b1;
	            Branch <= 1'b0;
	            ALUSelect_out <= 6'b100000;
	        end
	        6'b100001: begin //lh            
	          	RegDst <= 1'b0;
	            RegWrite <= 1'b1;
	            ALUSrc <= 1'b0;
	            MemRead <= 1'b1;
	            MemWrite <= 1'b0;
	            MemtoReg <= 1'b1;
	            Branch <= 1'b0;
	            ALUSelect_out <= 6'b100000;
	        end
	        6'b100011: begin //lw            
	          	RegDst <= 1'b0;
	            RegWrite <= 1'b1;
	            ALUSrc <= 1'b1;
	            MemRead <= 1'b1;
	            MemWrite <= 1'b0;
	            MemtoReg <= 1'b1;
	            Branch <= 1'b0;
	            ALUSelect_out <= 6'b100000;
	        end
	        6'b100100: begin //lbu            
	          	RegDst <= 1'b0;
	            RegWrite <= 1'b1;
	            ALUSrc <= 1'b0;
	            MemRead <= 1'b1;
	            MemWrite <= 1'b0;
	            MemtoReg <= 1'b1;
	            Branch <= 1'b0;
	            ALUSelect_out <= 6'b100000;
	        end
	        6'b100101: begin //lhu            
	          	RegDst <= 1'b0;
	            RegWrite <= 1'b1;
	            ALUSrc <= 1'b0;
	            MemRead <= 1'b1;
	            MemWrite <= 1'b0;
	            MemtoReg <= 1'b1;
	            Branch <= 1'b0;
	            ALUSelect_out <= 6'b100000;
	        end
	        6'b101000: begin //sb            
	          	RegDst <= 1'bx;
	            RegWrite <= 1'b0;
	            ALUSrc <= 1'b1;
	            MemRead <= 1'b0;
	            MemWrite <= 1'b1;
	            MemtoReg <= 1'bx;
	            Branch <= 1'b0;
	            ALUSelect_out <= 6'b100000;
	        end
	        6'b101001: begin //sh            
	          	RegDst <= 1'bx;
	            RegWrite <= 1'b0;
	            ALUSrc <= 1'b1;
	            MemRead <= 1'b0;
	            MemWrite <= 1'b1;
	            MemtoReg <= 1'bx;
	            Branch <= 1'b0;
	            ALUSelect_out <= 6'b100000;
	        end
	        6'b101011: begin //sw            
	          	RegDst <= 1'bx;
	            RegWrite <= 1'b0;
	            ALUSrc <= 1'b1;
	            MemRead <= 1'b0;
	            MemWrite <= 1'b1;
	            MemtoReg <= 1'bx;
	            Branch <= 1'b0;
	            ALUSelect_out <= 6'b100000;
	        end
	    endcase
	end

endmodule