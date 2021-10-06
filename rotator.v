module rotator #(parameter WIDTH=8) (
   input wire [WIDTH - 1:0] in,
   input wire direction,
   input wire [7:0] distance,
   output wire [WIDTH - 1:0] out
);
	// Declarations
	wire [2*WIDTH - 1:0] double_in = {2{in}};
	wire [2*WIDTH - 1:0] double_rot_l;
	wire [2*WIDTH - 1:0] double_rot_r;
	wire [WIDTH - 1:0] rot_l;
	wire [WIDTH - 1:0] rot_r;
	// Rotating logic
	assign double_rot_l = double_in << distance;
	assign double_rot_r = double_in >> distance;
	assign rot_l = double_rot_l[2*WIDTH - 1:WIDTH/2];
	assign rot_r = double_rot_r[WIDTH/2 - 1:0];
	// Output mux logic
	assign out = direction == 1'b1 ? rot_l :  rot_r;
endmodule
