library verilog;
use verilog.vl_types.all;
entity l2cache_control is
    port(
        clk             : in     vl_logic;
        way0_write      : out    vl_logic;
        v0_in           : out    vl_logic;
        dirty0_in       : out    vl_logic;
        way1_write      : out    vl_logic;
        v1_in           : out    vl_logic;
        dirty1_in       : out    vl_logic;
        way2_write      : out    vl_logic;
        v2_in           : out    vl_logic;
        dirty2_in       : out    vl_logic;
        way3_write      : out    vl_logic;
        v3_in           : out    vl_logic;
        dirty3_in       : out    vl_logic;
        lru_write       : out    vl_logic;
        datainmux_sel   : out    vl_logic;
        memaddrmux_sel  : out    vl_logic;
        dirty           : in     vl_logic;
        hit             : in     vl_logic;
        way_hit         : in     vl_logic_vector(1 downto 0);
        wb_way_sel      : in     vl_logic_vector(1 downto 0);
        mem_ack         : in     vl_logic;
        mem_rty         : in     vl_logic;
        mem_cyc         : out    vl_logic;
        mem_stb         : out    vl_logic;
        mem_we          : out    vl_logic;
        cpu_cyc         : in     vl_logic;
        cpu_stb         : in     vl_logic;
        cpu_we          : in     vl_logic;
        cpu_ack         : out    vl_logic;
        reginmux_sel    : out    vl_logic;
        addrregmux_sel  : out    vl_logic;
        load_mar        : out    vl_logic
    );
end l2cache_control;
