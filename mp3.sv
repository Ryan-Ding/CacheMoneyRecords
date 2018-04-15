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
//wishbone l2cachepmem(pmem_master.CLK);
wishbone l2ewb(pmem_master.CLK);

lc3b_word l2_miss_counter;
lc3b_word l2_hit_counter;
lc3b_word icache_miss_counter;
lc3b_word icache_hit_counter;
lc3b_word dcache_miss_counter;
lc3b_word dcache_hit_counter;


/* Instantiate MP 0 top level blocks here */
datapath datapath
(
	.ifetch(ifetch),
	.memory(memory),
	.l2_miss_counter,
	.l2_hit_counter,
	.icache_miss_counter,
	.icache_hit_counter,
	.dcache_miss_counter,
	.dcache_hit_counter

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
		.wb_cache_mem(icache),
		.l1_miss_counter(icache_miss_counter),
		.l1_hit_counter(icache_hit_counter)

);

cache dcache1
(
		.wb_cpu_cache(memory),
		.wb_cache_mem(dcache),
		.l1_miss_counter(dcache_miss_counter),
		.l1_hit_counter(dcache_hit_counter)
);

cache_interconnect cache_interconnect
(
	//wishbone from icache and dcache
	.icache(icache),
	.dcache(dcache),
	//wishbone between L1 cache and L2 cache 
	.l1l2cache(l1l2cache)
	//wishbone between physical memory and L2 cache
//	.l2cachepmem(),
//	.pmem_master()
	
);

l2cache l2cache1
(
		.wb_cpu_cache(l1l2cache),
		.wb_cache_mem(l2ewb),
		.l2_miss_counter,
		.l2_hit_counter
);

ewb ewb_l2_pmem
(
		.wb_cpu_cache(l2ewb),
		.wb_cache_mem(pmem_master)
);


endmodule : mp3
