import lc3b_types::*;

module mp3
(
		wishbone.master ifetch,
		wishbone.master memory
   
);



/* Instantiate MP 0 top level blocks here */
datapath datapath
(
	.ifetch,
	.memory

    /* declare more ports here */
);


endmodule : mp3
