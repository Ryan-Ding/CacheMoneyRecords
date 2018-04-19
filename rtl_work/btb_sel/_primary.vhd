library verilog;
use verilog.vl_types.all;
entity btb_sel is
    port(
        pc_comp0_out    : in     vl_logic;
        pc_comp1_out    : in     vl_logic;
        pc_comp2_out    : in     vl_logic;
        pc_comp3_out    : in     vl_logic;
        dataout_mux_sel : out    vl_logic_vector(1 downto 0)
    );
end btb_sel;
