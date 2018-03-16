import lc3b_types::*;

module srmask
(
    input [15:0] in,
	 input logic is_even,
    output lc3b_word out
);

assign out = {in[7:0], in[7:0]};


endmodule : srmask