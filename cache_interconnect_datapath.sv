import lc3b_types::*;

module cache_interconnect_datapath
(
	//L1 wdata SEL address rdata
	input lc3b_line icache_wdata,
	input lc3b_line dcache_wdata,
	input lc3b_word icache_address,
	input lc3b_word dcache_address,
	input lc3b_word icache_sel,
	input lc3b_word dcache_sel,
	//output lc3b_line l1cache_rdata,
	//L2 wdata SEL address rdata
	output lc3b_line l2cache_wdata,
	output lc3b_word l2cache_sel,
	output lc3b_word l2cache_address,
	input lc3b_line l2cache_rdata,
	//physical memory rdata
	input lc3b_line pmem_rdata,
	input lc3b_word pmem_address,
	//control signal
	input l2wdatamux_sel,
	input l2selmux_sel,
	input l2adrmux_sel
	
);

//icache and dcache data select
mux2 #(.width(128)) l2wdatamux
(
	.sel(l1wdatamux_sel),
	.a(icache_wdata),
	.b(dcache_wdata),
	.f(l2cache_wdata)
);

mux2 #(.width(16)) l2selmux
(
	.sel(l2selmux_sel),
	.a(icache_sel),
	.b(dcache_sel),
	.f(l2cache_sel)
);

mux2 #(.width(16)) l2adrmux
(
	.sel(l2adrmux_sel),
	.a(icache_address),
	.b(dcache_address),
	.f(l2cache_address)
);
//advance feature
//L1 cache rdata come from L2 cache and physical memory 
//mux2 #(.width(128)) l1rdatamux
//(
//	.sel(l1rdatamux_sel),
//	.a(l2cache_rdata),
//	.b(pmem_rdata),
//	.f(l1cache_rdata)
//);
//
//address_comp address_comp
//(
//	.icache_address,
//	.dcache_address,
//	.pmem_address,
//	.l1rdatamux_sel
//);


endmodule : cache_interconnect_datapath