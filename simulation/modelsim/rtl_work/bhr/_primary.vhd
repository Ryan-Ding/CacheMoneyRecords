library verilog;
use verilog.vl_types.all;
entity bhr is
    generic(
        width           : integer := 4
    );
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        taken           : in     vl_logic;
        bhrout          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end bhr;
