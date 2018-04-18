onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/dut/datapath/pc/in
add wave -noupdate /mp3_tb/dut/datapath/pc/out
add wave -noupdate /mp3_tb/dut/datapath/load_pc
add wave -noupdate /mp3_tb/dut/datapath/proceed
add wave -noupdate /mp3_tb/dut/datapath/icache_memrdata
add wave -noupdate -expand /mp3_tb/dut/datapath/regfile/data
add wave -noupdate /mp3_tb/dut/datapath/instruction_data
add wave -noupdate /mp3_tb/dut/datapath/control_out
add wave -noupdate /mp3_tb/dut/datapath/crtl_reg_id_ex_out
add wave -noupdate /mp3_tb/dut/datapath/crtl_reg_ex_mem_out
add wave -noupdate /mp3_tb/dut/datapath/crtl_reg_mem_wb_out
add wave -noupdate /mp3_tb/dut/datapath/sti_WE
add wave -noupdate /mp3_tb/dut/datapath/forwardmuxsr2/sel
add wave -noupdate /mp3_tb/dut/datapath/forwardmuxsr2/a
add wave -noupdate /mp3_tb/dut/datapath/forwardmuxsr2/b
add wave -noupdate /mp3_tb/dut/datapath/forwardmuxsr2/c
add wave -noupdate /mp3_tb/dut/datapath/forwardmuxsr2/d
add wave -noupdate /mp3_tb/dut/datapath/forwardmuxsr2/f
add wave -noupdate /mp3_tb/dut/datapath/sr2_ex_mem_out
add wave -noupdate /mp3_tb/dut/datapath/wdata
add wave -noupdate /mp3_tb/dut/datapath/data_mem_in
add wave -noupdate /mp3_tb/dut/datapath/mem_rdata
add wave -noupdate /mp3_tb/dut/datapath/mdrmask/in
add wave -noupdate /mp3_tb/dut/datapath/mdrmask/is_even
add wave -noupdate /mp3_tb/dut/datapath/mdrmask/out
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
add wave -noupdate /mp3_tb/dut/datapath/mem_address
add wave -noupdate /mp3_tb/dut/datapath/flush
add wave -noupdate /mp3_tb/dut/dcache/DAT_M
add wave -noupdate /mp3_tb/dut/dcache/DAT_S
add wave -noupdate /mp3_tb/dut/dcache/ACK
add wave -noupdate /mp3_tb/dut/dcache/CYC
add wave -noupdate /mp3_tb/dut/dcache/STB
add wave -noupdate /mp3_tb/dut/dcache/RTY
add wave -noupdate /mp3_tb/dut/dcache/WE
add wave -noupdate /mp3_tb/dut/dcache/ADR
add wave -noupdate /mp3_tb/dut/dcache/SEL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3395961 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 317
configure wave -valuecolwidth 273
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
WaveRestoreZoom {3318903 ps} {3534606 ps}
