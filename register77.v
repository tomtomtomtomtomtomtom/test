module register(src0, src1, dst, we, data, clk, rst_n, outa, outb);
	input clk, rst_n;
	input [5:0] src0, src1;
	input [5:0] dst;
	input we;
	input [17:0] data;
	output [17:0] outa, outb;

	wire [17:0] NOW, COUNT, FINDING, NEXT;

	reg [17:0] regis [60:0];
    reg [44:0] answer;
	parameter [17:0] BOARD0 = 18'b000_001_010_011_100_101,
    BOARD1 = 18'b000_001_011_100_010_101,
    BOARD2 = 18'b000_001_100_010_011_101,
    BOARD3 = 18'b000_010_001_100_011_101,
    BOARD4 = 18'b000_010_011_001_100_101,
    BOARD5 = 18'b000_010_100_011_001_101,
    BOARD6 = 18'b000_011_001_010_100_101,
    BOARD7 = 18'b000_011_010_100_001_101,
    BOARD8 = 18'b000_011_100_001_010_101,
    BOARD9 = 18'b000_100_001_011_010_101,
    BOARD10 = 18'b000_100_010_001_011_101,
    BOARD11 = 18'b000_100_011_010_001_101,
    BOARD12 = 18'b001_000_010_100_011_101,
    BOARD13 = 18'b001_000_011_010_100_101,
    BOARD14 = 18'b001_000_100_011_010_101,
    BOARD15 = 18'b001_010_000_011_100_101,
    BOARD16 = 18'b001_010_011_100_000_101,
    BOARD17 = 18'b001_010_100_000_011_101,
    BOARD18 = 18'b001_011_000_100_010_101,
    BOARD19 = 18'b001_011_010_000_100_101,
    BOARD20 = 18'b001_011_100_010_000_101,
    BOARD21 = 18'b001_100_000_010_011_101,
    BOARD22 = 18'b001_100_010_011_000_101,
    BOARD23 = 18'b001_100_011_000_010_101,
    BOARD24 = 18'b010_000_001_011_100_101,
    BOARD25 = 18'b010_000_011_100_001_101,
    BOARD26 = 18'b010_000_100_001_011_101,
    BOARD27 = 18'b010_001_000_100_011_101,
    BOARD28 = 18'b010_001_011_000_100_101,
    BOARD29 = 18'b010_001_100_011_000_101,
    BOARD30 = 18'b010_011_000_001_100_101,
    BOARD31 = 18'b010_011_001_100_000_101,
    BOARD32 = 18'b010_011_100_000_001_101,
    BOARD33 = 18'b010_100_000_011_001_101,
    BOARD34 = 18'b010_100_001_000_011_101,
    BOARD35 = 18'b010_100_011_001_000_101,
    BOARD36 = 18'b011_000_001_100_010_101,
    BOARD37 = 18'b011_000_010_001_100_101,
    BOARD38 = 18'b011_000_100_010_001_101,
    BOARD39 = 18'b011_001_000_010_100_101,
    BOARD40 = 18'b011_001_010_100_000_101,
    BOARD41 = 18'b011_001_100_000_010_101,
    BOARD42 = 18'b011_010_000_100_001_101,
    BOARD43 = 18'b011_010_001_000_100_101,
    BOARD44 = 18'b011_010_100_001_000_101,
    BOARD45 = 18'b011_100_000_001_010_101,
    BOARD46 = 18'b011_100_001_010_000_101,
    BOARD47 = 18'b011_100_010_000_001_101,
    BOARD48 = 18'b100_000_001_010_011_101,
    BOARD49 = 18'b100_000_010_011_001_101,
    BOARD50 = 18'b100_000_011_001_010_101,
    BOARD51 = 18'b100_001_000_011_010_101,
    BOARD52 = 18'b100_001_010_000_011_101,
    BOARD53 = 18'b100_001_011_010_000_101,
    BOARD54 = 18'b100_010_000_001_011_101,
    BOARD55 = 18'b100_010_001_011_000_101,
    BOARD56 = 18'b100_010_011_000_001_101,
    BOARD57 = 18'b100_011_000_010_001_101,
    BOARD58 = 18'b100_011_001_000_010_101,
    BOARD59 = 18'b100_011_010_001_000_101,
    QUESTION = 18'b100_011_010_001_000_101;
	
	always @(posedge clk) begin
		if (!rst_n) begin
			// 初期・現在の盤面
			// ####_1111_2222_3333_4444_5555_7777
			regis[0] <= BOARD0;
			regis[1] <= BOARD1;
			regis[2] <= BOARD2;
			regis[3] <= BOARD3;
			regis[4] <= BOARD4;
			regis[5] <= BOARD5;
			regis[6] <= BOARD6;
			regis[7] <= BOARD7;
			regis[8] <= BOARD8;
			regis[9] <= BOARD9;
			regis[10] <= BOARD10;
			regis[11] <= BOARD11;
			regis[12] <= BOARD12;
			regis[13] <= BOARD13;
			regis[14] <= BOARD14;
			regis[15] <= BOARD15;
			regis[16] <= BOARD16;
			regis[17] <= BOARD17;
			regis[18] <= BOARD18;
			regis[19] <= BOARD19;
			regis[20] <= BOARD20;
			regis[21] <= BOARD21;
			regis[22] <= BOARD22;
			regis[23] <= BOARD23;
			regis[24] <= BOARD24;
			regis[25] <= BOARD25;
			regis[26] <= BOARD26;
			regis[27] <= BOARD27;
			regis[28] <= BOARD28;
			regis[29] <= BOARD29;
			regis[30] <= BOARD30;
			regis[31] <= BOARD31;
			regis[32] <= BOARD32;
			regis[33] <= BOARD33;
			regis[34] <= BOARD34;
			regis[35] <= BOARD35;
			regis[36] <= BOARD36;
			regis[37] <= BOARD37;
			regis[38] <= BOARD38;
			regis[39] <= BOARD39;
			regis[40] <= BOARD40;
			regis[41] <= BOARD41;
			regis[42] <= BOARD42;
			regis[43] <= BOARD43;
			regis[44] <= BOARD44;
			regis[45] <= BOARD45;
			regis[46] <= BOARD46;
			regis[47] <= BOARD47;
			regis[48] <= BOARD48;
			regis[49] <= BOARD49;
			regis[50] <= BOARD50;
			regis[51] <= BOARD51;
			regis[52] <= BOARD52;
			regis[53] <= BOARD53;
			regis[54] <= BOARD54;
			regis[55] <= BOARD55;
			regis[56] <= BOARD56;
			regis[57] <= BOARD57;
			regis[58] <= BOARD58;
			regis[59] <= BOARD59;
            regis[60] <= QUESTION;
            answer <= 0;
		end else begin
			if (we) begin
				regis[dst] <= data;
			end else begin
				regis[dst] <= regis[dst];
			end
		end
	end

	assign outa = regis[src0];
	assign outb = regis[src1];
	assign NOW = regis[0];
	assign COUNT = regis[2];
	assign FINDING = regis[3];
	assign NEXT = regis[4];
endmodule
