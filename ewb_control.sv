import lc3b_types::*;

module ewb_control
(	
	input clk,
	input cpu_we,
	input mem_ack,
	input cpu_stb,
	input cpu_cyc,
	output logic cpu_ack,
	output logic mem_stb,
	output logic mem_cyc,
	output logic mem_we,
	output logic load_data,
	output logic datamux_sel
	
);
logic full, next_full;

initial 
begin
full = 0;
end

enum int unsigned {
    /* List of states */
	 idle,
	 load,
	 write_back,
	 load_transit,
	 strobe
} state, next_states;

always_comb
begin : state_actions
    /* Default output assignments */
    /* Actions for each state */
	load_data = 1'b0;
	mem_we = 1'b0;
	mem_stb = 1'b0;
	mem_cyc = 1'b0;
	datamux_sel = 1'b0;
	cpu_ack = 1'b0;
	next_full = full;
	
	 case(state)
		idle: begin
		if(cpu_cyc && cpu_stb && (!cpu_we))
			begin
				mem_stb = cpu_stb;
				mem_cyc = cpu_cyc;
				cpu_ack = mem_ack;
			end
		end
		load: begin
		if(cpu_cyc && cpu_stb && (!cpu_we))
			begin
				mem_stb = cpu_stb;
				mem_cyc = cpu_cyc;
				cpu_ack = mem_ack;
			end
		else	
			begin
			load_data = 1'b1;
			cpu_ack = 1'b1;
			next_full = 1'b1;
			end
		end
		write_back: begin
			mem_we = 1'b1;
			mem_stb = 1'b1;
			mem_cyc = 1'b1;
			datamux_sel = 1'b1;
			next_full = 1'b0;
		end
		strobe: ;
		load_transit: ;

		default: /* Do nothing */;
	endcase
	 
	 
end

always_comb
begin : next_state_logic
    /* Next state information and conditions (if any)
     * for transitioning between states */
	  next_states = state;
	  case(state)
		idle:
				if( !full && cpu_cyc && cpu_stb && cpu_we ) next_states = load;
				else if (full & !(cpu_cyc && cpu_stb && (!cpu_we))) next_states = write_back;
		load: 
				if (!(cpu_cyc && cpu_stb && (!cpu_we))) next_states = load_transit;
		write_back: 
				if(mem_ack & mem_we) next_states = strobe;
		strobe:
			next_states = idle;
		load_transit:
			next_states = idle;
		
	endcase
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
	 state <= next_states;
	 full <= next_full;
end
 
endmodule : ewb_control