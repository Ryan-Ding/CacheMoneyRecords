module mdrmask
(
    input [15:0] in,
	 input logic is_even,
    output lc3b_word out
);

always_comb
begin
    if(is_even)
		out = {8'b0, in[7:0]};
	else
		out = {8'b0, in[15:8]};
end

endmodule : mdrmask