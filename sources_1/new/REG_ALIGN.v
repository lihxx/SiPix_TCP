`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/21 20:56:14
// Design Name: 
// Module Name: config_top
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


module REG_ALIGN(
  input [7:0]     A_REG,
  input [3:0]     NUM, 
  input           rst,
  input           clk125,
  output reg [7:0]    A_REGX);

// always@ (posedge clk125) begin
//   if(rst) begin
//        A_REGX <= 0;   
//   end
//   else if(A_REG==8'hA5) begin
//        A_REGX <= {NUM[3:0],4'h1}; 
//   end
//   else if(A_REG==8'h4B) begin
//        A_REGX <= {NUM[3:0],4'h2}; 
//   end  
//   else if(A_REG==8'h96) begin
//        A_REGX <= {NUM[3:0],4'h3}; 
//   end  
//   else if(A_REG==8'h2D) begin
//        A_REGX <= {NUM[3:0],4'h4}; 
//   end   
//   else if(A_REG==8'h5B) begin
//        A_REGX <= {NUM[3:0],4'h5}; 
//   end
//   else if(A_REG==8'hB7) begin
//        A_REGX <= {NUM[3:0],4'h6}; 
//   end  
//   else if(A_REG==8'h6E) begin
//        A_REGX <= {NUM[3:0],4'h7}; 
//   end  
//   else if(A_REG==8'hDD) begin
//        A_REGX <= {NUM[3:0],4'h8}; 
//   end  
//   else if(A_REG==8'hBA) begin
//        A_REGX <= {NUM[3:0],4'h9}; 
//   end
//   else if(A_REG==8'h74) begin
//        A_REGX <= {NUM[3:0],4'hA}; 
//   end  
//   else if(A_REG==8'hE9) begin
//        A_REGX <= {NUM[3:0],4'hB}; 
//   end  
//   else if(A_REG==8'hD2) begin
//        A_REGX <= {NUM[3:0],4'hC}; 
//   end 
//   else begin
//        A_REGX <= {NUM[3:0],4'h7};      
//   end        
// end


always@ (posedge clk125) begin
  if(rst) begin
       A_REGX <= 0;   
  end
  else begin
       A_REGX <= {NUM[3:0],A_REG[3:0]};      
  end        
end
endmodule
