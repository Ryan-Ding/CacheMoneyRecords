library verilog;
use verilog.vl_types.all;
entity cache is
    port(
        l1_miss_counter : out    vl_logic_vector(15 downto 0);
        l1_hit_counter  : out    vl_logic_vector(15 downto 0)
    );
end cache;
