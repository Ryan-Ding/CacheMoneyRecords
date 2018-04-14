library verilog;
use verilog.vl_types.all;
entity ewb_control is
    port(
        clk             : in     vl_logic;
        cpu_we          : in     vl_logic;
        mem_ack         : in     vl_logic;
        cpu_stb         : in     vl_logic;
        cpu_cyc         : in     vl_logic;
        cpu_ack         : out    vl_logic;
        mem_stb         : out    vl_logic;
        mem_cyc         : out    vl_logic;
        mem_we          : out    vl_logic;
        load_data       : out    vl_logic;
        datamux_sel     : out    vl_logic
    );
end ewb_control;
