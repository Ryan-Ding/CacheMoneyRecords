library verilog;
use verilog.vl_types.all;
entity pht_update_ctrl is
    port(
        clk             : in     vl_logic;
        actual_taken    : in     vl_logic;
        state           : in     vl_logic_vector(1 downto 0);
        next_states     : out    vl_logic_vector(1 downto 0)
    );
end pht_update_ctrl;
