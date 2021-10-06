module length_finder (
   input wire [63:0] string,
   output wire [3:0] length
);
   
	// wire declarations
	wire char1 = string[7:0];
	wire char2 = string[15:8];
	wire char3 = string[23:16];
	wire char4 = string[31:24];
	wire char5 = string[39:32];
	wire char6 = string[47:40];
	wire char7 = string[55:48];
	wire char8 = string[63:56]; 
    wire [7:0] is_character_null;
    wire [7:0] first_null_character;
	// is_character_null logic (8 lines of it!)
	assign is_character_null[0:0] = ~(char1 | char1);
	assign is_character_null[1:1] = ~(char2 | char2);
	assign is_character_null[2:2] = ~(char3 | char3);
	assign is_character_null[3:3] = ~(char4 | char4);
	assign is_character_null[4:4] = ~(char5 | char5);
	assign is_character_null[5:5] = ~(char6 | char6);
	assign is_character_null[6:6] = ~(char7 | char7);
	assign is_character_null[7:7] = ~(char8 | char8);
	// arbiter
    arbiter length_arbiter (
        .in(is_chracter_null),
        .out(first_null_character)
    );
    
    encoder length_encoder(
        .in(first_null_character),
        .out(length[2:0])
    );   
    assign length[3:3] = ~(length[2:0] | length[2:0]); 
endmodule
