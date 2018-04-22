library verilog;
use verilog.vl_types.all;
entity ewb_datapath is
    port(
        clk             : in     vl_logic;
        load_data       : in     vl_logic;
        cpu_addr        : in     vl_logic_vector(15 downto 0);
        cpu_wdata       : in     vl_logic_vector(127 downto 0);
        datamux_sel     : in     vl_logic;
        mem_wdata       : out    vl_logic_vector(127 downto 0);
        mem_addr        : out    vl_logic_vector(15 downto 0)
    );
end ewb_datapath;
