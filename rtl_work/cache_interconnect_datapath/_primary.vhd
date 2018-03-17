library verilog;
use verilog.vl_types.all;
entity cache_interconnect_datapath is
    port(
        icache_wdata    : in     vl_logic_vector(127 downto 0);
        dcache_wdata    : in     vl_logic_vector(127 downto 0);
        icache_address  : in     vl_logic_vector(15 downto 0);
        dcache_address  : in     vl_logic_vector(15 downto 0);
        icache_sel      : in     vl_logic_vector(15 downto 0);
        dcache_sel      : in     vl_logic_vector(15 downto 0);
        l2cache_wdata   : out    vl_logic_vector(127 downto 0);
        l2cache_sel     : out    vl_logic_vector(15 downto 0);
        l2cache_address : out    vl_logic_vector(15 downto 0);
        l2cache_rdata   : in     vl_logic_vector(127 downto 0);
        pmem_rdata      : in     vl_logic_vector(127 downto 0);
        pmem_address    : in     vl_logic_vector(15 downto 0);
        l2wdatamux_sel  : in     vl_logic;
        l2selmux_sel    : in     vl_logic;
        l2adrmux_sel    : in     vl_logic
    );
end cache_interconnect_datapath;
