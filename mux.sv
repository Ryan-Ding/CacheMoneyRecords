module mux2 #(parameter width = 16)
(
input sel,
input [width-1:0] a, b,
output logic [width-1:0] f
);
always_comb
begin
if (sel == 0)
f = a;
else
f = b;
end
endmodule : mux2

module mux4 #(parameter width = 16)
(
input [1:0] sel,
input [width-1:0] a, b, c, d,
output logic [width-1:0] f
);
always_comb
begin
if (sel == 2'b00)
f = a;
else if (sel == 2'b01)
f = b;
else if (sel == 2'b10)
f = c;
else
f = d;
end
endmodule : mux4

module mux8 #(parameter width = 16)
(
input [2:0] sel,
input [width-1:0] a, b, c, d, e, f, g, h,
output logic [width-1:0] out
);

always_comb
begin
	if (sel == 3'b000)
		out = a;
	else if (sel == 3'b001)
		out = b;
	else if (sel == 3'b010)
		out = c;
	else if (sel == 3'b011)
		out = d;
	else if (sel == 3'b100)
		out = e;
	else if (sel == 3'b101)
		out = f;
	else if(sel == 3'b110)
		out = g;
	else 
		out = h;
end
endmodule : mux8

module mux16 #(parameter width = 16)
(
input [3:0] sel,
input [width-1:0] a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p,
output logic [width-1:0] out
);

always_comb
begin
	if (sel == 4'b0000)
		out = a;
	else if (sel == 4'b0001)
		out = b;
	else if (sel == 4'b0010)
		out = c;
	else if (sel == 4'b0011)
		out = d;
	else if (sel == 4'b0100)
		out = e;
	else if (sel == 4'b0101)
		out = f;
	else if(sel == 4'b0110)
		out = g;
	else if(sel == 4'b0111)
		out = h;
	else if(sel == 4'b1000)
		out = i;
	else if(sel == 4'b1001)
		out = j;
	else if(sel == 4'b1010)
		out = k;
	else if(sel == 4'b1011)
		out = l;
	else if(sel == 4'b1100)
		out = m;
	else if(sel == 4'b1101)
		out = n;
	else if(sel == 4'b1110)
		out = o;
	else
		out = p;
end
endmodule : mux16
