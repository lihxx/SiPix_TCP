`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/14 19:43:53
// Design Name: 
// Module Name: Chip_Core
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Chip_Core(   
  input clk360, //chip ser clk, for FIFO write
  output data_chip_reg,
  output sync,  
  
  input data_p,
    input data_n,
  input sync_p,  //sync is the 30MHz sys clk
  input sync_n

); 


IBUFDS #(
      .DIFF_TERM("TRUE"),       // Differential Termination
      .IBUF_LOW_PWR("FALSE") 
   ) IBUFDS_data (//instance name
      .O(data_chip_reg),  // Buffer output
      .I(data_p),  // Diff_p buffer input (connect directly to top-level port)
      .IB(data_n) // Diff_n buffer input (connect directly to top-level port)
);

IBUFDS #(
      .DIFF_TERM("TRUE"),       // Differential Termination
      .IBUF_LOW_PWR("FALSE") 
   ) IBUFDS_sync (//instance name
      .O(sync),  // Buffer output
      .I(sync_p),  // Diff_p buffer input (connect directly to top-level port)
      .IB(sync_n) // Diff_n buffer input (connect directly to top-level port)
);

//reg data_chip_reg;
// always@(posedge clk360)
// begin
//     data_chip_reg<=data_chip;
// end

endmodule
