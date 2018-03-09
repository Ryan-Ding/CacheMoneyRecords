import lc3b_types::*;

module cccomp
(
    input lc3b_reg ir_in,
	 input lc3b_nzp nzp_in,
    output logic out
);

always_comb
begin
		out = (ir_in[0] & nzp_in[0]) + (ir_in[1] & nzp_in[1]) + (ir_in[2] & nzp_in[2]);
end

endmodule : cccomp
