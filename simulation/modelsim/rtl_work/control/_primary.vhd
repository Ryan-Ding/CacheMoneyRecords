library verilog;
use verilog.vl_types.all;
library work;
entity control is
    port(
        clk             : in     vl_logic;
        opcode          : in     work.lc3b_types.lc3b_opcode;
        bench_enable    : in     vl_logic;
        jsr_check       : in     vl_logic;
        offset6         : in     vl_logic_vector(5 downto 0);
        imm5            : in     vl_logic_vector(4 downto 0);
        imm4            : in     vl_logic_vector(3 downto 0);
        sr1             : in     vl_logic_vector(2 downto 0);
        is_even         : out    vl_logic;
        load_pc         : out    vl_logic;
        load_ir         : out    vl_logic;
        load_regfile    : out    vl_logic;
        marmux_sel      : out    vl_logic_vector(1 downto 0);
        load_mar        : out    vl_logic;
        mdrmux_sel      : out    vl_logic;
        destmux_sel     : out    vl_logic;
        load_mdr        : out    vl_logic;
        regfilemux_sel  : out    vl_logic_vector(1 downto 0);
        load_cc         : out    vl_logic;
        pcmux_sel       : out    vl_logic_vector(1 downto 0);
        alumux_sel      : out    vl_logic;
        storemux_sel    : out    vl_logic;
        immediatemux_sel: out    vl_logic_vector(1 downto 0);
        leamux_sel      : out    vl_logic;
        addermux_sel    : out    vl_logic;
        stbmux_sel      : out    vl_logic;
        aluop           : out    work.lc3b_types.lc3b_aluop;
        mem_resp        : in     vl_logic;
        mem_address     : in     vl_logic_vector(15 downto 0);
        mem_read        : out    vl_logic;
        mem_write       : out    vl_logic;
        mem_byte_enable : out    vl_logic_vector(1 downto 0)
    );
end control;
