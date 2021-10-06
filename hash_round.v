module hash_round #(parameter ROUND = 1) (
    input wire [31:0] in_state,
    input wire [7:0] in_byte,
    output wire [31:0] out_state   
);
	// Declarations
	wire [7:0] a;
	wire [7:0] b;
	wire [7:0] c;
	wire [7:0] d;
	reg [7:0] mix_out;
	wire [7:0] adder_out = mix_out + a;
	wire [7:0] mixed_a = adder_out + in_byte;
	wire [7:0] rotated_mixed_a;
	// State splitting
	assign {d, c, b, a} = in_state;
	// Mix function
	always@(*)begin
	   if (ROUND == 0 || ROUND == 1 || ROUND == 2)
	       begin
	       assign mix_out = (c & b) | (~b & d);
	       end
	   else if (ROUND == 3 || ROUND == 4)
	       begin
	       assign mix_out = (c & b) | (b & d) | (c & d);
	       end
	    else
	       begin
	       assign mix_out = c ^ b ^ d;
	       end
    end
	// Rotator
	rotator eight_bit_rotator (
	   .in(mixed_a),
	   .direction(1'b1),
	   .distance(ROUND),
	   .out(rotated_mixed_a)
   );
	// Output state assignment
    assign out_state = {c, b, rotated_mixed_a, d};
endmodule
