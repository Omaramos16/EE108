module arbiter (
   input wire [7:0] in,
   output reg [7:0] out
);
   always@(*)begin
   casex(in)
        8'bxxxxxxx1: assign out = 8'b00000001;
        8'bxxxxxx1x: assign out = 8'b00000010;
        8'bxxxxx1xx: assign out = 8'b00000100;
        8'bxxxx1xxx: assign out = 8'b00001000;
        8'bxxx1xxxx: assign out = 8'b00010000;
        8'bxx1xxxxx: assign out = 8'b00100000;
        8'bx1xxxxxx: assign out = 8'b01000000;
        8'b1xxxxxxx: assign out = 8'b10000000;
        default: out = 8'b00000000;
    endcase
    end
	// module body goes here

endmodule
