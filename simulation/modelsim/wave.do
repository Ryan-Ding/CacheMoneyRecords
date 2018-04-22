onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/dut/datapath/pc/load
add wave -noupdate /mp3_tb/dut/datapath/pc/in
add wave -noupdate /mp3_tb/dut/datapath/pc/out
add wave -noupdate -expand /mp3_tb/dut/datapath/regfile/data
add wave -noupdate /mp3_tb/dut/memory/CLK
add wave -noupdate /mp3_tb/dut/memory/DAT_M
add wave -noupdate /mp3_tb/dut/memory/DAT_S
add wave -noupdate /mp3_tb/dut/memory/ACK
add wave -noupdate /mp3_tb/dut/memory/CYC
add wave -noupdate /mp3_tb/dut/memory/STB
add wave -noupdate /mp3_tb/dut/memory/RTY
add wave -noupdate /mp3_tb/dut/memory/WE
add wave -noupdate /mp3_tb/dut/memory/ADR
add wave -noupdate /mp3_tb/dut/memory/SEL
add wave -noupdate /mp3_tb/dut/datapath/pred_taken
add wave -noupdate /mp3_tb/dut/datapath/btb_hit
add wave -noupdate -radix binary /mp3_tb/dut/datapath/instruction_data
add wave -noupdate -expand /mp3_tb/dut/datapath/control_out
add wave -noupdate /mp3_tb/dut/datapath/crtl_reg_id_ex_out
add wave -noupdate /mp3_tb/dut/datapath/crtl_reg_ex_mem_out
add wave -noupdate /mp3_tb/dut/datapath/crtl_reg_mem_wb_out
add wave -noupdate /mp3_tb/dut/datapath/wbisbranch
add wave -noupdate /mp3_tb/dut/datapath/flush
add wave -noupdate /mp3_tb/dut/datapath/pcmux/sel
add wave -noupdate /mp3_tb/dut/datapath/pcmux/a
add wave -noupdate /mp3_tb/dut/datapath/pcmux/b
add wave -noupdate /mp3_tb/dut/datapath/pcmux/c
add wave -noupdate /mp3_tb/dut/datapath/pcmux/d
add wave -noupdate /mp3_tb/dut/datapath/pcmux/f
add wave -noupdate /mp3_tb/dut/datapath/btb/clk
add wave -noupdate /mp3_tb/dut/datapath/btb/branch_instruction
add wave -noupdate /mp3_tb/dut/datapath/btb/pc_addr
add wave -noupdate /mp3_tb/dut/datapath/btb/wb_addr
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/old_pc_addr
add wave -noupdate /mp3_tb/dut/datapath/btb/wb_enable
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_out
add wave -noupdate /mp3_tb/dut/datapath/btb/pc_hit
add wave -noupdate /mp3_tb/dut/datapath/btb/way0_write
add wave -noupdate /mp3_tb/dut/datapath/btb/way1_write
add wave -noupdate /mp3_tb/dut/datapath/btb/way2_write
add wave -noupdate /mp3_tb/dut/datapath/btb/way3_write
add wave -noupdate /mp3_tb/dut/datapath/btb/lru_load
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/lru_state0/lru_out
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/lru_state0/wb_way_hit
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/lru_state0/lru_in
add wave -noupdate /mp3_tb/dut/datapath/btb/wb_comp0_out
add wave -noupdate /mp3_tb/dut/datapath/btb/wb_comp1_out
add wave -noupdate /mp3_tb/dut/datapath/btb/wb_comp2_out
add wave -noupdate /mp3_tb/dut/datapath/btb/wb_comp3_out
add wave -noupdate /mp3_tb/dut/datapath/btb/wb_hit
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/pc_index_offset
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/wb_index_offset
add wave -noupdate /mp3_tb/dut/datapath/btb/lru_out
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/lru_btb_array/data
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/data0/data
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/data1/data
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/data2/data
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/data3/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {145604969 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 478
configure wave -valuecolwidth 265
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
WaveRestoreZoom {145561389 ps} {145689565 ps}
