import lc3b_types::*;

/*
 * SEXT[offset-n << 1]
 */
module adj #(parameter width = 8)
(
    input [width-1:0] in,
    output lc3b_word out
);

assign out = $signed({in, 1'b0});

endmodule : adj

module sext #(parameter width = 8)
(
    input [width-1:0] in,
    output lc3b_word out
);

assign out = $signed(in);

endmodule : sext

module zext #(parameter width = 8)
(
    input [width-1:0] in,
    output lc3b_word out
);

assign out = $unsigned(in);

endmodule : zext






module zext_shift #(parameter width = 8)
(
    input [width-1:0] in,
    output lc3b_word out
);

assign out = $unsigned({in, 1'b0});

endmodule : zext_shift












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
