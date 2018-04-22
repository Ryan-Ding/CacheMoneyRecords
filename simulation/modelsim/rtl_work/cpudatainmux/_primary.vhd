library verilog;
use verilog.vl_types.all;
entity cpudatainmux is
    port(
        cpu_sel         : in     vl_logic_vector(15 downto 0);
        dat_o_cpu       : in     vl_logic_vector(127 downto 0);
        dat_i_cpu       : in     vl_logic_vector(127 downto 0);
        cpudatainmux_out: out    vl_logic_vector(127 downto 0)
    );
end cpudatainmux;
