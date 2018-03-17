import lc3b_types::*;

module mp3
(
		wishbone.master pmem_master
);

wishbone ifetch(pmem_master.CLK);
wishbone memory(pmem_master.CLK);
wishbone icache(pmem_master.CLK);
wishbone dcache(pmem_master.CLK);
wishbone l1l2cache(pmem_master.CLK);
wishbone l2cachepmem(pmem_master.CLK);

/* Instantiate MP 0 top level blocks here */
datapath datapath
(
	.ifetch(ifetch),
	.memory(memory)

    /* declare more ports here */
);

//cpu cpu
//(
//	.wb(ifetch),
//	.wbmem(memory)
//
//);

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
	.l1l2cache(l1l2cache),
	//wishbone between physical memory and L2 cache
	.l2cachepmem(l2cachepmem),
	.pmem_master(pmem_master)
	
);

l2cache l2cache1
(
		.wb_cpu_cache(l1l2cache),
		.wb_cache_mem(l2cachepmem)
);

endmodule : mp3
