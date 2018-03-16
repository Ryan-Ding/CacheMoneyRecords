module srmask
(
    input [15:0] in,
	 input logic is_even,
    output lc3b_word out
);

always_comb
begin
    if(is_even)
		out = {8'bXXXXXXXX, in[7:0]};
	else
		out = {in[7:0], 8'bXXXXXXXX};
end

endmodule : srmask