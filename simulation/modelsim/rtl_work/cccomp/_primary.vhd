library verilog;
use verilog.vl_types.all;
entity cccomp is
    port(
        ir_in           : in     vl_logic_vector(2 downto 0);
        nzp_in          : in     vl_logic_vector(2 downto 0);
        \out\           : out    vl_logic
    );
end cccomp;
