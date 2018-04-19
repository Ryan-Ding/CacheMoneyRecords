library verilog;
use verilog.vl_types.all;
entity btb is
    port(
        clk             : in     vl_logic;
        branch_instruction: in     vl_logic;
        pc_addr         : in     vl_logic_vector(15 downto 0);
        wb_addr         : in     vl_logic_vector(15 downto 0);
        old_pc_addr     : in     vl_logic_vector(15 downto 0);
        wb_enable       : in     vl_logic;
        btb_out         : out    vl_logic_vector(15 downto 0);
        pc_hit          : out    vl_logic
    );
end btb;
