onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/dut/datapath/pc/load
add wave -noupdate /mp3_tb/dut/datapath/pc/in
add wave -noupdate /mp3_tb/dut/datapath/pc/out
add wave -noupdate /mp3_tb/dut/datapath/regfile/data
add wave -noupdate /mp3_tb/dut/datapath/pred_taken
add wave -noupdate /mp3_tb/dut/datapath/btb_hit
add wave -noupdate -radix binary /mp3_tb/dut/datapath/instruction_data
add wave -noupdate /mp3_tb/dut/datapath/control_out
add wave -noupdate /mp3_tb/dut/datapath/crtl_reg_id_ex_out
add wave -noupdate /mp3_tb/dut/datapath/crtl_reg_ex_mem_out
add wave -noupdate /mp3_tb/dut/datapath/crtl_reg_mem_wb_out
add wave -noupdate /mp3_tb/dut/datapath/wbisbranch
add wave -noupdate /mp3_tb/dut/datapath/flush
add wave -noupdate /mp3_tb/dut/ifetch/CLK
add wave -noupdate /mp3_tb/dut/ifetch/DAT_M
add wave -noupdate /mp3_tb/dut/ifetch/DAT_S
add wave -noupdate /mp3_tb/dut/ifetch/ACK
add wave -noupdate /mp3_tb/dut/ifetch/CYC
add wave -noupdate /mp3_tb/dut/ifetch/STB
add wave -noupdate /mp3_tb/dut/ifetch/RTY
add wave -noupdate /mp3_tb/dut/ifetch/WE
add wave -noupdate /mp3_tb/dut/ifetch/ADR
add wave -noupdate /mp3_tb/dut/ifetch/SEL
add wave -noupdate /mp3_tb/dut/icache/CLK
add wave -noupdate /mp3_tb/dut/icache/DAT_M
add wave -noupdate /mp3_tb/dut/icache/DAT_S
add wave -noupdate /mp3_tb/dut/icache/ACK
add wave -noupdate /mp3_tb/dut/icache/CYC
add wave -noupdate /mp3_tb/dut/icache/STB
add wave -noupdate /mp3_tb/dut/icache/RTY
add wave -noupdate /mp3_tb/dut/icache/WE
add wave -noupdate /mp3_tb/dut/icache/ADR
add wave -noupdate /mp3_tb/dut/icache/SEL
add wave -noupdate /mp3_tb/dut/icache1/cache_controller/state
add wave -noupdate /mp3_tb/dut/icache1/cache_datapath1/mar/clk
add wave -noupdate /mp3_tb/dut/icache1/cache_datapath1/mar/load
add wave -noupdate /mp3_tb/dut/icache1/cache_datapath1/mar/in
add wave -noupdate /mp3_tb/dut/icache1/cache_datapath1/mar/out
add wave -noupdate /mp3_tb/dut/icache1/cache_datapath1/mar/data
add wave -noupdate -expand /mp3_tb/dut/icache1/cache_datapath1/data0/data
add wave -noupdate /mp3_tb/dut/icache1/cache_datapath1/data1/data
add wave -noupdate /mp3_tb/dut/l1l2cache/CLK
add wave -noupdate /mp3_tb/dut/l1l2cache/DAT_M
add wave -noupdate /mp3_tb/dut/l1l2cache/DAT_S
add wave -noupdate /mp3_tb/dut/l1l2cache/ACK
add wave -noupdate /mp3_tb/dut/l1l2cache/CYC
add wave -noupdate /mp3_tb/dut/l1l2cache/STB
add wave -noupdate /mp3_tb/dut/l1l2cache/RTY
add wave -noupdate /mp3_tb/dut/l1l2cache/WE
add wave -noupdate /mp3_tb/dut/l1l2cache/ADR
add wave -noupdate /mp3_tb/dut/l1l2cache/SEL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1374466 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 364
configure wave -valuecolwidth 290
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
WaveRestoreZoom {257648 ps} {3307421 ps}
