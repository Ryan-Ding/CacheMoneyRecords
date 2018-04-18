library verilog;
use verilog.vl_types.all;
entity pattern_hist_table is
    generic(
        entry           : integer := 8
    );
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        \in\            : in     vl_logic_vector(1 downto 0);
        read_index      : in     vl_logic_vector;
        write_index     : in     vl_logic_vector;
        pht_out         : out    vl_logic_vector(1 downto 0);
        current_state   : out    vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of entry : constant is 1;
end pattern_hist_table;
