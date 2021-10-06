module hasher (
   input wire [63:0] data,
   input wire [3:0] data_len,
   output wire [31:0] hash
);
	// DO IT GORDON
	wire [31:0] in_state_0 = 31'h55555555;
	wire [31:0] in_state_1 = 31'hAAAAAAAA;
	wire [31:0] in_state_2;
    wire [31:0] in_state_3;
	wire [31:0] in_state_4;
	wire [31:0] in_state_5;
	wire [31:0] in_state_6;
	wire [31:0] in_state_7;
	wire [31:0] out_state_6;
	wire [31:0] out_state_7;
	wire [31:0] final_state = out_state_6 ^ out_state_7;
	
	hash_round #(.ROUND(0)) hash_round_0 (
	   .in_state(in_state_0),
	   .in_byte(data[7:0]),
	   .out_state(in_state_2)
   );
	hash_round #(.ROUND(1)) hash_round_1 (
	   .in_state(in_state_1),
	   .in_byte(data[15:8]),
	   .out_state(in_state_3)
   );
   hash_round #(.ROUND(2)) hash_round_2 (
	   .in_state(in_state_2),
	   .in_byte(data[23:16]),
	   .out_state(in_state_4)
   );
   hash_round #(.ROUND(3)) hash_round_3 (
	   .in_state(in_state_3),
	   .in_byte(data[31:24]),
	   .out_state(in_state_5)
   );
   hash_round #(.ROUND(4)) hash_round_4 (
	   .in_state(in_state_4),
	   .in_byte(data[39:32]),
	   .out_state(in_state_6)
   );
   hash_round #(.ROUND(5)) hash_round_5 (
	   .in_state(in_state_5),
	   .in_byte(data[47:40]),
	   .out_state(in_state_7)
   );
   hash_round #(.ROUND(6)) hash_round_6 (
	   .in_state(in_state_6),
	   .in_byte(data[55:48]),
	   .out_state(out_state_6)
   );
   hash_round #(.ROUND(7)) hash_round_7 (
	   .in_state(in_state_7),
	   .in_byte(data[63:56]),
	   .out_state(out_state_7)
   );
   rotator #(.WIDTH(32)) bit_32_rotator(
       .in(final_state),
       .distance({3'b000, final_state[4:0]}),
       .direction((data_len ^ data_len)),
       .out(hash)
   );
endmodule
