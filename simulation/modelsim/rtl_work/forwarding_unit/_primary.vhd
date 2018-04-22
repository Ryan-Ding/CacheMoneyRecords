library verilog;
use verilog.vl_types.all;
library work;
entity forwarding_unit is
    port(
        if_id_sr1       : in     vl_logic_vector(2 downto 0);
        if_id_sr2       : in     vl_logic_vector(2 downto 0);
        id_ex_sr1       : in     vl_logic_vector(2 downto 0);
        id_ex_sr2       : in     vl_logic_vector(2 downto 0);
        id_ex_dest      : in     vl_logic_vector(2 downto 0);
        ex_mem_dest     : in     vl_logic_vector(2 downto 0);
        mem_wb_dest     : in     vl_logic_vector(2 downto 0);
        ex_mem_load_regfile: in     vl_logic;
        mem_wb_load_regfile: in     vl_logic;
        id_ex_sr1use    : in     vl_logic;
        id_ex_sr2use    : in     vl_logic;
        if_id_sr1use    : in     vl_logic;
        if_id_sr2use    : in     vl_logic;
        id_ex_opcode    : in     work.lc3b_types.lc3b_opcode;
        ir_id_mux_sel   : out    vl_logic;
        ctrl_id_mux_sel : out    vl_logic;
        forwardmuxsr1_sel: out    vl_logic_vector(1 downto 0);
        forwardmuxsr2_sel: out    vl_logic_vector(1 downto 0);
        forward_fetch_stall: out    vl_logic
    );
end forwarding_unit;
