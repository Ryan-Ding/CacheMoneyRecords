library verilog;
use verilog.vl_types.all;
entity btb_control is
    port(
        wb_enable       : in     vl_logic;
        pc_hit          : in     vl_logic;
        wb_hit          : in     vl_logic;
        wb_comp0_out    : in     vl_logic;
        wb_comp1_out    : in     vl_logic;
        wb_comp2_out    : in     vl_logic;
        wb_comp3_out    : in     vl_logic;
        lru_out         : in     vl_logic_vector(2 downto 0);
        way0_write      : out    vl_logic;
        way1_write      : out    vl_logic;
        way2_write      : out    vl_logic;
        way3_write      : out    vl_logic;
        lru_load        : out    vl_logic
    );
end btb_control;
