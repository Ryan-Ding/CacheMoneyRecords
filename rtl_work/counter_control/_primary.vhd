library verilog;
use verilog.vl_types.all;
entity counter_control is
    port(
        clk             : in     vl_logic;
        mem_address     : in     vl_logic_vector(15 downto 0);
        load_pc         : in     vl_logic;
        l2_miss_counter : in     vl_logic_vector(15 downto 0);
        l2_hit_counter  : in     vl_logic_vector(15 downto 0);
        icache_miss_counter: in     vl_logic_vector(15 downto 0);
        icache_hit_counter: in     vl_logic_vector(15 downto 0);
        dcache_miss_counter: in     vl_logic_vector(15 downto 0);
        dcache_hit_counter: in     vl_logic_vector(15 downto 0);
        br_ctrl_out     : in     vl_logic_vector(1 downto 0);
        flush           : in     vl_logic;
        instruction     : in     vl_logic_vector(15 downto 0);
        counter_read_mux_sel: out    vl_logic;
        counter_mux_out : out    vl_logic_vector(15 downto 0)
    );
end counter_control;
