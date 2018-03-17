

module cache_control
(
    /* Input and output port declarations */
	 input clk,
	 /* Datapath controls */
	 output logic way0_write,
	 output logic v0_write,
	 output logic v0_in,
	 output logic dirty0_write,
	 output logic dirty0_in,
	 output logic way1_write,
	 output logic v1_write,
	 output logic v1_in,
	 output logic dirty1_write,
	 output logic dirty1_in,
	 output logic lru_write,
	 output logic lru_in,
	 input lru_out,
	 output logic datainmux_sel,
	 output logic memaddrmux_sel,
	 input dirty,
	 input hit,
	 input hit0,
	 
	 // physical memory
	 input mem_ack,
	 input mem_rty,
	 output logic mem_cyc,
	 output logic mem_stb,
	 output logic mem_we,
	 
	 //cpu
	 input cpu_cyc,
	 input cpu_stb,
	 input cpu_we,
	 output logic cpu_ack,
	 output logic load_mar,
	 output logic load_mdr
//	 output logic cpu_rty
	 
);

enum int unsigned {
    /* List of states */
	 hit_idle,
	 allocate,
	 write_back,
	 strobe
} state, next_states;

always_comb
begin : state_actions
    /* Default output assignments */
    /* Actions for each state */
	 way0_write = 1'b0;
	 v0_write = 1'b0;
	 v0_in = 1'b0;
	 dirty0_write= 1'b0;
	 dirty0_in= 1'b0;
	 way1_write = 1'b0;
	 v1_write= 1'b0;
	 v1_in= 1'b0;
	 dirty1_write= 1'b0;
	 dirty1_in= 1'b0;
	 lru_write= 1'b0;
	 lru_in = 1'b0;
	 datainmux_sel= 1'b0;
	 memaddrmux_sel= 1'b0;
	 
	 //memory wishbone
	 mem_cyc = 1'b0;
	 mem_stb = 1'b0;
	 mem_we = 1'b0;
	 //
	 cpu_ack = 1'b0;
//	 cpu_rty = 1'b0;
	load_mar = 1'b0;
	load_mdr = 1'b0;
	
	 
	 /*et cetera*/
	 
	 case(state)
		hit_idle: begin
			
			if (cpu_cyc & cpu_stb  & hit ) begin
				// get the lru
				if (hit0) begin
					lru_in = 1;
					lru_write = 1;
				end
				else begin
					lru_in = 0;
					lru_write = 1;
				end
				if (cpu_we) begin
					datainmux_sel = 1;
					if(hit0) begin
						way0_write = 1;
						v0_write = 1;
						v0_in = 1;
						dirty0_write= 1;
						dirty0_in= 1;
					end
					else begin
						way1_write = 1;
						v1_write = 1;
						v1_in = 1;
						dirty1_write= 1;
						dirty1_in= 1;
					end
			
				end
				//set ack
				cpu_ack = 1'b1;
			end
			
		end
		allocate: begin
//			if (cpu_cyc & cpu_stb) begin
			//load mem into cache way0
			mem_cyc = 1;
			mem_stb = 1;
			mem_we = 0;
			load_mar = 1;
			
			if(lru_out == 0) begin
				way0_write = 1;
				v0_write = 1;
				v0_in = 1;
				dirty0_write= 1;
				dirty0_in= 0;
			end
			else begin
				way1_write = 1;
				v1_write = 1;
				v1_in = 1;
				dirty1_write= 1;
				dirty1_in= 0;
			end
//			end
			
		end
		write_back: begin
//		if (cpu_cyc & cpu_stb) begin
			memaddrmux_sel = 1;
			mem_we = 1;
			mem_cyc = 1;
			mem_stb = 1;
			load_mar = 1;
			load_mdr = 1;
		end
//		end
		strobe: begin
			mem_cyc = 0;
			mem_stb = 0;
		end
		

		default: /* Do nothing */;
	endcase
	 
	 
end

always_comb
//always@(*)
begin : next_state_logic
    /* Next state information and conditions (if any)
     * for transitioning between states */
	  next_states = state;
	  case(state)
		hit_idle:	if(hit == 1) next_states = hit_idle;
						else begin 
							if(dirty == 0) next_states = allocate;
							else next_states = write_back;
						end
		allocate: if (mem_ack == 0) next_states = allocate;
						else next_states = hit_idle;
		write_back: if (mem_ack == 0) next_states = write_back;
						else next_states = strobe;
		strobe: next_states = allocate;
		
		//default: next_states = fetch1;
		
	endcase
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
	 state <= next_states;
end

endmodule : cache_control
