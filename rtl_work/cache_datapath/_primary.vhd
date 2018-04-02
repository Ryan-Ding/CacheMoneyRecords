library verilog;
use verilog.vl_types.all;
entity cache_datapath is
    port(
        clk             : in     vl_logic;
        adr_i_cpu_in    : in     vl_logic_vector(15 downto 0);
        way0_write      : in     vl_logic;
        v0_write        : in     vl_logic;
        v0_in           : in     vl_logic;
        dirty0_write    : in     vl_logic;
        dirty0_in       : in     vl_logic;
        way1_write      : in     vl_logic;
        v1_write        : in     vl_logic;
        v1_in           : in     vl_logic;
        dirty1_write    : in     vl_logic;
        dirty1_in       : in     vl_logic;
        lru_write       : in     vl_logic;
        lru_in          : in     vl_logic;
        lru_out         : out    vl_logic;
        datainmux_sel   : in     vl_logic;
        memaddrmux_sel  : in     vl_logic;
        dirty           : out    vl_logic;
        hit             : out    vl_logic;
        hit0            : out    vl_logic;
        dat_o_cpu       : out    vl_logic_vector(127 downto 0);
        cpu_sel         : in     vl_logic_vector(15 downto 0);
        dat_i_cpu_in    : in     vl_logic_vector(127 downto 0);
        dat_o_mem       : out    vl_logic_vector(127 downto 0);
        adr_o_mem       : out    vl_logic_vector(15 downto 0);
        dat_i_mem       : in     vl_logic_vector(127 downto 0);
        load_mar        : in     vl_logic;
        load_mdr        : in     vl_logic
    );
end cache_datapath;
