library verilog;
use verilog.vl_types.all;
entity l2cache_datapath is
    port(
        clk             : in     vl_logic;
        adr_i_cpu_in    : in     vl_logic_vector(15 downto 0);
        way0_write      : in     vl_logic;
        v0_in           : in     vl_logic;
        dirty0_in       : in     vl_logic;
        way1_write      : in     vl_logic;
        v1_in           : in     vl_logic;
        dirty1_in       : in     vl_logic;
        way2_write      : in     vl_logic;
        way3_write      : in     vl_logic;
        v2_in           : in     vl_logic;
        v3_in           : in     vl_logic;
        dirty2_in       : in     vl_logic;
        dirty3_in       : in     vl_logic;
        lru_write       : in     vl_logic;
        datainmux_sel   : in     vl_logic;
        memaddrmux_sel  : in     vl_logic;
        dirty           : out    vl_logic;
        hit             : out    vl_logic;
        way_hit         : out    vl_logic_vector(1 downto 0);
        wb_way_sel      : out    vl_logic_vector(1 downto 0);
        dat_o_cpu       : out    vl_logic_vector(127 downto 0);
        cpu_sel         : in     vl_logic_vector(15 downto 0);
        dat_i_cpu       : in     vl_logic_vector(127 downto 0);
        dat_o_mem       : out    vl_logic_vector(127 downto 0);
        adr_o_mem       : out    vl_logic_vector(15 downto 0);
        dat_i_mem       : in     vl_logic_vector(127 downto 0);
        reginmux_sel    : in     vl_logic;
        addrregmux_sel  : in     vl_logic;
        load_mar        : in     vl_logic
    );
end l2cache_datapath;
