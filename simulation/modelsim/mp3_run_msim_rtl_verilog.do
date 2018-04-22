transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/comparator.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/btb_sel.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/btb_lru_state.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/btb_control.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/l2cache_control.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/cache_interconnect_control.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/cache_control.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/wishbone.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/lc3b_types.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/plus2.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/register.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/mux.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/ewb_control.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/incremental_counter.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/bhr.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/pattern_hist_table.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/pht_update_ctrl.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/lru_replace.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/btb_datapath.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/btb_array.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/l2array.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/cpudatainmux.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/cache_interconnect_datapath.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/adj.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/alu.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/control.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/gencc.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/regfile.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/cccomp.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/br_ctrl.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/mdrmask.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/srmask.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/mem_enable_ctrl.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/ldi_sti_control.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/forwarding_unit.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/branch_detection..sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/ewb_datapath.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/counter_control.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/global_br_predictor.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/local_br_predictor.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/choice_predictor.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/array.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/btb.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/l2cache_datapath.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/cache_datapath.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/cache_interconnect.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/ewb.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/l2cache.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/cache.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/datapath.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/mp3.sv}

vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/mp3_tb.sv}
vlog -sv -work work +incdir+/home/rding4/ece411/cachemoneyrecords {/home/rding4/ece411/cachemoneyrecords/physical_memory.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixiv_hssi_ver -L stratixiv_pcie_hip_ver -L stratixiv_ver -L rtl_work -L work -voptargs="+acc"  mp3_tb

#add wave *
#view structure
#view signals
run 20000 ns
quit -f
