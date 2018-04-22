library verilog;
use verilog.vl_types.all;
entity cache_interconnect_control is
    port(
        clk             : in     vl_logic;
        l2wdatamux_sel  : out    vl_logic;
        l2selmux_sel    : out    vl_logic;
        l2adrmux_sel    : out    vl_logic;
        icache_we       : in     vl_logic;
        dcache_we       : in     vl_logic;
        l2cache_we      : out    vl_logic;
        icache_stb      : in     vl_logic;
        dcache_stb      : in     vl_logic;
        l2cache_stb     : out    vl_logic;
        icache_cyc      : in     vl_logic;
        dcache_cyc      : in     vl_logic;
        l2cache_cyc     : out    vl_logic;
        l2cache_ack     : in     vl_logic;
        pmem_ack        : in     vl_logic;
        icache_ack      : out    vl_logic;
        dcache_ack      : out    vl_logic
    );
end cache_interconnect_control;
