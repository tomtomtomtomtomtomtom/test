module sel(in0, in1, sel, out);
	input [17:0] in0, in1;
	input sel;
	output [18:0] out;

	assign out = (sel) ? in1 : in0;
endmodule
