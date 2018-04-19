module btb_sel
(
    input pc_comp0_out, pc_comp1_out, pc_comp2_out, pc_comp3_out,
    output logic [1:0] dataout_mux_sel
);

always_comb
begin
    dataout_mux_sel = 2'b00;
	 if(pc_comp0_out)
		dataout_mux_sel = 2'b00;
	 else if(pc_comp1_out)
		dataout_mux_sel = 2'b01;
	 else if(pc_comp2_out)
		dataout_mux_sel = 2'b10;
	 else if(pc_comp3_out)
		dataout_mux_sel = 2'b11;
end

endmodule : btb_sel
