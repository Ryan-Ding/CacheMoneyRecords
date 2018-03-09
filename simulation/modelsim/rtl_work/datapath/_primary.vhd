library verilog;
use verilog.vl_types.all;
library work;
entity datapath is
    port(
        clk             : in     vl_logic;
        pcmux_sel       : in     vl_logic_vector(1 downto 0);
        load_pc         : in     vl_logic;
        storemux_sel    : in     vl_logic;
        alumux_sel      : in     vl_logic;
        regfilemux_sel  : in     vl_logic_vector(1 downto 0);
        marmux_sel      : in     vl_logic_vector(1 downto 0);
        mdrmux_sel      : in     vl_logic;
        immediatemux_sel: in     vl_logic_vector(1 downto 0);
        leamux_sel      : in     vl_logic;
        addermux_sel    : in     vl_logic;
        destmux_sel     : in     vl_logic;
        stbmux_sel      : in     vl_logic;
        load_cc         : in     vl_logic;
        load_mar        : in     vl_logic;
        load_mdr        : in     vl_logic;
        load_ir         : in     vl_logic;
        load_regfile    : in     vl_logic;
        is_even         : in     vl_logic;
        aluop           : in     work.lc3b_types.lc3b_aluop;
        mem_rdata       : in     vl_logic_vector(15 downto 0);
        sr1             : out    vl_logic_vector(2 downto 0);
        mem_wdata       : out    vl_logic_vector(15 downto 0);
        bench_enable    : out    vl_logic;
        opcode          : out    work.lc3b_types.lc3b_opcode;
        mem_address     : out    vl_logic_vector(15 downto 0);
        offset6         : out    vl_logic_vector(5 downto 0);
        imm5            : out    vl_logic_vector(4 downto 0);
        imm4            : out    vl_logic_vector(3 downto 0);
        jsr_check       : out    vl_logic
    );
end datapath;
