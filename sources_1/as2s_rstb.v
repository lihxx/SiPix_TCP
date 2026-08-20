`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/13 18:47:09
// Design Name: 
// Module Name: as2s_rstb
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


module as2s_rstb(
    input        rstb_in,          // Asynchronous reset for entire core.
    input        clk,             // System clock
    output       rstb_out          // Synchronous reset
    );
    
    (* ASYNC_REG = "TRUE" *)
    reg   [3:0]  reset_pipe; // flip-flop pipeline for reset duration stretch
    
    always@(posedge clk or negedge rstb_in)
      if (~rstb_in) reset_pipe <= 4'b0000;
      else reset_pipe <= {reset_pipe[2:0], rstb_in};
    
    assign rstb_out = reset_pipe[3];
endmodule
