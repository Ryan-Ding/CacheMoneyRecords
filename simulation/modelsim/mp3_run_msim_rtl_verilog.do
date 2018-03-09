transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/chaohua2/ece411/mp3/ECE411-MP3 {/home/chaohua2/ece411/mp3/ECE411-MP3/wishbone.sv}
vlog -sv -work work +incdir+/home/chaohua2/ece411/mp3/ECE411-MP3 {/home/chaohua2/ece411/mp3/ECE411-MP3/lc3b_types.sv}
vlog -sv -work work +incdir+/home/chaohua2/ece411/mp3/ECE411-MP3 {/home/chaohua2/ece411/mp3/ECE411-MP3/plus2.sv}
vlog -sv -work work +incdir+/home/chaohua2/ece411/mp3/ECE411-MP3 {/home/chaohua2/ece411/mp3/ECE411-MP3/register.sv}
vlog -sv -work work +incdir+/home/chaohua2/ece411/mp3/ECE411-MP3 {/home/chaohua2/ece411/mp3/ECE411-MP3/mux.sv}
vlog -sv -work work +incdir+/home/chaohua2/ece411/mp3/ECE411-MP3 {/home/chaohua2/ece411/mp3/ECE411-MP3/adj.sv}
vlog -sv -work work +incdir+/home/chaohua2/ece411/mp3/ECE411-MP3 {/home/chaohua2/ece411/mp3/ECE411-MP3/alu.sv}
vlog -sv -work work +incdir+/home/chaohua2/ece411/mp3/ECE411-MP3 {/home/chaohua2/ece411/mp3/ECE411-MP3/control.sv}
vlog -sv -work work +incdir+/home/chaohua2/ece411/mp3/ECE411-MP3 {/home/chaohua2/ece411/mp3/ECE411-MP3/gencc.sv}
vlog -sv -work work +incdir+/home/chaohua2/ece411/mp3/ECE411-MP3 {/home/chaohua2/ece411/mp3/ECE411-MP3/regfile.sv}
vlog -sv -work work +incdir+/home/chaohua2/ece411/mp3/ECE411-MP3 {/home/chaohua2/ece411/mp3/ECE411-MP3/cccomp.sv}
vlog -sv -work work +incdir+/home/chaohua2/ece411/mp3/ECE411-MP3 {/home/chaohua2/ece411/mp3/ECE411-MP3/br_ctrl.sv}
vlog -sv -work work +incdir+/home/chaohua2/ece411/mp3/ECE411-MP3 {/home/chaohua2/ece411/mp3/ECE411-MP3/datapath.sv}
vlog -sv -work work +incdir+/home/chaohua2/ece411/mp3/ECE411-MP3 {/home/chaohua2/ece411/mp3/ECE411-MP3/mp3.sv}

vlog -sv -work work +incdir+/home/chaohua2/ece411/mp3/ECE411-MP3 {/home/chaohua2/ece411/mp3/ECE411-MP3/mp3_tb.sv}
vlog -sv -work work +incdir+/home/chaohua2/ece411/mp3/ECE411-MP3 {/home/chaohua2/ece411/mp3/ECE411-MP3/memory.sv}
vlog -sv -work work +incdir+/home/chaohua2/ece411/mp3/ECE411-MP3 {/home/chaohua2/ece411/mp3/ECE411-MP3/magic_memory_dual_port.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  mp3_tb

add wave *
view structure
view signals
run 100000 ns
