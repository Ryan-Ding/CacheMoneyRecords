library verilog;
use verilog.vl_types.all;
library work;
entity br_ctrl is
    port(
        branch_enable   : in     vl_logic;
        opcode          : in     work.lc3b_types.lc3b_opcode;
        \out\           : out    vl_logic_vector(1 downto 0)
    );
end br_ctrl;
