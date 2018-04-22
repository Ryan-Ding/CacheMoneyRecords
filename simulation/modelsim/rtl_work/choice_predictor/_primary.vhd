library verilog;
use verilog.vl_types.all;
entity choice_predictor is
    port(
        clk             : in     vl_logic;
        if_pc           : in     vl_logic_vector(15 downto 0);
        wb_pcplus2      : in     vl_logic_vector(15 downto 0);
        wbisbranch      : in     vl_logic;
        p0_pred_correct : in     vl_logic;
        p1_pred_correct : in     vl_logic;
        pred_select     : out    vl_logic
    );
end choice_predictor;
