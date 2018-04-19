library verilog;
use verilog.vl_types.all;
entity local_br_predictor is
    port(
        clk             : in     vl_logic;
        if_pc           : in     vl_logic_vector(15 downto 0);
        wb_pcplus2      : in     vl_logic_vector(15 downto 0);
        wbisbranch      : in     vl_logic;
        actual_taken    : in     vl_logic;
        lc_pred_taken   : out    vl_logic;
        lc_pred_correct : out    vl_logic
    );
end local_br_predictor;
