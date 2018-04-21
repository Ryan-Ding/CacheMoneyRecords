module l2cache_control
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
	 
	 output logic way2_write,
	 output logic v2_write,
	 output logic v2_in,
	 output logic dirty2_write,
	 output logic dirty2_in,
	 
	 output logic way3_write,
	 output logic v3_write,
	 output logic v3_in,
	 output logic dirty3_write,
	 output logic dirty3_in,
	 
	 output logic lru_write,
	 
	 output logic [2:0] lru_in,
	 
	 output logic [1:0] datainmux_sel,
	 
	 output logic memaddrmux_sel,
	 
	 input [2:0] lru_out,
	 
	 input dirty,
	 input hit,
	 
	 input hit0,
	 input hit1,
	 input hit2,
	 input hit3,
	 
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
	 output logic cpu_ack
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
	 
	 way2_write = 1'b0;
	 v2_write = 1'b0;
	 v2_in = 1'b0;
	 dirty2_write 1'b0;
	 dirty2_in = 1'b0;
	 
	 way3_write = 1'b0;	 
	 v3_write = 1'b0;
	 v3_in = 1'b0;
	 dirty3_write = 1'b0;
	 dirty3_in = 1'b0;	 
	 
	 lru_write= 1'b0;
	 lru_in = 3'b000;
	 datainmux_sel= 1'b0;
	 memaddrmux_sel= 1'b0;
	 
	 //memory wishbone
	 mem_cyc = 1'b0;
	 mem_stb = 1'b0;
	 mem_we = 1'b0;
	 
	 cpu_ack = 1'b0;
//	 cpu_rty = 1'b0;
	
	 
	 /*et cetera*/
	 
	 case(state)
		hit_idle: begin
			
			if (cpu_cyc & cpu_stb & hit) begin
				// get the lru
				if (hit0) begin
					lru_in = {2'b00,lru_out[2]};
					lru_write = 1;
				end
				else if (hit1) begin
					lru_in = {2'b01,lru_out[2]};
					lru_write = 1;
				end
				else if (hit2) begin
					lru_in = {1'b1,lru_out[1],1'b0};
					lru_write = 1;
				end
				else if (hit3) begin
					lru_in = {1'b1,lru_out[1],1'b1};
					lru_write = 1;
				end
				
				if (cpu_we) begin
					datainmux_sel = 1;
					if(hit0) begin
						way0_write = 1;
						v0_write = 1;
						v0_in = 1;
						dirty0_write= 1;
						dirty0_in = 1;
					end
					else if(hit1) begin
						way1_write = 1;
						v1_write = 1;
						v1_in = 1;
						dirty1_write= 1;
						dirty1_in = 1;
					end
					else if(hit2) begin
						way2_write = 1;
						v2_write = 1;
						v2_in = 1;
						dirty2_write = 1;
						dirty2_in = 1;
					end
					else if(hit3) begin
						way3_write = 1;
						v3_write = 1;
						v3_in = 1;
						dirty3_write = 1;
						dirty3_in = 1;
					end
				end
				//set ack
				cpu_ack = 1'b1;
			end
			
		end
		allocate: begin
			//load mem into cache way0
			mem_cyc = 1;
			mem_stb = 1;
			mem_we = 0;
			
			if(lru_out[0] == 0 && lru_out[1] == 0) begin
				way0_write = 1;
				v0_write = 1;
				v0_in = 1;
				dirty0_write= 1;
				dirty0_in= 0;
			end
			
			else if(lru_out[0] == 0 && lru_out[1] == 1) begin
				way1_write = 1;
				v1_write = 1;
				v1_in = 1;
				dirty1_write= 1;
				dirty1_in= 0;
			end
			
			else if(lru_out[0] == 1 && lru_out[2] == 0) begin
				way2_write = 1;
				v2_write = 1;
				v2_in = 1;
				dirty2_write= 1;
				dirty2_in= 0;
			end
			
			else if(lru_out[0] == 1 && lru_out[2] == 1) begin
				way2_write = 1;
				v2_write = 1;
				v2_in = 1;
				dirty2_write= 1;
				dirty2_in= 0;
			end			
			
		end
		write_back: begin
			memaddrmux_sel = 1;
			mem_we = 1;
			mem_cyc = 1;
			mem_stb = 1;
		end
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
		hit_idle:	
			if(cpu_cyc & cpu_stb) begin
					if(hit == 1) next_states = hit_idle;
						else begin 
							if(dirty == 0) next_states = allocate;
							else next_states = write_back;
						end
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

endmodule : l2cache_control
