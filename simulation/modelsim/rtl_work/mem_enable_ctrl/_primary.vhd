library verilog;
use verilog.vl_types.all;
library work;
entity mem_enable_ctrl is
    port(
        opcode          : in     work.lc3b_types.lc3b_opcode;
        is_even         : in     vl_logic;
        \out\           : out    vl_logic_vector(1 downto 0)
    );
end mem_enable_ctrl;
