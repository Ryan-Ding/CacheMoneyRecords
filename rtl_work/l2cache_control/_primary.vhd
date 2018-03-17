library verilog;
use verilog.vl_types.all;
entity l2cache_control is
    port(
        clk             : in     vl_logic;
        way0_write      : out    vl_logic;
        v0_write        : out    vl_logic;
        v0_in           : out    vl_logic;
        dirty0_write    : out    vl_logic;
        dirty0_in       : out    vl_logic;
        way1_write      : out    vl_logic;
        v1_write        : out    vl_logic;
        v1_in           : out    vl_logic;
        dirty1_write    : out    vl_logic;
        dirty1_in       : out    vl_logic;
        lru_write       : out    vl_logic;
        lru_in          : out    vl_logic;
        lru_out         : in     vl_logic;
        datainmux_sel   : out    vl_logic;
        memaddrmux_sel  : out    vl_logic;
        dirty           : in     vl_logic;
        hit             : in     vl_logic;
        hit0            : in     vl_logic;
        mem_ack         : in     vl_logic;
        mem_rty         : in     vl_logic;
        mem_cyc         : out    vl_logic;
        mem_stb         : out    vl_logic;
        mem_we          : out    vl_logic;
        cpu_cyc         : in     vl_logic;
        cpu_stb         : in     vl_logic;
        cpu_we          : in     vl_logic;
        cpu_ack         : out    vl_logic
    );
end l2cache_control;
