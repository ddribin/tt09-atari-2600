`default_nettype none

module qspi_rom_emu #(parameter ADDR_BITS = 24) (
  input wire clk,
  input wire reset,
  input wire sclk,
  input wire select,
  input wire [3:0] cmd_addr_in,
  output reg [3:0] data_out
);

  // parameter DATA_WIDTH_BYTES = 1;
  // localparam CMD    = 8;
  // localparam ADDR   = CMD  + ADDR_BITS/4; // receive address
  // localparam LOAD   = ADDR + 2;           // load 2 bytes ahead: 1) 1st byte
  // localparam INCA   = LOAD + 1;           //                     advance read addr
  // localparam LOAD2  = LOAD + 2;           //                     2) 2nd byte
  // localparam INC2   = LOAD + 3;           //                     advance read addr
  // localparam DATA   = LOAD + 4;           // serve data

  // reg [7:0] counter;
  // reg [ADDR_BITS-1:0] addr;
  // always @(posedge clk) begin
  //   if (select) begin
  //     counter <= 0;
  //   end else begin
  //     counter <= counter + 1;
  //     if      (counter <  CMD)  addr            <= 0;
  //     else if (counter < ADDR)  addr            <= {addr[ADDR_BITS-1-4:0], cmd_addr_in};
  //     else if (counter < LOAD)  data[15:8]      <= rom[addr[11:0]];
  //     else if (counter < INCA)  addr            <= addr + 1;
  //     else if (counter < LOAD2) data[7:0]       <= rom[addr[11:0]];
  //     else if (counter < INC2)  addr            <= addr + 1;
  //     else if (counter < DATA)  data_out        <= data[15-:4]; // 1st nibble
  //     else begin           
  //                               data_out        <= data[11-:4]; // 2nd nibble
  //                               // load next byte
  //                               data[15:8]      <= data[7:0];   
  //                               data[7:0]       <= rom[addr[11:0]];
  //                               addr            <= addr + 1;
  //                               counter         <= counter - 1;
  //     end
  //   end
  // end

  parameter DATA_WIDTH_BYTES = 1;
  localparam CMD    = 8;
  localparam ADDR   = CMD  + ADDR_BITS/4; // receive address
  localparam LOAD   = ADDR + 3;           // load 2 bytes ahead: 1) 1st byte
  localparam INCA   = LOAD + 1;           //               advance read addr
  localparam LOAD2  = LOAD + 2;           //                     2) 2nd byte
  localparam INC2   = LOAD + 3;           //               advance read addr
  localparam DATA   = LOAD + 4;           // serve the data & load next byte

  reg sclk_prev; always @(posedge clk) sclk_prev <= sclk;
  wire sclk_negedge = sclk_prev != sclk && !sclk;
  reg  [7:0] counter;

  reg [ADDR_BITS-1:0] addr; // read address
  always @(posedge clk) begin
    if (select || reset) counter <= 0;
    else if (sclk_negedge) begin
      counter <= counter + 1;
      if      (counter <  CMD)  addr        <= 0;
      else if (counter < ADDR)  addr        <= {addr[ADDR_BITS-1-4:0], cmd_addr_in};
      else if (counter < LOAD)  data[15:8]  <= rom[addr[11:0]];
      else if (counter < INCA)  addr        <= addr + 1;
      else if (counter < LOAD2) data[7:0]   <= rom[addr[11:0]];
      else if (counter < INC2)  addr        <= addr + 1;
      else if (counter < DATA)  data_out    <= data[15-:4]; // 1st nibble
      else begin
                                data_out    <= data[11-:4]; // 2nd nibble
                                // load next byte
                                data[15:8]  <= data[7:0];   
                                data[7:0]   <= rom[addr[11:0]];
                                addr        <= addr + 1;
                                counter <= counter - 1;
      end
    end
  end


  // reg  [7:0] counter; // counts on both positive and NEGATIVE clock edges
  // wire [7:0] counter_negedge = counter[7:1];
  // // always @(posedge clk or negedge clk) begin
  // //   if      (select)                  counter <= 0;
  // //   else if (counter_negedge < DATA)  counter <= counter + 1;
  // //   else                              counter <= counter - 3; // loop serving data
  // // end

  // reg reg_select;
  // always @(posedge clk)
  //   if (reset)
  //     reg_select <= 1;
  //   else
  //     reg_select <= select;

  // reg [ADDR_BITS-1:0] addr; // read address
  // always @(posedge clk or negedge clk) begin // serves data on the NEGATIVE edge
  //   // if (select) counter <= 0;
  //   if (reg_select || reset) counter <= 0;
  //   else begin
  //     counter <= counter + 1;
  //     if (counter[0]) begin
  //     if      (counter_negedge <  CMD)  addr        <= 0;
  //     else if (counter_negedge < ADDR)  addr        <= {addr[ADDR_BITS-1-4:0], cmd_addr_in};
  //     else if (counter_negedge < LOAD)  data[15:8]  <= rom[addr[11:0]];
  //     else if (counter_negedge < INCA)  addr        <= addr + 1;
  //     else if (counter_negedge < LOAD2) data[7:0]   <= rom[addr[11:0]];
  //     else if (counter_negedge < INC2)  addr        <= addr + 1;
  //     else if (counter_negedge < DATA)  data_out    <= data[15-:4]; // 1st nibble
  //     else begin
  //                                       data_out    <= data[11-:4]; // 2nd nibble
  //                                       // load next byte
  //                                       data[15:8]  <= data[7:0];   
  //                                       data[7:0]   <= rom[addr[11:0]];
  //                                       addr        <= addr + 1;
  //                                       counter <= counter - 3;
  //     end
  //   end
  // end
  // end

  // reg [ADDR_BITS-1:0] addr; // read address
  // always @(negedge clk) begin // serves data on the NEGATIVE edge
  //   if      (counter_negedge <  CMD)  addr        <= 0;
  //   else if (counter_negedge < ADDR)  addr        <= {addr[ADDR_BITS-1-4:0], cmd_addr_in};
  //   else if (counter_negedge < LOAD)  data[15:8]  <= rom[addr[11:0]];
  //   else if (counter_negedge < INCA)  addr        <= addr + 1;
  //   else if (counter_negedge < LOAD2) data[7:0]   <= rom[addr[11:0]];
  //   else if (counter_negedge < INC2)  addr        <= addr + 1;
  //   else if (counter_negedge < DATA)  data_out    <= data[15-:4]; // 1st nibble
  //   else begin
  //                                     data_out    <= data[11-:4]; // 2nd nibble
  //                                     // load next byte
  //                                     data[15:8]  <= data[7:0];   
  //                                     data[7:0]   <= rom[addr[11:0]];
  //                                     addr        <= addr + 1;
  //   end
  // end

  reg [15:0] data;
  reg [7:0] rom [4095:0];
  initial begin
    $readmemh("../roms/rom.mem", rom, 0, 4095);
    // DEBUG: override reset vector
    // rom[12'hFFD] <= 8'hF0; rom[12'hFFC] <= 8'h00;
  end  
endmodule
