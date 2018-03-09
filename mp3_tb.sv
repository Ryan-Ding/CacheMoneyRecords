module mp3_tb;

timeunit 1ns;
timeprecision 1ns;

logic clk;

/* Clock generator */
initial clk = 0;
always #5 clk = ~clk;

wishbone ifetch(clk);
wishbone memory(clk);

mp3 dut(.ifetch,
	.memory);

magic_memory magic_memory
(
    .ifetch, // instruction fetch stage, assumed to never write
	 .memory // memory stage
);


endmodule : mp3_tb
