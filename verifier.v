module verifier (
   input wire [63:0] password,
   input wire [63:0] username,
   output wire valid
);
	// FINISH HIM
	wire [3:0] pass_length;
	wire [3:0] user_length;
	wire [31:0] a, b;
	wire [2:0] address;
	wire CAM_out;
    length_finder pass_length_find(
        .string(password),
        .length(pass_length)
    );
    hasher password_hash(
        .data(password),
        .data_len(pass_length),
        .hash(a)
    );
    length_finder user_length_find(.string(username), .length(user_length));
    CAM user_CAM(
        .data_len(user_length),
        .data(username),
        .addr(adress),
        .valid(CAM_out)
    );
    hash_rom pass_ROM(
        .addr(address),
        .data(b)
    );
    assign valid = CAM_out & (a == b);
endmodule
