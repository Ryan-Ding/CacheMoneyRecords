library verilog;
use verilog.vl_types.all;
entity branch_detection is
    port(
        aluout_mem_wb_out: in     vl_logic_vector(15 downto 0);
        mem_data_mem_wb_out: in     vl_logic_vector(15 downto 0);
        predict_addr    : in     vl_logic_vector(15 downto 0);
        wbisbranch      : in     vl_logic;
        flush           : out    vl_logic
    );
end branch_detection;
