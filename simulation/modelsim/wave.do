onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/dut/datapath/pc/in
add wave -noupdate /mp3_tb/dut/datapath/pc/out
add wave -noupdate /mp3_tb/dut/datapath/load_pc
add wave -noupdate /mp3_tb/dut/datapath/proceed
add wave -noupdate /mp3_tb/dut/datapath/icache_memrdata
add wave -noupdate -expand /mp3_tb/dut/datapath/regfile/data
add wave -noupdate /mp3_tb/dut/datapath/instruction_data
add wave -noupdate /mp3_tb/dut/datapath/control_out
add wave -noupdate /mp3_tb/dut/l2cache1/l2cache_controller/state
add wave -noupdate /mp3_tb/dut/ewb_l2_pmem/ewb_control/clk
add wave -noupdate /mp3_tb/dut/ewb_l2_pmem/ewb_control/cpu_we
add wave -noupdate /mp3_tb/dut/ewb_l2_pmem/ewb_control/mem_ack
add wave -noupdate /mp3_tb/dut/ewb_l2_pmem/ewb_control/cpu_stb
add wave -noupdate /mp3_tb/dut/ewb_l2_pmem/ewb_control/cpu_cyc
add wave -noupdate /mp3_tb/dut/ewb_l2_pmem/ewb_control/cpu_ack
add wave -noupdate /mp3_tb/dut/ewb_l2_pmem/ewb_control/mem_stb
add wave -noupdate /mp3_tb/dut/ewb_l2_pmem/ewb_control/mem_cyc
add wave -noupdate /mp3_tb/dut/ewb_l2_pmem/ewb_control/mem_we
add wave -noupdate /mp3_tb/dut/ewb_l2_pmem/ewb_control/load_data
add wave -noupdate /mp3_tb/dut/ewb_l2_pmem/ewb_control/datamux_sel
add wave -noupdate /mp3_tb/dut/ewb_l2_pmem/ewb_control/state
add wave -noupdate /mp3_tb/dut/ewb_l2_pmem/ewb_control/next_states
add wave -noupdate /mp3_tb/dut/pmem_master/CLK
add wave -noupdate /mp3_tb/dut/pmem_master/DAT_M
add wave -noupdate /mp3_tb/dut/pmem_master/DAT_S
add wave -noupdate /mp3_tb/dut/pmem_master/ACK
add wave -noupdate /mp3_tb/dut/pmem_master/CYC
add wave -noupdate /mp3_tb/dut/pmem_master/STB
add wave -noupdate /mp3_tb/dut/pmem_master/RTY
add wave -noupdate /mp3_tb/dut/pmem_master/WE
add wave -noupdate /mp3_tb/dut/pmem_master/ADR
add wave -noupdate /mp3_tb/dut/pmem_master/SEL
add wave -noupdate /mp3_tb/dut/ewb_l2_pmem/ewb_datapath/ewb_data_reg/data
add wave -noupdate /mp3_tb/dut/ewb_l2_pmem/ewb_datapath/ewb_addr_reg/data
add wave -noupdate /mp3_tb/dut/l2ewb/CLK
add wave -noupdate /mp3_tb/dut/l2ewb/DAT_M
add wave -noupdate /mp3_tb/dut/l2ewb/DAT_S
add wave -noupdate /mp3_tb/dut/l2ewb/ACK
add wave -noupdate /mp3_tb/dut/l2ewb/CYC
add wave -noupdate /mp3_tb/dut/l2ewb/STB
add wave -noupdate /mp3_tb/dut/l2ewb/RTY
add wave -noupdate /mp3_tb/dut/l2ewb/WE
add wave -noupdate /mp3_tb/dut/l2ewb/ADR
add wave -noupdate /mp3_tb/dut/l2ewb/SEL
add wave -noupdate /mp3_tb/dut/ewb_l2_pmem/ewb_control/full
add wave -noupdate /mp3_tb/dut/ewb_l2_pmem/ewb_control/next_full
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1422992 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 417
configure wave -valuecolwidth 308
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {8203128 ps}
