onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/dut/datapath/pc/in
add wave -noupdate /mp3_tb/dut/datapath/pc/out
add wave -noupdate -expand /mp3_tb/dut/datapath/regfile/data
add wave -noupdate /mp3_tb/dut/datapath/if_id_reg/in
add wave -noupdate /mp3_tb/dut/datapath/if_id_reg/out
add wave -noupdate /mp3_tb/dut/datapath/ir_if_id_out
add wave -noupdate /mp3_tb/dut/datapath/control_rom/ctrl
add wave -noupdate /mp3_tb/dut/datapath/id_ex_reg/in
add wave -noupdate /mp3_tb/dut/datapath/id_ex_reg/out
add wave -noupdate /mp3_tb/dut/datapath/alu/a
add wave -noupdate /mp3_tb/dut/datapath/alu/b
add wave -noupdate /mp3_tb/dut/datapath/alu/f
add wave -noupdate /mp3_tb/dut/datapath/ex_mem_reg/data
add wave -noupdate /mp3_tb/dut/datapath/mem_rdata
add wave -noupdate -expand /mp3_tb/dut/datapath/crtl_reg_ex_mem_out
add wave -noupdate /mp3_tb/memory/DAT_S
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15124 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 228
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {57791 ps}
