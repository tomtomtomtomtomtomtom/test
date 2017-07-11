module alu(in0, in1, op, zf, out);
	input [17:0] in0, in1;
	input [2:0] op;
	output reg zf;
	output reg [44:0] out;

	`include "def.h"

	always @(*) begin
		case(op)
			//synopsys parallel_case full_case
			CHECK : begin
				zf  <= (in0 == in1) ? 0 : 1;
			end

			LOAD  : begin
				out <= in0;
				zf  <= 0;
			end

			default: begin
				out <= out;
			end
		endcase
	end
endmodule
