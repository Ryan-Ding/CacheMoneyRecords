onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/dut/datapath/pc/in
add wave -noupdate /mp3_tb/dut/datapath/pc/out
add wave -noupdate /mp3_tb/dut/datapath/load_pc
add wave -noupdate /mp3_tb/dut/datapath/proceed
add wave -noupdate /mp3_tb/dut/datapath/icache_memrdata
add wave -noupdate -expand /mp3_tb/dut/datapath/regfile/data
add wave -noupdate /mp3_tb/dut/datapath/control_out
add wave -noupdate /mp3_tb/dut/datapath/counter_control/clk
add wave -noupdate /mp3_tb/dut/datapath/counter_control/mem_address
add wave -noupdate /mp3_tb/dut/datapath/counter_control/load_pc
add wave -noupdate /mp3_tb/dut/datapath/counter_control/l2_miss_counter
add wave -noupdate /mp3_tb/dut/datapath/counter_control/l2_hit_counter
add wave -noupdate /mp3_tb/dut/datapath/counter_control/icache_miss_counter
add wave -noupdate /mp3_tb/dut/datapath/counter_control/icache_hit_counter
add wave -noupdate /mp3_tb/dut/datapath/counter_control/dcache_miss_counter
add wave -noupdate /mp3_tb/dut/datapath/counter_control/dcache_hit_counter
add wave -noupdate /mp3_tb/dut/datapath/counter_control/br_ctrl_out
add wave -noupdate /mp3_tb/dut/datapath/counter_control/counter_read_mux_sel
add wave -noupdate /mp3_tb/dut/datapath/counter_control/counter_mux_out
add wave -noupdate /mp3_tb/dut/datapath/counter_control/counter_mux_sel
add wave -noupdate /mp3_tb/dut/datapath/counter_control/total_instruction_count
add wave -noupdate /mp3_tb/dut/datapath/counter_control/misprediction_count
add wave -noupdate /mp3_tb/dut/datapath/counter_control/total_branch_count
add wave -noupdate /mp3_tb/dut/datapath/counter_control/stall_count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {53253981 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 479
configure wave -valuecolwidth 240
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
WaveRestoreZoom {53253981 ps} {56593306 ps}
