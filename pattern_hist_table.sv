module pattern_hist_table #(parameter entry = 8)
(
    input clk,
    input load,
    input [1:0] in,
    input [entry-1:0] read_index,
	 input [entry-1:0] write_index,
    output logic [1:0] pht_out, //read output
	 output logic [1:0] current_state
);

logic [1:0] data [2**entry-1:0] /* synthesis ramstyle = "logic" */;

/* Altera device registers are 0 at power on. Specify this
 * so that Modelsim works as expected.
 */
initial
begin
    for (int i = 0; i < $size(data); i++)
    begin
        data[i] = 2'b11;
    end
end

always_ff @(posedge clk)
begin
    if (load == 1)
    begin
        data[write_index] = in;
    end
end

always_comb
begin
    pht_out = data[read_index];
	 current_state = data[write_index];
end

endmodule : pattern_hist_table
