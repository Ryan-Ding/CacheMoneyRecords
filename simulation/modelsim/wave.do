onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mp3_tb/clk
add wave -noupdate /mp3_tb/dut/datapath/pc/in
add wave -noupdate /mp3_tb/dut/datapath/pc/out
add wave -noupdate -expand /mp3_tb/dut/datapath/regfile/data
add wave -noupdate /mp3_tb/dut/datapath/control_out
add wave -noupdate /mp3_tb/dut/cache_interconnect/cache_interconnect_control/state
add wave -noupdate /mp3_tb/dut/datapath/instruction_data
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
add wave -noupdate /mp3_tb/dut/icache1/cache_controller/state
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
add wave -noupdate /mp3_tb/dut/l2cachepmem/CLK
add wave -noupdate /mp3_tb/dut/l2cachepmem/DAT_M
add wave -noupdate /mp3_tb/dut/l2cachepmem/DAT_S
add wave -noupdate /mp3_tb/dut/l2cachepmem/ACK
add wave -noupdate /mp3_tb/dut/l2cachepmem/CYC
add wave -noupdate /mp3_tb/dut/l2cachepmem/STB
add wave -noupdate /mp3_tb/dut/l2cachepmem/RTY
add wave -noupdate /mp3_tb/dut/l2cachepmem/WE
add wave -noupdate /mp3_tb/dut/l2cachepmem/ADR
add wave -noupdate /mp3_tb/dut/l2cachepmem/SEL
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
add wave -noupdate /mp3_tb/dut/dcache1/cache_controller/state
add wave -noupdate /mp3_tb/dut/dcache/CLK
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
WaveRestoreCursors {{Cursor 1} {527614 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 270
configure wave -valuecolwidth 266
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
WaveRestoreZoom {351617 ps} {623443 ps}
