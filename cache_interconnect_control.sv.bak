//import lc3b_types::*; /* Import types defined in lc3b_types.sv */

module cache_interconnect_control
(
   /* Input and output port declarations */
	input clk,
	/* Datapath controls */
	//control signal
	output logic l2wdatamux_sel,
	output logic l2selmux_sel,
	output logic l2adrmux_sel,
	
	//1 bit control signals
	input icache_we,
	input dcache_we,
	output logic l2cache_we,
	input icache_stb,
	input dcache_stb,
	output logic l2cache_stb,
	input icache_cyc,
	input dcache_cyc,
	output logic l2cache_cyc,
	input l2cache_ack,
	input pmem_ack,
	output logic icache_ack,
	output logic dcache_ack
	 
);

//assign l2cache_we = icache_we | dcache_we;
//assign l2cache_stb = icache_stb | dcache_stb;
//assign l2cache_cyc = icache_cyc | dcache_cyc;

enum int unsigned {
    /* List of states */
	 idle,
	 imiss,
	 dmiss
} state, next_states;

always_comb
begin : state_actions
    /* Default output assignments */
    /* Actions for each state */
	l2wdatamux_sel = 1'b0;
	l2selmux_sel = 1'b0;
	l2adrmux_sel = 1'b0;
	icache_ack = 1'b0;
	dcache_ack = 1'b0;
	l2cache_we = icache_we;
	l2cache_stb = icache_stb;
	l2cache_cyc = icache_cyc;
	 
	 /*et cetera*/
	 case(state)
		idle: ;
		imiss: begin
			icache_ack = l2cache_ack;
		end
		dmiss: begin
			l2wdatamux_sel = 1'b1;
			l2selmux_sel = 1'b1;
			l2adrmux_sel = 1'b1;
			dcache_ack = l2cache_ack;
			l2cache_we = dcache_we;
			l2cache_stb = dcache_stb;
			l2cache_cyc = dcache_cyc;
		end

		default: /* Do nothing */;
	endcase
	 
	 
end

always_comb
begin : next_state_logic
    /* Next state information and conditions (if any)
     * for transitioning between states */
	next_states = state;
	  
	//imiss has priority
//	case(state)
//		idle:	begin
//			if(icache_stb & icache_cyc) 
//				next_states = imiss;
//			if(dcache_stb & dcache_cyc & !(icache_stb & icache_cyc))
//				next_states = dmiss;
//		end
//		imiss: begin
//			if(l2cache_ack & !(dcache_stb & dcache_cyc))
//				next_states = idle;
//			if (l2cache_ack & dcache_stb & dcache_cyc)
//				next_states = dmiss;
//		end
//		dmiss: begin
//			if(l2cache_ack)
//				next_states = idle;
//		end
//	endcase
	
	//dmiss has priority
	case(state)
		idle:	begin
			if(dcache_stb & dcache_cyc) 
				next_states = dmiss;
			if(icache_stb & icache_cyc & !(dcache_stb & dcache_cyc))
				next_states = imiss;
		end
		dmiss: begin
			if(l2cache_ack & !(icache_stb & icache_cyc))
				next_states = idle;
			if (l2cache_ack & icache_stb & icache_cyc)
				next_states = imiss;
		end
		imiss: begin
			if(l2cache_ack)
				next_states = idle;
		end
	endcase
	
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
	 state <= next_states;
end

endmodule : cache_interconnect_control