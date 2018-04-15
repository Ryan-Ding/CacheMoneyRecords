library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        l2_miss_counter : in     vl_logic_vector(15 downto 0);
        l2_hit_counter  : in     vl_logic_vector(15 downto 0);
        icache_miss_counter: in     vl_logic_vector(15 downto 0);
        icache_hit_counter: in     vl_logic_vector(15 downto 0);
        dcache_miss_counter: in     vl_logic_vector(15 downto 0);
        dcache_hit_counter: in     vl_logic_vector(15 downto 0)
    );
end datapath;
