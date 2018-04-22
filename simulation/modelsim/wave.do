onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/dut/datapath/pc/load
add wave -noupdate /mp3_tb/dut/datapath/proceed
add wave -noupdate /mp3_tb/dut/ifetch/ACK
add wave -noupdate /mp3_tb/dut/datapath/forward_fetch_stall
add wave -noupdate /mp3_tb/dut/datapath/pc/in
add wave -noupdate /mp3_tb/dut/datapath/pc/out
add wave -noupdate -expand /mp3_tb/dut/datapath/regfile/data
add wave -noupdate /mp3_tb/dut/datapath/pred_taken
add wave -noupdate /mp3_tb/dut/datapath/btb_hit
add wave -noupdate -radix binary /mp3_tb/dut/datapath/instruction_data
add wave -noupdate /mp3_tb/dut/datapath/control_out
add wave -noupdate /mp3_tb/dut/datapath/crtl_reg_id_ex_out
add wave -noupdate /mp3_tb/dut/datapath/crtl_reg_ex_mem_out
add wave -noupdate /mp3_tb/dut/datapath/crtl_reg_mem_wb_out
add wave -noupdate /mp3_tb/dut/datapath/wbisbranch
add wave -noupdate /mp3_tb/dut/datapath/pcmux/sel
add wave -noupdate /mp3_tb/dut/datapath/pcmux/a
add wave -noupdate /mp3_tb/dut/datapath/pcmux/b
add wave -noupdate /mp3_tb/dut/datapath/pcmux/c
add wave -noupdate /mp3_tb/dut/datapath/pcmux/d
add wave -noupdate /mp3_tb/dut/datapath/pcmux/e
add wave -noupdate /mp3_tb/dut/datapath/pcmux/out
add wave -noupdate /mp3_tb/dut/datapath/flush
add wave -noupdate -expand /mp3_tb/dut/datapath/btb/btb_datapath0/data0/data
add wave -noupdate -expand /mp3_tb/dut/datapath/btb/btb_datapath0/data1/data
add wave -noupdate -expand /mp3_tb/dut/datapath/btb/btb_datapath0/data2/data
add wave -noupdate -expand /mp3_tb/dut/datapath/btb/btb_datapath0/data3/data
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/wb_way_hit
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/wb_hit
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/pc_addr
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/old_pc_addr
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/wb_addr
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_out
add wave -noupdate /mp3_tb/dut/datapath/btb/pc_hit
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/pc_way_hit
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/dataout_mux/sel
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/dataout_mux/a
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/dataout_mux/b
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/dataout_mux/c
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/dataout_mux/d
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/dataout_mux/f
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/lru_btb_array/data
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/lru_state0/lru_out
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/lru_state0/wb_way_hit
add wave -noupdate /mp3_tb/dut/datapath/btb/btb_datapath0/lru_state0/lru_in
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {33539419 ps} 0}
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
WaveRestoreZoom {33442460 ps} {33647540 ps}
