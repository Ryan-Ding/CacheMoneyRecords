library verilog;
use verilog.vl_types.all;
entity l2cache is
    port(
        l2_miss_counter : out    vl_logic_vector(15 downto 0);
        l2_hit_counter  : out    vl_logic_vector(15 downto 0)
    );
end l2cache;
