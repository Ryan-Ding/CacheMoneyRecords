library verilog;
use verilog.vl_types.all;
entity incremental_counter is
    port(
        clk             : in     vl_logic;
        increment       : in     vl_logic;
        clear           : in     vl_logic;
        count           : out    vl_logic_vector(15 downto 0)
    );
end incremental_counter;
