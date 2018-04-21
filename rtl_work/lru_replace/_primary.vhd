library verilog;
use verilog.vl_types.all;
entity lru_replace is
    port(
        lru_out         : in     vl_logic_vector(2 downto 0);
        wb_way_sel      : out    vl_logic_vector(1 downto 0)
    );
end lru_replace;
