import lc3b_types::*;

module incremental_counter
(
	 input clk,
    input increment,
	 input clear,
    output logic [15:0] count
);

initial
begin
    count = 16'b0;
end

always_ff @(negedge clk)
begin
	 if (clear == 1)
		count = 16'b0;
    else if (increment == 1)
    begin
       count++;
    end
end


endmodule : incremental_counter
