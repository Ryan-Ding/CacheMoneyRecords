onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/dut/datapath/pc/in
add wave -noupdate /mp3_tb/dut/datapath/pc/out
add wave -noupdate /mp3_tb/dut/datapath/load_pc
add wave -noupdate /mp3_tb/dut/datapath/proceed
add wave -noupdate /mp3_tb/dut/datapath/icache_memrdata
add wave -noupdate -expand /mp3_tb/dut/datapath/regfile/data
add wave -noupdate /mp3_tb/dut/datapath/control_out
add wave -noupdate /mp3_tb/dut/datapath/crtl_reg_id_ex_out
add wave -noupdate /mp3_tb/dut/datapath/crtl_reg_ex_mem_out
add wave -noupdate /mp3_tb/dut/datapath/crtl_reg_mem_wb_out
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/if_id_sr1
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/if_id_sr2
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/id_ex_sr1
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/id_ex_sr2
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/id_ex_dest
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/ex_mem_dest
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/mem_wb_dest
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/ex_mem_load_regfile
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/mem_wb_load_regfile
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/id_ex_sr1use
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/id_ex_sr2use
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/if_id_sr1use
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/if_id_sr2use
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/id_ex_opcode
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/ir_id_mux_sel
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/ctrl_id_mux_sel
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/forwardmuxsr1_sel
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/forwardmuxsr2_sel
add wave -noupdate /mp3_tb/dut/datapath/forwarding_unit/forward_fetch_stall
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/dut/datapath/regfile/load
add wave -noupdate /mp3_tb/dut/datapath/regfile/in
add wave -noupdate /mp3_tb/dut/datapath/regfile/src_a
add wave -noupdate /mp3_tb/dut/datapath/regfile/src_b
add wave -noupdate /mp3_tb/dut/datapath/regfile/dest
add wave -noupdate /mp3_tb/dut/datapath/regfile/reg_a
add wave -noupdate /mp3_tb/dut/datapath/regfile/reg_b
add wave -noupdate -expand /mp3_tb/dut/datapath/regfile/data
add wave -noupdate /mp3_tb/dut/dcache/DAT_M
add wave -noupdate /mp3_tb/dut/dcache/DAT_S
add wave -noupdate /mp3_tb/dut/cache_interconnect/cache_interconnect_control/state
add wave -noupdate /mp3_tb/dut/datapath/instruction_data
add wave -noupdate /mp3_tb/dut/icache1/cache_controller/state
add wave -noupdate /mp3_tb/dut/datapath/forwardmuxsr1/sel
add wave -noupdate /mp3_tb/dut/datapath/forwardmuxsr1/a
add wave -noupdate /mp3_tb/dut/datapath/forwardmuxsr1/b
add wave -noupdate /mp3_tb/dut/datapath/forwardmuxsr1/c
add wave -noupdate /mp3_tb/dut/datapath/forwardmuxsr1/d
add wave -noupdate /mp3_tb/dut/datapath/forwardmuxsr1/f
add wave -noupdate /mp3_tb/dut/datapath/forwardmuxsr2/sel
add wave -noupdate /mp3_tb/dut/datapath/forwardmuxsr2/a
add wave -noupdate /mp3_tb/dut/datapath/forwardmuxsr2/b
add wave -noupdate /mp3_tb/dut/datapath/forwardmuxsr2/c
add wave -noupdate /mp3_tb/dut/datapath/forwardmuxsr2/d
add wave -noupdate /mp3_tb/dut/datapath/forwardmuxsr2/f
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {35631305 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 376
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
WaveRestoreZoom {35612726 ps} {35657066 ps}
