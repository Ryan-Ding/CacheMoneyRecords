library verilog;
use verilog.vl_types.all;
entity btb_lru_state is
    port(
        lru_out         : in     vl_logic_vector(2 downto 0);
        wb_way_hit      : in     vl_logic_vector(1 downto 0);
        lru_in          : out    vl_logic_vector(2 downto 0)
    );
end btb_lru_state;
