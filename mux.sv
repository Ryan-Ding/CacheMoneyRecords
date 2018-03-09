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