import lc3b_types::*;

module mp3
(
		wishbone.master pmem
);

wishbone ifetch(pmem.CLK);
wishbone memory(pmem.CLK);
wishbone icache(pmem.CLK);
wishbone dcache(pmem.CLK);
wishbone l2cache(pmem.CLK);


/* Instantiate MP 0 top level blocks here */
datapath datapath
(
	.ifetch,
	.memory

    /* declare more ports here */
);

cache icache1
(

		.wb_cpu_cache(ifetch),
		.wb_cache_mem(icache)
);

cache dcache1
(

		.wb_cpu_cache(memory),
		.wb_cache_mem(dcache)
);

cache_interconnect cache_interconnect
(
	//wishbone from icache and dcache
	.icache(icache),
	.dcache(dcache),
	//wishbone between L1 cache and L2 cache 
	.l2cache_slave(l2cache),
	//wishbone between physical memory and L2 cache
	.pmem_master(pmem),
	.pmem_slave(pmem)
	
);

cache l2cache1
(
		.wb_cpu_cache(l2cache),
		.wb_cache_mem(pmem)
);

endmodule : mp3
