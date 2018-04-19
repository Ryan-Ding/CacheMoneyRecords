library verilog;
use verilog.vl_types.all;
entity btb_datapath is
    port(
        clk             : in     vl_logic;
        branch_instruction: in     vl_logic;
        pc_addr         : in     vl_logic_vector(15 downto 0);
        wb_addr         : in     vl_logic_vector(15 downto 0);
        old_pc_addr     : in     vl_logic_vector(15 downto 0);
        wb_enable       : in     vl_logic;
        way0_write      : in     vl_logic;
        way1_write      : in     vl_logic;
        way2_write      : in     vl_logic;
        way3_write      : in     vl_logic;
        lru_load        : in     vl_logic;
        pc_hit          : out    vl_logic;
        wb_hit          : out    vl_logic;
        wb_comp0_out    : out    vl_logic;
        wb_comp1_out    : out    vl_logic;
        wb_comp2_out    : out    vl_logic;
        wb_comp3_out    : out    vl_logic;
        lru_out         : out    vl_logic_vector(2 downto 0);
        btb_out         : out    vl_logic_vector(15 downto 0)
    );
end btb_datapath;
