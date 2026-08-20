`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/16 14:24:44
// Design Name: 
// Module Name: gate_gen
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


module gate_gen(
  input           CLK,
  input           F_IN,
  input           RST,
  input [31:0]    F_CNT,//in
  output          F_OUT
    );


reg [31:0]  f_out_cnt;


always @(posedge CLK or posedge RST) begin
            if (RST) begin
              f_out_cnt <= 32'd0;
            end
            else if (F_IN) begin //spiee_r
              f_out_cnt <= 32'd0;
            end 
            else begin
              f_out_cnt <= f_out_cnt + 1'd1;
            end
end


reg        f_out_r;

always @(posedge CLK or posedge RST) begin
            if (RST) begin
              f_out_r <= 1'b0;
            end
            else if (f_out_cnt==32'd1) begin //spiee_r
              f_out_r <= 1'b1;
            end             
            else if (f_out_cnt==F_CNT[31:0]) begin //spiee_r
              f_out_r <= 1'b0;
            end 
            else begin
              f_out_r <= f_out_r;
            end
end

assign F_OUT = f_out_r;

endmodule
