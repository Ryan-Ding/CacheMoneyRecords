module psuedo_lru
(
	input [2:0] lru_in,
	input [1:0] way_hit,
	output logic [2:0] lru_out
);

always_comb
begin 
	// L0 L1 L2
	case(way_hit)
		2'b00: 
			begin
				// 0 0 -
				lru_out = {2'b00,lru_in[2]}; // way A
			end
		
		2'b01: 
			begin
				// 0 1 - 
				lru_out = {2'b01,lru_in[2],; // way B
			end
		
		2'b10: 
			begin
				// 1 - 0
				lru_out = {1'b1,lru_in[1], 1'b0}; // way C
			end
		2'b11:
				// 1 - 1
			begin	
				lru_out = {1'b1, lru_in[1], 1'b1}; // way D
			end
			
			default:
				lru_out = -1 // error?
		endcase
end

endmodule : pseudo_lru