library verilog;
use verilog.vl_types.all;
entity mdrmask is
    port(
        \in\            : in     vl_logic_vector(15 downto 0);
        is_even         : in     vl_logic;
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end mdrmask;
