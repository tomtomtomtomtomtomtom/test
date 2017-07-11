module decoder(op, zf, pc_in, pc_we, src0, src1, dst, reg_we, sel1, sel2, data, alu_op, mem_we);
	input [15:0] op;
	input zf;
	output reg [11:0] pc_in;
	output reg pc_we;
	output reg [5:0] src0, src1, dst;
	output reg reg_we;
	output reg sel1, sel2;
	output reg [27:0] data;
	output reg [2:0] alu_op;
	output reg mem_we;

	`include "def.h"

	always @(*) begin
			case(op[43:36])
			//synopsys parallel_case full_case
			CHECK : begin
				alu_op <= op[15:13];
				dst    <= 0;
				src1   <= 60;
				src0   <= op[12:7];
				pc_in  <= 0;
				pc_we  <= 0;
				reg_we <= 0;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			JMP   : begin
				alu_op <= op[15:13];
				dst    <= 0;
				src1   <= 0;
				src0   <= 0;
				pc_in  <= op[12:0];
				pc_we  <= 1;
				reg_we <= 0;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			JNZ : begin
				alu_op <= op[15:13];
				dst    <= 0;
				src1   <= 0;
				src0   <= 0;
				pc_in  <= op[12:0];
				pc_we  <= zf;
				reg_we <= 0;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			LOAD : begin
				alu_op <= op[15:13];
				dst    <= 61;
				src1   <= 0;
				src0   <= 0;
				pc_in  <= op[12:0];
				pc_we  <= zf;
				reg_we <= 0;
				sel1   <= 1;
				sel2   <= 0;
				data   <= 0;
				mem_we <= 0;
			end

			default : begin
				pc_we  <= 0;
			end

		endcase
	end
endmodule
