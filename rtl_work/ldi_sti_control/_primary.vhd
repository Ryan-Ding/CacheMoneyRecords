library verilog;
use verilog.vl_types.all;
library work;
entity ldi_sti_control is
    port(
        clk             : in     vl_logic;
        mem_resp        : in     vl_logic;
        opcode          : in     work.lc3b_types.lc3b_opcode;
        proceed         : out    vl_logic;
        ldi_addr_register_load: out    vl_logic;
        memaddrmux_sel  : out    vl_logic
    );
end ldi_sti_control;
