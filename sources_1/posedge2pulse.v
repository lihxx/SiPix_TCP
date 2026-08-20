`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/22 13:49:28
// Design Name: 
// Module Name: posedge2pulse
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


module posedge2pulse(
    input clk,
    input rst_b,
    input signal_in,
    output pulse_out
    );

reg delay_reg1;
reg delay_reg2;
always@(negedge clk or negedge rst_b)
begin
    if(!rst_b)
    begin
        delay_reg1<=0;
        delay_reg2<=0;
    end
    else
    begin
        delay_reg1<=signal_in;
        delay_reg2<=delay_reg1;
    end
end

assign pulse_out=(!delay_reg1)&delay_reg2;
   
endmodule
