module hash_rom(
   input wire [2:0] addr,
   output reg[31:0] data
);
   
	// Module body
    always@(*) begin
    case(addr)
        3'b000 : assign data = 32'hDC1A2C9E;
        3'b001 : assign data = 32'hDC2EA8E4;
        3'b010 : assign data = 32'h355FACC3;
        3'b011:  assign data = 32'hAAF4ADC9;
        3'b100 : assign data = 32'h13D41CED;
        3'b101 : assign data = 32'h7EBCF8A8;
        3'b110 : assign data = 32'hF3CDDB9B;
        3'b111 : assign data = 32'h9948E6BE;
        default : assign data = 32'h00000000;
    endcase
    end
endmodule
