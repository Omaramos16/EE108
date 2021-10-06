module cam (
      input wire [3:0] data_len,
      input wire [63:0] data,
      output wire valid,
      output wire [2:0] addr
);
	// wire declarations
    wire [67:0] data_word;
    wire [67:0] user1_data = 68'h300000000004F454C;
    wire [67:0] user2_data = 68'h50000004E4F524141;
    wire [67:0] user3_data = 68'h5000000594C4C4F48;
    wire [67:0] user4_data = 68'h50000004449564144;
    wire [67:0] user5_data = 68'h60000455249414C43;
    wire [67:0] user6_data = 68'h50000004B4E415246;
    wire [67:0] user7_data = 68'h500000045434E414C;
    wire [67:0] user8_data = 68'h4000000004E415952;
    wire [7:0] entry_matches;
	// data concatenation
	assign data_word = {data_len, data};
	// 8 equality comparisons
	assign entry_matches[0:0] = data_word == user1_data;
	assign entry_matches[1:1] = data_word == user2_data;
	assign entry_matches[2:2] = data_word == user3_data;
	assign entry_matches[3:3] = data_word == user4_data;
	assign entry_matches[4:4] = data_word == user5_data;
	assign entry_matches[5:5] = data_word == user6_data;
	assign entry_matches[6:6] = data_word == user7_data;
	assign entry_matches[7:7] = data_word == user8_data;
	// encoder instantiation
	encoder data_encoder(
	   .in(entry_matches),
	   .out(addr)
   );
	// valid logic
	assign valid = entry_matches | entry_matches;
endmodule
