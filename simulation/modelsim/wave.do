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
add wave -noupdate /mp3_tb/dut/datapath/regfile/data
add wave -noupdate /mp3_tb/dut/datapath/instruction_data
add wave -noupdate /mp3_tb/dut/datapath/control_out
add wave -noupdate /mp3_tb/dut/datapath/crtl_reg_id_ex_out
add wave -noupdate /mp3_tb/dut/datapath/crtl_reg_ex_mem_out
add wave -noupdate /mp3_tb/dut/datapath/crtl_reg_mem_wb_out
add wave -noupdate -expand /mp3_tb/dut/datapath/branch_detection/br_ctrl_out
add wave -noupdate /mp3_tb/dut/datapath/branch_detection/aluout_mem_wb_out
add wave -noupdate /mp3_tb/dut/datapath/branch_detection/mem_data_mem_wb_out
add wave -noupdate /mp3_tb/dut/datapath/branch_detection/predict_addr
add wave -noupdate /mp3_tb/dut/datapath/branch_detection/flush
add wave -noupdate /mp3_tb/dut/datapath/instructionmux/sel
add wave -noupdate /mp3_tb/dut/datapath/instructionmux/a
add wave -noupdate /mp3_tb/dut/datapath/instructionmux/b
add wave -noupdate /mp3_tb/dut/datapath/instructionmux/f
add wave -noupdate /mp3_tb/dut/dcache/DAT_M
add wave -noupdate /mp3_tb/dut/dcache/DAT_S
add wave -noupdate /mp3_tb/dut/dcache/ACK
add wave -noupdate /mp3_tb/dut/datapath/mem_rdata
add wave -noupdate /mp3_tb/dut/datapath/ldbmux/sel
add wave -noupdate /mp3_tb/dut/datapath/ldbmux/a
add wave -noupdate /mp3_tb/dut/datapath/ldbmux/b
add wave -noupdate /mp3_tb/dut/datapath/ldbmux/f
add wave -noupdate /mp3_tb/dut/datapath/mem_address
add wave -noupdate /mp3_tb/dut/datapath/ldi_sti_control0/clk
add wave -noupdate /mp3_tb/dut/datapath/ldi_sti_control0/mem_resp
add wave -noupdate /mp3_tb/dut/datapath/ldi_sti_control0/opcode
add wave -noupdate /mp3_tb/dut/datapath/ldi_sti_control0/proceed
add wave -noupdate /mp3_tb/dut/datapath/ldi_sti_control0/ldi_addr_register_load
add wave -noupdate /mp3_tb/dut/datapath/ldi_sti_control0/memaddrmux_sel
add wave -noupdate /mp3_tb/dut/datapath/ldi_sti_control0/sti_WE
add wave -noupdate /mp3_tb/dut/datapath/ldi_sti_control0/ldi_sti
add wave -noupdate /mp3_tb/dut/datapath/ldi_sti_control0/mem_access
add wave -noupdate /mp3_tb/dut/datapath/ldi_sti_control0/state
add wave -noupdate /mp3_tb/dut/datapath/ldi_sti_control0/next_state
add wave -noupdate /mp3_tb/dut/datapath/ldi_addr_register/clk
add wave -noupdate /mp3_tb/dut/datapath/ldi_addr_register/load
add wave -noupdate /mp3_tb/dut/datapath/ldi_addr_register/in
add wave -noupdate /mp3_tb/dut/datapath/ldi_addr_register/out
add wave -noupdate /mp3_tb/dut/datapath/ldi_addr_register/data
add wave -noupdate /mp3_tb/dut/datapath/data_mem_in
add wave -noupdate /mp3_tb/dut/datapath/memory/CLK
add wave -noupdate /mp3_tb/dut/datapath/memory/DAT_M
add wave -noupdate /mp3_tb/dut/datapath/memory/DAT_S
add wave -noupdate /mp3_tb/dut/datapath/memory/ACK
add wave -noupdate /mp3_tb/dut/datapath/memory/CYC
add wave -noupdate /mp3_tb/dut/datapath/memory/STB
add wave -noupdate /mp3_tb/dut/datapath/memory/RTY
add wave -noupdate /mp3_tb/dut/datapath/memory/WE
add wave -noupdate /mp3_tb/dut/datapath/memory/ADR
add wave -noupdate /mp3_tb/dut/datapath/memory/SEL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {14463235 ps} 0}
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
WaveRestoreZoom {14318996 ps} {15173476 ps}
