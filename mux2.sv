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