`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/07 08:42:18
// Design Name: 
// Module Name: bp_top
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


module bp0_top(
  input           CLK_20M,
  input           CLK_120M,
  input           CLK_80M,
  input           CLK_125M,
  input           CLK_READ,
  input           FNT_EN,
  input           RST,     // 200MHz
  input           FRAME_IN,
  input           SYNC1,
  input           SYNC2,
  input           SYNC3,
  input           SYNC4,
  input           SYNC5,
  input           SYNC6,
  input           SYNC7,
  input           SYNC8,
  input           SYNC9,
  input           SYNC10,
  input           SYNC11,
  input           SYNC12,
  output [11:0]   A_REG1,
  output [11:0]   A_REG2,
  output [11:0]   A_REG3,
  output [11:0]   A_REG4,
  output [11:0]   A_REG5,
  output [11:0]   A_REG6,
  output [11:0]   A_REG7,
  output [11:0]   A_REG8,
  output [11:0]   A_REG9,
  output [11:0]   A_REG10,
  output [11:0]   A_REG11,
  output [11:0]   A_REG12,
  input           chip1,
  input           chip2,
  input           chip3,
  input           chip4,
  input           chip5,
  input           chip6,
  input           chip7,
  input           chip8,
  input           chip9,
  input           chip10,
  input           chip11,
  input           chip12,
  output          P_OK,
  output          FRAME_OUT,
  // input [4:0]     PHASE_CNT,
  // input [7:0]     CHIP_S,
  input [4:0] PHASE1_CNT0,
  input [4:0] PHASE1_CNT1,
  input [4:0] PHASE1_CNT2,
  input [4:0] PHASE1_CNT3,
  input [4:0] PHASE1_CNT4,
  input [4:0] PHASE1_CNT5,
  input [4:0] PHASE1_CNT6,
  input [4:0] PHASE1_CNT7,
  input [4:0] PHASE1_CNT8,
  input [4:0] PHASE1_CNT9,
  input [4:0] PHASE1_CNT10,
  input [4:0] PHASE1_CNT11,
  output          RD_ST_OUT,
  output [15:0]   DATA_OUT,
  output          NEX_ST,
  output          DATA_EN
    );



reg [4:0]  phase1_cnt;
reg [4:0]  phase2_cnt;
reg [4:0]  phase3_cnt;
reg [4:0]  phase4_cnt;
reg [4:0]  phase5_cnt;
reg [4:0]  phase6_cnt;
reg [4:0]  phase7_cnt;
reg [4:0]  phase8_cnt;
reg [4:0]  phase9_cnt;
reg [4:0]  phase10_cnt;
reg [4:0]  phase11_cnt;
reg [4:0]  phase12_cnt;

// always @(posedge CLK_125M or posedge RST) begin
//             if (RST) begin
//               phase1_cnt  <= 5'd14;
//               phase2_cnt  <= 5'd14;
//               phase3_cnt  <= 5'd14;
//               phase4_cnt  <= 5'd14;
//               phase5_cnt  <= 5'd14;
//               phase6_cnt  <= 5'd14;
//               phase7_cnt  <= 5'd14;
//               phase8_cnt  <= 5'd14;
//               phase9_cnt  <= 5'd14;
//               phase10_cnt <= 5'd14;
//               phase11_cnt <= 5'd14;
//               phase12_cnt <= 5'd14;              
//             end
//             else if (CHIP_S[7:0]==8'd1) begin //spiee_r
//               phase1_cnt <= PHASE_CNT;
//             end 
//             else if (CHIP_S[7:0]==8'd2) begin //spiee_r
//               phase2_cnt <= PHASE_CNT;
//             end 
//             else if (CHIP_S[7:0]==8'd3) begin //spiee_r
//               phase3_cnt <= PHASE_CNT;
//             end 
//             else if (CHIP_S[7:0]==8'd4) begin //spiee_r
//               phase4_cnt <= PHASE_CNT;
//             end  
//             else if (CHIP_S[7:0]==8'd5) begin //spiee_r
//               phase5_cnt <= PHASE_CNT;
//             end 
//             else if (CHIP_S[7:0]==8'd6) begin //spiee_r
//               phase6_cnt <= PHASE_CNT;
//             end 
//             else if (CHIP_S[7:0]==8'd7) begin //spiee_r
//               phase7_cnt <= PHASE_CNT;
//             end 
//             else if (CHIP_S[7:0]==8'd8) begin //spiee_r
//               phase8_cnt <= PHASE_CNT;
//             end   
//             else if (CHIP_S[7:0]==8'd9) begin //spiee_r
//               phase9_cnt <= PHASE_CNT;
//             end 
//             else if (CHIP_S[7:0]==8'd10) begin //spiee_r
//               phase10_cnt <= PHASE_CNT;
//             end 
//             else if (CHIP_S[7:0]==8'd11) begin //spiee_r
//               phase11_cnt <= PHASE_CNT;
//             end 
//             else if (CHIP_S[7:0]==8'd12) begin //spiee_r
//               phase12_cnt <= PHASE_CNT;
//             end                                                    
//             else begin
//               phase1_cnt  <= phase1_cnt;
//               phase2_cnt  <= phase2_cnt;
//               phase3_cnt  <= phase3_cnt;
//               phase4_cnt  <= phase4_cnt;
//               phase5_cnt  <= phase5_cnt;
//               phase6_cnt  <= phase6_cnt;
//               phase7_cnt  <= phase7_cnt;
//               phase8_cnt  <= phase8_cnt;
//               phase9_cnt  <= phase9_cnt;
//               phase10_cnt <= phase10_cnt;
//               phase11_cnt <= phase11_cnt;
//               phase12_cnt <= phase12_cnt;  
//             end
// end



always @(posedge CLK_125M or posedge RST) begin
            if (RST) begin
              phase1_cnt  <= 5'd14;
              phase2_cnt  <= 5'd14;
              phase3_cnt  <= 5'd14;
              phase4_cnt  <= 5'd14;
              phase5_cnt  <= 5'd14;
              phase6_cnt  <= 5'd14;
              phase7_cnt  <= 5'd14;
              phase8_cnt  <= 5'd14;
              phase9_cnt  <= 5'd14;
              phase10_cnt <= 5'd14;
              phase11_cnt <= 5'd14;
              phase12_cnt <= 5'd14;              
            end                                                   
            else begin
              phase1_cnt  <= PHASE1_CNT0;
              phase2_cnt  <= PHASE1_CNT1;
              phase3_cnt  <= PHASE1_CNT2;
              phase4_cnt  <= PHASE1_CNT3;
              phase5_cnt  <= PHASE1_CNT4;
              phase6_cnt  <= PHASE1_CNT5;
              phase7_cnt  <= PHASE1_CNT6;
              phase8_cnt  <= PHASE1_CNT7;
              phase9_cnt  <= PHASE1_CNT8;
              phase10_cnt <= PHASE1_CNT9;
              phase11_cnt <= PHASE1_CNT10;
              phase12_cnt <= PHASE1_CNT11;  
            end
end
// reg     SYNC;
// always@(posedge CLK_20M or posedge RST) begin//
//   if (RST) begin//
//     SYNC <= 1'b0;
//   end
//   else begin//
//     SYNC<=~SYNC;
//   end    
// end


//   reg          chip1;
//   reg          chip2;
//   reg          chip3;
//   reg          chip4;
//   reg          chip5;
//   reg          chip6;
//   reg          chip7;
//   reg          chip8;
//   reg          chip9;
//   reg          chip10;
//   reg          chip11;
//   reg          chip12;


// reg [27:0]   chip1_reg;
// reg [27:0]   chip2_reg;
// reg [27:0]   chip3_reg;
// reg [27:0]   chip4_reg;
// reg [27:0]   chip5_reg;
// reg [27:0]   chip6_reg;

// reg [27:0]   chip7_reg;
// reg [27:0]   chip8_reg;
// reg [27:0]   chip9_reg;
// reg [27:0]   chip10_reg;
// reg [27:0]   chip11_reg;
// reg [27:0]   chip12_reg;

// reg [4:0]    chip_cnt;


// always @(posedge CLK_120M or posedge RST) begin//
//             if (RST) begin//
//               chip_cnt[4:0] <= 5'd0;
//               chip1 <= 1'b0;
//               chip2 <= 1'b0;
//               chip3 <= 1'b0;
//               chip4 <= 1'b0;
//               chip5 <= 1'b0;
//               chip6 <= 1'b0;
//               chip7 <= 1'b0;
//               chip8 <= 1'b0;
//               chip9 <= 1'b0;
//               chip10 <= 1'b0;
//               chip11 <= 1'b0;
//               chip12 <= 1'b0;


//               chip1_reg <= 28'd245147455;
//               chip2_reg <= 28'd800;
//               chip3_reg <= 28'd799;
//               chip4_reg <= 28'd801;
//               chip5_reg <= 28'd802;
//               chip6_reg <= 28'd666;
//               chip7_reg <= 28'd777;
//               chip8_reg <= 28'd888;
//               chip9_reg <= 28'd999;
//               chip10_reg <= 28'd111;
//               chip11_reg <= 28'd222;
//               chip12_reg <= 28'd333;              
//             end

//             else if (chip_cnt[4:0]==5'd27) begin//
//               chip_cnt[4:0] <= 5'd0;
//               chip1 <= chip1_reg[27];
//               chip2 <= chip2_reg[27];
//               chip3 <= chip3_reg[27];
//               chip4 <= chip4_reg[27];
//               chip5 <= chip5_reg[27];
//               chip6 <= chip6_reg[27];
//               chip7 <= chip7_reg[27];
//               chip8 <= chip8_reg[27];
//               chip9 <= chip9_reg[27];
//               chip10 <= chip10_reg[27];
//               chip11 <= chip11_reg[27];
//               chip12 <= chip12_reg[27];
//             end
//             else if (chip_cnt[4:0]==5'd0) begin//
//               chip_cnt[4:0] <= 5'd1;
//               chip1 <= chip1_reg[0];
//               chip2 <= chip2_reg[0];
//               chip3 <= chip3_reg[0];
//               chip4 <= chip4_reg[0];
//               chip5 <= chip5_reg[0];
//               chip6 <= chip6_reg[0];
//               chip7 <= chip7_reg[0];
//               chip8 <= chip8_reg[0];
//               chip9 <= chip9_reg[0];
//               chip10 <= chip10_reg[0];
//               chip11 <= chip11_reg[0];
//               chip12 <= chip12_reg[0];
//             end
//             else if (chip_cnt[4:0]==5'd1) begin//
//               chip_cnt[4:0] <= 5'd2;
//               chip1 <= chip1_reg[1];
//               chip2 <= chip2_reg[1];
//               chip3 <= chip3_reg[1];
//               chip4 <= chip4_reg[1];
//               chip5 <= chip5_reg[1];
//               chip6 <= chip6_reg[1];
//               chip7 <= chip7_reg[1];
//               chip8 <= chip8_reg[1];
//               chip9 <= chip9_reg[1];
//               chip10 <= chip10_reg[1];
//               chip11 <= chip11_reg[1];
//               chip12 <= chip12_reg[1];
//             end
//             else if (chip_cnt[4:0]==5'd2) begin//
//               chip_cnt[4:0] <= 5'd3;
//               chip1 <= chip1_reg[2];
//               chip2 <= chip2_reg[2];
//               chip3 <= chip3_reg[2];
//               chip4 <= chip4_reg[2];
//               chip5 <= chip5_reg[2];
//               chip6 <= chip6_reg[2];
//               chip7 <= chip7_reg[2];
//               chip8 <= chip8_reg[2];
//               chip9 <= chip9_reg[2];
//               chip10 <= chip10_reg[2];
//               chip11 <= chip11_reg[2];
//               chip12 <= chip12_reg[2];
//             end
//             else if (chip_cnt[4:0]==5'd3) begin//
//               chip_cnt[4:0] <= 5'd4;
//               chip1 <= chip1_reg[3];
//               chip2 <= chip2_reg[3];
//               chip3 <= chip3_reg[3];
//               chip4 <= chip4_reg[3];
//               chip5 <= chip5_reg[3];
//               chip6 <= chip6_reg[3];
//               chip7 <= chip7_reg[3];
//               chip8 <= chip8_reg[3];
//               chip9 <= chip9_reg[3];
//               chip10 <= chip10_reg[3];
//               chip11 <= chip11_reg[3];
//               chip12 <= chip12_reg[3];
//             end
//             else if (chip_cnt[4:0]==5'd4) begin//
//               chip_cnt[4:0] <= 5'd5;
//               chip1 <= chip1_reg[4];
//               chip2 <= chip2_reg[4];
//               chip3 <= chip3_reg[4];
//               chip4 <= chip4_reg[4];
//               chip5 <= chip5_reg[4];
//               chip6 <= chip6_reg[4];
//               chip7 <= chip7_reg[4];
//               chip8 <= chip8_reg[4];
//               chip9 <= chip9_reg[4];
//               chip10 <= chip10_reg[4];
//               chip11 <= chip11_reg[4];
//               chip12 <= chip12_reg[4];
//             end
//             else if (chip_cnt[4:0]==5'd5) begin//
//               chip_cnt[4:0] <= 5'd6;
//               chip1 <= chip1_reg[5];
//               chip2 <= chip2_reg[5];
//               chip3 <= chip3_reg[5];
//               chip4 <= chip4_reg[5];
//               chip5 <= chip5_reg[5];
//               chip6 <= chip6_reg[5];
//               chip7 <= chip7_reg[5];
//               chip8 <= chip8_reg[5];
//               chip9 <= chip9_reg[5];
//               chip10 <= chip10_reg[5];
//               chip11 <= chip11_reg[5];
//               chip12 <= chip12_reg[5];
//             end
//             else if (chip_cnt[4:0]==5'd6) begin//
//               chip_cnt[4:0] <= 5'd7;
//               chip1 <= chip1_reg[6];
//               chip2 <= chip2_reg[6];
//               chip3 <= chip3_reg[6];
//               chip4 <= chip4_reg[6];
//               chip5 <= chip5_reg[6];
//               chip6 <= chip6_reg[6];
//               chip7 <= chip7_reg[6];
//               chip8 <= chip8_reg[6];
//               chip9 <= chip9_reg[6];
//               chip10 <= chip10_reg[6];
//               chip11 <= chip11_reg[6];
//               chip12 <= chip12_reg[6];
//             end
//             else if (chip_cnt[4:0]==5'd7) begin//
//               chip_cnt[4:0] <= 5'd8;
//               chip1 <= chip1_reg[7];
//               chip2 <= chip2_reg[7];
//               chip3 <= chip3_reg[7];
//               chip4 <= chip4_reg[7];
//               chip5 <= chip5_reg[7];
//               chip6 <= chip6_reg[7];
//               chip7 <= chip7_reg[7];
//               chip8 <= chip8_reg[7];
//               chip9 <= chip9_reg[7];
//               chip10 <= chip10_reg[7];
//               chip11 <= chip11_reg[7];
//               chip12 <= chip12_reg[7];
//             end
//             else if (chip_cnt[4:0]==5'd8) begin//
//               chip_cnt[4:0] <= 5'd9;
//               chip1 <= chip1_reg[8];
//               chip2 <= chip2_reg[8];
//               chip3 <= chip3_reg[8];
//               chip4 <= chip4_reg[8];
//               chip5 <= chip5_reg[8];
//               chip6 <= chip6_reg[8];
//               chip7 <= chip7_reg[8];
//               chip8 <= chip8_reg[8];
//               chip9 <= chip9_reg[8];
//               chip10 <= chip10_reg[8];
//               chip11 <= chip11_reg[8];
//               chip12 <= chip12_reg[8];
//             end
//             else if (chip_cnt[4:0]==5'd9) begin//
//               chip_cnt[4:0] <= 5'd10;
//               chip1 <= chip1_reg[9];
//               chip2 <= chip2_reg[9];
//               chip3 <= chip3_reg[9];
//               chip4 <= chip4_reg[9];
//               chip5 <= chip5_reg[9];
//               chip6 <= chip6_reg[9];
//               chip7 <= chip7_reg[9];
//               chip8 <= chip8_reg[9];
//               chip9 <= chip9_reg[9];
//               chip10 <= chip10_reg[9];
//               chip11 <= chip11_reg[9];
//               chip12 <= chip12_reg[9];
//             end
//             else if (chip_cnt[4:0]==5'd10) begin//
//               chip_cnt[4:0] <= 5'd11;
//               chip1 <= chip1_reg[10];
//               chip2 <= chip2_reg[10];
//               chip3 <= chip3_reg[10];
//               chip4 <= chip4_reg[10];
//               chip5 <= chip5_reg[10];
//               chip6 <= chip6_reg[10];
//               chip7 <= chip7_reg[10];
//               chip8 <= chip8_reg[10];
//               chip9 <= chip9_reg[10];
//               chip10 <= chip10_reg[10];
//               chip11 <= chip11_reg[10];
//               chip12 <= chip12_reg[10];
//             end
//             else if (chip_cnt[4:0]==5'd11) begin//
//               chip_cnt[4:0] <= 5'd12;
//               chip1 <= chip1_reg[11];
//               chip2 <= chip2_reg[11];
//               chip3 <= chip3_reg[11];
//               chip4 <= chip4_reg[11];
//               chip5 <= chip5_reg[11];
//               chip6 <= chip6_reg[11];
//               chip7 <= chip7_reg[11];
//               chip8 <= chip8_reg[11];
//               chip9 <= chip9_reg[11];
//               chip10 <= chip10_reg[11];
//               chip11 <= chip11_reg[11];
//               chip12 <= chip12_reg[11];
//             end
//             else if (chip_cnt[4:0]==5'd12) begin//
//               chip_cnt[4:0] <= 5'd13;
//               chip1 <= chip1_reg[12];
//               chip2 <= chip2_reg[12];
//               chip3 <= chip3_reg[12];
//               chip4 <= chip4_reg[12];
//               chip5 <= chip5_reg[12];
//               chip6 <= chip6_reg[12];
//               chip7 <= chip7_reg[12];
//               chip8 <= chip8_reg[12];
//               chip9 <= chip9_reg[12];
//               chip10 <= chip10_reg[12];
//               chip11 <= chip11_reg[12];
//               chip12 <= chip12_reg[12];
//             end
//             else if (chip_cnt[4:0]==5'd13) begin//
//               chip_cnt[4:0] <= 5'd14;
//               chip1 <= chip1_reg[13];
//               chip2 <= chip2_reg[13];
//               chip3 <= chip3_reg[13];
//               chip4 <= chip4_reg[13];
//               chip5 <= chip5_reg[13];
//               chip6 <= chip6_reg[13];
//               chip7 <= chip7_reg[13];
//               chip8 <= chip8_reg[13];
//               chip9 <= chip9_reg[13];
//               chip10 <= chip10_reg[13];
//               chip11 <= chip11_reg[13];
//               chip12 <= chip12_reg[13];
//             end
//             else if (chip_cnt[4:0]==5'd14) begin//
//               chip_cnt[4:0] <= 5'd15;
//               chip1 <= chip1_reg[14];
//               chip2 <= chip2_reg[14];
//               chip3 <= chip3_reg[14];
//               chip4 <= chip4_reg[14];
//               chip5 <= chip5_reg[14];
//               chip6 <= chip6_reg[14];
//               chip7 <= chip7_reg[14];
//               chip8 <= chip8_reg[14];
//               chip9 <= chip9_reg[14];
//               chip10 <= chip10_reg[14];
//               chip11 <= chip11_reg[14];
//               chip12 <= chip12_reg[14];
//             end
//             else if (chip_cnt[4:0]==5'd15) begin//
//               chip_cnt[4:0] <= 5'd16;
//               chip1 <= chip1_reg[15];
//               chip2 <= chip2_reg[15];
//               chip3 <= chip3_reg[15];
//               chip4 <= chip4_reg[15];
//               chip5 <= chip5_reg[15];
//               chip6 <= chip6_reg[15];
//               chip7 <= chip7_reg[15];
//               chip8 <= chip8_reg[15];
//               chip9 <= chip9_reg[15];
//               chip10 <= chip10_reg[15];
//               chip11 <= chip11_reg[15];
//               chip12 <= chip12_reg[15];
//             end
//             else if (chip_cnt[4:0]==5'd16) begin//
//               chip_cnt[4:0] <= 5'd17;
//               chip1 <= chip1_reg[16];
//               chip2 <= chip2_reg[16];
//               chip3 <= chip3_reg[16];
//               chip4 <= chip4_reg[16];
//               chip5 <= chip5_reg[16];
//               chip6 <= chip6_reg[16];
//               chip7 <= chip7_reg[16];
//               chip8 <= chip8_reg[16];
//               chip9 <= chip9_reg[16];
//               chip10 <= chip10_reg[16];
//               chip11 <= chip11_reg[16];
//               chip12 <= chip12_reg[16];
//             end
//             else if (chip_cnt[4:0]==5'd17) begin//
//               chip_cnt[4:0] <= 5'd18;
//               chip1 <= chip1_reg[17];
//               chip2 <= chip2_reg[17];
//               chip3 <= chip3_reg[17];
//               chip4 <= chip4_reg[17];
//               chip5 <= chip5_reg[17];
//               chip6 <= chip6_reg[17];
//               chip7 <= chip7_reg[17];
//               chip8 <= chip8_reg[17];
//               chip9 <= chip9_reg[17];
//               chip10 <= chip10_reg[17];
//               chip11 <= chip11_reg[17];
//               chip12 <= chip12_reg[17];
//             end
//             else if (chip_cnt[4:0]==5'd18) begin//
//               chip_cnt[4:0] <= 5'd19;
//               chip1 <= chip1_reg[18];
//               chip2 <= chip2_reg[18];
//               chip3 <= chip3_reg[18];
//               chip4 <= chip4_reg[18];
//               chip5 <= chip5_reg[18];
//               chip6 <= chip6_reg[18];
//               chip7 <= chip7_reg[18];
//               chip8 <= chip8_reg[18];
//               chip9 <= chip9_reg[18];
//               chip10 <= chip10_reg[18];
//               chip11 <= chip11_reg[18];
//               chip12 <= chip12_reg[18];
//             end
//             else if (chip_cnt[4:0]==5'd19) begin//
//               chip_cnt[4:0] <= 5'd20;
//               chip1 <= chip1_reg[19];
//               chip2 <= chip2_reg[19];
//               chip3 <= chip3_reg[19];
//               chip4 <= chip4_reg[19];
//               chip5 <= chip5_reg[19];
//               chip6 <= chip6_reg[19];
//               chip7 <= chip7_reg[19];
//               chip8 <= chip8_reg[19];
//               chip9 <= chip9_reg[19];
//               chip10 <= chip10_reg[19];
//               chip11 <= chip11_reg[19];
//               chip12 <= chip12_reg[19];
//             end
//             else if (chip_cnt[4:0]==5'd20) begin//
//               chip_cnt[4:0] <= 5'd21;
//               chip1 <= chip1_reg[20];
//               chip2 <= chip2_reg[20];
//               chip3 <= chip3_reg[20];
//               chip4 <= chip4_reg[20];
//               chip5 <= chip5_reg[20];
//               chip6 <= chip6_reg[20];
//               chip7 <= chip7_reg[20];
//               chip8 <= chip8_reg[20];
//               chip9 <= chip9_reg[20];
//               chip10 <= chip10_reg[20];
//               chip11 <= chip11_reg[20];
//               chip12 <= chip12_reg[20];
//             end
//             else if (chip_cnt[4:0]==5'd21) begin//
//               chip_cnt[4:0] <= 5'd22;
//               chip1 <= chip1_reg[21];
//               chip2 <= chip2_reg[21];
//               chip3 <= chip3_reg[21];
//               chip4 <= chip4_reg[21];
//               chip5 <= chip5_reg[21];
//               chip6 <= chip6_reg[21];
//               chip7 <= chip7_reg[21];
//               chip8 <= chip8_reg[21];
//               chip9 <= chip9_reg[21];
//               chip10 <= chip10_reg[21];
//               chip11 <= chip11_reg[21];
//               chip12 <= chip12_reg[21];
//             end
//             else if (chip_cnt[4:0]==5'd22) begin//
//               chip_cnt[4:0] <= 5'd23;
//               chip1 <= chip1_reg[22];
//               chip2 <= chip2_reg[22];
//               chip3 <= chip3_reg[22];
//               chip4 <= chip4_reg[22];
//               chip5 <= chip5_reg[22];
//               chip6 <= chip6_reg[22];
//               chip7 <= chip7_reg[22];
//               chip8 <= chip8_reg[22];
//               chip9 <= chip9_reg[22];
//               chip10 <= chip10_reg[22];
//               chip11 <= chip11_reg[22];
//               chip12 <= chip12_reg[22];
//             end
//             else if (chip_cnt[4:0]==5'd23) begin//
//               chip_cnt[4:0] <= 5'd24;
//               chip1 <= chip1_reg[23];
//               chip2 <= chip2_reg[23];
//               chip3 <= chip3_reg[23];
//               chip4 <= chip4_reg[23];
//               chip5 <= chip5_reg[23];
//               chip6 <= chip6_reg[23];
//               chip7 <= chip7_reg[23];
//               chip8 <= chip8_reg[23];
//               chip9 <= chip9_reg[23];
//               chip10 <= chip10_reg[23];
//               chip11 <= chip11_reg[23];
//               chip12 <= chip12_reg[23];
//             end
//             else if (chip_cnt[4:0]==5'd24) begin//
//               chip_cnt[4:0] <= 5'd25;
//               chip1 <= chip1_reg[24];
//               chip2 <= chip2_reg[24];
//               chip3 <= chip3_reg[24];
//               chip4 <= chip4_reg[24];
//               chip5 <= chip5_reg[24];
//               chip6 <= chip6_reg[24];
//               chip7 <= chip7_reg[24];
//               chip8 <= chip8_reg[24];
//               chip9 <= chip9_reg[24];
//               chip10 <= chip10_reg[24];
//               chip11 <= chip11_reg[24];
//               chip12 <= chip12_reg[24];
//             end
//             else if (chip_cnt[4:0]==5'd25) begin//
//               chip_cnt[4:0] <= 5'd26;
//               chip1 <= chip1_reg[25];
//               chip2 <= chip2_reg[25];
//               chip3 <= chip3_reg[25];
//               chip4 <= chip4_reg[25];
//               chip5 <= chip5_reg[25];
//               chip6 <= chip6_reg[25];
//               chip7 <= chip7_reg[25];
//               chip8 <= chip8_reg[25];
//               chip9 <= chip9_reg[25];
//               chip10 <= chip10_reg[25];
//               chip11 <= chip11_reg[25];
//               chip12 <= chip12_reg[25];
//             end
//             else if (chip_cnt[4:0]==5'd26) begin//
//               chip_cnt[4:0] <= 5'd27;
//               chip1 <= chip1_reg[26];
//               chip2 <= chip2_reg[26];
//               chip3 <= chip3_reg[26];
//               chip4 <= chip4_reg[26];
//               chip5 <= chip5_reg[26];
//               chip6 <= chip6_reg[26];
//               chip7 <= chip7_reg[26];
//               chip8 <= chip8_reg[26];
//               chip9 <= chip9_reg[26];
//               chip10 <= chip10_reg[26];
//               chip11 <= chip11_reg[26];
//               chip12 <= chip12_reg[26];
//             end
//             else begin//
//               chip_cnt[4:0] <= 5'd27;
//               chip1 <= chip1_reg[26];
//               chip2 <= chip2_reg[26];
//               chip3 <= chip3_reg[26];
//               chip4 <= chip4_reg[26];
//               chip5 <= chip5_reg[26];
//               chip6 <= chip6_reg[26];
//               chip7 <= chip7_reg[26];
//               chip8 <= chip8_reg[26];
//               chip9 <= chip9_reg[26];
//               chip10 <= chip10_reg[26];
//               chip11 <= chip11_reg[26];
//               chip12 <= chip12_reg[26];
//             end
// end








////////////////////////////////////////////////

wire     START;
wire     RE_START;




wire [15:0]     FRAME_COUNT;



  sync_trans sync_trans (
      .CLK_20M          (CLK_20M),
      .CLK_120M         (CLK_120M),
      .RST              (RST),
      .START            (),
      .RE_START         (),
      .FRAME_IN         (FRAME_IN),
      .SYNC             (SYNC),
      .FRAME_OUT        (),
      .FRAME_COUNT      ());

wire          FRAME_O;


  wire [15:0]        CHIP1_ADDR1_DAT1;
  wire [15:0]        CHIP1_ADDR1_DAT2;
  wire [15:0]        CHIP1_ADDR1_DAT3;
  wire [15:0]        CHIP1_ADDR1_DAT4;
  wire [15:0]        CHIP1_ADDR1_DAT5;
  wire [15:0]        CHIP1_ADDR1_DAT6;
  wire [15:0]        CHIP1_ADDR1_DAT7;
  wire [15:0]        CHIP1_ADDR1_DAT8;
  wire [15:0]        CHIP1_ADDR1_DAT9;
  wire [15:0]        CHIP1_ADDR1_DAT10;
  wire [15:0]        CHIP1_ADDR1_DAT11;
  wire [15:0]        CHIP1_ADDR1_DAT12;
  wire [15:0]        CHIP1_ADDR2_DAT1;
  wire [15:0]        CHIP1_ADDR2_DAT2;
  wire [15:0]        CHIP1_ADDR2_DAT3;
  wire [15:0]        CHIP1_ADDR2_DAT4;
  wire [15:0]        CHIP1_ADDR2_DAT5;
  wire [15:0]        CHIP1_ADDR2_DAT6;
  wire [15:0]        CHIP1_ADDR2_DAT7;
  wire [15:0]        CHIP1_ADDR2_DAT8;
  wire [15:0]        CHIP1_ADDR2_DAT9;
  wire [15:0]        CHIP1_ADDR2_DAT10;
  wire [15:0]        CHIP1_ADDR2_DAT11;
  wire [15:0]        CHIP1_ADDR2_DAT12;


  wire [15:0]        CHIP2_ADDR1_DAT1;
  wire [15:0]        CHIP2_ADDR1_DAT2;
  wire [15:0]        CHIP2_ADDR1_DAT3;
  wire [15:0]        CHIP2_ADDR1_DAT4;
  wire [15:0]        CHIP2_ADDR1_DAT5;
  wire [15:0]        CHIP2_ADDR1_DAT6;
  wire [15:0]        CHIP2_ADDR1_DAT7;
  wire [15:0]        CHIP2_ADDR1_DAT8;
  wire [15:0]        CHIP2_ADDR1_DAT9;
  wire [15:0]        CHIP2_ADDR1_DAT10;
  wire [15:0]        CHIP2_ADDR1_DAT11;
  wire [15:0]        CHIP2_ADDR1_DAT12;
  wire [15:0]        CHIP2_ADDR2_DAT1;
  wire [15:0]        CHIP2_ADDR2_DAT2;
  wire [15:0]        CHIP2_ADDR2_DAT3;
  wire [15:0]        CHIP2_ADDR2_DAT4;
  wire [15:0]        CHIP2_ADDR2_DAT5;
  wire [15:0]        CHIP2_ADDR2_DAT6;
  wire [15:0]        CHIP2_ADDR2_DAT7;
  wire [15:0]        CHIP2_ADDR2_DAT8;
  wire [15:0]        CHIP2_ADDR2_DAT9;
  wire [15:0]        CHIP2_ADDR2_DAT10;
  wire [15:0]        CHIP2_ADDR2_DAT11;
  wire [15:0]        CHIP2_ADDR2_DAT12;

  wire [15:0]        CHIP3_ADDR1_DAT1;
  wire [15:0]        CHIP3_ADDR1_DAT2;
  wire [15:0]        CHIP3_ADDR1_DAT3;
  wire [15:0]        CHIP3_ADDR1_DAT4;
  wire [15:0]        CHIP3_ADDR1_DAT5;
  wire [15:0]        CHIP3_ADDR1_DAT6;
  wire [15:0]        CHIP3_ADDR1_DAT7;
  wire [15:0]        CHIP3_ADDR1_DAT8;
  wire [15:0]        CHIP3_ADDR1_DAT9;
  wire [15:0]        CHIP3_ADDR1_DAT10;
  wire [15:0]        CHIP3_ADDR1_DAT11;
  wire [15:0]        CHIP3_ADDR1_DAT12;
  wire [15:0]        CHIP3_ADDR2_DAT1;
  wire [15:0]        CHIP3_ADDR2_DAT2;
  wire [15:0]        CHIP3_ADDR2_DAT3;
  wire [15:0]        CHIP3_ADDR2_DAT4;
  wire [15:0]        CHIP3_ADDR2_DAT5;
  wire [15:0]        CHIP3_ADDR2_DAT6;
  wire [15:0]        CHIP3_ADDR2_DAT7;
  wire [15:0]        CHIP3_ADDR2_DAT8;
  wire [15:0]        CHIP3_ADDR2_DAT9;
  wire [15:0]        CHIP3_ADDR2_DAT10;
  wire [15:0]        CHIP3_ADDR2_DAT11;
  wire [15:0]        CHIP3_ADDR2_DAT12;

  wire [15:0]        CHIP4_ADDR1_DAT1;
  wire [15:0]        CHIP4_ADDR1_DAT2;
  wire [15:0]        CHIP4_ADDR1_DAT3;
  wire [15:0]        CHIP4_ADDR1_DAT4;
  wire [15:0]        CHIP4_ADDR1_DAT5;
  wire [15:0]        CHIP4_ADDR1_DAT6;
  wire [15:0]        CHIP4_ADDR1_DAT7;
  wire [15:0]        CHIP4_ADDR1_DAT8;
  wire [15:0]        CHIP4_ADDR1_DAT9;
  wire [15:0]        CHIP4_ADDR1_DAT10;
  wire [15:0]        CHIP4_ADDR1_DAT11;
  wire [15:0]        CHIP4_ADDR1_DAT12;
  wire [15:0]        CHIP4_ADDR2_DAT1;
  wire [15:0]        CHIP4_ADDR2_DAT2;
  wire [15:0]        CHIP4_ADDR2_DAT3;
  wire [15:0]        CHIP4_ADDR2_DAT4;
  wire [15:0]        CHIP4_ADDR2_DAT5;
  wire [15:0]        CHIP4_ADDR2_DAT6;
  wire [15:0]        CHIP4_ADDR2_DAT7;
  wire [15:0]        CHIP4_ADDR2_DAT8;
  wire [15:0]        CHIP4_ADDR2_DAT9;
  wire [15:0]        CHIP4_ADDR2_DAT10;
  wire [15:0]        CHIP4_ADDR2_DAT11;
  wire [15:0]        CHIP4_ADDR2_DAT12;

  wire [15:0]        CHIP5_ADDR1_DAT1;
  wire [15:0]        CHIP5_ADDR1_DAT2;
  wire [15:0]        CHIP5_ADDR1_DAT3;
  wire [15:0]        CHIP5_ADDR1_DAT4;
  wire [15:0]        CHIP5_ADDR1_DAT5;
  wire [15:0]        CHIP5_ADDR1_DAT6;
  wire [15:0]        CHIP5_ADDR1_DAT7;
  wire [15:0]        CHIP5_ADDR1_DAT8;
  wire [15:0]        CHIP5_ADDR1_DAT9;
  wire [15:0]        CHIP5_ADDR1_DAT10;
  wire [15:0]        CHIP5_ADDR1_DAT11;
  wire [15:0]        CHIP5_ADDR1_DAT12;
  wire [15:0]        CHIP5_ADDR2_DAT1;
  wire [15:0]        CHIP5_ADDR2_DAT2;
  wire [15:0]        CHIP5_ADDR2_DAT3;
  wire [15:0]        CHIP5_ADDR2_DAT4;
  wire [15:0]        CHIP5_ADDR2_DAT5;
  wire [15:0]        CHIP5_ADDR2_DAT6;
  wire [15:0]        CHIP5_ADDR2_DAT7;
  wire [15:0]        CHIP5_ADDR2_DAT8;
  wire [15:0]        CHIP5_ADDR2_DAT9;
  wire [15:0]        CHIP5_ADDR2_DAT10;
  wire [15:0]        CHIP5_ADDR2_DAT11;
  wire [15:0]        CHIP5_ADDR2_DAT12;


  wire [15:0]        CHIP6_ADDR1_DAT1;
  wire [15:0]        CHIP6_ADDR1_DAT2;
  wire [15:0]        CHIP6_ADDR1_DAT3;
  wire [15:0]        CHIP6_ADDR1_DAT4;
  wire [15:0]        CHIP6_ADDR1_DAT5;
  wire [15:0]        CHIP6_ADDR1_DAT6;
  wire [15:0]        CHIP6_ADDR1_DAT7;
  wire [15:0]        CHIP6_ADDR1_DAT8;
  wire [15:0]        CHIP6_ADDR1_DAT9;
  wire [15:0]        CHIP6_ADDR1_DAT10;
  wire [15:0]        CHIP6_ADDR1_DAT11;
  wire [15:0]        CHIP6_ADDR1_DAT12;
  wire [15:0]        CHIP6_ADDR2_DAT1;
  wire [15:0]        CHIP6_ADDR2_DAT2;
  wire [15:0]        CHIP6_ADDR2_DAT3;
  wire [15:0]        CHIP6_ADDR2_DAT4;
  wire [15:0]        CHIP6_ADDR2_DAT5;
  wire [15:0]        CHIP6_ADDR2_DAT6;
  wire [15:0]        CHIP6_ADDR2_DAT7;
  wire [15:0]        CHIP6_ADDR2_DAT8;
  wire [15:0]        CHIP6_ADDR2_DAT9;
  wire [15:0]        CHIP6_ADDR2_DAT10;
  wire [15:0]        CHIP6_ADDR2_DAT11;
  wire [15:0]        CHIP6_ADDR2_DAT12;

  wire [15:0]        CHIP7_ADDR1_DAT1;
  wire [15:0]        CHIP7_ADDR1_DAT2;
  wire [15:0]        CHIP7_ADDR1_DAT3;
  wire [15:0]        CHIP7_ADDR1_DAT4;
  wire [15:0]        CHIP7_ADDR1_DAT5;
  wire [15:0]        CHIP7_ADDR1_DAT6;
  wire [15:0]        CHIP7_ADDR1_DAT7;
  wire [15:0]        CHIP7_ADDR1_DAT8;
  wire [15:0]        CHIP7_ADDR1_DAT9;
  wire [15:0]        CHIP7_ADDR1_DAT10;
  wire [15:0]        CHIP7_ADDR1_DAT11;
  wire [15:0]        CHIP7_ADDR1_DAT12;
  wire [15:0]        CHIP7_ADDR2_DAT1;
  wire [15:0]        CHIP7_ADDR2_DAT2;
  wire [15:0]        CHIP7_ADDR2_DAT3;
  wire [15:0]        CHIP7_ADDR2_DAT4;
  wire [15:0]        CHIP7_ADDR2_DAT5;
  wire [15:0]        CHIP7_ADDR2_DAT6;
  wire [15:0]        CHIP7_ADDR2_DAT7;
  wire [15:0]        CHIP7_ADDR2_DAT8;
  wire [15:0]        CHIP7_ADDR2_DAT9;
  wire [15:0]        CHIP7_ADDR2_DAT10;
  wire [15:0]        CHIP7_ADDR2_DAT11;
  wire [15:0]        CHIP7_ADDR2_DAT12;

  wire [15:0]        CHIP8_ADDR1_DAT1;
  wire [15:0]        CHIP8_ADDR1_DAT2;
  wire [15:0]        CHIP8_ADDR1_DAT3;
  wire [15:0]        CHIP8_ADDR1_DAT4;
  wire [15:0]        CHIP8_ADDR1_DAT5;
  wire [15:0]        CHIP8_ADDR1_DAT6;
  wire [15:0]        CHIP8_ADDR1_DAT7;
  wire [15:0]        CHIP8_ADDR1_DAT8;
  wire [15:0]        CHIP8_ADDR1_DAT9;
  wire [15:0]        CHIP8_ADDR1_DAT10;
  wire [15:0]        CHIP8_ADDR1_DAT11;
  wire [15:0]        CHIP8_ADDR1_DAT12;
  wire [15:0]        CHIP8_ADDR2_DAT1;
  wire [15:0]        CHIP8_ADDR2_DAT2;
  wire [15:0]        CHIP8_ADDR2_DAT3;
  wire [15:0]        CHIP8_ADDR2_DAT4;
  wire [15:0]        CHIP8_ADDR2_DAT5;
  wire [15:0]        CHIP8_ADDR2_DAT6;
  wire [15:0]        CHIP8_ADDR2_DAT7;
  wire [15:0]        CHIP8_ADDR2_DAT8;
  wire [15:0]        CHIP8_ADDR2_DAT9;
  wire [15:0]        CHIP8_ADDR2_DAT10;
  wire [15:0]        CHIP8_ADDR2_DAT11;
  wire [15:0]        CHIP8_ADDR2_DAT12;


  wire [15:0]        CHIP9_ADDR1_DAT1;
  wire [15:0]        CHIP9_ADDR1_DAT2;
  wire [15:0]        CHIP9_ADDR1_DAT3;
  wire [15:0]        CHIP9_ADDR1_DAT4;
  wire [15:0]        CHIP9_ADDR1_DAT5;
  wire [15:0]        CHIP9_ADDR1_DAT6;
  wire [15:0]        CHIP9_ADDR1_DAT7;
  wire [15:0]        CHIP9_ADDR1_DAT8;
  wire [15:0]        CHIP9_ADDR1_DAT9;
  wire [15:0]        CHIP9_ADDR1_DAT10;
  wire [15:0]        CHIP9_ADDR1_DAT11;
  wire [15:0]        CHIP9_ADDR1_DAT12;
  wire [15:0]        CHIP9_ADDR2_DAT1;
  wire [15:0]        CHIP9_ADDR2_DAT2;
  wire [15:0]        CHIP9_ADDR2_DAT3;
  wire [15:0]        CHIP9_ADDR2_DAT4;
  wire [15:0]        CHIP9_ADDR2_DAT5;
  wire [15:0]        CHIP9_ADDR2_DAT6;
  wire [15:0]        CHIP9_ADDR2_DAT7;
  wire [15:0]        CHIP9_ADDR2_DAT8;
  wire [15:0]        CHIP9_ADDR2_DAT9;
  wire [15:0]        CHIP9_ADDR2_DAT10;
  wire [15:0]        CHIP9_ADDR2_DAT11;
  wire [15:0]        CHIP9_ADDR2_DAT12;

  wire [15:0]        CHIP10_ADDR1_DAT1;
  wire [15:0]        CHIP10_ADDR1_DAT2;
  wire [15:0]        CHIP10_ADDR1_DAT3;
  wire [15:0]        CHIP10_ADDR1_DAT4;
  wire [15:0]        CHIP10_ADDR1_DAT5;
  wire [15:0]        CHIP10_ADDR1_DAT6;
  wire [15:0]        CHIP10_ADDR1_DAT7;
  wire [15:0]        CHIP10_ADDR1_DAT8;
  wire [15:0]        CHIP10_ADDR1_DAT9;
  wire [15:0]        CHIP10_ADDR1_DAT10;
  wire [15:0]        CHIP10_ADDR1_DAT11;
  wire [15:0]        CHIP10_ADDR1_DAT12;
  wire [15:0]        CHIP10_ADDR2_DAT1;
  wire [15:0]        CHIP10_ADDR2_DAT2;
  wire [15:0]        CHIP10_ADDR2_DAT3;
  wire [15:0]        CHIP10_ADDR2_DAT4;
  wire [15:0]        CHIP10_ADDR2_DAT5;
  wire [15:0]        CHIP10_ADDR2_DAT6;
  wire [15:0]        CHIP10_ADDR2_DAT7;
  wire [15:0]        CHIP10_ADDR2_DAT8;
  wire [15:0]        CHIP10_ADDR2_DAT9;
  wire [15:0]        CHIP10_ADDR2_DAT10;
  wire [15:0]        CHIP10_ADDR2_DAT11;
  wire [15:0]        CHIP10_ADDR2_DAT12;

  wire [15:0]        CHIP11_ADDR1_DAT1;
  wire [15:0]        CHIP11_ADDR1_DAT2;
  wire [15:0]        CHIP11_ADDR1_DAT3;
  wire [15:0]        CHIP11_ADDR1_DAT4;
  wire [15:0]        CHIP11_ADDR1_DAT5;
  wire [15:0]        CHIP11_ADDR1_DAT6;
  wire [15:0]        CHIP11_ADDR1_DAT7;
  wire [15:0]        CHIP11_ADDR1_DAT8;
  wire [15:0]        CHIP11_ADDR1_DAT9;
  wire [15:0]        CHIP11_ADDR1_DAT10;
  wire [15:0]        CHIP11_ADDR1_DAT11;
  wire [15:0]        CHIP11_ADDR1_DAT12;
  wire [15:0]        CHIP11_ADDR2_DAT1;
  wire [15:0]        CHIP11_ADDR2_DAT2;
  wire [15:0]        CHIP11_ADDR2_DAT3;
  wire [15:0]        CHIP11_ADDR2_DAT4;
  wire [15:0]        CHIP11_ADDR2_DAT5;
  wire [15:0]        CHIP11_ADDR2_DAT6;
  wire [15:0]        CHIP11_ADDR2_DAT7;
  wire [15:0]        CHIP11_ADDR2_DAT8;
  wire [15:0]        CHIP11_ADDR2_DAT9;
  wire [15:0]        CHIP11_ADDR2_DAT10;
  wire [15:0]        CHIP11_ADDR2_DAT11;
  wire [15:0]        CHIP11_ADDR2_DAT12;


  wire [15:0]        CHIP12_ADDR1_DAT1;
  wire [15:0]        CHIP12_ADDR1_DAT2;
  wire [15:0]        CHIP12_ADDR1_DAT3;
  wire [15:0]        CHIP12_ADDR1_DAT4;
  wire [15:0]        CHIP12_ADDR1_DAT5;
  wire [15:0]        CHIP12_ADDR1_DAT6;
  wire [15:0]        CHIP12_ADDR1_DAT7;
  wire [15:0]        CHIP12_ADDR1_DAT8;
  wire [15:0]        CHIP12_ADDR1_DAT9;
  wire [15:0]        CHIP12_ADDR1_DAT10;
  wire [15:0]        CHIP12_ADDR1_DAT11;
  wire [15:0]        CHIP12_ADDR1_DAT12;
  wire [15:0]        CHIP12_ADDR2_DAT1;
  wire [15:0]        CHIP12_ADDR2_DAT2;
  wire [15:0]        CHIP12_ADDR2_DAT3;
  wire [15:0]        CHIP12_ADDR2_DAT4;
  wire [15:0]        CHIP12_ADDR2_DAT5;
  wire [15:0]        CHIP12_ADDR2_DAT6;
  wire [15:0]        CHIP12_ADDR2_DAT7;
  wire [15:0]        CHIP12_ADDR2_DAT8;
  wire [15:0]        CHIP12_ADDR2_DAT9;
  wire [15:0]        CHIP12_ADDR2_DAT10;
  wire [15:0]        CHIP12_ADDR2_DAT11;
  wire [15:0]        CHIP12_ADDR2_DAT12;


reg  [31:0]   read_cnt;
reg           chip1_read1_en1;
reg           chip1_read1_en2;
reg           chip1_read1_en3;
reg           chip1_read1_en4;
reg           chip1_read1_en5;
reg           chip1_read1_en6;
reg           chip1_read1_en7;
reg           chip1_read1_en8;
reg           chip1_read1_en9;
reg           chip1_read1_en10;
reg           chip1_read1_en11;
reg           chip1_read1_en12;
reg           chip1_read2_en1;
reg           chip1_read2_en2;
reg           chip1_read2_en3;
reg           chip1_read2_en4;
reg           chip1_read2_en5;
reg           chip1_read2_en6;
reg           chip1_read2_en7;
reg           chip1_read2_en8;
reg           chip1_read2_en9;
reg           chip1_read2_en10;
reg           chip1_read2_en11;
reg           chip1_read2_en12;

reg           chip2_read1_en1;
reg           chip2_read1_en2;
reg           chip2_read1_en3;
reg           chip2_read1_en4;
reg           chip2_read1_en5;
reg           chip2_read1_en6;
reg           chip2_read1_en7;
reg           chip2_read1_en8;
reg           chip2_read1_en9;
reg           chip2_read1_en10;
reg           chip2_read1_en11;
reg           chip2_read1_en12;
reg           chip2_read2_en1;
reg           chip2_read2_en2;
reg           chip2_read2_en3;
reg           chip2_read2_en4;
reg           chip2_read2_en5;
reg           chip2_read2_en6;
reg           chip2_read2_en7;
reg           chip2_read2_en8;
reg           chip2_read2_en9;
reg           chip2_read2_en10;
reg           chip2_read2_en11;
reg           chip2_read2_en12;

reg           chip3_read1_en1;
reg           chip3_read1_en2;
reg           chip3_read1_en3;
reg           chip3_read1_en4;
reg           chip3_read1_en5;
reg           chip3_read1_en6;
reg           chip3_read1_en7;
reg           chip3_read1_en8;
reg           chip3_read1_en9;
reg           chip3_read1_en10;
reg           chip3_read1_en11;
reg           chip3_read1_en12;
reg           chip3_read2_en1;
reg           chip3_read2_en2;
reg           chip3_read2_en3;
reg           chip3_read2_en4;
reg           chip3_read2_en5;
reg           chip3_read2_en6;
reg           chip3_read2_en7;
reg           chip3_read2_en8;
reg           chip3_read2_en9;
reg           chip3_read2_en10;
reg           chip3_read2_en11;
reg           chip3_read2_en12;

reg           chip4_read1_en1;
reg           chip4_read1_en2;
reg           chip4_read1_en3;
reg           chip4_read1_en4;
reg           chip4_read1_en5;
reg           chip4_read1_en6;
reg           chip4_read1_en7;
reg           chip4_read1_en8;
reg           chip4_read1_en9;
reg           chip4_read1_en10;
reg           chip4_read1_en11;
reg           chip4_read1_en12;
reg           chip4_read2_en1;
reg           chip4_read2_en2;
reg           chip4_read2_en3;
reg           chip4_read2_en4;
reg           chip4_read2_en5;
reg           chip4_read2_en6;
reg           chip4_read2_en7;
reg           chip4_read2_en8;
reg           chip4_read2_en9;
reg           chip4_read2_en10;
reg           chip4_read2_en11;
reg           chip4_read2_en12;

reg           chip5_read1_en1;
reg           chip5_read1_en2;
reg           chip5_read1_en3;
reg           chip5_read1_en4;
reg           chip5_read1_en5;
reg           chip5_read1_en6;
reg           chip5_read1_en7;
reg           chip5_read1_en8;
reg           chip5_read1_en9;
reg           chip5_read1_en10;
reg           chip5_read1_en11;
reg           chip5_read1_en12;
reg           chip5_read2_en1;
reg           chip5_read2_en2;
reg           chip5_read2_en3;
reg           chip5_read2_en4;
reg           chip5_read2_en5;
reg           chip5_read2_en6;
reg           chip5_read2_en7;
reg           chip5_read2_en8;
reg           chip5_read2_en9;
reg           chip5_read2_en10;
reg           chip5_read2_en11;
reg           chip5_read2_en12;

reg           chip6_read1_en1;
reg           chip6_read1_en2;
reg           chip6_read1_en3;
reg           chip6_read1_en4;
reg           chip6_read1_en5;
reg           chip6_read1_en6;
reg           chip6_read1_en7;
reg           chip6_read1_en8;
reg           chip6_read1_en9;
reg           chip6_read1_en10;
reg           chip6_read1_en11;
reg           chip6_read1_en12;
reg           chip6_read2_en1;
reg           chip6_read2_en2;
reg           chip6_read2_en3;
reg           chip6_read2_en4;
reg           chip6_read2_en5;
reg           chip6_read2_en6;
reg           chip6_read2_en7;
reg           chip6_read2_en8;
reg           chip6_read2_en9;
reg           chip6_read2_en10;
reg           chip6_read2_en11;
reg           chip6_read2_en12;

reg           chip7_read1_en1;
reg           chip7_read1_en2;
reg           chip7_read1_en3;
reg           chip7_read1_en4;
reg           chip7_read1_en5;
reg           chip7_read1_en6;
reg           chip7_read1_en7;
reg           chip7_read1_en8;
reg           chip7_read1_en9;
reg           chip7_read1_en10;
reg           chip7_read1_en11;
reg           chip7_read1_en12;
reg           chip7_read2_en1;
reg           chip7_read2_en2;
reg           chip7_read2_en3;
reg           chip7_read2_en4;
reg           chip7_read2_en5;
reg           chip7_read2_en6;
reg           chip7_read2_en7;
reg           chip7_read2_en8;
reg           chip7_read2_en9;
reg           chip7_read2_en10;
reg           chip7_read2_en11;
reg           chip7_read2_en12;

reg           chip8_read1_en1;
reg           chip8_read1_en2;
reg           chip8_read1_en3;
reg           chip8_read1_en4;
reg           chip8_read1_en5;
reg           chip8_read1_en6;
reg           chip8_read1_en7;
reg           chip8_read1_en8;
reg           chip8_read1_en9;
reg           chip8_read1_en10;
reg           chip8_read1_en11;
reg           chip8_read1_en12;
reg           chip8_read2_en1;
reg           chip8_read2_en2;
reg           chip8_read2_en3;
reg           chip8_read2_en4;
reg           chip8_read2_en5;
reg           chip8_read2_en6;
reg           chip8_read2_en7;
reg           chip8_read2_en8;
reg           chip8_read2_en9;
reg           chip8_read2_en10;
reg           chip8_read2_en11;
reg           chip8_read2_en12;

reg           chip9_read1_en1;
reg           chip9_read1_en2;
reg           chip9_read1_en3;
reg           chip9_read1_en4;
reg           chip9_read1_en5;
reg           chip9_read1_en6;
reg           chip9_read1_en7;
reg           chip9_read1_en8;
reg           chip9_read1_en9;
reg           chip9_read1_en10;
reg           chip9_read1_en11;
reg           chip9_read1_en12;
reg           chip9_read2_en1;
reg           chip9_read2_en2;
reg           chip9_read2_en3;
reg           chip9_read2_en4;
reg           chip9_read2_en5;
reg           chip9_read2_en6;
reg           chip9_read2_en7;
reg           chip9_read2_en8;
reg           chip9_read2_en9;
reg           chip9_read2_en10;
reg           chip9_read2_en11;
reg           chip9_read2_en12;

reg           chip10_read1_en1;
reg           chip10_read1_en2;
reg           chip10_read1_en3;
reg           chip10_read1_en4;
reg           chip10_read1_en5;
reg           chip10_read1_en6;
reg           chip10_read1_en7;
reg           chip10_read1_en8;
reg           chip10_read1_en9;
reg           chip10_read1_en10;
reg           chip10_read1_en11;
reg           chip10_read1_en12;
reg           chip10_read2_en1;
reg           chip10_read2_en2;
reg           chip10_read2_en3;
reg           chip10_read2_en4;
reg           chip10_read2_en5;
reg           chip10_read2_en6;
reg           chip10_read2_en7;
reg           chip10_read2_en8;
reg           chip10_read2_en9;
reg           chip10_read2_en10;
reg           chip10_read2_en11;
reg           chip10_read2_en12;

reg           chip11_read1_en1;
reg           chip11_read1_en2;
reg           chip11_read1_en3;
reg           chip11_read1_en4;
reg           chip11_read1_en5;
reg           chip11_read1_en6;
reg           chip11_read1_en7;
reg           chip11_read1_en8;
reg           chip11_read1_en9;
reg           chip11_read1_en10;
reg           chip11_read1_en11;
reg           chip11_read1_en12;
reg           chip11_read2_en1;
reg           chip11_read2_en2;
reg           chip11_read2_en3;
reg           chip11_read2_en4;
reg           chip11_read2_en5;
reg           chip11_read2_en6;
reg           chip11_read2_en7;
reg           chip11_read2_en8;
reg           chip11_read2_en9;
reg           chip11_read2_en10;
reg           chip11_read2_en11;
reg           chip11_read2_en12;

reg           chip12_read1_en1;
reg           chip12_read1_en2;
reg           chip12_read1_en3;
reg           chip12_read1_en4;
reg           chip12_read1_en5;
reg           chip12_read1_en6;
reg           chip12_read1_en7;
reg           chip12_read1_en8;
reg           chip12_read1_en9;
reg           chip12_read1_en10;
reg           chip12_read1_en11;
reg           chip12_read1_en12;
reg           chip12_read2_en1;
reg           chip12_read2_en2;
reg           chip12_read2_en3;
reg           chip12_read2_en4;
reg           chip12_read2_en5;
reg           chip12_read2_en6;
reg           chip12_read2_en7;
reg           chip12_read2_en8;
reg           chip12_read2_en9;
reg           chip12_read2_en10;
reg           chip12_read2_en11;
reg           chip12_read2_en12;


wire          FRAME2;
wire          FRAME3;
wire          FRAME4;
wire          FRAME5;
wire          FRAME6;
wire          FRAME7;
wire          FRAME8;
wire          FRAME9;
wire          FRAME10;
wire          FRAME11;
wire          FRAME12;
wire          RD_OUTEN;
wire         next_start;


//BP40_TRANS
wire          sync_neg;
wire          sync_reg;

FD sync (.D(SYNC1), .C(CLK_120M), .Q(sync_reg));

assign sync_neg = (~SYNC1)&&sync_reg;

// State Machine
reg [1:0] statex_reg, statex_next;
localparam
  Y_IDLE         = 0,
  X_IDLE         = 1,
  F_OUT          = 2,
  F2_OUT         = 3;

always @(posedge CLK_120M or posedge RST) begin
  if (RST) statex_reg <= Y_IDLE;
  else statex_reg <= statex_next;
end

always @(*) begin
  statex_next = Y_IDLE;
  case(statex_reg)
    Y_IDLE: begin     //STATE0
      if(SYNC1&&FRAME_IN) begin 
        statex_next = F_OUT;
      end  
      else begin
        statex_next = Y_IDLE;
      end
    end
    F_OUT: begin     //STATE0
      if(sync_neg) begin 
        statex_next = F2_OUT;
      end  
      else begin
        statex_next = F_OUT;
      end
    end
    F2_OUT: begin     //STATE0
      if(fout_end) begin 
        statex_next = X_IDLE;
      end  
      else begin
        statex_next = F2_OUT;
      end
    end
    X_IDLE: begin     //STATE0
      if(sync_neg) begin 
        statex_next = Y_IDLE;
      end  
      else begin
        statex_next = X_IDLE;
      end
    end


  endcase
end

assign frame_end = statex_next == X_IDLE;
wire frameY_end;
assign frameY_end = (statex_next == X_IDLE)&&(statex_reg == F2_OUT);
reg  [4:0]   fout_cnt;
wire         fout_start;
wire         fout_end;    

always @(posedge CLK_120M or posedge RST) begin
  if (RST) begin
    fout_cnt[4:0] <= 0; 
  end
  else if (fout_start) begin
      if(fout_end)begin
        fout_cnt[4:0] <= 0;
      end
      else begin
        fout_cnt[4:0] <= fout_cnt[4:0] + 1;
      end
  end
end
assign fout_start = (statex_reg==F2_OUT);
assign fout_end   = fout_start&&(fout_cnt[4:0]==5'd19);//12288 //4/16



reg       fout_reg;

always @(posedge CLK_120M or posedge RST) begin
            if (RST) begin
              fout_reg <= 1'b0;
            end
            else if ((statex_reg==F2_OUT)&&(fout_cnt[4:0]==5'd4)) begin
              fout_reg <= 1'b1;
            end
            else if ((statex_reg==F2_OUT)&&(fout_cnt[4:0]==5'd16)) begin//15 //F2_OUT
              fout_reg <= 1'b0;
            end
            else begin
              fout_reg <= fout_reg;
            end
end

assign FRAME_O = fout_reg;

//20250825
reg       fout1_reg;
wire      sync_start;

always @(posedge CLK_120M or posedge RST) begin
            if (RST) begin
              fout1_reg <= 1'b0;
            end
            else if ((statex_reg==F2_OUT)&&(fout_cnt[4:0]==5'd3)) begin
              fout1_reg <= 1'b1;
            end
            else if ((statex_reg==F2_OUT)&&(fout_cnt[4:0]==5'd4)) begin//15 //F2_OUT
              fout1_reg <= 1'b0;
            end
            else begin
              fout1_reg <= fout1_reg;
            end
end
assign sync_start = fout1_reg;
//20250825

reg [15:0]      frame_end_r;

always @(posedge CLK_120M or posedge RST) begin
            if (RST) begin
              frame_end_r[15:0] <= 16'd0;
            end
            else if (frameY_end) begin
              frame_end_r[15:0] <= frame_end_r[15:0]+1'd1;
            end
            else begin
              frame_end_r[15:0] <= frame_end_r[15:0];
            end
end

assign FRAME_COUNT[15:0] = frame_end_r[15:0];


  bp40_xtrans bp40_1trans (
      .CLK              (CLK_120M),
      .CLK_80M          (CLK_READ),
      .CLK_125M         (CLK_125M),
      .frame_end        (frame_end),
      .RST              (RST),
      .SYNC             (SYNC1),
      .chip             (chip1),
      .A_REG            (A_REG1),
      .sync_start       (sync_start),
      // .FRAME_O          (FRAME_O),
      .FRAME_COUNT      (FRAME_COUNT),
      .RD_OUTEN         (RD_OUTEN),
      .next_start       (next_start),
      .SPIEE_PD         (),
      .PHASE_CNT        (phase1_cnt),
      .VTH1_D1          (CHIP1_ADDR1_DAT1[15:0]),
      .VTH1_D2          (CHIP1_ADDR1_DAT2[15:0]),
      .VTH1_D3          (CHIP1_ADDR1_DAT3[15:0]),
      .VTH1_D4          (CHIP1_ADDR1_DAT4[15:0]),
      .VTH1_D5          (CHIP1_ADDR1_DAT5[15:0]),
      .VTH1_D6          (CHIP1_ADDR1_DAT6[15:0]),
      .VTH1_D7          (CHIP1_ADDR1_DAT7[15:0]),
      .VTH1_D8          (CHIP1_ADDR1_DAT8[15:0]),
      .VTH1_D9          (CHIP1_ADDR1_DAT9[15:0]),
      .VTH1_D10         (CHIP1_ADDR1_DAT10[15:0]),
      .VTH1_D11         (CHIP1_ADDR1_DAT11[15:0]),
      .VTH1_D12         (CHIP1_ADDR1_DAT12[15:0]),
      .VTH2_D1          (CHIP1_ADDR2_DAT1[15:0]),
      .VTH2_D2          (CHIP1_ADDR2_DAT2[15:0]),
      .VTH2_D3          (CHIP1_ADDR2_DAT3[15:0]),
      .VTH2_D4          (CHIP1_ADDR2_DAT4[15:0]),
      .VTH2_D5          (CHIP1_ADDR2_DAT5[15:0]),
      .VTH2_D6          (CHIP1_ADDR2_DAT6[15:0]),
      .VTH2_D7          (CHIP1_ADDR2_DAT7[15:0]),
      .VTH2_D8          (CHIP1_ADDR2_DAT8[15:0]),
      .VTH2_D9          (CHIP1_ADDR2_DAT9[15:0]),
      .VTH2_D10         (CHIP1_ADDR2_DAT10[15:0]),
      .VTH2_D11         (CHIP1_ADDR2_DAT11[15:0]),
      .VTH2_D12         (CHIP1_ADDR2_DAT12[15:0]),
      .VTH1_A1          (CHIP1_ADDR1_1[9:0]),
      .VTH1_A2          (CHIP1_ADDR1_2[9:0]),
      .VTH1_A3          (CHIP1_ADDR1_3[9:0]),
      .VTH1_A4          (CHIP1_ADDR1_4[9:0]),
      .VTH1_A5          (CHIP1_ADDR1_5[9:0]),
      .VTH1_A6          (CHIP1_ADDR1_6[9:0]),
      .VTH1_A7          (CHIP1_ADDR1_7[9:0]),
      .VTH1_A8          (CHIP1_ADDR1_8[9:0]),
      .VTH1_A9          (CHIP1_ADDR1_9[9:0]),
      .VTH1_A10         (CHIP1_ADDR1_10[9:0]),
      .VTH1_A11         (CHIP1_ADDR1_11[9:0]),
      .VTH1_A12         (CHIP1_ADDR1_12[9:0]),
      .VTH2_A1          (CHIP1_ADDR2_1[9:0]),
      .VTH2_A2          (CHIP1_ADDR2_2[9:0]),
      .VTH2_A3          (CHIP1_ADDR2_3[9:0]),
      .VTH2_A4          (CHIP1_ADDR2_4[9:0]),
      .VTH2_A5          (CHIP1_ADDR2_5[9:0]),
      .VTH2_A6          (CHIP1_ADDR2_6[9:0]),
      .VTH2_A7          (CHIP1_ADDR2_7[9:0]),
      .VTH2_A8          (CHIP1_ADDR2_8[9:0]),
      .VTH2_A9          (CHIP1_ADDR2_9[9:0]),
      .VTH2_A10         (CHIP1_ADDR2_10[9:0]),
      .VTH2_A11         (CHIP1_ADDR2_11[9:0]),
      .VTH2_A12         (CHIP1_ADDR2_12[9:0]),
      .VTH1_EN1         (chip1_read1_en1),
      .VTH1_EN2         (chip1_read1_en2),
      .VTH1_EN3         (chip1_read1_en3),
      .VTH1_EN4         (chip1_read1_en4),
      .VTH1_EN5         (chip1_read1_en5),
      .VTH1_EN6         (chip1_read1_en6),
      .VTH1_EN7         (chip1_read1_en7),
      .VTH1_EN8         (chip1_read1_en8),
      .VTH1_EN9         (chip1_read1_en9),
      .VTH1_EN10        (chip1_read1_en10),
      .VTH1_EN11        (chip1_read1_en11),
      .VTH1_EN12        (chip1_read1_en12),
      .VTH2_EN1         (chip1_read2_en1),
      .VTH2_EN2         (chip1_read2_en2),
      .VTH2_EN3         (chip1_read2_en3),
      .VTH2_EN4         (chip1_read2_en4),
      .VTH2_EN5         (chip1_read2_en5),
      .VTH2_EN6         (chip1_read2_en6),
      .VTH2_EN7         (chip1_read2_en7),
      .VTH2_EN8         (chip1_read2_en8),
      .VTH2_EN9         (chip1_read2_en9),
      .VTH2_EN10        (chip1_read2_en10),
      .VTH2_EN11        (chip1_read2_en11),
      .VTH2_EN12        (chip1_read2_en12));





  bp40_xtrans bp40_2trans (
      .CLK              (CLK_120M),
      .CLK_80M          (CLK_READ),
      .CLK_125M         (CLK_125M),
      .frame_end        (frame_end),
      .RST              (RST),
      .SYNC             (SYNC2),
      .sync_start       (sync_start),
      .chip             (chip2),
      .A_REG            (A_REG2),
      // .FRAME_O          (FRAME2),
      .FRAME_COUNT      (FRAME_COUNT),
      .RD_OUTEN         (),
      .next_start       (),
      .SPIEE_PD         (),
      .PHASE_CNT        (phase2_cnt),
      .VTH1_D1          (CHIP2_ADDR1_DAT1[15:0]),
      .VTH1_D2          (CHIP2_ADDR1_DAT2[15:0]),
      .VTH1_D3          (CHIP2_ADDR1_DAT3[15:0]),
      .VTH1_D4          (CHIP2_ADDR1_DAT4[15:0]),
      .VTH1_D5          (CHIP2_ADDR1_DAT5[15:0]),
      .VTH1_D6          (CHIP2_ADDR1_DAT6[15:0]),
      .VTH1_D7          (CHIP2_ADDR1_DAT7[15:0]),
      .VTH1_D8          (CHIP2_ADDR1_DAT8[15:0]),
      .VTH1_D9          (CHIP2_ADDR1_DAT9[15:0]),
      .VTH1_D10         (CHIP2_ADDR1_DAT10[15:0]),
      .VTH1_D11         (CHIP2_ADDR1_DAT11[15:0]),
      .VTH1_D12         (CHIP2_ADDR1_DAT12[15:0]),
      .VTH2_D1          (CHIP2_ADDR2_DAT1[15:0]),
      .VTH2_D2          (CHIP2_ADDR2_DAT2[15:0]),
      .VTH2_D3          (CHIP2_ADDR2_DAT3[15:0]),
      .VTH2_D4          (CHIP2_ADDR2_DAT4[15:0]),
      .VTH2_D5          (CHIP2_ADDR2_DAT5[15:0]),
      .VTH2_D6          (CHIP2_ADDR2_DAT6[15:0]),
      .VTH2_D7          (CHIP2_ADDR2_DAT7[15:0]),
      .VTH2_D8          (CHIP2_ADDR2_DAT8[15:0]),
      .VTH2_D9          (CHIP2_ADDR2_DAT9[15:0]),
      .VTH2_D10         (CHIP2_ADDR2_DAT10[15:0]),
      .VTH2_D11         (CHIP2_ADDR2_DAT11[15:0]),
      .VTH2_D12         (CHIP2_ADDR2_DAT12[15:0]),
      .VTH1_A1          (CHIP2_ADDR1_1[9:0]),
      .VTH1_A2          (CHIP2_ADDR1_2[9:0]),
      .VTH1_A3          (CHIP2_ADDR1_3[9:0]),
      .VTH1_A4          (CHIP2_ADDR1_4[9:0]),
      .VTH1_A5          (CHIP2_ADDR1_5[9:0]),
      .VTH1_A6          (CHIP2_ADDR1_6[9:0]),
      .VTH1_A7          (CHIP2_ADDR1_7[9:0]),
      .VTH1_A8          (CHIP2_ADDR1_8[9:0]),
      .VTH1_A9          (CHIP2_ADDR1_9[9:0]),
      .VTH1_A10         (CHIP2_ADDR1_10[9:0]),
      .VTH1_A11         (CHIP2_ADDR1_11[9:0]),
      .VTH1_A12         (CHIP2_ADDR1_12[9:0]),
      .VTH2_A1          (CHIP2_ADDR2_1[9:0]),
      .VTH2_A2          (CHIP2_ADDR2_2[9:0]),
      .VTH2_A3          (CHIP2_ADDR2_3[9:0]),
      .VTH2_A4          (CHIP2_ADDR2_4[9:0]),
      .VTH2_A5          (CHIP2_ADDR2_5[9:0]),
      .VTH2_A6          (CHIP2_ADDR2_6[9:0]),
      .VTH2_A7          (CHIP2_ADDR2_7[9:0]),
      .VTH2_A8          (CHIP2_ADDR2_8[9:0]),
      .VTH2_A9          (CHIP2_ADDR2_9[9:0]),
      .VTH2_A10         (CHIP2_ADDR2_10[9:0]),
      .VTH2_A11         (CHIP2_ADDR2_11[9:0]),
      .VTH2_A12         (CHIP2_ADDR2_12[9:0]),
      .VTH1_EN1         (chip2_read1_en1),
      .VTH1_EN2         (chip2_read1_en2),
      .VTH1_EN3         (chip2_read1_en3),
      .VTH1_EN4         (chip2_read1_en4),
      .VTH1_EN5         (chip2_read1_en5),
      .VTH1_EN6         (chip2_read1_en6),
      .VTH1_EN7         (chip2_read1_en7),
      .VTH1_EN8         (chip2_read1_en8),
      .VTH1_EN9         (chip2_read1_en9),
      .VTH1_EN10        (chip2_read1_en10),
      .VTH1_EN11        (chip2_read1_en11),
      .VTH1_EN12        (chip2_read1_en12),
      .VTH2_EN1         (chip2_read2_en1),
      .VTH2_EN2         (chip2_read2_en2),
      .VTH2_EN3         (chip2_read2_en3),
      .VTH2_EN4         (chip2_read2_en4),
      .VTH2_EN5         (chip2_read2_en5),
      .VTH2_EN6         (chip2_read2_en6),
      .VTH2_EN7         (chip2_read2_en7),
      .VTH2_EN8         (chip2_read2_en8),
      .VTH2_EN9         (chip2_read2_en9),
      .VTH2_EN10        (chip2_read2_en10),
      .VTH2_EN11        (chip2_read2_en11),
      .VTH2_EN12        (chip2_read2_en12));

  bp40_xtrans bp40_3trans (
      .CLK              (CLK_120M),
      .CLK_80M          (CLK_READ),
      .CLK_125M         (CLK_125M),
      .frame_end        (frame_end),
      .RST              (RST),
      .SYNC             (SYNC3),
      .sync_start       (sync_start),
      .chip             (chip3),
      .A_REG            (A_REG3),
      // .FRAME_O          (FRAME3),
      .FRAME_COUNT      (FRAME_COUNT),
      .RD_OUTEN         (),
      .next_start       (),
      .SPIEE_PD         (),
      .PHASE_CNT        (phase3_cnt),
      .VTH1_D1          (CHIP3_ADDR1_DAT1[15:0]),
      .VTH1_D2          (CHIP3_ADDR1_DAT2[15:0]),
      .VTH1_D3          (CHIP3_ADDR1_DAT3[15:0]),
      .VTH1_D4          (CHIP3_ADDR1_DAT4[15:0]),
      .VTH1_D5          (CHIP3_ADDR1_DAT5[15:0]),
      .VTH1_D6          (CHIP3_ADDR1_DAT6[15:0]),
      .VTH1_D7          (CHIP3_ADDR1_DAT7[15:0]),
      .VTH1_D8          (CHIP3_ADDR1_DAT8[15:0]),
      .VTH1_D9          (CHIP3_ADDR1_DAT9[15:0]),
      .VTH1_D10         (CHIP3_ADDR1_DAT10[15:0]),
      .VTH1_D11         (CHIP3_ADDR1_DAT11[15:0]),
      .VTH1_D12         (CHIP3_ADDR1_DAT12[15:0]),
      .VTH2_D1          (CHIP3_ADDR2_DAT1[15:0]),
      .VTH2_D2          (CHIP3_ADDR2_DAT2[15:0]),
      .VTH2_D3          (CHIP3_ADDR2_DAT3[15:0]),
      .VTH2_D4          (CHIP3_ADDR2_DAT4[15:0]),
      .VTH2_D5          (CHIP3_ADDR2_DAT5[15:0]),
      .VTH2_D6          (CHIP3_ADDR2_DAT6[15:0]),
      .VTH2_D7          (CHIP3_ADDR2_DAT7[15:0]),
      .VTH2_D8          (CHIP3_ADDR2_DAT8[15:0]),
      .VTH2_D9          (CHIP3_ADDR2_DAT9[15:0]),
      .VTH2_D10         (CHIP3_ADDR2_DAT10[15:0]),
      .VTH2_D11         (CHIP3_ADDR2_DAT11[15:0]),
      .VTH2_D12         (CHIP3_ADDR2_DAT12[15:0]),
      .VTH1_A1          (CHIP3_ADDR1_1[9:0]),
      .VTH1_A2          (CHIP3_ADDR1_2[9:0]),
      .VTH1_A3          (CHIP3_ADDR1_3[9:0]),
      .VTH1_A4          (CHIP3_ADDR1_4[9:0]),
      .VTH1_A5          (CHIP3_ADDR1_5[9:0]),
      .VTH1_A6          (CHIP3_ADDR1_6[9:0]),
      .VTH1_A7          (CHIP3_ADDR1_7[9:0]),
      .VTH1_A8          (CHIP3_ADDR1_8[9:0]),
      .VTH1_A9          (CHIP3_ADDR1_9[9:0]),
      .VTH1_A10         (CHIP3_ADDR1_10[9:0]),
      .VTH1_A11         (CHIP3_ADDR1_11[9:0]),
      .VTH1_A12         (CHIP3_ADDR1_12[9:0]),
      .VTH2_A1          (CHIP3_ADDR2_1[9:0]),
      .VTH2_A2          (CHIP3_ADDR2_2[9:0]),
      .VTH2_A3          (CHIP3_ADDR2_3[9:0]),
      .VTH2_A4          (CHIP3_ADDR2_4[9:0]),
      .VTH2_A5          (CHIP3_ADDR2_5[9:0]),
      .VTH2_A6          (CHIP3_ADDR2_6[9:0]),
      .VTH2_A7          (CHIP3_ADDR2_7[9:0]),
      .VTH2_A8          (CHIP3_ADDR2_8[9:0]),
      .VTH2_A9          (CHIP3_ADDR2_9[9:0]),
      .VTH2_A10         (CHIP3_ADDR2_10[9:0]),
      .VTH2_A11         (CHIP3_ADDR2_11[9:0]),
      .VTH2_A12         (CHIP3_ADDR2_12[9:0]),
      .VTH1_EN1         (chip3_read1_en1),
      .VTH1_EN2         (chip3_read1_en2),
      .VTH1_EN3         (chip3_read1_en3),
      .VTH1_EN4         (chip3_read1_en4),
      .VTH1_EN5         (chip3_read1_en5),
      .VTH1_EN6         (chip3_read1_en6),
      .VTH1_EN7         (chip3_read1_en7),
      .VTH1_EN8         (chip3_read1_en8),
      .VTH1_EN9         (chip3_read1_en9),
      .VTH1_EN10        (chip3_read1_en10),
      .VTH1_EN11        (chip3_read1_en11),
      .VTH1_EN12        (chip3_read1_en12),
      .VTH2_EN1         (chip3_read2_en1),
      .VTH2_EN2         (chip3_read2_en2),
      .VTH2_EN3         (chip3_read2_en3),
      .VTH2_EN4         (chip3_read2_en4),
      .VTH2_EN5         (chip3_read2_en5),
      .VTH2_EN6         (chip3_read2_en6),
      .VTH2_EN7         (chip3_read2_en7),
      .VTH2_EN8         (chip3_read2_en8),
      .VTH2_EN9         (chip3_read2_en9),
      .VTH2_EN10        (chip3_read2_en10),
      .VTH2_EN11        (chip3_read2_en11),
      .VTH2_EN12        (chip3_read2_en12));

  bp40_xtrans bp40_4trans (
      .CLK              (CLK_120M),
      .CLK_80M          (CLK_READ),
      .CLK_125M         (CLK_125M),
      .frame_end        (frame_end),
      .RST              (RST),
      .SYNC             (SYNC4),
      .sync_start       (sync_start),
      .chip             (chip4),
      .A_REG            (A_REG4),
      // .FRAME_O          (FRAME4),
      .FRAME_COUNT      (FRAME_COUNT),
      .RD_OUTEN         (),
      .next_start       (),
      .SPIEE_PD         (),
      .PHASE_CNT        (phase4_cnt),
      .VTH1_D1          (CHIP4_ADDR1_DAT1[15:0]),
      .VTH1_D2          (CHIP4_ADDR1_DAT2[15:0]),
      .VTH1_D3          (CHIP4_ADDR1_DAT3[15:0]),
      .VTH1_D4          (CHIP4_ADDR1_DAT4[15:0]),
      .VTH1_D5          (CHIP4_ADDR1_DAT5[15:0]),
      .VTH1_D6          (CHIP4_ADDR1_DAT6[15:0]),
      .VTH1_D7          (CHIP4_ADDR1_DAT7[15:0]),
      .VTH1_D8          (CHIP4_ADDR1_DAT8[15:0]),
      .VTH1_D9          (CHIP4_ADDR1_DAT9[15:0]),
      .VTH1_D10         (CHIP4_ADDR1_DAT10[15:0]),
      .VTH1_D11         (CHIP4_ADDR1_DAT11[15:0]),
      .VTH1_D12         (CHIP4_ADDR1_DAT12[15:0]),
      .VTH2_D1          (CHIP4_ADDR2_DAT1[15:0]),
      .VTH2_D2          (CHIP4_ADDR2_DAT2[15:0]),
      .VTH2_D3          (CHIP4_ADDR2_DAT3[15:0]),
      .VTH2_D4          (CHIP4_ADDR2_DAT4[15:0]),
      .VTH2_D5          (CHIP4_ADDR2_DAT5[15:0]),
      .VTH2_D6          (CHIP4_ADDR2_DAT6[15:0]),
      .VTH2_D7          (CHIP4_ADDR2_DAT7[15:0]),
      .VTH2_D8          (CHIP4_ADDR2_DAT8[15:0]),
      .VTH2_D9          (CHIP4_ADDR2_DAT9[15:0]),
      .VTH2_D10         (CHIP4_ADDR2_DAT10[15:0]),
      .VTH2_D11         (CHIP4_ADDR2_DAT11[15:0]),
      .VTH2_D12         (CHIP4_ADDR2_DAT12[15:0]),
      .VTH1_A1          (CHIP4_ADDR1_1[9:0]),
      .VTH1_A2          (CHIP4_ADDR1_2[9:0]),
      .VTH1_A3          (CHIP4_ADDR1_3[9:0]),
      .VTH1_A4          (CHIP4_ADDR1_4[9:0]),
      .VTH1_A5          (CHIP4_ADDR1_5[9:0]),
      .VTH1_A6          (CHIP4_ADDR1_6[9:0]),
      .VTH1_A7          (CHIP4_ADDR1_7[9:0]),
      .VTH1_A8          (CHIP4_ADDR1_8[9:0]),
      .VTH1_A9          (CHIP4_ADDR1_9[9:0]),
      .VTH1_A10         (CHIP4_ADDR1_10[9:0]),
      .VTH1_A11         (CHIP4_ADDR1_11[9:0]),
      .VTH1_A12         (CHIP4_ADDR1_12[9:0]),
      .VTH2_A1          (CHIP4_ADDR2_1[9:0]),
      .VTH2_A2          (CHIP4_ADDR2_2[9:0]),
      .VTH2_A3          (CHIP4_ADDR2_3[9:0]),
      .VTH2_A4          (CHIP4_ADDR2_4[9:0]),
      .VTH2_A5          (CHIP4_ADDR2_5[9:0]),
      .VTH2_A6          (CHIP4_ADDR2_6[9:0]),
      .VTH2_A7          (CHIP4_ADDR2_7[9:0]),
      .VTH2_A8          (CHIP4_ADDR2_8[9:0]),
      .VTH2_A9          (CHIP4_ADDR2_9[9:0]),
      .VTH2_A10         (CHIP4_ADDR2_10[9:0]),
      .VTH2_A11         (CHIP4_ADDR2_11[9:0]),
      .VTH2_A12         (CHIP4_ADDR2_12[9:0]),
      .VTH1_EN1         (chip4_read1_en1),
      .VTH1_EN2         (chip4_read1_en2),
      .VTH1_EN3         (chip4_read1_en3),
      .VTH1_EN4         (chip4_read1_en4),
      .VTH1_EN5         (chip4_read1_en5),
      .VTH1_EN6         (chip4_read1_en6),
      .VTH1_EN7         (chip4_read1_en7),
      .VTH1_EN8         (chip4_read1_en8),
      .VTH1_EN9         (chip4_read1_en9),
      .VTH1_EN10        (chip4_read1_en10),
      .VTH1_EN11        (chip4_read1_en11),
      .VTH1_EN12        (chip4_read1_en12),
      .VTH2_EN1         (chip4_read2_en1),
      .VTH2_EN2         (chip4_read2_en2),
      .VTH2_EN3         (chip4_read2_en3),
      .VTH2_EN4         (chip4_read2_en4),
      .VTH2_EN5         (chip4_read2_en5),
      .VTH2_EN6         (chip4_read2_en6),
      .VTH2_EN7         (chip4_read2_en7),
      .VTH2_EN8         (chip4_read2_en8),
      .VTH2_EN9         (chip4_read2_en9),
      .VTH2_EN10        (chip4_read2_en10),
      .VTH2_EN11        (chip4_read2_en11),
      .VTH2_EN12        (chip4_read2_en12));

  bp40_xtrans bp40_5trans (
      .CLK              (CLK_120M),
      .CLK_80M          (CLK_READ),
      .CLK_125M         (CLK_125M),
      .frame_end        (frame_end),
      .RST              (RST),
      .SYNC             (SYNC5),
      .sync_start       (sync_start),
      .chip             (chip5),
      .A_REG            (A_REG5),
      // .FRAME_O          (FRAME5),
      .FRAME_COUNT      (FRAME_COUNT),
      .RD_OUTEN         (),
      .next_start       (),
      .SPIEE_PD         (),
      .PHASE_CNT        (phase5_cnt),
      .VTH1_D1          (CHIP5_ADDR1_DAT1[15:0]),
      .VTH1_D2          (CHIP5_ADDR1_DAT2[15:0]),
      .VTH1_D3          (CHIP5_ADDR1_DAT3[15:0]),
      .VTH1_D4          (CHIP5_ADDR1_DAT4[15:0]),
      .VTH1_D5          (CHIP5_ADDR1_DAT5[15:0]),
      .VTH1_D6          (CHIP5_ADDR1_DAT6[15:0]),
      .VTH1_D7          (CHIP5_ADDR1_DAT7[15:0]),
      .VTH1_D8          (CHIP5_ADDR1_DAT8[15:0]),
      .VTH1_D9          (CHIP5_ADDR1_DAT9[15:0]),
      .VTH1_D10         (CHIP5_ADDR1_DAT10[15:0]),
      .VTH1_D11         (CHIP5_ADDR1_DAT11[15:0]),
      .VTH1_D12         (CHIP5_ADDR1_DAT12[15:0]),
      .VTH2_D1          (CHIP5_ADDR2_DAT1[15:0]),
      .VTH2_D2          (CHIP5_ADDR2_DAT2[15:0]),
      .VTH2_D3          (CHIP5_ADDR2_DAT3[15:0]),
      .VTH2_D4          (CHIP5_ADDR2_DAT4[15:0]),
      .VTH2_D5          (CHIP5_ADDR2_DAT5[15:0]),
      .VTH2_D6          (CHIP5_ADDR2_DAT6[15:0]),
      .VTH2_D7          (CHIP5_ADDR2_DAT7[15:0]),
      .VTH2_D8          (CHIP5_ADDR2_DAT8[15:0]),
      .VTH2_D9          (CHIP5_ADDR2_DAT9[15:0]),
      .VTH2_D10         (CHIP5_ADDR2_DAT10[15:0]),
      .VTH2_D11         (CHIP5_ADDR2_DAT11[15:0]),
      .VTH2_D12         (CHIP5_ADDR2_DAT12[15:0]),
      .VTH1_A1          (CHIP5_ADDR1_1[9:0]),
      .VTH1_A2          (CHIP5_ADDR1_2[9:0]),
      .VTH1_A3          (CHIP5_ADDR1_3[9:0]),
      .VTH1_A4          (CHIP5_ADDR1_4[9:0]),
      .VTH1_A5          (CHIP5_ADDR1_5[9:0]),
      .VTH1_A6          (CHIP5_ADDR1_6[9:0]),
      .VTH1_A7          (CHIP5_ADDR1_7[9:0]),
      .VTH1_A8          (CHIP5_ADDR1_8[9:0]),
      .VTH1_A9          (CHIP5_ADDR1_9[9:0]),
      .VTH1_A10         (CHIP5_ADDR1_10[9:0]),
      .VTH1_A11         (CHIP5_ADDR1_11[9:0]),
      .VTH1_A12         (CHIP5_ADDR1_12[9:0]),
      .VTH2_A1          (CHIP5_ADDR2_1[9:0]),
      .VTH2_A2          (CHIP5_ADDR2_2[9:0]),
      .VTH2_A3          (CHIP5_ADDR2_3[9:0]),
      .VTH2_A4          (CHIP5_ADDR2_4[9:0]),
      .VTH2_A5          (CHIP5_ADDR2_5[9:0]),
      .VTH2_A6          (CHIP5_ADDR2_6[9:0]),
      .VTH2_A7          (CHIP5_ADDR2_7[9:0]),
      .VTH2_A8          (CHIP5_ADDR2_8[9:0]),
      .VTH2_A9          (CHIP5_ADDR2_9[9:0]),
      .VTH2_A10         (CHIP5_ADDR2_10[9:0]),
      .VTH2_A11         (CHIP5_ADDR2_11[9:0]),
      .VTH2_A12         (CHIP5_ADDR2_12[9:0]),
      .VTH1_EN1         (chip5_read1_en1),
      .VTH1_EN2         (chip5_read1_en2),
      .VTH1_EN3         (chip5_read1_en3),
      .VTH1_EN4         (chip5_read1_en4),
      .VTH1_EN5         (chip5_read1_en5),
      .VTH1_EN6         (chip5_read1_en6),
      .VTH1_EN7         (chip5_read1_en7),
      .VTH1_EN8         (chip5_read1_en8),
      .VTH1_EN9         (chip5_read1_en9),
      .VTH1_EN10        (chip5_read1_en10),
      .VTH1_EN11        (chip5_read1_en11),
      .VTH1_EN12        (chip5_read1_en12),
      .VTH2_EN1         (chip5_read2_en1),
      .VTH2_EN2         (chip5_read2_en2),
      .VTH2_EN3         (chip5_read2_en3),
      .VTH2_EN4         (chip5_read2_en4),
      .VTH2_EN5         (chip5_read2_en5),
      .VTH2_EN6         (chip5_read2_en6),
      .VTH2_EN7         (chip5_read2_en7),
      .VTH2_EN8         (chip5_read2_en8),
      .VTH2_EN9         (chip5_read2_en9),
      .VTH2_EN10        (chip5_read2_en10),
      .VTH2_EN11        (chip5_read2_en11),
      .VTH2_EN12        (chip5_read2_en12));

  bp40_xtrans bp40_6trans (
      .CLK              (CLK_120M),
      .CLK_80M          (CLK_READ),
      .CLK_125M         (CLK_125M),
      .frame_end        (frame_end),
      .RST              (RST),
      .SYNC             (SYNC6),
      .sync_start       (sync_start),
      .chip             (chip6),
      .A_REG            (A_REG6),
      // .FRAME_O          (FRAME6),
      .FRAME_COUNT      (FRAME_COUNT),
      .RD_OUTEN         (),
      .next_start       (),
      .SPIEE_PD         (),
      .PHASE_CNT        (phase6_cnt),
      .VTH1_D1          (CHIP6_ADDR1_DAT1[15:0]),
      .VTH1_D2          (CHIP6_ADDR1_DAT2[15:0]),
      .VTH1_D3          (CHIP6_ADDR1_DAT3[15:0]),
      .VTH1_D4          (CHIP6_ADDR1_DAT4[15:0]),
      .VTH1_D5          (CHIP6_ADDR1_DAT5[15:0]),
      .VTH1_D6          (CHIP6_ADDR1_DAT6[15:0]),
      .VTH1_D7          (CHIP6_ADDR1_DAT7[15:0]),
      .VTH1_D8          (CHIP6_ADDR1_DAT8[15:0]),
      .VTH1_D9          (CHIP6_ADDR1_DAT9[15:0]),
      .VTH1_D10         (CHIP6_ADDR1_DAT10[15:0]),
      .VTH1_D11         (CHIP6_ADDR1_DAT11[15:0]),
      .VTH1_D12         (CHIP6_ADDR1_DAT12[15:0]),
      .VTH2_D1          (CHIP6_ADDR2_DAT1[15:0]),
      .VTH2_D2          (CHIP6_ADDR2_DAT2[15:0]),
      .VTH2_D3          (CHIP6_ADDR2_DAT3[15:0]),
      .VTH2_D4          (CHIP6_ADDR2_DAT4[15:0]),
      .VTH2_D5          (CHIP6_ADDR2_DAT5[15:0]),
      .VTH2_D6          (CHIP6_ADDR2_DAT6[15:0]),
      .VTH2_D7          (CHIP6_ADDR2_DAT7[15:0]),
      .VTH2_D8          (CHIP6_ADDR2_DAT8[15:0]),
      .VTH2_D9          (CHIP6_ADDR2_DAT9[15:0]),
      .VTH2_D10         (CHIP6_ADDR2_DAT10[15:0]),
      .VTH2_D11         (CHIP6_ADDR2_DAT11[15:0]),
      .VTH2_D12         (CHIP6_ADDR2_DAT12[15:0]),
      .VTH1_A1          (CHIP6_ADDR1_1[9:0]),
      .VTH1_A2          (CHIP6_ADDR1_2[9:0]),
      .VTH1_A3          (CHIP6_ADDR1_3[9:0]),
      .VTH1_A4          (CHIP6_ADDR1_4[9:0]),
      .VTH1_A5          (CHIP6_ADDR1_5[9:0]),
      .VTH1_A6          (CHIP6_ADDR1_6[9:0]),
      .VTH1_A7          (CHIP6_ADDR1_7[9:0]),
      .VTH1_A8          (CHIP6_ADDR1_8[9:0]),
      .VTH1_A9          (CHIP6_ADDR1_9[9:0]),
      .VTH1_A10         (CHIP6_ADDR1_10[9:0]),
      .VTH1_A11         (CHIP6_ADDR1_11[9:0]),
      .VTH1_A12         (CHIP6_ADDR1_12[9:0]),
      .VTH2_A1          (CHIP6_ADDR2_1[9:0]),
      .VTH2_A2          (CHIP6_ADDR2_2[9:0]),
      .VTH2_A3          (CHIP6_ADDR2_3[9:0]),
      .VTH2_A4          (CHIP6_ADDR2_4[9:0]),
      .VTH2_A5          (CHIP6_ADDR2_5[9:0]),
      .VTH2_A6          (CHIP6_ADDR2_6[9:0]),
      .VTH2_A7          (CHIP6_ADDR2_7[9:0]),
      .VTH2_A8          (CHIP6_ADDR2_8[9:0]),
      .VTH2_A9          (CHIP6_ADDR2_9[9:0]),
      .VTH2_A10         (CHIP6_ADDR2_10[9:0]),
      .VTH2_A11         (CHIP6_ADDR2_11[9:0]),
      .VTH2_A12         (CHIP6_ADDR2_12[9:0]),
      .VTH1_EN1         (chip6_read1_en1),
      .VTH1_EN2         (chip6_read1_en2),
      .VTH1_EN3         (chip6_read1_en3),
      .VTH1_EN4         (chip6_read1_en4),
      .VTH1_EN5         (chip6_read1_en5),
      .VTH1_EN6         (chip6_read1_en6),
      .VTH1_EN7         (chip6_read1_en7),
      .VTH1_EN8         (chip6_read1_en8),
      .VTH1_EN9         (chip6_read1_en9),
      .VTH1_EN10        (chip6_read1_en10),
      .VTH1_EN11        (chip6_read1_en11),
      .VTH1_EN12        (chip6_read1_en12),
      .VTH2_EN1         (chip6_read2_en1),
      .VTH2_EN2         (chip6_read2_en2),
      .VTH2_EN3         (chip6_read2_en3),
      .VTH2_EN4         (chip6_read2_en4),
      .VTH2_EN5         (chip6_read2_en5),
      .VTH2_EN6         (chip6_read2_en6),
      .VTH2_EN7         (chip6_read2_en7),
      .VTH2_EN8         (chip6_read2_en8),
      .VTH2_EN9         (chip6_read2_en9),
      .VTH2_EN10        (chip6_read2_en10),
      .VTH2_EN11        (chip6_read2_en11),
      .VTH2_EN12        (chip6_read2_en12));


  bp40_xtrans bp40_7trans (
      .CLK              (CLK_120M),
      .CLK_80M          (CLK_READ),
      .CLK_125M         (CLK_125M),
      .frame_end        (frame_end),
      .RST              (RST),
      .SYNC             (SYNC7),
      .sync_start       (sync_start),
      .chip             (chip7),
      .A_REG            (A_REG7),
      // .FRAME_O          (FRAME7),
      .FRAME_COUNT      (FRAME_COUNT),
      .RD_OUTEN         (),
      .next_start       (),
      .SPIEE_PD         (),
      .PHASE_CNT        (phase7_cnt),
      .VTH1_D1          (CHIP7_ADDR1_DAT1[15:0]),
      .VTH1_D2          (CHIP7_ADDR1_DAT2[15:0]),
      .VTH1_D3          (CHIP7_ADDR1_DAT3[15:0]),
      .VTH1_D4          (CHIP7_ADDR1_DAT4[15:0]),
      .VTH1_D5          (CHIP7_ADDR1_DAT5[15:0]),
      .VTH1_D6          (CHIP7_ADDR1_DAT6[15:0]),
      .VTH1_D7          (CHIP7_ADDR1_DAT7[15:0]),
      .VTH1_D8          (CHIP7_ADDR1_DAT8[15:0]),
      .VTH1_D9          (CHIP7_ADDR1_DAT9[15:0]),
      .VTH1_D10         (CHIP7_ADDR1_DAT10[15:0]),
      .VTH1_D11         (CHIP7_ADDR1_DAT11[15:0]),
      .VTH1_D12         (CHIP7_ADDR1_DAT12[15:0]),
      .VTH2_D1          (CHIP7_ADDR2_DAT1[15:0]),
      .VTH2_D2          (CHIP7_ADDR2_DAT2[15:0]),
      .VTH2_D3          (CHIP7_ADDR2_DAT3[15:0]),
      .VTH2_D4          (CHIP7_ADDR2_DAT4[15:0]),
      .VTH2_D5          (CHIP7_ADDR2_DAT5[15:0]),
      .VTH2_D6          (CHIP7_ADDR2_DAT6[15:0]),
      .VTH2_D7          (CHIP7_ADDR2_DAT7[15:0]),
      .VTH2_D8          (CHIP7_ADDR2_DAT8[15:0]),
      .VTH2_D9          (CHIP7_ADDR2_DAT9[15:0]),
      .VTH2_D10         (CHIP7_ADDR2_DAT10[15:0]),
      .VTH2_D11         (CHIP7_ADDR2_DAT11[15:0]),
      .VTH2_D12         (CHIP7_ADDR2_DAT12[15:0]),
      .VTH1_A1          (CHIP7_ADDR1_1[9:0]),
      .VTH1_A2          (CHIP7_ADDR1_2[9:0]),
      .VTH1_A3          (CHIP7_ADDR1_3[9:0]),
      .VTH1_A4          (CHIP7_ADDR1_4[9:0]),
      .VTH1_A5          (CHIP7_ADDR1_5[9:0]),
      .VTH1_A6          (CHIP7_ADDR1_6[9:0]),
      .VTH1_A7          (CHIP7_ADDR1_7[9:0]),
      .VTH1_A8          (CHIP7_ADDR1_8[9:0]),
      .VTH1_A9          (CHIP7_ADDR1_9[9:0]),
      .VTH1_A10         (CHIP7_ADDR1_10[9:0]),
      .VTH1_A11         (CHIP7_ADDR1_11[9:0]),
      .VTH1_A12         (CHIP7_ADDR1_12[9:0]),
      .VTH2_A1          (CHIP7_ADDR2_1[9:0]),
      .VTH2_A2          (CHIP7_ADDR2_2[9:0]),
      .VTH2_A3          (CHIP7_ADDR2_3[9:0]),
      .VTH2_A4          (CHIP7_ADDR2_4[9:0]),
      .VTH2_A5          (CHIP7_ADDR2_5[9:0]),
      .VTH2_A6          (CHIP7_ADDR2_6[9:0]),
      .VTH2_A7          (CHIP7_ADDR2_7[9:0]),
      .VTH2_A8          (CHIP7_ADDR2_8[9:0]),
      .VTH2_A9          (CHIP7_ADDR2_9[9:0]),
      .VTH2_A10         (CHIP7_ADDR2_10[9:0]),
      .VTH2_A11         (CHIP7_ADDR2_11[9:0]),
      .VTH2_A12         (CHIP7_ADDR2_12[9:0]),
      .VTH1_EN1         (chip7_read1_en1),
      .VTH1_EN2         (chip7_read1_en2),
      .VTH1_EN3         (chip7_read1_en3),
      .VTH1_EN4         (chip7_read1_en4),
      .VTH1_EN5         (chip7_read1_en5),
      .VTH1_EN6         (chip7_read1_en6),
      .VTH1_EN7         (chip7_read1_en7),
      .VTH1_EN8         (chip7_read1_en8),
      .VTH1_EN9         (chip7_read1_en9),
      .VTH1_EN10        (chip7_read1_en10),
      .VTH1_EN11        (chip7_read1_en11),
      .VTH1_EN12        (chip7_read1_en12),
      .VTH2_EN1         (chip7_read2_en1),
      .VTH2_EN2         (chip7_read2_en2),
      .VTH2_EN3         (chip7_read2_en3),
      .VTH2_EN4         (chip7_read2_en4),
      .VTH2_EN5         (chip7_read2_en5),
      .VTH2_EN6         (chip7_read2_en6),
      .VTH2_EN7         (chip7_read2_en7),
      .VTH2_EN8         (chip7_read2_en8),
      .VTH2_EN9         (chip7_read2_en9),
      .VTH2_EN10        (chip7_read2_en10),
      .VTH2_EN11        (chip7_read2_en11),
      .VTH2_EN12        (chip7_read2_en12));

  bp40_xtrans bp40_8trans (
      .CLK              (CLK_120M),
      .CLK_80M          (CLK_READ),
      .CLK_125M         (CLK_125M),
      .frame_end        (frame_end),
      .RST              (RST),
      .SYNC             (SYNC8),
      .sync_start       (sync_start),
      .chip             (chip8),
      .A_REG            (A_REG8),
      // .FRAME_O          (FRAME8),
      .FRAME_COUNT      (FRAME_COUNT),
      .RD_OUTEN         (),
      .next_start       (),
      .SPIEE_PD         (),
      .PHASE_CNT        (phase8_cnt),
      .VTH1_D1          (CHIP8_ADDR1_DAT1[15:0]),
      .VTH1_D2          (CHIP8_ADDR1_DAT2[15:0]),
      .VTH1_D3          (CHIP8_ADDR1_DAT3[15:0]),
      .VTH1_D4          (CHIP8_ADDR1_DAT4[15:0]),
      .VTH1_D5          (CHIP8_ADDR1_DAT5[15:0]),
      .VTH1_D6          (CHIP8_ADDR1_DAT6[15:0]),
      .VTH1_D7          (CHIP8_ADDR1_DAT7[15:0]),
      .VTH1_D8          (CHIP8_ADDR1_DAT8[15:0]),
      .VTH1_D9          (CHIP8_ADDR1_DAT9[15:0]),
      .VTH1_D10         (CHIP8_ADDR1_DAT10[15:0]),
      .VTH1_D11         (CHIP8_ADDR1_DAT11[15:0]),
      .VTH1_D12         (CHIP8_ADDR1_DAT12[15:0]),
      .VTH2_D1          (CHIP8_ADDR2_DAT1[15:0]),
      .VTH2_D2          (CHIP8_ADDR2_DAT2[15:0]),
      .VTH2_D3          (CHIP8_ADDR2_DAT3[15:0]),
      .VTH2_D4          (CHIP8_ADDR2_DAT4[15:0]),
      .VTH2_D5          (CHIP8_ADDR2_DAT5[15:0]),
      .VTH2_D6          (CHIP8_ADDR2_DAT6[15:0]),
      .VTH2_D7          (CHIP8_ADDR2_DAT7[15:0]),
      .VTH2_D8          (CHIP8_ADDR2_DAT8[15:0]),
      .VTH2_D9          (CHIP8_ADDR2_DAT9[15:0]),
      .VTH2_D10         (CHIP8_ADDR2_DAT10[15:0]),
      .VTH2_D11         (CHIP8_ADDR2_DAT11[15:0]),
      .VTH2_D12         (CHIP8_ADDR2_DAT12[15:0]),
      .VTH1_A1          (CHIP8_ADDR1_1[9:0]),
      .VTH1_A2          (CHIP8_ADDR1_2[9:0]),
      .VTH1_A3          (CHIP8_ADDR1_3[9:0]),
      .VTH1_A4          (CHIP8_ADDR1_4[9:0]),
      .VTH1_A5          (CHIP8_ADDR1_5[9:0]),
      .VTH1_A6          (CHIP8_ADDR1_6[9:0]),
      .VTH1_A7          (CHIP8_ADDR1_7[9:0]),
      .VTH1_A8          (CHIP8_ADDR1_8[9:0]),
      .VTH1_A9          (CHIP8_ADDR1_9[9:0]),
      .VTH1_A10         (CHIP8_ADDR1_10[9:0]),
      .VTH1_A11         (CHIP8_ADDR1_11[9:0]),
      .VTH1_A12         (CHIP8_ADDR1_12[9:0]),
      .VTH2_A1          (CHIP8_ADDR2_1[9:0]),
      .VTH2_A2          (CHIP8_ADDR2_2[9:0]),
      .VTH2_A3          (CHIP8_ADDR2_3[9:0]),
      .VTH2_A4          (CHIP8_ADDR2_4[9:0]),
      .VTH2_A5          (CHIP8_ADDR2_5[9:0]),
      .VTH2_A6          (CHIP8_ADDR2_6[9:0]),
      .VTH2_A7          (CHIP8_ADDR2_7[9:0]),
      .VTH2_A8          (CHIP8_ADDR2_8[9:0]),
      .VTH2_A9          (CHIP8_ADDR2_9[9:0]),
      .VTH2_A10         (CHIP8_ADDR2_10[9:0]),
      .VTH2_A11         (CHIP8_ADDR2_11[9:0]),
      .VTH2_A12         (CHIP8_ADDR2_12[9:0]),
      .VTH1_EN1         (chip8_read1_en1),
      .VTH1_EN2         (chip8_read1_en2),
      .VTH1_EN3         (chip8_read1_en3),
      .VTH1_EN4         (chip8_read1_en4),
      .VTH1_EN5         (chip8_read1_en5),
      .VTH1_EN6         (chip8_read1_en6),
      .VTH1_EN7         (chip8_read1_en7),
      .VTH1_EN8         (chip8_read1_en8),
      .VTH1_EN9         (chip8_read1_en9),
      .VTH1_EN10        (chip8_read1_en10),
      .VTH1_EN11        (chip8_read1_en11),
      .VTH1_EN12        (chip8_read1_en12),
      .VTH2_EN1         (chip8_read2_en1),
      .VTH2_EN2         (chip8_read2_en2),
      .VTH2_EN3         (chip8_read2_en3),
      .VTH2_EN4         (chip8_read2_en4),
      .VTH2_EN5         (chip8_read2_en5),
      .VTH2_EN6         (chip8_read2_en6),
      .VTH2_EN7         (chip8_read2_en7),
      .VTH2_EN8         (chip8_read2_en8),
      .VTH2_EN9         (chip8_read2_en9),
      .VTH2_EN10        (chip8_read2_en10),
      .VTH2_EN11        (chip8_read2_en11),
      .VTH2_EN12        (chip8_read2_en12));

  bp40_xtrans bp40_9trans (
      .CLK              (CLK_120M),
      .CLK_80M          (CLK_READ),
      .CLK_125M         (CLK_125M),
      .frame_end        (frame_end),
      .RST              (RST),
      .SYNC             (SYNC9),
      .sync_start       (sync_start),
      .chip             (chip9),
      .A_REG            (A_REG9),
      // .FRAME_O          (FRAME9),
      .FRAME_COUNT      (FRAME_COUNT),
      .RD_OUTEN         (),
      .next_start       (),
      .SPIEE_PD         (),
      .PHASE_CNT        (phase9_cnt),
      .VTH1_D1          (CHIP9_ADDR1_DAT1[15:0]),
      .VTH1_D2          (CHIP9_ADDR1_DAT2[15:0]),
      .VTH1_D3          (CHIP9_ADDR1_DAT3[15:0]),
      .VTH1_D4          (CHIP9_ADDR1_DAT4[15:0]),
      .VTH1_D5          (CHIP9_ADDR1_DAT5[15:0]),
      .VTH1_D6          (CHIP9_ADDR1_DAT6[15:0]),
      .VTH1_D7          (CHIP9_ADDR1_DAT7[15:0]),
      .VTH1_D8          (CHIP9_ADDR1_DAT8[15:0]),
      .VTH1_D9          (CHIP9_ADDR1_DAT9[15:0]),
      .VTH1_D10         (CHIP9_ADDR1_DAT10[15:0]),
      .VTH1_D11         (CHIP9_ADDR1_DAT11[15:0]),
      .VTH1_D12         (CHIP9_ADDR1_DAT12[15:0]),
      .VTH2_D1          (CHIP9_ADDR2_DAT1[15:0]),
      .VTH2_D2          (CHIP9_ADDR2_DAT2[15:0]),
      .VTH2_D3          (CHIP9_ADDR2_DAT3[15:0]),
      .VTH2_D4          (CHIP9_ADDR2_DAT4[15:0]),
      .VTH2_D5          (CHIP9_ADDR2_DAT5[15:0]),
      .VTH2_D6          (CHIP9_ADDR2_DAT6[15:0]),
      .VTH2_D7          (CHIP9_ADDR2_DAT7[15:0]),
      .VTH2_D8          (CHIP9_ADDR2_DAT8[15:0]),
      .VTH2_D9          (CHIP9_ADDR2_DAT9[15:0]),
      .VTH2_D10         (CHIP9_ADDR2_DAT10[15:0]),
      .VTH2_D11         (CHIP9_ADDR2_DAT11[15:0]),
      .VTH2_D12         (CHIP9_ADDR2_DAT12[15:0]),
      .VTH1_A1          (CHIP9_ADDR1_1[9:0]),
      .VTH1_A2          (CHIP9_ADDR1_2[9:0]),
      .VTH1_A3          (CHIP9_ADDR1_3[9:0]),
      .VTH1_A4          (CHIP9_ADDR1_4[9:0]),
      .VTH1_A5          (CHIP9_ADDR1_5[9:0]),
      .VTH1_A6          (CHIP9_ADDR1_6[9:0]),
      .VTH1_A7          (CHIP9_ADDR1_7[9:0]),
      .VTH1_A8          (CHIP9_ADDR1_8[9:0]),
      .VTH1_A9          (CHIP9_ADDR1_9[9:0]),
      .VTH1_A10         (CHIP9_ADDR1_10[9:0]),
      .VTH1_A11         (CHIP9_ADDR1_11[9:0]),
      .VTH1_A12         (CHIP9_ADDR1_12[9:0]),
      .VTH2_A1          (CHIP9_ADDR2_1[9:0]),
      .VTH2_A2          (CHIP9_ADDR2_2[9:0]),
      .VTH2_A3          (CHIP9_ADDR2_3[9:0]),
      .VTH2_A4          (CHIP9_ADDR2_4[9:0]),
      .VTH2_A5          (CHIP9_ADDR2_5[9:0]),
      .VTH2_A6          (CHIP9_ADDR2_6[9:0]),
      .VTH2_A7          (CHIP9_ADDR2_7[9:0]),
      .VTH2_A8          (CHIP9_ADDR2_8[9:0]),
      .VTH2_A9          (CHIP9_ADDR2_9[9:0]),
      .VTH2_A10         (CHIP9_ADDR2_10[9:0]),
      .VTH2_A11         (CHIP9_ADDR2_11[9:0]),
      .VTH2_A12         (CHIP9_ADDR2_12[9:0]),
      .VTH1_EN1         (chip9_read1_en1),
      .VTH1_EN2         (chip9_read1_en2),
      .VTH1_EN3         (chip9_read1_en3),
      .VTH1_EN4         (chip9_read1_en4),
      .VTH1_EN5         (chip9_read1_en5),
      .VTH1_EN6         (chip9_read1_en6),
      .VTH1_EN7         (chip9_read1_en7),
      .VTH1_EN8         (chip9_read1_en8),
      .VTH1_EN9         (chip9_read1_en9),
      .VTH1_EN10        (chip9_read1_en10),
      .VTH1_EN11        (chip9_read1_en11),
      .VTH1_EN12        (chip9_read1_en12),
      .VTH2_EN1         (chip9_read2_en1),
      .VTH2_EN2         (chip9_read2_en2),
      .VTH2_EN3         (chip9_read2_en3),
      .VTH2_EN4         (chip9_read2_en4),
      .VTH2_EN5         (chip9_read2_en5),
      .VTH2_EN6         (chip9_read2_en6),
      .VTH2_EN7         (chip9_read2_en7),
      .VTH2_EN8         (chip9_read2_en8),
      .VTH2_EN9         (chip9_read2_en9),
      .VTH2_EN10        (chip9_read2_en10),
      .VTH2_EN11        (chip9_read2_en11),
      .VTH2_EN12        (chip9_read2_en12));

  bp40_xtrans bp40_10trans (
      .CLK              (CLK_120M),
      .CLK_80M          (CLK_READ),
      .CLK_125M         (CLK_125M),
      .frame_end        (frame_end),
      .RST              (RST),
      .SYNC             (SYNC10),
      .sync_start       (sync_start),
      .chip             (chip10),
      .A_REG            (A_REG10),
      // .FRAME_O          (FRAME10),
      .FRAME_COUNT      (FRAME_COUNT),
      .RD_OUTEN         (),
      .next_start       (),
      .SPIEE_PD         (),
      .PHASE_CNT        (phase10_cnt),
      .VTH1_D1          (CHIP10_ADDR1_DAT1[15:0]),
      .VTH1_D2          (CHIP10_ADDR1_DAT2[15:0]),
      .VTH1_D3          (CHIP10_ADDR1_DAT3[15:0]),
      .VTH1_D4          (CHIP10_ADDR1_DAT4[15:0]),
      .VTH1_D5          (CHIP10_ADDR1_DAT5[15:0]),
      .VTH1_D6          (CHIP10_ADDR1_DAT6[15:0]),
      .VTH1_D7          (CHIP10_ADDR1_DAT7[15:0]),
      .VTH1_D8          (CHIP10_ADDR1_DAT8[15:0]),
      .VTH1_D9          (CHIP10_ADDR1_DAT9[15:0]),
      .VTH1_D10         (CHIP10_ADDR1_DAT10[15:0]),
      .VTH1_D11         (CHIP10_ADDR1_DAT11[15:0]),
      .VTH1_D12         (CHIP10_ADDR1_DAT12[15:0]),
      .VTH2_D1          (CHIP10_ADDR2_DAT1[15:0]),
      .VTH2_D2          (CHIP10_ADDR2_DAT2[15:0]),
      .VTH2_D3          (CHIP10_ADDR2_DAT3[15:0]),
      .VTH2_D4          (CHIP10_ADDR2_DAT4[15:0]),
      .VTH2_D5          (CHIP10_ADDR2_DAT5[15:0]),
      .VTH2_D6          (CHIP10_ADDR2_DAT6[15:0]),
      .VTH2_D7          (CHIP10_ADDR2_DAT7[15:0]),
      .VTH2_D8          (CHIP10_ADDR2_DAT8[15:0]),
      .VTH2_D9          (CHIP10_ADDR2_DAT9[15:0]),
      .VTH2_D10         (CHIP10_ADDR2_DAT10[15:0]),
      .VTH2_D11         (CHIP10_ADDR2_DAT11[15:0]),
      .VTH2_D12         (CHIP10_ADDR2_DAT12[15:0]),
      .VTH1_A1          (CHIP10_ADDR1_1[9:0]),
      .VTH1_A2          (CHIP10_ADDR1_2[9:0]),
      .VTH1_A3          (CHIP10_ADDR1_3[9:0]),
      .VTH1_A4          (CHIP10_ADDR1_4[9:0]),
      .VTH1_A5          (CHIP10_ADDR1_5[9:0]),
      .VTH1_A6          (CHIP10_ADDR1_6[9:0]),
      .VTH1_A7          (CHIP10_ADDR1_7[9:0]),
      .VTH1_A8          (CHIP10_ADDR1_8[9:0]),
      .VTH1_A9          (CHIP10_ADDR1_9[9:0]),
      .VTH1_A10         (CHIP10_ADDR1_10[9:0]),
      .VTH1_A11         (CHIP10_ADDR1_11[9:0]),
      .VTH1_A12         (CHIP10_ADDR1_12[9:0]),
      .VTH2_A1          (CHIP10_ADDR2_1[9:0]),
      .VTH2_A2          (CHIP10_ADDR2_2[9:0]),
      .VTH2_A3          (CHIP10_ADDR2_3[9:0]),
      .VTH2_A4          (CHIP10_ADDR2_4[9:0]),
      .VTH2_A5          (CHIP10_ADDR2_5[9:0]),
      .VTH2_A6          (CHIP10_ADDR2_6[9:0]),
      .VTH2_A7          (CHIP10_ADDR2_7[9:0]),
      .VTH2_A8          (CHIP10_ADDR2_8[9:0]),
      .VTH2_A9          (CHIP10_ADDR2_9[9:0]),
      .VTH2_A10         (CHIP10_ADDR2_10[9:0]),
      .VTH2_A11         (CHIP10_ADDR2_11[9:0]),
      .VTH2_A12         (CHIP10_ADDR2_12[9:0]),
      .VTH1_EN1         (chip10_read1_en1),
      .VTH1_EN2         (chip10_read1_en2),
      .VTH1_EN3         (chip10_read1_en3),
      .VTH1_EN4         (chip10_read1_en4),
      .VTH1_EN5         (chip10_read1_en5),
      .VTH1_EN6         (chip10_read1_en6),
      .VTH1_EN7         (chip10_read1_en7),
      .VTH1_EN8         (chip10_read1_en8),
      .VTH1_EN9         (chip10_read1_en9),
      .VTH1_EN10        (chip10_read1_en10),
      .VTH1_EN11        (chip10_read1_en11),
      .VTH1_EN12        (chip10_read1_en12),
      .VTH2_EN1         (chip10_read2_en1),
      .VTH2_EN2         (chip10_read2_en2),
      .VTH2_EN3         (chip10_read2_en3),
      .VTH2_EN4         (chip10_read2_en4),
      .VTH2_EN5         (chip10_read2_en5),
      .VTH2_EN6         (chip10_read2_en6),
      .VTH2_EN7         (chip10_read2_en7),
      .VTH2_EN8         (chip10_read2_en8),
      .VTH2_EN9         (chip10_read2_en9),
      .VTH2_EN10        (chip10_read2_en10),
      .VTH2_EN11        (chip10_read2_en11),
      .VTH2_EN12        (chip10_read2_en12));

  bp40_xtrans bp40_11trans (
      .CLK              (CLK_120M),
      .CLK_80M          (CLK_READ),
      .CLK_125M         (CLK_125M),
      .frame_end        (frame_end),
      .RST              (RST),
      .SYNC             (SYNC11),
      .sync_start       (sync_start),
      .chip             (chip11),
      .A_REG            (A_REG11),
      // .FRAME_O          (FRAME11),
      .FRAME_COUNT      (FRAME_COUNT),
      .RD_OUTEN         (),
      .next_start       (),
      .SPIEE_PD         (),
      .PHASE_CNT        (phase11_cnt),
      .VTH1_D1          (CHIP11_ADDR1_DAT1[15:0]),
      .VTH1_D2          (CHIP11_ADDR1_DAT2[15:0]),
      .VTH1_D3          (CHIP11_ADDR1_DAT3[15:0]),
      .VTH1_D4          (CHIP11_ADDR1_DAT4[15:0]),
      .VTH1_D5          (CHIP11_ADDR1_DAT5[15:0]),
      .VTH1_D6          (CHIP11_ADDR1_DAT6[15:0]),
      .VTH1_D7          (CHIP11_ADDR1_DAT7[15:0]),
      .VTH1_D8          (CHIP11_ADDR1_DAT8[15:0]),
      .VTH1_D9          (CHIP11_ADDR1_DAT9[15:0]),
      .VTH1_D10         (CHIP11_ADDR1_DAT10[15:0]),
      .VTH1_D11         (CHIP11_ADDR1_DAT11[15:0]),
      .VTH1_D12         (CHIP11_ADDR1_DAT12[15:0]),
      .VTH2_D1          (CHIP11_ADDR2_DAT1[15:0]),
      .VTH2_D2          (CHIP11_ADDR2_DAT2[15:0]),
      .VTH2_D3          (CHIP11_ADDR2_DAT3[15:0]),
      .VTH2_D4          (CHIP11_ADDR2_DAT4[15:0]),
      .VTH2_D5          (CHIP11_ADDR2_DAT5[15:0]),
      .VTH2_D6          (CHIP11_ADDR2_DAT6[15:0]),
      .VTH2_D7          (CHIP11_ADDR2_DAT7[15:0]),
      .VTH2_D8          (CHIP11_ADDR2_DAT8[15:0]),
      .VTH2_D9          (CHIP11_ADDR2_DAT9[15:0]),
      .VTH2_D10         (CHIP11_ADDR2_DAT10[15:0]),
      .VTH2_D11         (CHIP11_ADDR2_DAT11[15:0]),
      .VTH2_D12         (CHIP11_ADDR2_DAT12[15:0]),
      .VTH1_A1          (CHIP11_ADDR1_1[9:0]),
      .VTH1_A2          (CHIP11_ADDR1_2[9:0]),
      .VTH1_A3          (CHIP11_ADDR1_3[9:0]),
      .VTH1_A4          (CHIP11_ADDR1_4[9:0]),
      .VTH1_A5          (CHIP11_ADDR1_5[9:0]),
      .VTH1_A6          (CHIP11_ADDR1_6[9:0]),
      .VTH1_A7          (CHIP11_ADDR1_7[9:0]),
      .VTH1_A8          (CHIP11_ADDR1_8[9:0]),
      .VTH1_A9          (CHIP11_ADDR1_9[9:0]),
      .VTH1_A10         (CHIP11_ADDR1_10[9:0]),
      .VTH1_A11         (CHIP11_ADDR1_11[9:0]),
      .VTH1_A12         (CHIP11_ADDR1_12[9:0]),
      .VTH2_A1          (CHIP11_ADDR2_1[9:0]),
      .VTH2_A2          (CHIP11_ADDR2_2[9:0]),
      .VTH2_A3          (CHIP11_ADDR2_3[9:0]),
      .VTH2_A4          (CHIP11_ADDR2_4[9:0]),
      .VTH2_A5          (CHIP11_ADDR2_5[9:0]),
      .VTH2_A6          (CHIP11_ADDR2_6[9:0]),
      .VTH2_A7          (CHIP11_ADDR2_7[9:0]),
      .VTH2_A8          (CHIP11_ADDR2_8[9:0]),
      .VTH2_A9          (CHIP11_ADDR2_9[9:0]),
      .VTH2_A10         (CHIP11_ADDR2_10[9:0]),
      .VTH2_A11         (CHIP11_ADDR2_11[9:0]),
      .VTH2_A12         (CHIP11_ADDR2_12[9:0]),
      .VTH1_EN1         (chip11_read1_en1),
      .VTH1_EN2         (chip11_read1_en2),
      .VTH1_EN3         (chip11_read1_en3),
      .VTH1_EN4         (chip11_read1_en4),
      .VTH1_EN5         (chip11_read1_en5),
      .VTH1_EN6         (chip11_read1_en6),
      .VTH1_EN7         (chip11_read1_en7),
      .VTH1_EN8         (chip11_read1_en8),
      .VTH1_EN9         (chip11_read1_en9),
      .VTH1_EN10        (chip11_read1_en10),
      .VTH1_EN11        (chip11_read1_en11),
      .VTH1_EN12        (chip11_read1_en12),
      .VTH2_EN1         (chip11_read2_en1),
      .VTH2_EN2         (chip11_read2_en2),
      .VTH2_EN3         (chip11_read2_en3),
      .VTH2_EN4         (chip11_read2_en4),
      .VTH2_EN5         (chip11_read2_en5),
      .VTH2_EN6         (chip11_read2_en6),
      .VTH2_EN7         (chip11_read2_en7),
      .VTH2_EN8         (chip11_read2_en8),
      .VTH2_EN9         (chip11_read2_en9),
      .VTH2_EN10        (chip11_read2_en10),
      .VTH2_EN11        (chip11_read2_en11),
      .VTH2_EN12        (chip11_read2_en12));

  bp40_xtrans bp40_12trans (
      .CLK              (CLK_120M),
      .CLK_80M          (CLK_READ),
      .CLK_125M         (CLK_125M),
      .frame_end        (frame_end),
      .RST              (RST),
      .SYNC             (SYNC12),
      .sync_start       (sync_start),
      .chip             (chip12),
      .A_REG            (A_REG12),
      // .FRAME_O          (FRAME12),
      .FRAME_COUNT      (FRAME_COUNT),
      .RD_OUTEN         (),
      .next_start       (),
      .SPIEE_PD         (),
      .PHASE_CNT        (phase12_cnt),
      .VTH1_D1          (CHIP12_ADDR1_DAT1[15:0]),
      .VTH1_D2          (CHIP12_ADDR1_DAT2[15:0]),
      .VTH1_D3          (CHIP12_ADDR1_DAT3[15:0]),
      .VTH1_D4          (CHIP12_ADDR1_DAT4[15:0]),
      .VTH1_D5          (CHIP12_ADDR1_DAT5[15:0]),
      .VTH1_D6          (CHIP12_ADDR1_DAT6[15:0]),
      .VTH1_D7          (CHIP12_ADDR1_DAT7[15:0]),
      .VTH1_D8          (CHIP12_ADDR1_DAT8[15:0]),
      .VTH1_D9          (CHIP12_ADDR1_DAT9[15:0]),
      .VTH1_D10         (CHIP12_ADDR1_DAT10[15:0]),
      .VTH1_D11         (CHIP12_ADDR1_DAT11[15:0]),
      .VTH1_D12         (CHIP12_ADDR1_DAT12[15:0]),
      .VTH2_D1          (CHIP12_ADDR2_DAT1[15:0]),
      .VTH2_D2          (CHIP12_ADDR2_DAT2[15:0]),
      .VTH2_D3          (CHIP12_ADDR2_DAT3[15:0]),
      .VTH2_D4          (CHIP12_ADDR2_DAT4[15:0]),
      .VTH2_D5          (CHIP12_ADDR2_DAT5[15:0]),
      .VTH2_D6          (CHIP12_ADDR2_DAT6[15:0]),
      .VTH2_D7          (CHIP12_ADDR2_DAT7[15:0]),
      .VTH2_D8          (CHIP12_ADDR2_DAT8[15:0]),
      .VTH2_D9          (CHIP12_ADDR2_DAT9[15:0]),
      .VTH2_D10         (CHIP12_ADDR2_DAT10[15:0]),
      .VTH2_D11         (CHIP12_ADDR2_DAT11[15:0]),
      .VTH2_D12         (CHIP12_ADDR2_DAT12[15:0]),
      .VTH1_A1          (CHIP12_ADDR1_1[9:0]),
      .VTH1_A2          (CHIP12_ADDR1_2[9:0]),
      .VTH1_A3          (CHIP12_ADDR1_3[9:0]),
      .VTH1_A4          (CHIP12_ADDR1_4[9:0]),
      .VTH1_A5          (CHIP12_ADDR1_5[9:0]),
      .VTH1_A6          (CHIP12_ADDR1_6[9:0]),
      .VTH1_A7          (CHIP12_ADDR1_7[9:0]),
      .VTH1_A8          (CHIP12_ADDR1_8[9:0]),
      .VTH1_A9          (CHIP12_ADDR1_9[9:0]),
      .VTH1_A10         (CHIP12_ADDR1_10[9:0]),
      .VTH1_A11         (CHIP12_ADDR1_11[9:0]),
      .VTH1_A12         (CHIP12_ADDR1_12[9:0]),
      .VTH2_A1          (CHIP12_ADDR2_1[9:0]),
      .VTH2_A2          (CHIP12_ADDR2_2[9:0]),
      .VTH2_A3          (CHIP12_ADDR2_3[9:0]),
      .VTH2_A4          (CHIP12_ADDR2_4[9:0]),
      .VTH2_A5          (CHIP12_ADDR2_5[9:0]),
      .VTH2_A6          (CHIP12_ADDR2_6[9:0]),
      .VTH2_A7          (CHIP12_ADDR2_7[9:0]),
      .VTH2_A8          (CHIP12_ADDR2_8[9:0]),
      .VTH2_A9          (CHIP12_ADDR2_9[9:0]),
      .VTH2_A10         (CHIP12_ADDR2_10[9:0]),
      .VTH2_A11         (CHIP12_ADDR2_11[9:0]),
      .VTH2_A12         (CHIP12_ADDR2_12[9:0]),
      .VTH1_EN1         (chip12_read1_en1),
      .VTH1_EN2         (chip12_read1_en2),
      .VTH1_EN3         (chip12_read1_en3),
      .VTH1_EN4         (chip12_read1_en4),
      .VTH1_EN5         (chip12_read1_en5),
      .VTH1_EN6         (chip12_read1_en6),
      .VTH1_EN7         (chip12_read1_en7),
      .VTH1_EN8         (chip12_read1_en8),
      .VTH1_EN9         (chip12_read1_en9),
      .VTH1_EN10        (chip12_read1_en10),
      .VTH1_EN11        (chip12_read1_en11),
      .VTH1_EN12        (chip12_read1_en12),
      .VTH2_EN1         (chip12_read2_en1),
      .VTH2_EN2         (chip12_read2_en2),
      .VTH2_EN3         (chip12_read2_en3),
      .VTH2_EN4         (chip12_read2_en4),
      .VTH2_EN5         (chip12_read2_en5),
      .VTH2_EN6         (chip12_read2_en6),
      .VTH2_EN7         (chip12_read2_en7),
      .VTH2_EN8         (chip12_read2_en8),
      .VTH2_EN9         (chip12_read2_en9),
      .VTH2_EN10        (chip12_read2_en10),
      .VTH2_EN11        (chip12_read2_en11),
      .VTH2_EN12        (chip12_read2_en12));



reg           readx_end;


// State Machine
reg [2:0] state_reg, state_next;
localparam
  IDLE           = 0,
  P_EN           = 1,
  C_EN           = 2,
  X_IN           = 3,
  D_EN           = 4,
  E_EN           = 5,
  F_EN           = 6,
  G_EN           = 7;

always @(posedge CLK_READ or posedge RST) begin//
  if (RST) state_reg <= IDLE;
  else state_reg <= state_next;
end

always @(*) begin//
  state_next = IDLE;
  case(state_reg)
    IDLE: begin//     //STATE0
      if(RD_OUTEN) begin// 
        state_next = P_EN;
      end  
      else begin//
        state_next = IDLE;
      end
    end
    P_EN: begin//     //STATE0 
        state_next = C_EN;
    end
    C_EN: begin//     //STATE0 
        state_next = X_IN;
    end
    X_IN: begin//     //STATE0
      if(poll_end) begin// 
        state_next = D_EN;
      end  
      else begin//
        state_next = X_IN;
      end
    end
    D_EN: begin//     //STATE0 
        state_next = E_EN;
    end
    E_EN: begin//     //STATE0 
        state_next = F_EN;
    end
    F_EN: begin//     //STATE0 
        state_next = G_EN;
    end
    G_EN: begin//     //STATE0 
        state_next = IDLE;
    end
  endcase
end







reg  [19:0]   poll_cnt;
wire          poll_start;
wire          poll_end;
     

always @(posedge CLK_READ or posedge RST) begin//
  if (RST) begin//
    poll_cnt[19:0] <= 0; 
  end
  else if (poll_start) begin//
      if(poll_end)begin//
        poll_cnt[19:0] <= 0;
      end
      else begin//
        poll_cnt[19:0] <= poll_cnt[19:0] + 1;
      end
  end
end
assign poll_start = (state_reg==X_IN);
assign poll_end   = poll_start&&(poll_cnt[19:0]==20'd294911+32'd1);//


assign RE_START = poll_start;

always @(posedge CLK_READ or posedge RST) begin//
            if (RST) begin//
              read_cnt <= 32'b0;
              chip1_read1_en1 <= 1'b0;
              chip1_read1_en2 <= 1'b0;
              chip1_read1_en3 <= 1'b0;
              chip1_read1_en4 <= 1'b0;
              chip1_read1_en5 <= 1'b0;
              chip1_read1_en6 <= 1'b0;
              chip1_read1_en7 <= 1'b0;
              chip1_read1_en8 <= 1'b0;
              chip1_read1_en9 <= 1'b0;
              chip1_read1_en10 <= 1'b0;
              chip1_read1_en11 <= 1'b0;
              chip1_read1_en12 <= 1'b0;
              chip1_read2_en1 <= 1'b0;
              chip1_read2_en2 <= 1'b0;
              chip1_read2_en3 <= 1'b0;
              chip1_read2_en4 <= 1'b0;
              chip1_read2_en5 <= 1'b0;
              chip1_read2_en6 <= 1'b0;
              chip1_read2_en7 <= 1'b0;
              chip1_read2_en8 <= 1'b0;
              chip1_read2_en9 <= 1'b0;
              chip1_read2_en10 <= 1'b0;
              chip1_read2_en11 <= 1'b0;
              chip1_read2_en12 <= 1'b0;

              chip2_read1_en1 <= 1'b0;
              chip2_read1_en2 <= 1'b0;
              chip2_read1_en3 <= 1'b0;
              chip2_read1_en4 <= 1'b0;
              chip2_read1_en5 <= 1'b0;
              chip2_read1_en6 <= 1'b0;
              chip2_read1_en7 <= 1'b0;
              chip2_read1_en8 <= 1'b0;
              chip2_read1_en9 <= 1'b0;
              chip2_read1_en10 <= 1'b0;
              chip2_read1_en11 <= 1'b0;
              chip2_read1_en12 <= 1'b0;
              chip2_read2_en1 <= 1'b0;
              chip2_read2_en2 <= 1'b0;
              chip2_read2_en3 <= 1'b0;
              chip2_read2_en4 <= 1'b0;
              chip2_read2_en5 <= 1'b0;
              chip2_read2_en6 <= 1'b0;
              chip2_read2_en7 <= 1'b0;
              chip2_read2_en8 <= 1'b0;
              chip2_read2_en9 <= 1'b0;
              chip2_read2_en10 <= 1'b0;
              chip2_read2_en11 <= 1'b0;
              chip2_read2_en12 <= 1'b0;

              chip3_read1_en1 <= 1'b0;
              chip3_read1_en2 <= 1'b0;
              chip3_read1_en3 <= 1'b0;
              chip3_read1_en4 <= 1'b0;
              chip3_read1_en5 <= 1'b0;
              chip3_read1_en6 <= 1'b0;
              chip3_read1_en7 <= 1'b0;
              chip3_read1_en8 <= 1'b0;
              chip3_read1_en9 <= 1'b0;
              chip3_read1_en10 <= 1'b0;
              chip3_read1_en11 <= 1'b0;
              chip3_read1_en12 <= 1'b0;
              chip3_read2_en1 <= 1'b0;
              chip3_read2_en2 <= 1'b0;
              chip3_read2_en3 <= 1'b0;
              chip3_read2_en4 <= 1'b0;
              chip3_read2_en5 <= 1'b0;
              chip3_read2_en6 <= 1'b0;
              chip3_read2_en7 <= 1'b0;
              chip3_read2_en8 <= 1'b0;
              chip3_read2_en9 <= 1'b0;
              chip3_read2_en10 <= 1'b0;
              chip3_read2_en11 <= 1'b0;
              chip3_read2_en12 <= 1'b0;

              chip4_read1_en1 <= 1'b0;
              chip4_read1_en2 <= 1'b0;
              chip4_read1_en3 <= 1'b0;
              chip4_read1_en4 <= 1'b0;
              chip4_read1_en5 <= 1'b0;
              chip4_read1_en6 <= 1'b0;
              chip4_read1_en7 <= 1'b0;
              chip4_read1_en8 <= 1'b0;
              chip4_read1_en9 <= 1'b0;
              chip4_read1_en10 <= 1'b0;
              chip4_read1_en11 <= 1'b0;
              chip4_read1_en12 <= 1'b0;
              chip4_read2_en1 <= 1'b0;
              chip4_read2_en2 <= 1'b0;
              chip4_read2_en3 <= 1'b0;
              chip4_read2_en4 <= 1'b0;
              chip4_read2_en5 <= 1'b0;
              chip4_read2_en6 <= 1'b0;
              chip4_read2_en7 <= 1'b0;
              chip4_read2_en8 <= 1'b0;
              chip4_read2_en9 <= 1'b0;
              chip4_read2_en10 <= 1'b0;
              chip4_read2_en11 <= 1'b0;
              chip4_read2_en12 <= 1'b0;  
              
              chip5_read1_en1 <= 1'b0;
              chip5_read1_en2 <= 1'b0;
              chip5_read1_en3 <= 1'b0;
              chip5_read1_en4 <= 1'b0;
              chip5_read1_en5 <= 1'b0;
              chip5_read1_en6 <= 1'b0;
              chip5_read1_en7 <= 1'b0;
              chip5_read1_en8 <= 1'b0;
              chip5_read1_en9 <= 1'b0;
              chip5_read1_en10 <= 1'b0;
              chip5_read1_en11 <= 1'b0;
              chip5_read1_en12 <= 1'b0;
              chip5_read2_en1 <= 1'b0;
              chip5_read2_en2 <= 1'b0;
              chip5_read2_en3 <= 1'b0;
              chip5_read2_en4 <= 1'b0;
              chip5_read2_en5 <= 1'b0;
              chip5_read2_en6 <= 1'b0;
              chip5_read2_en7 <= 1'b0;
              chip5_read2_en8 <= 1'b0;
              chip5_read2_en9 <= 1'b0;
              chip5_read2_en10 <= 1'b0;
              chip5_read2_en11 <= 1'b0;
              chip5_read2_en12 <= 1'b0; 
              
              chip6_read1_en1 <= 1'b0;
              chip6_read1_en2 <= 1'b0;
              chip6_read1_en3 <= 1'b0;
              chip6_read1_en4 <= 1'b0;
              chip6_read1_en5 <= 1'b0;
              chip6_read1_en6 <= 1'b0;
              chip6_read1_en7 <= 1'b0;
              chip6_read1_en8 <= 1'b0;
              chip6_read1_en9 <= 1'b0;
              chip6_read1_en10 <= 1'b0;
              chip6_read1_en11 <= 1'b0;
              chip6_read1_en12 <= 1'b0;
              chip6_read2_en1 <= 1'b0;
              chip6_read2_en2 <= 1'b0;
              chip6_read2_en3 <= 1'b0;
              chip6_read2_en4 <= 1'b0;
              chip6_read2_en5 <= 1'b0;
              chip6_read2_en6 <= 1'b0;
              chip6_read2_en7 <= 1'b0;
              chip6_read2_en8 <= 1'b0;
              chip6_read2_en9 <= 1'b0;
              chip6_read2_en10 <= 1'b0;
              chip6_read2_en11 <= 1'b0;
              chip6_read2_en12 <= 1'b0;


              chip7_read1_en1 <= 1'b0;
              chip7_read1_en2 <= 1'b0;
              chip7_read1_en3 <= 1'b0;
              chip7_read1_en4 <= 1'b0;
              chip7_read1_en5 <= 1'b0;
              chip7_read1_en6 <= 1'b0;
              chip7_read1_en7 <= 1'b0;
              chip7_read1_en8 <= 1'b0;
              chip7_read1_en9 <= 1'b0;
              chip7_read1_en10 <= 1'b0;
              chip7_read1_en11 <= 1'b0;
              chip7_read1_en12 <= 1'b0;
              chip7_read2_en1 <= 1'b0;
              chip7_read2_en2 <= 1'b0;
              chip7_read2_en3 <= 1'b0;
              chip7_read2_en4 <= 1'b0;
              chip7_read2_en5 <= 1'b0;
              chip7_read2_en6 <= 1'b0;
              chip7_read2_en7 <= 1'b0;
              chip7_read2_en8 <= 1'b0;
              chip7_read2_en9 <= 1'b0;
              chip7_read2_en10 <= 1'b0;
              chip7_read2_en11 <= 1'b0;
              chip7_read2_en12 <= 1'b0;



              chip8_read1_en1 <= 1'b0;
              chip8_read1_en2 <= 1'b0;
              chip8_read1_en3 <= 1'b0;
              chip8_read1_en4 <= 1'b0;
              chip8_read1_en5 <= 1'b0;
              chip8_read1_en6 <= 1'b0;
              chip8_read1_en7 <= 1'b0;
              chip8_read1_en8 <= 1'b0;
              chip8_read1_en9 <= 1'b0;
              chip8_read1_en10 <= 1'b0;
              chip8_read1_en11 <= 1'b0;
              chip8_read1_en12 <= 1'b0;
              chip8_read2_en1 <= 1'b0;
              chip8_read2_en2 <= 1'b0;
              chip8_read2_en3 <= 1'b0;
              chip8_read2_en4 <= 1'b0;
              chip8_read2_en5 <= 1'b0;
              chip8_read2_en6 <= 1'b0;
              chip8_read2_en7 <= 1'b0;
              chip8_read2_en8 <= 1'b0;
              chip8_read2_en9 <= 1'b0;
              chip8_read2_en10 <= 1'b0;
              chip8_read2_en11 <= 1'b0;
              chip8_read2_en12 <= 1'b0;



              chip9_read1_en1 <= 1'b0;
              chip9_read1_en2 <= 1'b0;
              chip9_read1_en3 <= 1'b0;
              chip9_read1_en4 <= 1'b0;
              chip9_read1_en5 <= 1'b0;
              chip9_read1_en6 <= 1'b0;
              chip9_read1_en7 <= 1'b0;
              chip9_read1_en8 <= 1'b0;
              chip9_read1_en9 <= 1'b0;
              chip9_read1_en10 <= 1'b0;
              chip9_read1_en11 <= 1'b0;
              chip9_read1_en12 <= 1'b0;
              chip9_read2_en1 <= 1'b0;
              chip9_read2_en2 <= 1'b0;
              chip9_read2_en3 <= 1'b0;
              chip9_read2_en4 <= 1'b0;
              chip9_read2_en5 <= 1'b0;
              chip9_read2_en6 <= 1'b0;
              chip9_read2_en7 <= 1'b0;
              chip9_read2_en8 <= 1'b0;
              chip9_read2_en9 <= 1'b0;
              chip9_read2_en10 <= 1'b0;
              chip9_read2_en11 <= 1'b0;
              chip9_read2_en12 <= 1'b0;


              chip10_read1_en1 <= 1'b0;
              chip10_read1_en2 <= 1'b0;
              chip10_read1_en3 <= 1'b0;
              chip10_read1_en4 <= 1'b0;
              chip10_read1_en5 <= 1'b0;
              chip10_read1_en6 <= 1'b0;
              chip10_read1_en7 <= 1'b0;
              chip10_read1_en8 <= 1'b0;
              chip10_read1_en9 <= 1'b0;
              chip10_read1_en10 <= 1'b0;
              chip10_read1_en11 <= 1'b0;
              chip10_read1_en12 <= 1'b0;
              chip10_read2_en1 <= 1'b0;
              chip10_read2_en2 <= 1'b0;
              chip10_read2_en3 <= 1'b0;
              chip10_read2_en4 <= 1'b0;
              chip10_read2_en5 <= 1'b0;
              chip10_read2_en6 <= 1'b0;
              chip10_read2_en7 <= 1'b0;
              chip10_read2_en8 <= 1'b0;
              chip10_read2_en9 <= 1'b0;
              chip10_read2_en10 <= 1'b0;
              chip10_read2_en11 <= 1'b0;
              chip10_read2_en12 <= 1'b0;


              chip11_read1_en1 <= 1'b0;
              chip11_read1_en2 <= 1'b0;
              chip11_read1_en3 <= 1'b0;
              chip11_read1_en4 <= 1'b0;
              chip11_read1_en5 <= 1'b0;
              chip11_read1_en6 <= 1'b0;
              chip11_read1_en7 <= 1'b0;
              chip11_read1_en8 <= 1'b0;
              chip11_read1_en9 <= 1'b0;
              chip11_read1_en10 <= 1'b0;
              chip11_read1_en11 <= 1'b0;
              chip11_read1_en12 <= 1'b0;
              chip11_read2_en1 <= 1'b0;
              chip11_read2_en2 <= 1'b0;
              chip11_read2_en3 <= 1'b0;
              chip11_read2_en4 <= 1'b0;
              chip11_read2_en5 <= 1'b0;
              chip11_read2_en6 <= 1'b0;
              chip11_read2_en7 <= 1'b0;
              chip11_read2_en8 <= 1'b0;
              chip11_read2_en9 <= 1'b0;
              chip11_read2_en10 <= 1'b0;
              chip11_read2_en11 <= 1'b0;
              chip11_read2_en12 <= 1'b0;


              chip12_read1_en1 <= 1'b0;
              chip12_read1_en2 <= 1'b0;
              chip12_read1_en3 <= 1'b0;
              chip12_read1_en4 <= 1'b0;
              chip12_read1_en5 <= 1'b0;
              chip12_read1_en6 <= 1'b0;
              chip12_read1_en7 <= 1'b0;
              chip12_read1_en8 <= 1'b0;
              chip12_read1_en9 <= 1'b0;
              chip12_read1_en10 <= 1'b0;
              chip12_read1_en11 <= 1'b0;
              chip12_read1_en12 <= 1'b0;
              chip12_read2_en1 <= 1'b0;
              chip12_read2_en2 <= 1'b0;
              chip12_read2_en3 <= 1'b0;
              chip12_read2_en4 <= 1'b0;
              chip12_read2_en5 <= 1'b0;
              chip12_read2_en6 <= 1'b0;
              chip12_read2_en7 <= 1'b0;
              chip12_read2_en8 <= 1'b0;
              chip12_read2_en9 <= 1'b0;
              chip12_read2_en10 <= 1'b0;
              chip12_read2_en11 <= 1'b0;
              chip12_read2_en12 <= 1'b0;

              readx_end <= 1'b0;
            end
            else if (RE_START&&read_cnt[31:0]==32'd0) begin//
              chip1_read1_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;             
            end
            else if (RE_START&&read_cnt[31:0]==32'd294911+32'd1) begin//d294911
              chip12_read2_en12 <= 1'b0;
              readx_end <= 1'b1;
              read_cnt[31:0]<= 32'd0;      
            end            
            else if (RE_START&&read_cnt[31:0]==32'd293887+32'd1) begin//d293887
              chip12_read2_en11 <= 1'b0;
              chip12_read2_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd292863+32'd1) begin//d292863
              chip12_read2_en10 <= 1'b0;
              chip12_read2_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd291839+32'd1) begin//d291839
              chip12_read2_en9 <= 1'b0;
              chip12_read2_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end  
            else if (RE_START&&read_cnt[31:0]==32'd290815+32'd1) begin//d290815
              chip12_read2_en8 <= 1'b0;
              chip12_read2_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd289791+32'd1) begin//d289791
              chip12_read2_en7 <= 1'b0;
              chip12_read2_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd288767+32'd1) begin//d288767
              chip12_read2_en6 <= 1'b0;
              chip12_read2_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd287743+32'd1) begin//d287743
              chip12_read2_en5 <= 1'b0;
              chip12_read2_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd286719+32'd1) begin//d286719
              chip12_read2_en4 <= 1'b0;
              chip12_read2_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd285695+32'd1) begin//d285695
              chip12_read2_en3 <= 1'b0;
              chip12_read2_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd284671+32'd1) begin//d284671
              chip12_read2_en2 <= 1'b0;
              chip12_read2_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd283647+32'd1) begin//d283647
              chip12_read2_en1 <= 1'b0;
              chip12_read2_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd282623+32'd1) begin//d282623
              chip11_read2_en12 <= 1'b0;
              chip12_read2_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd281599+32'd1) begin//d281599
              chip11_read2_en11 <= 1'b0;
              chip11_read2_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd280575+32'd1) begin//d280575
              chip11_read2_en10 <= 1'b0;
              chip11_read2_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 

            else if (RE_START&&read_cnt[31:0]==32'd279551+32'd1) begin//d279551
              chip11_read2_en9 <= 1'b0;
              chip11_read2_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd278527+32'd1) begin//d278527
              chip11_read2_en8 <= 1'b0;
              chip11_read2_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd277503+32'd1) begin//d277503
              chip11_read2_en7 <= 1'b0;
              chip11_read2_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd276479+32'd1) begin//d276479
              chip11_read2_en6 <= 1'b0;
              chip11_read2_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd275455+32'd1) begin//d275455
              chip11_read2_en5 <= 1'b0;
              chip11_read2_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd274431+32'd1) begin//d274431
              chip11_read2_en4 <= 1'b0;
              chip11_read2_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd273407+32'd1) begin//d273407
              chip11_read2_en3 <= 1'b0;
              chip11_read2_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd272383+32'd1) begin//d272383
              chip11_read2_en2 <= 1'b0;
              chip11_read2_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd271359+32'd1) begin//d271359
              chip11_read2_en1 <= 1'b0;
              chip11_read2_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd270335+32'd1) begin//d270335
              chip10_read2_en12 <= 1'b0;
              chip11_read2_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd269311+32'd1) begin//d269311
              chip10_read2_en11 <= 1'b0;
              chip10_read2_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd268287+32'd1) begin//d268287
              chip10_read2_en10 <= 1'b0;
              chip10_read2_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd267263+32'd1) begin//d267263
              chip10_read2_en9 <= 1'b0;
              chip10_read2_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd266239+32'd1) begin//d266239
              chip10_read2_en8 <= 1'b0;
              chip10_read2_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd265215+32'd1) begin//d265215
              chip10_read2_en7 <= 1'b0;
              chip10_read2_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd264191+32'd1) begin//d264191
              chip10_read2_en6 <= 1'b0;
              chip10_read2_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd263167+32'd1) begin//d263167
              chip10_read2_en5 <= 1'b0;
              chip10_read2_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd262143+32'd1) begin//d262143
              chip10_read2_en4 <= 1'b0;
              chip10_read2_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd261119+32'd1) begin//d261119
              chip10_read2_en3 <= 1'b0;
              chip10_read2_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd260095+32'd1) begin//d260095
              chip10_read2_en2 <= 1'b0;
              chip10_read2_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd259071+32'd1) begin//d259071
              chip10_read2_en1 <= 1'b0;
              chip10_read2_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd258047+32'd1) begin//d258047
              chip9_read2_en12 <= 1'b0;
              chip10_read2_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd257023+32'd1) begin//d257023
              chip9_read2_en11 <= 1'b0;
              chip9_read2_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd255999+32'd1) begin//d255999
              chip9_read2_en10 <= 1'b0;
              chip9_read2_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd254975+32'd1) begin//d254975
              chip9_read2_en9 <= 1'b0;
              chip9_read2_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd253951+32'd1) begin//d253951
              chip9_read2_en8 <= 1'b0;
              chip9_read2_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd252927+32'd1) begin//d252927
              chip9_read2_en7 <= 1'b0;
              chip9_read2_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd251903+32'd1) begin//d251903
              chip9_read2_en6 <= 1'b0;
              chip9_read2_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd250879+32'd1) begin//d250879
              chip9_read2_en5 <= 1'b0;
              chip9_read2_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd249855+32'd1) begin//d249855
              chip9_read2_en4 <= 1'b0;
              chip9_read2_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd248831+32'd1) begin//d248831
              chip9_read2_en3 <= 1'b0;
              chip9_read2_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd247807+32'd1) begin//d247807
              chip9_read2_en2 <= 1'b0;
              chip9_read2_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd246783+32'd1) begin//d246783
              chip9_read2_en1 <= 1'b0;
              chip9_read2_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd245759+32'd1) begin//d245759
              chip8_read2_en12 <= 1'b0;
              chip9_read2_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd244735+32'd1) begin//d244735
              chip8_read2_en11 <= 1'b0;
              chip8_read2_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd243711+32'd1) begin//d243711
              chip8_read2_en10 <= 1'b0;
              chip8_read2_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd242687+32'd1) begin//d242687
              chip8_read2_en9 <= 1'b0;
              chip8_read2_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd241663+32'd1) begin//d241663
              chip8_read2_en8 <= 1'b0;
              chip8_read2_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd240639+32'd1) begin//d240639
              chip8_read2_en7 <= 1'b0;
              chip8_read2_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd239615+32'd1) begin//d239615
              chip8_read2_en6 <= 1'b0;
              chip8_read2_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd238591+32'd1) begin//d238591
              chip8_read2_en5 <= 1'b0;
              chip8_read2_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd237567+32'd1) begin//d237567
              chip8_read2_en4 <= 1'b0;
              chip8_read2_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd236543+32'd1) begin//d236543
              chip8_read2_en3 <= 1'b0;
              chip8_read2_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd235519+32'd1) begin//d235519
              chip8_read2_en2 <= 1'b0;
              chip8_read2_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end  
            else if (RE_START&&read_cnt[31:0]==32'd234495+32'd1) begin//d234495
              chip8_read2_en1 <= 1'b0;
              chip8_read2_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd233471+32'd1) begin//d233471
              chip7_read2_en12 <= 1'b0;
              chip8_read2_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd232447+32'd1) begin//d232447
              chip7_read2_en11 <= 1'b0;
              chip7_read2_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd231423+32'd1) begin//d231423
              chip7_read2_en10 <= 1'b0;
              chip7_read2_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd230399+32'd1) begin//d230399
              chip7_read2_en9 <= 1'b0;
              chip7_read2_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd229375+32'd1) begin//d229375
              chip7_read2_en8 <= 1'b0;
              chip7_read2_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd228351+32'd1) begin//d228351
              chip7_read2_en7 <= 1'b0;
              chip7_read2_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd227327+32'd1) begin//d227327
              chip7_read2_en6 <= 1'b0;
              chip7_read2_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd226303+32'd1) begin//d226303
              chip7_read2_en5 <= 1'b0;
              chip7_read2_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd225279+32'd1) begin//d225279
              chip7_read2_en4 <= 1'b0;
              chip7_read2_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd224255+32'd1) begin//d224255
              chip7_read2_en3 <= 1'b0;
              chip7_read2_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd223231+32'd1) begin//d223231
              chip7_read2_en2 <= 1'b0;
              chip7_read2_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd222207+32'd1) begin//d222207
              chip7_read2_en1 <= 1'b0;
              chip7_read2_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd221183+32'd1) begin//d221183
              chip6_read2_en12 <= 1'b0;
              chip7_read2_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd220159+32'd1) begin//d220159
              chip6_read2_en11 <= 1'b0;
              chip6_read2_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd219135+32'd1) begin//d219135
              chip6_read2_en10 <= 1'b0;
              chip6_read2_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd218111+32'd1) begin//d218111
              chip6_read2_en9 <= 1'b0;
              chip6_read2_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd217087+32'd1) begin//d217087
              chip6_read2_en8 <= 1'b0;
              chip6_read2_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd216063+32'd1) begin//d216063
              chip6_read2_en7 <= 1'b0;
              chip6_read2_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd215039+32'd1) begin//d215039
              chip6_read2_en6 <= 1'b0;
              chip6_read2_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd214015+32'd1) begin//d214015
              chip6_read2_en5 <= 1'b0;
              chip6_read2_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd212991+32'd1) begin//d212991
              chip6_read2_en4 <= 1'b0;
              chip6_read2_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd211967+32'd1) begin//d211967
              chip6_read2_en3 <= 1'b0;
              chip6_read2_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd210943+32'd1) begin//d210943
              chip6_read2_en2 <= 1'b0;
              chip6_read2_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd209919+32'd1) begin//d209919
              chip6_read2_en1 <= 1'b0;
              chip6_read2_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd208895+32'd1) begin//d208895
              chip5_read2_en12 <= 1'b0;
              chip6_read2_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd207871+32'd1) begin//d207871
              chip5_read2_en11 <= 1'b0;
              chip5_read2_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd206847+32'd1) begin//d206847
              chip5_read2_en10 <= 1'b0;
              chip5_read2_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd205823+32'd1) begin//d205823
              chip5_read2_en9 <= 1'b0;
              chip5_read2_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd204799+32'd1) begin//d204799
              chip5_read2_en8 <= 1'b0;
              chip5_read2_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd203775+32'd1) begin//d203775
              chip5_read2_en7 <= 1'b0;
              chip5_read2_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd202751+32'd1) begin//d202751
              chip5_read2_en6 <= 1'b0;
              chip5_read2_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd201727+32'd1) begin//d201727
              chip5_read2_en5 <= 1'b0;
              chip5_read2_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd200703+32'd1) begin//d200703
              chip5_read2_en4 <= 1'b0;
              chip5_read2_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd199679+32'd1) begin//d199679
              chip5_read2_en3 <= 1'b0;
              chip5_read2_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd198655+32'd1) begin//d198655
              chip5_read2_en2 <= 1'b0;
              chip5_read2_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd197631+32'd1) begin//d197631
              chip5_read2_en1 <= 1'b0;
              chip5_read2_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd196607+32'd1) begin//d196607
              chip4_read2_en12 <= 1'b0;
              chip5_read2_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd195583+32'd1) begin//d195583
              chip4_read2_en11 <= 1'b0;
              chip4_read2_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd194559+32'd1) begin//d194559
              chip4_read2_en10 <= 1'b0;
              chip4_read2_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd193535+32'd1) begin//d193535
              chip4_read2_en9 <= 1'b0;
              chip4_read2_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd192511+32'd1) begin//d192511
              chip4_read2_en8 <= 1'b0;
              chip4_read2_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd191487+32'd1) begin//d191487
              chip4_read2_en7 <= 1'b0;
              chip4_read2_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd190463+32'd1) begin//d190463
              chip4_read2_en6 <= 1'b0;
              chip4_read2_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd189439+32'd1) begin//d189439
              chip4_read2_en5 <= 1'b0;
              chip4_read2_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd188415+32'd1) begin//d188415
              chip4_read2_en4 <= 1'b0;
              chip4_read2_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd187391+32'd1) begin//d187391
              chip4_read2_en3 <= 1'b0;
              chip4_read2_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd186367+32'd1) begin//d186367
              chip4_read2_en2 <= 1'b0;
              chip4_read2_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd185343+32'd1) begin//d185343
              chip4_read2_en1 <= 1'b0;
              chip4_read2_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd184319+32'd1) begin//d184319
              chip3_read2_en12 <= 1'b0;
              chip4_read2_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd183295+32'd1) begin//d183295
              chip3_read2_en11 <= 1'b0;
              chip3_read2_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd182271+32'd1) begin//d182271
              chip3_read2_en10 <= 1'b0;
              chip3_read2_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd181247+32'd1) begin//d181247
              chip3_read2_en9 <= 1'b0;
              chip3_read2_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd180223+32'd1) begin//d180223
              chip3_read2_en8 <= 1'b0;
              chip3_read2_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd179199+32'd1) begin//d179199
              chip3_read2_en7 <= 1'b0;
              chip3_read2_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd178175+32'd1) begin//d178175
              chip3_read2_en6 <= 1'b0;
              chip3_read2_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd177151+32'd1) begin//d177151
              chip3_read2_en5 <= 1'b0;
              chip3_read2_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd176127+32'd1) begin//d176127
              chip3_read2_en4 <= 1'b0;
              chip3_read2_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd175103+32'd1) begin//d175103
              chip3_read2_en3 <= 1'b0;
              chip3_read2_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd174079+32'd1) begin//d174079
              chip3_read2_en2 <= 1'b0;
              chip3_read2_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd173055+32'd1) begin//d173055
              chip3_read2_en1 <= 1'b0;
              chip3_read2_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd172031+32'd1) begin//d172031
              chip2_read2_en12 <= 1'b0;
              chip3_read2_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd171007+32'd1) begin//d171007
              chip2_read2_en11 <= 1'b0;
              chip2_read2_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd169983+32'd1) begin//d169983
              chip2_read2_en10 <= 1'b0;
              chip2_read2_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd168959+32'd1) begin//d168959
              chip2_read2_en9 <= 1'b0;
              chip2_read2_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd167935+32'd1) begin//d167935
              chip2_read2_en8 <= 1'b0;
              chip2_read2_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd166911+32'd1) begin//d166911
              chip2_read2_en7 <= 1'b0;
              chip2_read2_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd165887+32'd1) begin//d165887
              chip2_read2_en6 <= 1'b0;
              chip2_read2_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd164863+32'd1) begin//d164863
              chip2_read2_en5 <= 1'b0;
              chip2_read2_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd163839+32'd1) begin//d163839
              chip2_read2_en4 <= 1'b0;
              chip2_read2_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd162815+32'd1) begin//d162815
              chip2_read2_en3 <= 1'b0;
              chip2_read2_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd161791+32'd1) begin//d161791
              chip2_read2_en2 <= 1'b0;
              chip2_read2_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd160767+32'd1) begin//d160767
              chip2_read2_en1 <= 1'b0;
              chip2_read2_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd159743+32'd1) begin//d159743
              chip1_read2_en12 <= 1'b0;
              chip2_read2_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd158719+32'd1) begin//d158719
              chip1_read2_en11 <= 1'b0;
              chip1_read2_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd157695+32'd1) begin//d157695
              chip1_read2_en10 <= 1'b0;
              chip1_read2_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd156671+32'd1) begin//d156671
              chip1_read2_en9 <= 1'b0;
              chip1_read2_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd155647+32'd1) begin//d155647
              chip1_read2_en8 <= 1'b0;
              chip1_read2_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd154623+32'd1) begin//d154623
              chip1_read2_en7 <= 1'b0;
              chip1_read2_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd153599+32'd1) begin//d153599
              chip1_read2_en6 <= 1'b0;
              chip1_read2_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd152575+32'd1) begin//d152575
              chip1_read2_en5 <= 1'b0;
              chip1_read2_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd151551+32'd1) begin//d151551
              chip1_read2_en4 <= 1'b0;
              chip1_read2_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd150527+32'd1) begin//d150527
              chip1_read2_en3 <= 1'b0;
              chip1_read2_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd149503+32'd1) begin//d149503
              chip1_read2_en2 <= 1'b0;
              chip1_read2_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd148479+32'd1) begin//d148479
              chip1_read2_en1 <= 1'b0;
              chip1_read2_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd147455+32'd1) begin//d147455
              chip12_read1_en12 <= 1'b0;
              chip1_read2_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd146431+32'd1) begin//d146431
              chip12_read1_en11 <= 1'b0;
              chip12_read1_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd145407+32'd1) begin//d145407
              chip12_read1_en10 <= 1'b0;
              chip12_read1_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd144383+32'd1) begin//d144383
              chip12_read1_en9 <= 1'b0;
              chip12_read1_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd143359+32'd1) begin//d143359
              chip12_read1_en8 <= 1'b0;
              chip12_read1_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd142335+32'd1) begin//d142335
              chip12_read1_en7 <= 1'b0;
              chip12_read1_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd141311+32'd1) begin//d141311
              chip12_read1_en6 <= 1'b0;
              chip12_read1_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd140287+32'd1) begin//d140287
              chip12_read1_en5 <= 1'b0;
              chip12_read1_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd139263+32'd1) begin//d139263
              chip12_read1_en4 <= 1'b0;
              chip12_read1_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd138239+32'd1) begin//d138239
              chip12_read1_en3 <= 1'b0;
              chip12_read1_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd137215+32'd1) begin//d137215
              chip12_read1_en2 <= 1'b0;
              chip12_read1_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end  
            else if (RE_START&&read_cnt[31:0]==32'd136191+32'd1) begin//d136191
              chip12_read1_en1 <= 1'b0;
              chip12_read1_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd135167+32'd1) begin//d135167
              chip11_read1_en12 <= 1'b0;
              chip12_read1_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd134143+32'd1) begin//d134143
              chip11_read1_en11 <= 1'b0;
              chip11_read1_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd133119+32'd1) begin//d133119
              chip11_read1_en10 <= 1'b0;
              chip11_read1_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd132095+32'd1) begin//d132095
              chip11_read1_en9 <= 1'b0;
              chip11_read1_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd131071+32'd1) begin//d131071
              chip11_read1_en8 <= 1'b0;
              chip11_read1_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd130047+32'd1) begin//d130047
              chip11_read1_en7 <= 1'b0;
              chip11_read1_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd129023+32'd1) begin//d129023
              chip11_read1_en6 <= 1'b0;
              chip11_read1_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd127999+32'd1) begin//d127999
              chip11_read1_en5 <= 1'b0;
              chip11_read1_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd126975+32'd1) begin//d126975
              chip11_read1_en4 <= 1'b0;
              chip11_read1_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd125951+32'd1) begin//d125951
              chip11_read1_en3 <= 1'b0;
              chip11_read1_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd124927+32'd1) begin//d124927
              chip11_read1_en2 <= 1'b0;
              chip11_read1_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd123903+32'd1) begin//d123903
              chip11_read1_en1 <= 1'b0;
              chip11_read1_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd122879+32'd1) begin//d122879
              chip10_read1_en12 <= 1'b0;
              chip11_read1_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd121855+32'd1) begin//d121855
              chip10_read1_en11 <= 1'b0;
              chip10_read1_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd120831+32'd1) begin//d120831
              chip10_read1_en10 <= 1'b0;
              chip10_read1_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd119807+32'd1) begin//d119807
              chip10_read1_en9 <= 1'b0;
              chip10_read1_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd118783+32'd1) begin//d118783
              chip10_read1_en8 <= 1'b0;
              chip10_read1_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd117759+32'd1) begin//d117759
              chip10_read1_en7 <= 1'b0;
              chip10_read1_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd116735+32'd1) begin//d116735
              chip10_read1_en6 <= 1'b0;
              chip10_read1_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd115711+32'd1) begin//d115711
              chip10_read1_en5 <= 1'b0;
              chip10_read1_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd114687+32'd1) begin//d114687
              chip10_read1_en4 <= 1'b0;
              chip10_read1_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd113663+32'd1) begin//d113663
              chip10_read1_en3 <= 1'b0;
              chip10_read1_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd112639+32'd1) begin//d112639
              chip10_read1_en2 <= 1'b0;
              chip10_read1_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd111615+32'd1) begin//d111615
              chip10_read1_en1 <= 1'b0;
              chip10_read1_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd110591+32'd1) begin//d110591
              chip9_read1_en12 <= 1'b0;
              chip10_read1_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd109567+32'd1) begin//d109567
              chip9_read1_en11 <= 1'b0;
              chip9_read1_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd108543+32'd1) begin//d108543
              chip9_read1_en10 <= 1'b0;
              chip9_read1_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd107519+32'd1) begin//d107519
              chip9_read1_en9 <= 1'b0;
              chip9_read1_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd106495+32'd1) begin//d106495
              chip9_read1_en8 <= 1'b0;
              chip9_read1_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd105471+32'd1) begin//d105471
              chip9_read1_en7 <= 1'b0;
              chip9_read1_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd104447+32'd1) begin//d104447
              chip9_read1_en6 <= 1'b0;
              chip9_read1_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd103423+32'd1) begin//d103423
              chip9_read1_en5 <= 1'b0;
              chip9_read1_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd102399+32'd1) begin//d102399
              chip9_read1_en4 <= 1'b0;
              chip9_read1_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd101375+32'd1) begin//d101375
              chip9_read1_en3 <= 1'b0;
              chip9_read1_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd100351+32'd1) begin//d100351
              chip9_read1_en2 <= 1'b0;
              chip9_read1_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd99327+32'd1) begin//d99327
              chip9_read1_en1 <= 1'b0;
              chip9_read1_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd98303+32'd1) begin//d98303
              chip8_read1_en12 <= 1'b0;
              chip9_read1_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd97279+32'd1) begin//d97279
              chip8_read1_en11 <= 1'b0;
              chip8_read1_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd96255+32'd1) begin//d96255
              chip8_read1_en10 <= 1'b0;
              chip8_read1_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd95231+32'd1) begin//d95231
              chip8_read1_en9 <= 1'b0;
              chip8_read1_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd94207+32'd1) begin//d94207
              chip8_read1_en8 <= 1'b0;
              chip8_read1_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd93183+32'd1) begin//d93183
              chip8_read1_en7 <= 1'b0;
              chip8_read1_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd92159+32'd1) begin//d92159
              chip8_read1_en6 <= 1'b0;
              chip8_read1_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd91135+32'd1) begin//d91135
              chip8_read1_en5 <= 1'b0;
              chip8_read1_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd90111+32'd1) begin//d90111
              chip8_read1_en4 <= 1'b0;
              chip8_read1_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd89087+32'd1) begin//d89087
              chip8_read1_en3 <= 1'b0;
              chip8_read1_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd88063+32'd1) begin//d88063
              chip8_read1_en2 <= 1'b0;
              chip8_read1_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd87039+32'd1) begin//d87039
              chip8_read1_en1 <= 1'b0;
              chip8_read1_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd86015+32'd1) begin//d86015
              chip7_read1_en12 <= 1'b0;
              chip8_read1_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd84991+32'd1) begin//d84991
              chip7_read1_en11 <= 1'b0;
              chip7_read1_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd83967+32'd1) begin//d83967
              chip7_read1_en10 <= 1'b0;
              chip7_read1_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd82943+32'd1) begin//d82943
              chip7_read1_en9 <= 1'b0;
              chip7_read1_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd81919+32'd1) begin//d81919
              chip7_read1_en8 <= 1'b0;
              chip7_read1_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd80895+32'd1) begin//d80895
              chip7_read1_en7 <= 1'b0;
              chip7_read1_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd79871+32'd1) begin//d79871
              chip7_read1_en6 <= 1'b0;
              chip7_read1_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd78847+32'd1) begin//d78847
              chip7_read1_en5 <= 1'b0;
              chip7_read1_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd77823+32'd1) begin//d77823
              chip7_read1_en4 <= 1'b0;
              chip7_read1_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd76799+32'd1) begin//d76799
              chip7_read1_en3 <= 1'b0;
              chip7_read1_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd75775+32'd1) begin//d75775
              chip7_read1_en2 <= 1'b0;
              chip7_read1_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd74751+32'd1) begin//d74751
              chip7_read1_en1 <= 1'b0;
              chip7_read1_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd73727+32'd1) begin//d73727
              chip6_read1_en12 <= 1'b0;
              chip7_read1_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd72703+32'd1) begin//d72703
              chip6_read1_en11 <= 1'b0;
              chip6_read1_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd71679+32'd1) begin//d71679
              chip6_read1_en10 <= 1'b0;
              chip6_read1_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd70655+32'd1) begin//d70655
              chip6_read1_en9 <= 1'b0;
              chip6_read1_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd69631+32'd1) begin//d69631
              chip6_read1_en8 <= 1'b0;
              chip6_read1_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd68607+32'd1) begin//d68607
              chip6_read1_en7 <= 1'b0;
              chip6_read1_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd67583+32'd1) begin//d67583
              chip6_read1_en6 <= 1'b0;
              chip6_read1_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd66559+32'd1) begin//d66559
              chip6_read1_en5 <= 1'b0;
              chip6_read1_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd65535+32'd1) begin//d65535
              chip6_read1_en4 <= 1'b0;
              chip6_read1_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd64511+32'd1) begin//d64511
              chip6_read1_en3 <= 1'b0;
              chip6_read1_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd63487+32'd1) begin//d63487
              chip6_read1_en2 <= 1'b0;
              chip6_read1_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd62463+32'd1) begin//d62463
              chip6_read1_en1 <= 1'b0;
              chip6_read1_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd61439+32'd1) begin//d61439
              chip5_read1_en12 <= 1'b0;
              chip6_read1_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd60415+32'd1) begin//d60415
              chip5_read1_en11 <= 1'b0;
              chip5_read1_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd59391+32'd1) begin//d59391
              chip5_read1_en10 <= 1'b0;
              chip5_read1_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd58367+32'd1) begin//d58367
              chip5_read1_en9 <= 1'b0;
              chip5_read1_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd57343+32'd1) begin//d57343
              chip5_read1_en8 <= 1'b0;
              chip5_read1_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd56319+32'd1) begin//d56319
              chip5_read1_en7 <= 1'b0;
              chip5_read1_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd55295+32'd1) begin//d55295
              chip5_read1_en6 <= 1'b0;
              chip5_read1_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd54271+32'd1) begin//d54271
              chip5_read1_en5 <= 1'b0;
              chip5_read1_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd53247+32'd1) begin//d53247
              chip5_read1_en4 <= 1'b0;
              chip5_read1_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd52223+32'd1) begin//d52223
              chip5_read1_en3 <= 1'b0;
              chip5_read1_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd51199+32'd1) begin//d51199
              chip5_read1_en2 <= 1'b0;
              chip5_read1_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd50175+32'd1) begin//d50175
              chip5_read1_en1 <= 1'b0;
              chip5_read1_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd49151+32'd1) begin//d49151
              chip4_read1_en12 <= 1'b0;
              chip5_read1_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end  
            else if (RE_START&&read_cnt[31:0]==32'd48127+32'd1) begin//d48127
              chip4_read1_en11 <= 1'b0;
              chip4_read1_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd47103+32'd1) begin//d47103
              chip4_read1_en10 <= 1'b0;
              chip4_read1_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd46079+32'd1) begin//d46079
              chip4_read1_en9 <= 1'b0;
              chip4_read1_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd45055+32'd1) begin//d45055
              chip4_read1_en8 <= 1'b0;
              chip4_read1_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd44031+32'd1) begin//d44031
              chip4_read1_en7 <= 1'b0;
              chip4_read1_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd43007+32'd1) begin//d43007
              chip4_read1_en6 <= 1'b0;
              chip4_read1_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd41983+32'd1) begin//d41983
              chip4_read1_en5 <= 1'b0;
              chip4_read1_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd40959+32'd1) begin//d40959
              chip4_read1_en4 <= 1'b0;
              chip4_read1_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd39935+32'd1) begin//d39935
              chip4_read1_en3 <= 1'b0;
              chip4_read1_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd38911+32'd1) begin//d38911
              chip4_read1_en2 <= 1'b0;
              chip4_read1_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd37887+32'd1) begin//d37887
              chip4_read1_en1 <= 1'b0;
              chip4_read1_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd36863+32'd1) begin//d36863
              chip3_read1_en12 <= 1'b0;
              chip4_read1_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd35839+32'd1) begin//d35839
              chip3_read1_en11 <= 1'b0;
              chip3_read1_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd34815+32'd1) begin//d34815
              chip3_read1_en10 <= 1'b0;
              chip3_read1_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd33791+32'd1) begin//d33791
              chip3_read1_en9 <= 1'b0;
              chip3_read1_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd32767+32'd1) begin//d32767
              chip3_read1_en8 <= 1'b0;
              chip3_read1_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd31743+32'd1) begin//d31743
              chip3_read1_en7 <= 1'b0;
              chip3_read1_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd30719+32'd1) begin//d30719
              chip3_read1_en6 <= 1'b0;
              chip3_read1_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd29695+32'd1) begin//d29695
              chip3_read1_en5 <= 1'b0;
              chip3_read1_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd28671+32'd1) begin//d28671
              chip3_read1_en4 <= 1'b0;
              chip3_read1_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd27647+32'd1) begin//d27647
              chip3_read1_en3 <= 1'b0;
              chip3_read1_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd26623+32'd1) begin//d26623
              chip3_read1_en2 <= 1'b0;
              chip3_read1_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd25599+32'd1) begin//d25599
              chip3_read1_en1 <= 1'b0;
              chip3_read1_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd24575+32'd1) begin//d24575
              chip2_read1_en12 <= 1'b0;
              chip3_read1_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd23551+32'd1) begin//d23551
              chip2_read1_en11 <= 1'b0;
              chip2_read1_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd22527+32'd1) begin//d22527
              chip2_read1_en10 <= 1'b0;
              chip2_read1_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd21503+32'd1) begin//d21503
              chip2_read1_en9 <= 1'b0;
              chip2_read1_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd20479+32'd1) begin//d20479
              chip2_read1_en8 <= 1'b0;
              chip2_read1_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd19455+32'd1) begin//d19455
              chip2_read1_en7 <= 1'b0;
              chip2_read1_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd18431+32'd1) begin//d18431
              chip2_read1_en6 <= 1'b0;
              chip2_read1_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd17407+32'd1) begin//d17407
              chip2_read1_en5 <= 1'b0;
              chip2_read1_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd16383+32'd1) begin//d16383
              chip2_read1_en4 <= 1'b0;
              chip2_read1_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd15359+32'd1) begin//d15359
              chip2_read1_en3 <= 1'b0;
              chip2_read1_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd14335+32'd1) begin//d14335
              chip2_read1_en2 <= 1'b0;
              chip2_read1_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd13311+32'd1) begin//d13311
              chip2_read1_en1 <= 1'b0;
              chip2_read1_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd12287+32'd1) begin//d12287
              chip1_read1_en12 <= 1'b0;
              chip2_read1_en1 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end 
            else if (RE_START&&read_cnt[31:0]==32'd11263+32'd1) begin//d11263
              chip1_read1_en11 <= 1'b0;
              chip1_read1_en12 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd10239+32'd1) begin//d10239
              chip1_read1_en10 <= 1'b0;
              chip1_read1_en11 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd9215+32'd1) begin//d9215
              chip1_read1_en9 <= 1'b0;
              chip1_read1_en10 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd8191+32'd1) begin////8191
              chip1_read1_en8 <= 1'b0;
              chip1_read1_en9 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            

            else if (RE_START&&read_cnt[31:0]==32'd7167+32'd1) begin////7167
              chip1_read1_en7 <= 1'b0;
              chip1_read1_en8 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd6143+32'd1) begin////6143
              chip1_read1_en6 <= 1'b0;
              chip1_read1_en7 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd5119+32'd1) begin////5119
              chip1_read1_en5 <= 1'b0;
              chip1_read1_en6 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd4095+32'd1) begin////4095
              chip1_read1_en4 <= 1'b0;
              chip1_read1_en5 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd3071+32'd1) begin////3071
              chip1_read1_en3 <= 1'b0;
              chip1_read1_en4 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end            
            else if (RE_START&&read_cnt[31:0]==32'd2047+32'd1) begin// //2047
              chip1_read1_en2 <= 1'b0;
              chip1_read1_en3 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end
            else if (RE_START&&read_cnt[31:0]==32'd1023+32'd1) begin// //1023
              chip1_read1_en1 <= 1'b0;
              chip1_read1_en2 <= 1'b1;
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end             
            else if (RE_START) begin//
              read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
            end           
            else begin//
              readx_end <= 1'b0;
              chip1_read1_en1  <= chip1_read1_en1;
              chip1_read1_en2  <= chip1_read1_en2;
              chip1_read1_en3  <= chip1_read1_en3;
              chip1_read1_en4  <= chip1_read1_en4;
              chip1_read1_en5  <= chip1_read1_en5;
              chip1_read1_en6  <= chip1_read1_en6;
              chip1_read1_en7  <= chip1_read1_en7;
              chip1_read1_en8  <= chip1_read1_en8;
              chip1_read1_en9  <= chip1_read1_en9;
              chip1_read1_en10 <= chip1_read1_en10;
              chip1_read1_en11 <= chip1_read1_en11;
              chip1_read1_en12 <= chip1_read1_en12;
              chip1_read2_en1  <= chip1_read2_en1;
              chip1_read2_en2  <= chip1_read2_en2;
              chip1_read2_en3  <= chip1_read2_en3;
              chip1_read2_en4  <= chip1_read2_en4;
              chip1_read2_en5  <= chip1_read2_en5;
              chip1_read2_en6  <= chip1_read2_en6;
              chip1_read2_en7  <= chip1_read2_en7;
              chip1_read2_en8  <= chip1_read2_en8;
              chip1_read2_en9  <= chip1_read2_en9;
              chip1_read2_en10 <= chip1_read2_en10;
              chip1_read2_en11 <= chip1_read2_en11;
              chip1_read2_en12 <= chip1_read2_en12;


              chip2_read1_en1  <= chip2_read1_en1;
              chip2_read1_en2  <= chip2_read1_en2;
              chip2_read1_en3  <= chip2_read1_en3;
              chip2_read1_en4  <= chip2_read1_en4;
              chip2_read1_en5  <= chip2_read1_en5;
              chip2_read1_en6  <= chip2_read1_en6;
              chip2_read1_en7  <= chip2_read1_en7;
              chip2_read1_en8  <= chip2_read1_en8;
              chip2_read1_en9  <= chip2_read1_en9;
              chip2_read1_en10 <= chip2_read1_en10;
              chip2_read1_en11 <= chip2_read1_en11;
              chip2_read1_en12 <= chip2_read1_en12;
              chip2_read2_en1  <= chip2_read2_en1;
              chip2_read2_en2  <= chip2_read2_en2;
              chip2_read2_en3  <= chip2_read2_en3;
              chip2_read2_en4  <= chip2_read2_en4;
              chip2_read2_en5  <= chip2_read2_en5;
              chip2_read2_en6  <= chip2_read2_en6;
              chip2_read2_en7  <= chip2_read2_en7;
              chip2_read2_en8  <= chip2_read2_en8;
              chip2_read2_en9  <= chip2_read2_en9;
              chip2_read2_en10 <= chip2_read2_en10;
              chip2_read2_en11 <= chip2_read2_en11;
              chip2_read2_en12 <= chip2_read2_en12;


              chip3_read1_en1  <= chip3_read1_en1;
              chip3_read1_en2  <= chip3_read1_en2;
              chip3_read1_en3  <= chip3_read1_en3;
              chip3_read1_en4  <= chip3_read1_en4;
              chip3_read1_en5  <= chip3_read1_en5;
              chip3_read1_en6  <= chip3_read1_en6;
              chip3_read1_en7  <= chip3_read1_en7;
              chip3_read1_en8  <= chip3_read1_en8;
              chip3_read1_en9  <= chip3_read1_en9;
              chip3_read1_en10 <= chip3_read1_en10;
              chip3_read1_en11 <= chip3_read1_en11;
              chip3_read1_en12 <= chip3_read1_en12;
              chip3_read2_en1  <= chip3_read2_en1;
              chip3_read2_en2  <= chip3_read2_en2;
              chip3_read2_en3  <= chip3_read2_en3;
              chip3_read2_en4  <= chip3_read2_en4;
              chip3_read2_en5  <= chip3_read2_en5;
              chip3_read2_en6  <= chip3_read2_en6;
              chip3_read2_en7  <= chip3_read2_en7;
              chip3_read2_en8  <= chip3_read2_en8;
              chip3_read2_en9  <= chip3_read2_en9;
              chip3_read2_en10 <= chip3_read2_en10;
              chip3_read2_en11 <= chip3_read2_en11;
              chip3_read2_en12 <= chip3_read2_en12;


              chip4_read1_en1  <= chip4_read1_en1;
              chip4_read1_en2  <= chip4_read1_en2;
              chip4_read1_en3  <= chip4_read1_en3;
              chip4_read1_en4  <= chip4_read1_en4;
              chip4_read1_en5  <= chip4_read1_en5;
              chip4_read1_en6  <= chip4_read1_en6;
              chip4_read1_en7  <= chip4_read1_en7;
              chip4_read1_en8  <= chip4_read1_en8;
              chip4_read1_en9  <= chip4_read1_en9;
              chip4_read1_en10 <= chip4_read1_en10;
              chip4_read1_en11 <= chip4_read1_en11;
              chip4_read1_en12 <= chip4_read1_en12;
              chip4_read2_en1  <= chip4_read2_en1;
              chip4_read2_en2  <= chip4_read2_en2;
              chip4_read2_en3  <= chip4_read2_en3;
              chip4_read2_en4  <= chip4_read2_en4;
              chip4_read2_en5  <= chip4_read2_en5;
              chip4_read2_en6  <= chip4_read2_en6;
              chip4_read2_en7  <= chip4_read2_en7;
              chip4_read2_en8  <= chip4_read2_en8;
              chip4_read2_en9  <= chip4_read2_en9;
              chip4_read2_en10 <= chip4_read2_en10;
              chip4_read2_en11 <= chip4_read2_en11;
              chip4_read2_en12 <= chip4_read2_en12;



              chip5_read1_en1  <= chip5_read1_en1;
              chip5_read1_en2  <= chip5_read1_en2;
              chip5_read1_en3  <= chip5_read1_en3;
              chip5_read1_en4  <= chip5_read1_en4;
              chip5_read1_en5  <= chip5_read1_en5;
              chip5_read1_en6  <= chip5_read1_en6;
              chip5_read1_en7  <= chip5_read1_en7;
              chip5_read1_en8  <= chip5_read1_en8;
              chip5_read1_en9  <= chip5_read1_en9;
              chip5_read1_en10 <= chip5_read1_en10;
              chip5_read1_en11 <= chip5_read1_en11;
              chip5_read1_en12 <= chip5_read1_en12;
              chip5_read2_en1  <= chip5_read2_en1;
              chip5_read2_en2  <= chip5_read2_en2;
              chip5_read2_en3  <= chip5_read2_en3;
              chip5_read2_en4  <= chip5_read2_en4;
              chip5_read2_en5  <= chip5_read2_en5;
              chip5_read2_en6  <= chip5_read2_en6;
              chip5_read2_en7  <= chip5_read2_en7;
              chip5_read2_en8  <= chip5_read2_en8;
              chip5_read2_en9  <= chip5_read2_en9;
              chip5_read2_en10 <= chip5_read2_en10;
              chip5_read2_en11 <= chip5_read2_en11;
              chip5_read2_en12 <= chip5_read2_en12;


              chip6_read1_en1  <= chip6_read1_en1;
              chip6_read1_en2  <= chip6_read1_en2;
              chip6_read1_en3  <= chip6_read1_en3;
              chip6_read1_en4  <= chip6_read1_en4;
              chip6_read1_en5  <= chip6_read1_en5;
              chip6_read1_en6  <= chip6_read1_en6;
              chip6_read1_en7  <= chip6_read1_en7;
              chip6_read1_en8  <= chip6_read1_en8;
              chip6_read1_en9  <= chip6_read1_en9;
              chip6_read1_en10 <= chip6_read1_en10;
              chip6_read1_en11 <= chip6_read1_en11;
              chip6_read1_en12 <= chip6_read1_en12;
              chip6_read2_en1  <= chip6_read2_en1;
              chip6_read2_en2  <= chip6_read2_en2;
              chip6_read2_en3  <= chip6_read2_en3;
              chip6_read2_en4  <= chip6_read2_en4;
              chip6_read2_en5  <= chip6_read2_en5;
              chip6_read2_en6  <= chip6_read2_en6;
              chip6_read2_en7  <= chip6_read2_en7;
              chip6_read2_en8  <= chip6_read2_en8;
              chip6_read2_en9  <= chip6_read2_en9;
              chip6_read2_en10 <= chip6_read2_en10;
              chip6_read2_en11 <= chip6_read2_en11;
              chip6_read2_en12 <= chip6_read2_en12;


              chip7_read1_en1  <= chip7_read1_en1;
              chip7_read1_en2  <= chip7_read1_en2;
              chip7_read1_en3  <= chip7_read1_en3;
              chip7_read1_en4  <= chip7_read1_en4;
              chip7_read1_en5  <= chip7_read1_en5;
              chip7_read1_en6  <= chip7_read1_en6;
              chip7_read1_en7  <= chip7_read1_en7;
              chip7_read1_en8  <= chip7_read1_en8;
              chip7_read1_en9  <= chip7_read1_en9;
              chip7_read1_en10 <= chip7_read1_en10;
              chip7_read1_en11 <= chip7_read1_en11;
              chip7_read1_en12 <= chip7_read1_en12;
              chip7_read2_en1  <= chip7_read2_en1;
              chip7_read2_en2  <= chip7_read2_en2;
              chip7_read2_en3  <= chip7_read2_en3;
              chip7_read2_en4  <= chip7_read2_en4;
              chip7_read2_en5  <= chip7_read2_en5;
              chip7_read2_en6  <= chip7_read2_en6;
              chip7_read2_en7  <= chip7_read2_en7;
              chip7_read2_en8  <= chip7_read2_en8;
              chip7_read2_en9  <= chip7_read2_en9;
              chip7_read2_en10 <= chip7_read2_en10;
              chip7_read2_en11 <= chip7_read2_en11;
              chip7_read2_en12 <= chip7_read2_en12;



              chip8_read1_en1  <= chip8_read1_en1;
              chip8_read1_en2  <= chip8_read1_en2;
              chip8_read1_en3  <= chip8_read1_en3;
              chip8_read1_en4  <= chip8_read1_en4;
              chip8_read1_en5  <= chip8_read1_en5;
              chip8_read1_en6  <= chip8_read1_en6;
              chip8_read1_en7  <= chip8_read1_en7;
              chip8_read1_en8  <= chip8_read1_en8;
              chip8_read1_en9  <= chip8_read1_en9;
              chip8_read1_en10 <= chip8_read1_en10;
              chip8_read1_en11 <= chip8_read1_en11;
              chip8_read1_en12 <= chip8_read1_en12;
              chip8_read2_en1  <= chip8_read2_en1;
              chip8_read2_en2  <= chip8_read2_en2;
              chip8_read2_en3  <= chip8_read2_en3;
              chip8_read2_en4  <= chip8_read2_en4;
              chip8_read2_en5  <= chip8_read2_en5;
              chip8_read2_en6  <= chip8_read2_en6;
              chip8_read2_en7  <= chip8_read2_en7;
              chip8_read2_en8  <= chip8_read2_en8;
              chip8_read2_en9  <= chip8_read2_en9;
              chip8_read2_en10 <= chip8_read2_en10;
              chip8_read2_en11 <= chip8_read2_en11;
              chip8_read2_en12 <= chip8_read2_en12;



              chip9_read1_en1  <= chip9_read1_en1;
              chip9_read1_en2  <= chip9_read1_en2;
              chip9_read1_en3  <= chip9_read1_en3;
              chip9_read1_en4  <= chip9_read1_en4;
              chip9_read1_en5  <= chip9_read1_en5;
              chip9_read1_en6  <= chip9_read1_en6;
              chip9_read1_en7  <= chip9_read1_en7;
              chip9_read1_en8  <= chip9_read1_en8;
              chip9_read1_en9  <= chip9_read1_en9;
              chip9_read1_en10 <= chip9_read1_en10;
              chip9_read1_en11 <= chip9_read1_en11;
              chip9_read1_en12 <= chip9_read1_en12;
              chip9_read2_en1  <= chip9_read2_en1;
              chip9_read2_en2  <= chip9_read2_en2;
              chip9_read2_en3  <= chip9_read2_en3;
              chip9_read2_en4  <= chip9_read2_en4;
              chip9_read2_en5  <= chip9_read2_en5;
              chip9_read2_en6  <= chip9_read2_en6;
              chip9_read2_en7  <= chip9_read2_en7;
              chip9_read2_en8  <= chip9_read2_en8;
              chip9_read2_en9  <= chip9_read2_en9;
              chip9_read2_en10 <= chip9_read2_en10;
              chip9_read2_en11 <= chip9_read2_en11;
              chip9_read2_en12 <= chip9_read2_en12;



              chip10_read1_en1  <= chip10_read1_en1;
              chip10_read1_en2  <= chip10_read1_en2;
              chip10_read1_en3  <= chip10_read1_en3;
              chip10_read1_en4  <= chip10_read1_en4;
              chip10_read1_en5  <= chip10_read1_en5;
              chip10_read1_en6  <= chip10_read1_en6;
              chip10_read1_en7  <= chip10_read1_en7;
              chip10_read1_en8  <= chip10_read1_en8;
              chip10_read1_en9  <= chip10_read1_en9;
              chip10_read1_en10 <= chip10_read1_en10;
              chip10_read1_en11 <= chip10_read1_en11;
              chip10_read1_en12 <= chip10_read1_en12;
              chip10_read2_en1  <= chip10_read2_en1;
              chip10_read2_en2  <= chip10_read2_en2;
              chip10_read2_en3  <= chip10_read2_en3;
              chip10_read2_en4  <= chip10_read2_en4;
              chip10_read2_en5  <= chip10_read2_en5;
              chip10_read2_en6  <= chip10_read2_en6;
              chip10_read2_en7  <= chip10_read2_en7;
              chip10_read2_en8  <= chip10_read2_en8;
              chip10_read2_en9  <= chip10_read2_en9;
              chip10_read2_en10 <= chip10_read2_en10;
              chip10_read2_en11 <= chip10_read2_en11;
              chip10_read2_en12 <= chip10_read2_en12;



              chip11_read1_en1  <= chip11_read1_en1;
              chip11_read1_en2  <= chip11_read1_en2;
              chip11_read1_en3  <= chip11_read1_en3;
              chip11_read1_en4  <= chip11_read1_en4;
              chip11_read1_en5  <= chip11_read1_en5;
              chip11_read1_en6  <= chip11_read1_en6;
              chip11_read1_en7  <= chip11_read1_en7;
              chip11_read1_en8  <= chip11_read1_en8;
              chip11_read1_en9  <= chip11_read1_en9;
              chip11_read1_en10 <= chip11_read1_en10;
              chip11_read1_en11 <= chip11_read1_en11;
              chip11_read1_en12 <= chip11_read1_en12;
              chip11_read2_en1  <= chip11_read2_en1;
              chip11_read2_en2  <= chip11_read2_en2;
              chip11_read2_en3  <= chip11_read2_en3;
              chip11_read2_en4  <= chip11_read2_en4;
              chip11_read2_en5  <= chip11_read2_en5;
              chip11_read2_en6  <= chip11_read2_en6;
              chip11_read2_en7  <= chip11_read2_en7;
              chip11_read2_en8  <= chip11_read2_en8;
              chip11_read2_en9  <= chip11_read2_en9;
              chip11_read2_en10 <= chip11_read2_en10;
              chip11_read2_en11 <= chip11_read2_en11;
              chip11_read2_en12 <= chip11_read2_en12;




              chip12_read1_en1  <= chip12_read1_en1;
              chip12_read1_en2  <= chip12_read1_en2;
              chip12_read1_en3  <= chip12_read1_en3;
              chip12_read1_en4  <= chip12_read1_en4;
              chip12_read1_en5  <= chip12_read1_en5;
              chip12_read1_en6  <= chip12_read1_en6;
              chip12_read1_en7  <= chip12_read1_en7;
              chip12_read1_en8  <= chip12_read1_en8;
              chip12_read1_en9  <= chip12_read1_en9;
              chip12_read1_en10 <= chip12_read1_en10;
              chip12_read1_en11 <= chip12_read1_en11;
              chip12_read1_en12 <= chip12_read1_en12;
              chip12_read2_en1  <= chip12_read2_en1;
              chip12_read2_en2  <= chip12_read2_en2;
              chip12_read2_en3  <= chip12_read2_en3;
              chip12_read2_en4  <= chip12_read2_en4;
              chip12_read2_en5  <= chip12_read2_en5;
              chip12_read2_en6  <= chip12_read2_en6;
              chip12_read2_en7  <= chip12_read2_en7;
              chip12_read2_en8  <= chip12_read2_en8;
              chip12_read2_en9  <= chip12_read2_en9;
              chip12_read2_en10 <= chip12_read2_en10;
              chip12_read2_en11 <= chip12_read2_en11;
              chip12_read2_en12 <= chip12_read2_en12;              



              read_cnt[31:0]<= 32'b0;  
            end
end


wire          FIFO_EN;
reg  [15:0]   RAM2FIFO;
reg  [9:0]   CHIP1_ADDR1_1;
reg  [9:0]   CHIP1_ADDR1_2;
reg  [9:0]   CHIP1_ADDR1_3;
reg  [9:0]   CHIP1_ADDR1_4;
reg  [9:0]   CHIP1_ADDR1_5;
reg  [9:0]   CHIP1_ADDR1_6;
reg  [9:0]   CHIP1_ADDR1_7;
reg  [9:0]   CHIP1_ADDR1_8;
reg  [9:0]   CHIP1_ADDR1_9;
reg  [9:0]   CHIP1_ADDR1_10;
reg  [9:0]   CHIP1_ADDR1_11;
reg  [9:0]   CHIP1_ADDR1_12;

reg  [9:0]   CHIP1_ADDR2_1;
reg  [9:0]   CHIP1_ADDR2_2;
reg  [9:0]   CHIP1_ADDR2_3;
reg  [9:0]   CHIP1_ADDR2_4;
reg  [9:0]   CHIP1_ADDR2_5;
reg  [9:0]   CHIP1_ADDR2_6;
reg  [9:0]   CHIP1_ADDR2_7;
reg  [9:0]   CHIP1_ADDR2_8;
reg  [9:0]   CHIP1_ADDR2_9;
reg  [9:0]   CHIP1_ADDR2_10;
reg  [9:0]   CHIP1_ADDR2_11;
reg  [9:0]   CHIP1_ADDR2_12;

reg  [9:0]   CHIP2_ADDR1_1;
reg  [9:0]   CHIP2_ADDR1_2;
reg  [9:0]   CHIP2_ADDR1_3;
reg  [9:0]   CHIP2_ADDR1_4;
reg  [9:0]   CHIP2_ADDR1_5;
reg  [9:0]   CHIP2_ADDR1_6;
reg  [9:0]   CHIP2_ADDR1_7;
reg  [9:0]   CHIP2_ADDR1_8;
reg  [9:0]   CHIP2_ADDR1_9;
reg  [9:0]   CHIP2_ADDR1_10;
reg  [9:0]   CHIP2_ADDR1_11;
reg  [9:0]   CHIP2_ADDR1_12;

reg  [9:0]   CHIP2_ADDR2_1;
reg  [9:0]   CHIP2_ADDR2_2;
reg  [9:0]   CHIP2_ADDR2_3;
reg  [9:0]   CHIP2_ADDR2_4;
reg  [9:0]   CHIP2_ADDR2_5;
reg  [9:0]   CHIP2_ADDR2_6;
reg  [9:0]   CHIP2_ADDR2_7;
reg  [9:0]   CHIP2_ADDR2_8;
reg  [9:0]   CHIP2_ADDR2_9;
reg  [9:0]   CHIP2_ADDR2_10;
reg  [9:0]   CHIP2_ADDR2_11;
reg  [9:0]   CHIP2_ADDR2_12;

reg  [9:0]   CHIP3_ADDR1_1;
reg  [9:0]   CHIP3_ADDR1_2;
reg  [9:0]   CHIP3_ADDR1_3;
reg  [9:0]   CHIP3_ADDR1_4;
reg  [9:0]   CHIP3_ADDR1_5;
reg  [9:0]   CHIP3_ADDR1_6;
reg  [9:0]   CHIP3_ADDR1_7;
reg  [9:0]   CHIP3_ADDR1_8;
reg  [9:0]   CHIP3_ADDR1_9;
reg  [9:0]   CHIP3_ADDR1_10;
reg  [9:0]   CHIP3_ADDR1_11;
reg  [9:0]   CHIP3_ADDR1_12;

reg  [9:0]   CHIP3_ADDR2_1;
reg  [9:0]   CHIP3_ADDR2_2;
reg  [9:0]   CHIP3_ADDR2_3;
reg  [9:0]   CHIP3_ADDR2_4;
reg  [9:0]   CHIP3_ADDR2_5;
reg  [9:0]   CHIP3_ADDR2_6;
reg  [9:0]   CHIP3_ADDR2_7;
reg  [9:0]   CHIP3_ADDR2_8;
reg  [9:0]   CHIP3_ADDR2_9;
reg  [9:0]   CHIP3_ADDR2_10;
reg  [9:0]   CHIP3_ADDR2_11;
reg  [9:0]   CHIP3_ADDR2_12;


reg  [9:0]   CHIP4_ADDR1_1;
reg  [9:0]   CHIP4_ADDR1_2;
reg  [9:0]   CHIP4_ADDR1_3;
reg  [9:0]   CHIP4_ADDR1_4;
reg  [9:0]   CHIP4_ADDR1_5;
reg  [9:0]   CHIP4_ADDR1_6;
reg  [9:0]   CHIP4_ADDR1_7;
reg  [9:0]   CHIP4_ADDR1_8;
reg  [9:0]   CHIP4_ADDR1_9;
reg  [9:0]   CHIP4_ADDR1_10;
reg  [9:0]   CHIP4_ADDR1_11;
reg  [9:0]   CHIP4_ADDR1_12;
reg  [9:0]   CHIP4_ADDR2_1;
reg  [9:0]   CHIP4_ADDR2_2;
reg  [9:0]   CHIP4_ADDR2_3;
reg  [9:0]   CHIP4_ADDR2_4;
reg  [9:0]   CHIP4_ADDR2_5;
reg  [9:0]   CHIP4_ADDR2_6;
reg  [9:0]   CHIP4_ADDR2_7;
reg  [9:0]   CHIP4_ADDR2_8;
reg  [9:0]   CHIP4_ADDR2_9;
reg  [9:0]   CHIP4_ADDR2_10;
reg  [9:0]   CHIP4_ADDR2_11;
reg  [9:0]   CHIP4_ADDR2_12;



reg  [9:0]   CHIP5_ADDR1_1;
reg  [9:0]   CHIP5_ADDR1_2;
reg  [9:0]   CHIP5_ADDR1_3;
reg  [9:0]   CHIP5_ADDR1_4;
reg  [9:0]   CHIP5_ADDR1_5;
reg  [9:0]   CHIP5_ADDR1_6;
reg  [9:0]   CHIP5_ADDR1_7;
reg  [9:0]   CHIP5_ADDR1_8;
reg  [9:0]   CHIP5_ADDR1_9;
reg  [9:0]   CHIP5_ADDR1_10;
reg  [9:0]   CHIP5_ADDR1_11;
reg  [9:0]   CHIP5_ADDR1_12;
reg  [9:0]   CHIP5_ADDR2_1;
reg  [9:0]   CHIP5_ADDR2_2;
reg  [9:0]   CHIP5_ADDR2_3;
reg  [9:0]   CHIP5_ADDR2_4;
reg  [9:0]   CHIP5_ADDR2_5;
reg  [9:0]   CHIP5_ADDR2_6;
reg  [9:0]   CHIP5_ADDR2_7;
reg  [9:0]   CHIP5_ADDR2_8;
reg  [9:0]   CHIP5_ADDR2_9;
reg  [9:0]   CHIP5_ADDR2_10;
reg  [9:0]   CHIP5_ADDR2_11;
reg  [9:0]   CHIP5_ADDR2_12;

reg  [9:0]   CHIP6_ADDR1_1;
reg  [9:0]   CHIP6_ADDR1_2;
reg  [9:0]   CHIP6_ADDR1_3;
reg  [9:0]   CHIP6_ADDR1_4;
reg  [9:0]   CHIP6_ADDR1_5;
reg  [9:0]   CHIP6_ADDR1_6;
reg  [9:0]   CHIP6_ADDR1_7;
reg  [9:0]   CHIP6_ADDR1_8;
reg  [9:0]   CHIP6_ADDR1_9;
reg  [9:0]   CHIP6_ADDR1_10;
reg  [9:0]   CHIP6_ADDR1_11;
reg  [9:0]   CHIP6_ADDR1_12;
reg  [9:0]   CHIP6_ADDR2_1;
reg  [9:0]   CHIP6_ADDR2_2;
reg  [9:0]   CHIP6_ADDR2_3;
reg  [9:0]   CHIP6_ADDR2_4;
reg  [9:0]   CHIP6_ADDR2_5;
reg  [9:0]   CHIP6_ADDR2_6;
reg  [9:0]   CHIP6_ADDR2_7;
reg  [9:0]   CHIP6_ADDR2_8;
reg  [9:0]   CHIP6_ADDR2_9;
reg  [9:0]   CHIP6_ADDR2_10;
reg  [9:0]   CHIP6_ADDR2_11;
reg  [9:0]   CHIP6_ADDR2_12;


reg  [9:0]   CHIP7_ADDR1_1;
reg  [9:0]   CHIP7_ADDR1_2;
reg  [9:0]   CHIP7_ADDR1_3;
reg  [9:0]   CHIP7_ADDR1_4;
reg  [9:0]   CHIP7_ADDR1_5;
reg  [9:0]   CHIP7_ADDR1_6;
reg  [9:0]   CHIP7_ADDR1_7;
reg  [9:0]   CHIP7_ADDR1_8;
reg  [9:0]   CHIP7_ADDR1_9;
reg  [9:0]   CHIP7_ADDR1_10;
reg  [9:0]   CHIP7_ADDR1_11;
reg  [9:0]   CHIP7_ADDR1_12;
reg  [9:0]   CHIP7_ADDR2_1;
reg  [9:0]   CHIP7_ADDR2_2;
reg  [9:0]   CHIP7_ADDR2_3;
reg  [9:0]   CHIP7_ADDR2_4;
reg  [9:0]   CHIP7_ADDR2_5;
reg  [9:0]   CHIP7_ADDR2_6;
reg  [9:0]   CHIP7_ADDR2_7;
reg  [9:0]   CHIP7_ADDR2_8;
reg  [9:0]   CHIP7_ADDR2_9;
reg  [9:0]   CHIP7_ADDR2_10;
reg  [9:0]   CHIP7_ADDR2_11;
reg  [9:0]   CHIP7_ADDR2_12;

reg  [9:0]   CHIP8_ADDR1_1;
reg  [9:0]   CHIP8_ADDR1_2;
reg  [9:0]   CHIP8_ADDR1_3;
reg  [9:0]   CHIP8_ADDR1_4;
reg  [9:0]   CHIP8_ADDR1_5;
reg  [9:0]   CHIP8_ADDR1_6;
reg  [9:0]   CHIP8_ADDR1_7;
reg  [9:0]   CHIP8_ADDR1_8;
reg  [9:0]   CHIP8_ADDR1_9;
reg  [9:0]   CHIP8_ADDR1_10;
reg  [9:0]   CHIP8_ADDR1_11;
reg  [9:0]   CHIP8_ADDR1_12;
reg  [9:0]   CHIP8_ADDR2_1;
reg  [9:0]   CHIP8_ADDR2_2;
reg  [9:0]   CHIP8_ADDR2_3;
reg  [9:0]   CHIP8_ADDR2_4;
reg  [9:0]   CHIP8_ADDR2_5;
reg  [9:0]   CHIP8_ADDR2_6;
reg  [9:0]   CHIP8_ADDR2_7;
reg  [9:0]   CHIP8_ADDR2_8;
reg  [9:0]   CHIP8_ADDR2_9;
reg  [9:0]   CHIP8_ADDR2_10;
reg  [9:0]   CHIP8_ADDR2_11;
reg  [9:0]   CHIP8_ADDR2_12;

reg  [9:0]   CHIP9_ADDR1_1;
reg  [9:0]   CHIP9_ADDR1_2;
reg  [9:0]   CHIP9_ADDR1_3;
reg  [9:0]   CHIP9_ADDR1_4;
reg  [9:0]   CHIP9_ADDR1_5;
reg  [9:0]   CHIP9_ADDR1_6;
reg  [9:0]   CHIP9_ADDR1_7;
reg  [9:0]   CHIP9_ADDR1_8;
reg  [9:0]   CHIP9_ADDR1_9;
reg  [9:0]   CHIP9_ADDR1_10;
reg  [9:0]   CHIP9_ADDR1_11;
reg  [9:0]   CHIP9_ADDR1_12;
reg  [9:0]   CHIP9_ADDR2_1;
reg  [9:0]   CHIP9_ADDR2_2;
reg  [9:0]   CHIP9_ADDR2_3;
reg  [9:0]   CHIP9_ADDR2_4;
reg  [9:0]   CHIP9_ADDR2_5;
reg  [9:0]   CHIP9_ADDR2_6;
reg  [9:0]   CHIP9_ADDR2_7;
reg  [9:0]   CHIP9_ADDR2_8;
reg  [9:0]   CHIP9_ADDR2_9;
reg  [9:0]   CHIP9_ADDR2_10;
reg  [9:0]   CHIP9_ADDR2_11;
reg  [9:0]   CHIP9_ADDR2_12;

reg  [9:0]   CHIP10_ADDR1_1;
reg  [9:0]   CHIP10_ADDR1_2;
reg  [9:0]   CHIP10_ADDR1_3;
reg  [9:0]   CHIP10_ADDR1_4;
reg  [9:0]   CHIP10_ADDR1_5;
reg  [9:0]   CHIP10_ADDR1_6;
reg  [9:0]   CHIP10_ADDR1_7;
reg  [9:0]   CHIP10_ADDR1_8;
reg  [9:0]   CHIP10_ADDR1_9;
reg  [9:0]   CHIP10_ADDR1_10;
reg  [9:0]   CHIP10_ADDR1_11;
reg  [9:0]   CHIP10_ADDR1_12;
reg  [9:0]   CHIP10_ADDR2_1;
reg  [9:0]   CHIP10_ADDR2_2;
reg  [9:0]   CHIP10_ADDR2_3;
reg  [9:0]   CHIP10_ADDR2_4;
reg  [9:0]   CHIP10_ADDR2_5;
reg  [9:0]   CHIP10_ADDR2_6;
reg  [9:0]   CHIP10_ADDR2_7;
reg  [9:0]   CHIP10_ADDR2_8;
reg  [9:0]   CHIP10_ADDR2_9;
reg  [9:0]   CHIP10_ADDR2_10;
reg  [9:0]   CHIP10_ADDR2_11;
reg  [9:0]   CHIP10_ADDR2_12;

reg  [9:0]   CHIP11_ADDR1_1;
reg  [9:0]   CHIP11_ADDR1_2;
reg  [9:0]   CHIP11_ADDR1_3;
reg  [9:0]   CHIP11_ADDR1_4;
reg  [9:0]   CHIP11_ADDR1_5;
reg  [9:0]   CHIP11_ADDR1_6;
reg  [9:0]   CHIP11_ADDR1_7;
reg  [9:0]   CHIP11_ADDR1_8;
reg  [9:0]   CHIP11_ADDR1_9;
reg  [9:0]   CHIP11_ADDR1_10;
reg  [9:0]   CHIP11_ADDR1_11;
reg  [9:0]   CHIP11_ADDR1_12;
reg  [9:0]   CHIP11_ADDR2_1;
reg  [9:0]   CHIP11_ADDR2_2;
reg  [9:0]   CHIP11_ADDR2_3;
reg  [9:0]   CHIP11_ADDR2_4;
reg  [9:0]   CHIP11_ADDR2_5;
reg  [9:0]   CHIP11_ADDR2_6;
reg  [9:0]   CHIP11_ADDR2_7;
reg  [9:0]   CHIP11_ADDR2_8;
reg  [9:0]   CHIP11_ADDR2_9;
reg  [9:0]   CHIP11_ADDR2_10;
reg  [9:0]   CHIP11_ADDR2_11;
reg  [9:0]   CHIP11_ADDR2_12;

reg  [9:0]   CHIP12_ADDR1_1;
reg  [9:0]   CHIP12_ADDR1_2;
reg  [9:0]   CHIP12_ADDR1_3;
reg  [9:0]   CHIP12_ADDR1_4;
reg  [9:0]   CHIP12_ADDR1_5;
reg  [9:0]   CHIP12_ADDR1_6;
reg  [9:0]   CHIP12_ADDR1_7;
reg  [9:0]   CHIP12_ADDR1_8;
reg  [9:0]   CHIP12_ADDR1_9;
reg  [9:0]   CHIP12_ADDR1_10;
reg  [9:0]   CHIP12_ADDR1_11;
reg  [9:0]   CHIP12_ADDR1_12;
reg  [9:0]   CHIP12_ADDR2_1;
reg  [9:0]   CHIP12_ADDR2_2;
reg  [9:0]   CHIP12_ADDR2_3;
reg  [9:0]   CHIP12_ADDR2_4;
reg  [9:0]   CHIP12_ADDR2_5;
reg  [9:0]   CHIP12_ADDR2_6;
reg  [9:0]   CHIP12_ADDR2_7;
reg  [9:0]   CHIP12_ADDR2_8;
reg  [9:0]   CHIP12_ADDR2_9;
reg  [9:0]   CHIP12_ADDR2_10;
reg  [9:0]   CHIP12_ADDR2_11;
reg  [9:0]   CHIP12_ADDR2_12;

// always @(posedge CLK_80M or posedge RST) begin//
//             if (RST) begin//
//               RAM2FIFO <= 32'b0;

//               CHIP1_ADDR1_1   <= 10'b0;
//               CHIP1_ADDR1_2   <= 10'b0;
//               CHIP1_ADDR1_3   <= 10'b0;
//               CHIP1_ADDR1_4   <= 10'b0;
//               CHIP1_ADDR1_5   <= 10'b0;
//               CHIP1_ADDR1_6   <= 10'b0;
//               CHIP1_ADDR1_7   <= 10'b0;
//               CHIP1_ADDR1_8   <= 10'b0;
//               CHIP1_ADDR1_9   <= 10'b0;
//               CHIP1_ADDR1_10  <= 10'b0;
//               CHIP1_ADDR1_11  <= 10'b0;
//               CHIP1_ADDR1_12  <= 10'b0;
//               CHIP1_ADDR2_1   <= 10'b0;
//               CHIP1_ADDR2_2   <= 10'b0;
//               CHIP1_ADDR2_3   <= 10'b0;
//               CHIP1_ADDR2_4   <= 10'b0;
//               CHIP1_ADDR2_5   <= 10'b0;
//               CHIP1_ADDR2_6   <= 10'b0;
//               CHIP1_ADDR2_7   <= 10'b0;
//               CHIP1_ADDR2_8   <= 10'b0;
//               CHIP1_ADDR2_9   <= 10'b0;
//               CHIP1_ADDR2_10  <= 10'b0;
//               CHIP1_ADDR2_11  <= 10'b0;
//               CHIP1_ADDR2_12  <= 10'b0;


//               CHIP2_ADDR1_1   <= 10'b0;
//               CHIP2_ADDR1_2   <= 10'b0;
//               CHIP2_ADDR1_3   <= 10'b0;
//               CHIP2_ADDR1_4   <= 10'b0;
//               CHIP2_ADDR1_5   <= 10'b0;
//               CHIP2_ADDR1_6   <= 10'b0;
//               CHIP2_ADDR1_7   <= 10'b0;
//               CHIP2_ADDR1_8   <= 10'b0;
//               CHIP2_ADDR1_9   <= 10'b0;
//               CHIP2_ADDR1_10  <= 10'b0;
//               CHIP2_ADDR1_11  <= 10'b0;
//               CHIP2_ADDR1_12  <= 10'b0;
//               CHIP2_ADDR2_1   <= 10'b0;
//               CHIP2_ADDR2_2   <= 10'b0;
//               CHIP2_ADDR2_3   <= 10'b0;
//               CHIP2_ADDR2_4   <= 10'b0;
//               CHIP2_ADDR2_5   <= 10'b0;
//               CHIP2_ADDR2_6   <= 10'b0;
//               CHIP2_ADDR2_7   <= 10'b0;
//               CHIP2_ADDR2_8   <= 10'b0;
//               CHIP2_ADDR2_9   <= 10'b0;
//               CHIP2_ADDR2_10  <= 10'b0;
//               CHIP2_ADDR2_11  <= 10'b0;
//               CHIP2_ADDR2_12  <= 10'b0;


//               CHIP3_ADDR1_1   <= 10'b0;
//               CHIP3_ADDR1_2   <= 10'b0;
//               CHIP3_ADDR1_3   <= 10'b0;
//               CHIP3_ADDR1_4   <= 10'b0;
//               CHIP3_ADDR1_5   <= 10'b0;
//               CHIP3_ADDR1_6   <= 10'b0;
//               CHIP3_ADDR1_7   <= 10'b0;
//               CHIP3_ADDR1_8   <= 10'b0;
//               CHIP3_ADDR1_9   <= 10'b0;
//               CHIP3_ADDR1_10  <= 10'b0;
//               CHIP3_ADDR1_11  <= 10'b0;
//               CHIP3_ADDR1_12  <= 10'b0;
//               CHIP3_ADDR2_1   <= 10'b0;
//               CHIP3_ADDR2_2   <= 10'b0;
//               CHIP3_ADDR2_3   <= 10'b0;
//               CHIP3_ADDR2_4   <= 10'b0;
//               CHIP3_ADDR2_5   <= 10'b0;
//               CHIP3_ADDR2_6   <= 10'b0;
//               CHIP3_ADDR2_7   <= 10'b0;
//               CHIP3_ADDR2_8   <= 10'b0;
//               CHIP3_ADDR2_9   <= 10'b0;
//               CHIP3_ADDR2_10  <= 10'b0;
//               CHIP3_ADDR2_11  <= 10'b0;
//               CHIP3_ADDR2_12  <= 10'b0;


//               CHIP4_ADDR1_1   <= 10'b0;
//               CHIP4_ADDR1_2   <= 10'b0;
//               CHIP4_ADDR1_3   <= 10'b0;
//               CHIP4_ADDR1_4   <= 10'b0;
//               CHIP4_ADDR1_5   <= 10'b0;
//               CHIP4_ADDR1_6   <= 10'b0;
//               CHIP4_ADDR1_7   <= 10'b0;
//               CHIP4_ADDR1_8   <= 10'b0;
//               CHIP4_ADDR1_9   <= 10'b0;
//               CHIP4_ADDR1_10  <= 10'b0;
//               CHIP4_ADDR1_11  <= 10'b0;
//               CHIP4_ADDR1_12  <= 10'b0;
//               CHIP4_ADDR2_1   <= 10'b0;
//               CHIP4_ADDR2_2   <= 10'b0;
//               CHIP4_ADDR2_3   <= 10'b0;
//               CHIP4_ADDR2_4   <= 10'b0;
//               CHIP4_ADDR2_5   <= 10'b0;
//               CHIP4_ADDR2_6   <= 10'b0;
//               CHIP4_ADDR2_7   <= 10'b0;
//               CHIP4_ADDR2_8   <= 10'b0;
//               CHIP4_ADDR2_9   <= 10'b0;
//               CHIP4_ADDR2_10  <= 10'b0;
//               CHIP4_ADDR2_11  <= 10'b0;
//               CHIP4_ADDR2_12  <= 10'b0;


//               CHIP5_ADDR1_1   <= 10'b0;
//               CHIP5_ADDR1_2   <= 10'b0;
//               CHIP5_ADDR1_3   <= 10'b0;
//               CHIP5_ADDR1_4   <= 10'b0;
//               CHIP5_ADDR1_5   <= 10'b0;
//               CHIP5_ADDR1_6   <= 10'b0;
//               CHIP5_ADDR1_7   <= 10'b0;
//               CHIP5_ADDR1_8   <= 10'b0;
//               CHIP5_ADDR1_9   <= 10'b0;
//               CHIP5_ADDR1_10  <= 10'b0;
//               CHIP5_ADDR1_11  <= 10'b0;
//               CHIP5_ADDR1_12  <= 10'b0;
//               CHIP5_ADDR2_1   <= 10'b0;
//               CHIP5_ADDR2_2   <= 10'b0;
//               CHIP5_ADDR2_3   <= 10'b0;
//               CHIP5_ADDR2_4   <= 10'b0;
//               CHIP5_ADDR2_5   <= 10'b0;
//               CHIP5_ADDR2_6   <= 10'b0;
//               CHIP5_ADDR2_7   <= 10'b0;
//               CHIP5_ADDR2_8   <= 10'b0;
//               CHIP5_ADDR2_9   <= 10'b0;
//               CHIP5_ADDR2_10  <= 10'b0;
//               CHIP5_ADDR2_11  <= 10'b0;
//               CHIP5_ADDR2_12  <= 10'b0;


//               CHIP6_ADDR1_1   <= 10'b0;
//               CHIP6_ADDR1_2   <= 10'b0;
//               CHIP6_ADDR1_3   <= 10'b0;
//               CHIP6_ADDR1_4   <= 10'b0;
//               CHIP6_ADDR1_5   <= 10'b0;
//               CHIP6_ADDR1_6   <= 10'b0;
//               CHIP6_ADDR1_7   <= 10'b0;
//               CHIP6_ADDR1_8   <= 10'b0;
//               CHIP6_ADDR1_9   <= 10'b0;
//               CHIP6_ADDR1_10  <= 10'b0;
//               CHIP6_ADDR1_11  <= 10'b0;
//               CHIP6_ADDR1_12  <= 10'b0;
//               CHIP6_ADDR2_1   <= 10'b0;
//               CHIP6_ADDR2_2   <= 10'b0;
//               CHIP6_ADDR2_3   <= 10'b0;
//               CHIP6_ADDR2_4   <= 10'b0;
//               CHIP6_ADDR2_5   <= 10'b0;
//               CHIP6_ADDR2_6   <= 10'b0;
//               CHIP6_ADDR2_7   <= 10'b0;
//               CHIP6_ADDR2_8   <= 10'b0;
//               CHIP6_ADDR2_9   <= 10'b0;
//               CHIP6_ADDR2_10  <= 10'b0;
//               CHIP6_ADDR2_11  <= 10'b0;
//               CHIP6_ADDR2_12  <= 10'b0;


//               CHIP7_ADDR1_1   <= 10'b0;
//               CHIP7_ADDR1_2   <= 10'b0;
//               CHIP7_ADDR1_3   <= 10'b0;
//               CHIP7_ADDR1_4   <= 10'b0;
//               CHIP7_ADDR1_5   <= 10'b0;
//               CHIP7_ADDR1_6   <= 10'b0;
//               CHIP7_ADDR1_7   <= 10'b0;
//               CHIP7_ADDR1_8   <= 10'b0;
//               CHIP7_ADDR1_9   <= 10'b0;
//               CHIP7_ADDR1_10  <= 10'b0;
//               CHIP7_ADDR1_11  <= 10'b0;
//               CHIP7_ADDR1_12  <= 10'b0;
//               CHIP7_ADDR2_1   <= 10'b0;
//               CHIP7_ADDR2_2   <= 10'b0;
//               CHIP7_ADDR2_3   <= 10'b0;
//               CHIP7_ADDR2_4   <= 10'b0;
//               CHIP7_ADDR2_5   <= 10'b0;
//               CHIP7_ADDR2_6   <= 10'b0;
//               CHIP7_ADDR2_7   <= 10'b0;
//               CHIP7_ADDR2_8   <= 10'b0;
//               CHIP7_ADDR2_9   <= 10'b0;
//               CHIP7_ADDR2_10  <= 10'b0;
//               CHIP7_ADDR2_11  <= 10'b0;
//               CHIP7_ADDR2_12  <= 10'b0;


//               CHIP8_ADDR1_1   <= 10'b0;
//               CHIP8_ADDR1_2   <= 10'b0;
//               CHIP8_ADDR1_3   <= 10'b0;
//               CHIP8_ADDR1_4   <= 10'b0;
//               CHIP8_ADDR1_5   <= 10'b0;
//               CHIP8_ADDR1_6   <= 10'b0;
//               CHIP8_ADDR1_7   <= 10'b0;
//               CHIP8_ADDR1_8   <= 10'b0;
//               CHIP8_ADDR1_9   <= 10'b0;
//               CHIP8_ADDR1_10  <= 10'b0;
//               CHIP8_ADDR1_11  <= 10'b0;
//               CHIP8_ADDR1_12  <= 10'b0;
//               CHIP8_ADDR2_1   <= 10'b0;
//               CHIP8_ADDR2_2   <= 10'b0;
//               CHIP8_ADDR2_3   <= 10'b0;
//               CHIP8_ADDR2_4   <= 10'b0;
//               CHIP8_ADDR2_5   <= 10'b0;
//               CHIP8_ADDR2_6   <= 10'b0;
//               CHIP8_ADDR2_7   <= 10'b0;
//               CHIP8_ADDR2_8   <= 10'b0;
//               CHIP8_ADDR2_9   <= 10'b0;
//               CHIP8_ADDR2_10  <= 10'b0;
//               CHIP8_ADDR2_11  <= 10'b0;
//               CHIP8_ADDR2_12  <= 10'b0;


//               CHIP9_ADDR1_1   <= 10'b0;
//               CHIP9_ADDR1_2   <= 10'b0;
//               CHIP9_ADDR1_3   <= 10'b0;
//               CHIP9_ADDR1_4   <= 10'b0;
//               CHIP9_ADDR1_5   <= 10'b0;
//               CHIP9_ADDR1_6   <= 10'b0;
//               CHIP9_ADDR1_7   <= 10'b0;
//               CHIP9_ADDR1_8   <= 10'b0;
//               CHIP9_ADDR1_9   <= 10'b0;
//               CHIP9_ADDR1_10  <= 10'b0;
//               CHIP9_ADDR1_11  <= 10'b0;
//               CHIP9_ADDR1_12  <= 10'b0;
//               CHIP9_ADDR2_1   <= 10'b0;
//               CHIP9_ADDR2_2   <= 10'b0;
//               CHIP9_ADDR2_3   <= 10'b0;
//               CHIP9_ADDR2_4   <= 10'b0;
//               CHIP9_ADDR2_5   <= 10'b0;
//               CHIP9_ADDR2_6   <= 10'b0;
//               CHIP9_ADDR2_7   <= 10'b0;
//               CHIP9_ADDR2_8   <= 10'b0;
//               CHIP9_ADDR2_9   <= 10'b0;
//               CHIP9_ADDR2_10  <= 10'b0;
//               CHIP9_ADDR2_11  <= 10'b0;
//               CHIP9_ADDR2_12  <= 10'b0;


//               CHIP10_ADDR1_1   <= 10'b0;
//               CHIP10_ADDR1_2   <= 10'b0;
//               CHIP10_ADDR1_3   <= 10'b0;
//               CHIP10_ADDR1_4   <= 10'b0;
//               CHIP10_ADDR1_5   <= 10'b0;
//               CHIP10_ADDR1_6   <= 10'b0;
//               CHIP10_ADDR1_7   <= 10'b0;
//               CHIP10_ADDR1_8   <= 10'b0;
//               CHIP10_ADDR1_9   <= 10'b0;
//               CHIP10_ADDR1_10  <= 10'b0;
//               CHIP10_ADDR1_11  <= 10'b0;
//               CHIP10_ADDR1_12  <= 10'b0;
//               CHIP10_ADDR2_1   <= 10'b0;
//               CHIP10_ADDR2_2   <= 10'b0;
//               CHIP10_ADDR2_3   <= 10'b0;
//               CHIP10_ADDR2_4   <= 10'b0;
//               CHIP10_ADDR2_5   <= 10'b0;
//               CHIP10_ADDR2_6   <= 10'b0;
//               CHIP10_ADDR2_7   <= 10'b0;
//               CHIP10_ADDR2_8   <= 10'b0;
//               CHIP10_ADDR2_9   <= 10'b0;
//               CHIP10_ADDR2_10  <= 10'b0;
//               CHIP10_ADDR2_11  <= 10'b0;
//               CHIP10_ADDR2_12  <= 10'b0;


//               CHIP11_ADDR1_1   <= 10'b0;
//               CHIP11_ADDR1_2   <= 10'b0;
//               CHIP11_ADDR1_3   <= 10'b0;
//               CHIP11_ADDR1_4   <= 10'b0;
//               CHIP11_ADDR1_5   <= 10'b0;
//               CHIP11_ADDR1_6   <= 10'b0;
//               CHIP11_ADDR1_7   <= 10'b0;
//               CHIP11_ADDR1_8   <= 10'b0;
//               CHIP11_ADDR1_9   <= 10'b0;
//               CHIP11_ADDR1_10  <= 10'b0;
//               CHIP11_ADDR1_11  <= 10'b0;
//               CHIP11_ADDR1_12  <= 10'b0;
//               CHIP11_ADDR2_1   <= 10'b0;
//               CHIP11_ADDR2_2   <= 10'b0;
//               CHIP11_ADDR2_3   <= 10'b0;
//               CHIP11_ADDR2_4   <= 10'b0;
//               CHIP11_ADDR2_5   <= 10'b0;
//               CHIP11_ADDR2_6   <= 10'b0;
//               CHIP11_ADDR2_7   <= 10'b0;
//               CHIP11_ADDR2_8   <= 10'b0;
//               CHIP11_ADDR2_9   <= 10'b0;
//               CHIP11_ADDR2_10  <= 10'b0;
//               CHIP11_ADDR2_11  <= 10'b0;
//               CHIP11_ADDR2_12  <= 10'b0;


//               CHIP12_ADDR1_1   <= 10'b0;
//               CHIP12_ADDR1_2   <= 10'b0;
//               CHIP12_ADDR1_3   <= 10'b0;
//               CHIP12_ADDR1_4   <= 10'b0;
//               CHIP12_ADDR1_5   <= 10'b0;
//               CHIP12_ADDR1_6   <= 10'b0;
//               CHIP12_ADDR1_7   <= 10'b0;
//               CHIP12_ADDR1_8   <= 10'b0;
//               CHIP12_ADDR1_9   <= 10'b0;
//               CHIP12_ADDR1_10  <= 10'b0;
//               CHIP12_ADDR1_11  <= 10'b0;
//               CHIP12_ADDR1_12  <= 10'b0;
//               CHIP12_ADDR2_1   <= 10'b0;
//               CHIP12_ADDR2_2   <= 10'b0;
//               CHIP12_ADDR2_3   <= 10'b0;
//               CHIP12_ADDR2_4   <= 10'b0;
//               CHIP12_ADDR2_5   <= 10'b0;
//               CHIP12_ADDR2_6   <= 10'b0;
//               CHIP12_ADDR2_7   <= 10'b0;
//               CHIP12_ADDR2_8   <= 10'b0;
//               CHIP12_ADDR2_9   <= 10'b0;
//               CHIP12_ADDR2_10  <= 10'b0;
//               CHIP12_ADDR2_11  <= 10'b0;
//               CHIP12_ADDR2_12  <= 10'b0;
//             end
//             // else if (FRAME_X) begin//
//             //   RAM2FIFO[15:0]<= 16'h55AA;  
 
//             // end
//             else if (state_next==P_EN) begin//
//               RAM2FIFO[15:0]<= 16'h55AA;  //(state_reg==P_EN)||(state_reg==C_EN)
 
//             end
//             else if (state_next==C_EN) begin//
//               RAM2FIFO[15:0]<= FRAME_COUNT[15:0];  //(state_reg==P_EN)||(state_reg==C_EN)
 
//             end
//             else if (chip1_read1_en1) begin//
//               CHIP1_ADDR1_1 <= CHIP1_ADDR1_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT1[15:0];  
 
//             end
//             else if (chip1_read1_en2) begin//
//               CHIP1_ADDR1_1 <= 16'd0;
//               CHIP1_ADDR1_2 <= CHIP1_ADDR1_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT2[15:0];      
//             end
//             else if (chip1_read1_en3) begin//
//               CHIP1_ADDR1_2 <= 16'd0;
//               CHIP1_ADDR1_3 <= CHIP1_ADDR1_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT3[15:0];      
//             end
//             else if (chip1_read1_en4) begin//
//               CHIP1_ADDR1_3 <= 16'd0;
//               CHIP1_ADDR1_4 <= CHIP1_ADDR1_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT4[15:0];      
//             end
//             else if (chip1_read1_en5) begin//
//               CHIP1_ADDR1_4 <= 16'd0;
//               CHIP1_ADDR1_5 <= CHIP1_ADDR1_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT5[15:0];      
//             end
//             else if (chip1_read1_en6) begin//
//               CHIP1_ADDR1_5 <= 16'd0;
//               CHIP1_ADDR1_6 <= CHIP1_ADDR1_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT6[15:0];      
//             end
//             else if (chip1_read1_en7) begin//
//               CHIP1_ADDR1_6 <= 16'd0;
//               CHIP1_ADDR1_7 <= CHIP1_ADDR1_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT7[15:0];      
//             end
//             else if (chip1_read1_en8) begin//
//               CHIP1_ADDR1_7 <= 16'd0;
//               CHIP1_ADDR1_8 <= CHIP1_ADDR1_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT8[15:0];      
//             end
//             else if (chip1_read1_en9) begin//
//               CHIP1_ADDR1_8 <= 16'd0;
//               CHIP1_ADDR1_9 <= CHIP1_ADDR1_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT9[15:0];      
//             end
//             else if (chip1_read1_en10) begin//
//               CHIP1_ADDR1_9 <= 16'd0;
//               CHIP1_ADDR1_10 <= CHIP1_ADDR1_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT10[15:0];      
//             end
//             else if (chip1_read1_en11) begin//
//               CHIP1_ADDR1_10 <= 16'd0;
//               CHIP1_ADDR1_11 <= CHIP1_ADDR1_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT11[15:0];      
//             end
//             else if (chip1_read1_en12) begin//
//               CHIP1_ADDR1_11 <= 16'd0;
//               CHIP1_ADDR1_12 <= CHIP1_ADDR1_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT12[15:0];      
//             end

//             else if (chip2_read1_en1) begin//
//               CHIP1_ADDR1_12 <= 16'd0;
//               CHIP2_ADDR1_1 <= CHIP2_ADDR1_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT1[15:0];      
//             end
//             else if (chip2_read1_en2) begin//
//               CHIP2_ADDR1_1 <= 16'd0;
//               CHIP2_ADDR1_2 <= CHIP2_ADDR1_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT2[15:0];      
//             end
//             else if (chip2_read1_en3) begin//
//               CHIP2_ADDR1_2 <= 16'd0;
//               CHIP2_ADDR1_3 <= CHIP2_ADDR1_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT3[15:0];      
//             end
//             else if (chip2_read1_en4) begin//
//               CHIP2_ADDR1_3 <= 16'd0;
//               CHIP2_ADDR1_4 <= CHIP2_ADDR1_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT4[15:0];      
//             end
//             else if (chip2_read1_en5) begin//
//               CHIP2_ADDR1_4 <= 16'd0;
//               CHIP2_ADDR1_5 <= CHIP2_ADDR1_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT5[15:0];      
//             end
//             else if (chip2_read1_en6) begin//
//               CHIP2_ADDR1_5 <= 16'd0;
//               CHIP2_ADDR1_6 <= CHIP2_ADDR1_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT6[15:0];      
//             end
//             else if (chip2_read1_en7) begin//
//               CHIP2_ADDR1_6 <= 16'd0;
//               CHIP2_ADDR1_7 <= CHIP2_ADDR1_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT7[15:0];      
//             end
//             else if (chip2_read1_en8) begin//
//               CHIP2_ADDR1_7 <= 16'd0;
//               CHIP2_ADDR1_8 <= CHIP2_ADDR1_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT8[15:0];      
//             end
//             else if (chip2_read1_en9) begin//
//               CHIP2_ADDR1_8 <= 16'd0;
//               CHIP2_ADDR1_9 <= CHIP2_ADDR1_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT9[15:0];      
//             end
//             else if (chip2_read1_en10) begin//
//               CHIP2_ADDR1_9 <= 16'd0;
//               CHIP2_ADDR1_10 <= CHIP2_ADDR1_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT10[15:0];      
//             end
//             else if (chip2_read1_en11) begin//
//               CHIP2_ADDR1_10 <= 16'd0;
//               CHIP2_ADDR1_11 <= CHIP2_ADDR1_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT11[15:0];      
//             end
//             else if (chip2_read1_en12) begin//
//               CHIP2_ADDR1_11 <= 16'd0;
//               CHIP2_ADDR1_12 <= CHIP2_ADDR1_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT12[15:0];      
//             end

//             else if (chip3_read1_en1) begin//
//               CHIP2_ADDR1_12 <= 16'd0;
//               CHIP3_ADDR1_1 <= CHIP3_ADDR1_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT1[15:0];      
//             end
//             else if (chip3_read1_en2) begin//
//               CHIP3_ADDR1_1 <= 16'd0;
//               CHIP3_ADDR1_2 <= CHIP3_ADDR1_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT2[15:0];      
//             end
//             else if (chip3_read1_en3) begin//
//               CHIP3_ADDR1_2 <= 16'd0;
//               CHIP3_ADDR1_3 <= CHIP3_ADDR1_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT3[15:0];      
//             end
//             else if (chip3_read1_en4) begin//
//               CHIP3_ADDR1_3 <= 16'd0;
//               CHIP3_ADDR1_4 <= CHIP3_ADDR1_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT4[15:0];      
//             end
//             else if (chip3_read1_en5) begin//
//               CHIP3_ADDR1_4 <= 16'd0;
//               CHIP3_ADDR1_5 <= CHIP3_ADDR1_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT5[15:0];      
//             end
//             else if (chip3_read1_en6) begin//
//               CHIP3_ADDR1_5 <= 16'd0;
//               CHIP3_ADDR1_6 <= CHIP3_ADDR1_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT6[15:0];      
//             end
//             else if (chip3_read1_en7) begin//
//               CHIP3_ADDR1_6 <= 16'd0;
//               CHIP3_ADDR1_7 <= CHIP3_ADDR1_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT7[15:0];      
//             end
//             else if (chip3_read1_en8) begin//
//               CHIP3_ADDR1_7 <= 16'd0;
//               CHIP3_ADDR1_8 <= CHIP3_ADDR1_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT8[15:0];      
//             end
//             else if (chip3_read1_en9) begin//
//               CHIP3_ADDR1_8 <= 16'd0;
//               CHIP3_ADDR1_9 <= CHIP3_ADDR1_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT9[15:0];      
//             end
//             else if (chip3_read1_en10) begin//
//               CHIP3_ADDR1_9 <= 16'd0;
//               CHIP3_ADDR1_10 <= CHIP3_ADDR1_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT10[15:0];      
//             end
//             else if (chip3_read1_en11) begin//
//               CHIP3_ADDR1_10 <= 16'd0;
//               CHIP3_ADDR1_11 <= CHIP3_ADDR1_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT11[15:0];      
//             end
//             else if (chip3_read1_en12) begin//
//               CHIP3_ADDR1_11 <= 16'd0;
//               CHIP3_ADDR1_12 <= CHIP3_ADDR1_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT12[15:0];      
//             end


//             else if (chip4_read1_en1) begin//
//               CHIP3_ADDR1_12 <= 16'd0;
//               CHIP4_ADDR1_1 <= CHIP4_ADDR1_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT1[15:0];      
//             end
//             else if (chip4_read1_en2) begin//
//               CHIP4_ADDR1_1 <= 16'd0;
//               CHIP4_ADDR1_2 <= CHIP4_ADDR1_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT2[15:0];      
//             end
//             else if (chip4_read1_en3) begin//
//               CHIP4_ADDR1_2 <= 16'd0;
//               CHIP4_ADDR1_3 <= CHIP4_ADDR1_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT3[15:0];      
//             end
//             else if (chip4_read1_en4) begin//
//               CHIP4_ADDR1_3 <= 16'd0;
//               CHIP4_ADDR1_4 <= CHIP4_ADDR1_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT4[15:0];      
//             end
//             else if (chip4_read1_en5) begin//
//               CHIP4_ADDR1_4 <= 16'd0;
//               CHIP4_ADDR1_5 <= CHIP4_ADDR1_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT5[15:0];      
//             end
//             else if (chip4_read1_en6) begin//
//               CHIP4_ADDR1_5 <= 16'd0;
//               CHIP4_ADDR1_6 <= CHIP4_ADDR1_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT6[15:0];      
//             end
//             else if (chip4_read1_en7) begin//
//               CHIP4_ADDR1_6 <= 16'd0;
//               CHIP4_ADDR1_7 <= CHIP4_ADDR1_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT7[15:0];      
//             end
//             else if (chip4_read1_en8) begin//
//               CHIP4_ADDR1_7 <= 16'd0;
//               CHIP4_ADDR1_8 <= CHIP4_ADDR1_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT8[15:0];      
//             end
//             else if (chip4_read1_en9) begin//
//               CHIP4_ADDR1_8 <= 16'd0;
//               CHIP4_ADDR1_9 <= CHIP4_ADDR1_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT9[15:0];      
//             end
//             else if (chip4_read1_en10) begin//
//               CHIP4_ADDR1_9 <= 16'd0;
//               CHIP4_ADDR1_10 <= CHIP4_ADDR1_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT10[15:0];      
//             end
//             else if (chip4_read1_en11) begin//
//               CHIP4_ADDR1_10 <= 16'd0;
//               CHIP4_ADDR1_11 <= CHIP4_ADDR1_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT11[15:0];      
//             end
//             else if (chip4_read1_en12) begin//
//               CHIP4_ADDR1_11 <= 16'd0;
//               CHIP4_ADDR1_12 <= CHIP4_ADDR1_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT12[15:0];      
//             end


//             else if (chip5_read1_en1) begin//
//               CHIP4_ADDR1_12 <= 16'd0;
//               CHIP5_ADDR1_1 <= CHIP5_ADDR1_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT1[15:0];      
//             end
//             else if (chip5_read1_en2) begin//
//               CHIP5_ADDR1_1 <= 16'd0;
//               CHIP5_ADDR1_2 <= CHIP5_ADDR1_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT2[15:0];      
//             end
//             else if (chip5_read1_en3) begin//
//               CHIP5_ADDR1_2 <= 16'd0;
//               CHIP5_ADDR1_3 <= CHIP5_ADDR1_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT3[15:0];      
//             end
//             else if (chip5_read1_en4) begin//
//               CHIP5_ADDR1_3 <= 16'd0;
//               CHIP5_ADDR1_4 <= CHIP5_ADDR1_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT4[15:0];      
//             end
//             else if (chip5_read1_en5) begin//
//               CHIP5_ADDR1_4 <= 16'd0;
//               CHIP5_ADDR1_5 <= CHIP5_ADDR1_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT5[15:0];      
//             end
//             else if (chip5_read1_en6) begin//
//               CHIP5_ADDR1_5 <= 16'd0;
//               CHIP5_ADDR1_6 <= CHIP5_ADDR1_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT6[15:0];      
//             end
//             else if (chip5_read1_en7) begin//
//               CHIP5_ADDR1_6 <= 16'd0;
//               CHIP5_ADDR1_7 <= CHIP5_ADDR1_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT7[15:0];      
//             end
//             else if (chip5_read1_en8) begin//
//               CHIP5_ADDR1_7 <= 16'd0;
//               CHIP5_ADDR1_8 <= CHIP5_ADDR1_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT8[15:0];      
//             end
//             else if (chip5_read1_en9) begin//
//               CHIP5_ADDR1_8 <= 16'd0;
//               CHIP5_ADDR1_9 <= CHIP5_ADDR1_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT9[15:0];      
//             end
//             else if (chip5_read1_en10) begin//
//               CHIP5_ADDR1_9 <= 16'd0;
//               CHIP5_ADDR1_10 <= CHIP5_ADDR1_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT10[15:0];      
//             end
//             else if (chip5_read1_en11) begin//
//               CHIP5_ADDR1_10 <= 16'd0;
//               CHIP5_ADDR1_11 <= CHIP5_ADDR1_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT11[15:0];      
//             end
//             else if (chip5_read1_en12) begin//
//               CHIP5_ADDR1_11 <= 16'd0;
//               CHIP5_ADDR1_12 <= CHIP5_ADDR1_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT12[15:0];      
//             end

//             else if (chip6_read1_en1) begin//
//               CHIP5_ADDR1_12 <= 16'd0;
//               CHIP6_ADDR1_1 <= CHIP6_ADDR1_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT1[15:0];      
//             end
//             else if (chip6_read1_en2) begin//
//               CHIP6_ADDR1_1 <= 16'd0;
//               CHIP6_ADDR1_2 <= CHIP6_ADDR1_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT2[15:0];      
//             end
//             else if (chip6_read1_en3) begin//
//               CHIP6_ADDR1_2 <= 16'd0;
//               CHIP6_ADDR1_3 <= CHIP6_ADDR1_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT3[15:0];      
//             end
//             else if (chip6_read1_en4) begin//
//               CHIP6_ADDR1_3 <= 16'd0;
//               CHIP6_ADDR1_4 <= CHIP6_ADDR1_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT4[15:0];      
//             end
//             else if (chip6_read1_en5) begin//
//               CHIP6_ADDR1_4 <= 16'd0;
//               CHIP6_ADDR1_5 <= CHIP6_ADDR1_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT5[15:0];      
//             end
//             else if (chip6_read1_en6) begin//
//               CHIP6_ADDR1_5 <= 16'd0;
//               CHIP6_ADDR1_6 <= CHIP6_ADDR1_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT6[15:0];      
//             end
//             else if (chip6_read1_en7) begin//
//               CHIP6_ADDR1_6 <= 16'd0;
//               CHIP6_ADDR1_7 <= CHIP6_ADDR1_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT7[15:0];      
//             end
//             else if (chip6_read1_en8) begin//
//               CHIP6_ADDR1_7 <= 16'd0;
//               CHIP6_ADDR1_8 <= CHIP6_ADDR1_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT8[15:0];      
//             end
//             else if (chip6_read1_en9) begin//
//               CHIP6_ADDR1_8 <= 16'd0;
//               CHIP6_ADDR1_9 <= CHIP6_ADDR1_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT9[15:0];      
//             end
//             else if (chip6_read1_en10) begin//
//               CHIP6_ADDR1_9 <= 16'd0;
//               CHIP6_ADDR1_10 <= CHIP6_ADDR1_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT10[15:0];      
//             end
//             else if (chip6_read1_en11) begin//
//               CHIP6_ADDR1_10 <= 16'd0;
//               CHIP6_ADDR1_11 <= CHIP6_ADDR1_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT11[15:0];      
//             end
//             else if (chip6_read1_en12) begin//
//               CHIP6_ADDR1_11 <= 16'd0;
//               CHIP6_ADDR1_12 <= CHIP6_ADDR1_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT12[15:0];      
//             end


//             else if (chip7_read1_en1) begin//
//               CHIP6_ADDR1_12 <= 16'd0;
//               CHIP7_ADDR1_1 <= CHIP7_ADDR1_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT1[15:0];      
//             end
//             else if (chip7_read1_en2) begin//
//               CHIP7_ADDR1_1 <= 16'd0;
//               CHIP7_ADDR1_2 <= CHIP7_ADDR1_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT2[15:0];      
//             end
//             else if (chip7_read1_en3) begin//
//               CHIP7_ADDR1_2 <= 16'd0;
//               CHIP7_ADDR1_3 <= CHIP7_ADDR1_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT3[15:0];      
//             end
//             else if (chip7_read1_en4) begin//
//               CHIP7_ADDR1_3 <= 16'd0;
//               CHIP7_ADDR1_4 <= CHIP7_ADDR1_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT4[15:0];      
//             end
//             else if (chip7_read1_en5) begin//
//               CHIP7_ADDR1_4 <= 16'd0;
//               CHIP7_ADDR1_5 <= CHIP7_ADDR1_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT5[15:0];      
//             end
//             else if (chip7_read1_en6) begin//
//               CHIP7_ADDR1_5 <= 16'd0;
//               CHIP7_ADDR1_6 <= CHIP7_ADDR1_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT6[15:0];      
//             end
//             else if (chip7_read1_en7) begin//
//               CHIP7_ADDR1_6 <= 16'd0;
//               CHIP7_ADDR1_7 <= CHIP7_ADDR1_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT7[15:0];      
//             end
//             else if (chip7_read1_en8) begin//
//               CHIP7_ADDR1_7 <= 16'd0;
//               CHIP7_ADDR1_8 <= CHIP7_ADDR1_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT8[15:0];      
//             end
//             else if (chip7_read1_en9) begin//
//               CHIP7_ADDR1_8 <= 16'd0;
//               CHIP7_ADDR1_9 <= CHIP7_ADDR1_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT9[15:0];      
//             end
//             else if (chip7_read1_en10) begin//
//               CHIP7_ADDR1_9 <= 16'd0;
//               CHIP7_ADDR1_10 <= CHIP7_ADDR1_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT10[15:0];      
//             end
//             else if (chip7_read1_en11) begin//
//               CHIP7_ADDR1_10 <= 16'd0;
//               CHIP7_ADDR1_11 <= CHIP7_ADDR1_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT11[15:0];      
//             end
//             else if (chip7_read1_en12) begin//
//               CHIP7_ADDR1_11 <= 16'd0;
//               CHIP7_ADDR1_12 <= CHIP7_ADDR1_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT12[15:0];      
//             end


//             else if (chip8_read1_en1) begin//
//               CHIP7_ADDR1_12 <= 16'd0;
//               CHIP8_ADDR1_1 <= CHIP8_ADDR1_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT1[15:0];      
//             end
//             else if (chip8_read1_en2) begin//
//               CHIP8_ADDR1_1 <= 16'd0;
//               CHIP8_ADDR1_2 <= CHIP8_ADDR1_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT2[15:0];      
//             end
//             else if (chip8_read1_en3) begin//
//               CHIP8_ADDR1_2 <= 16'd0;
//               CHIP8_ADDR1_3 <= CHIP8_ADDR1_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT3[15:0];      
//             end
//             else if (chip8_read1_en4) begin//
//               CHIP8_ADDR1_3 <= 16'd0;
//               CHIP8_ADDR1_4 <= CHIP8_ADDR1_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT4[15:0];      
//             end
//             else if (chip8_read1_en5) begin//
//               CHIP8_ADDR1_4 <= 16'd0;
//               CHIP8_ADDR1_5 <= CHIP8_ADDR1_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT5[15:0];      
//             end
//             else if (chip8_read1_en6) begin//
//               CHIP8_ADDR1_5 <= 16'd0;
//               CHIP8_ADDR1_6 <= CHIP8_ADDR1_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT6[15:0];      
//             end
//             else if (chip8_read1_en7) begin//
//               CHIP8_ADDR1_6 <= 16'd0;
//               CHIP8_ADDR1_7 <= CHIP8_ADDR1_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT7[15:0];      
//             end
//             else if (chip8_read1_en8) begin//
//               CHIP8_ADDR1_7 <= 16'd0;
//               CHIP8_ADDR1_8 <= CHIP8_ADDR1_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT8[15:0];      
//             end
//             else if (chip8_read1_en9) begin//
//               CHIP8_ADDR1_8 <= 16'd0;
//               CHIP8_ADDR1_9 <= CHIP8_ADDR1_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT9[15:0];      
//             end
//             else if (chip8_read1_en10) begin//
//               CHIP8_ADDR1_9 <= 16'd0;
//               CHIP8_ADDR1_10 <= CHIP8_ADDR1_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT10[15:0];      
//             end
//             else if (chip8_read1_en11) begin//
//               CHIP8_ADDR1_10 <= 16'd0;
//               CHIP8_ADDR1_11 <= CHIP8_ADDR1_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT11[15:0];      
//             end
//             else if (chip8_read1_en12) begin//
//               CHIP8_ADDR1_11 <= 16'd0;
//               CHIP8_ADDR1_12 <= CHIP8_ADDR1_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT12[15:0];      
//             end


//             else if (chip9_read1_en1) begin//
//               CHIP8_ADDR1_12 <= 16'd0;
//               CHIP9_ADDR1_1 <= CHIP9_ADDR1_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT1[15:0];      
//             end
//             else if (chip9_read1_en2) begin//
//               CHIP9_ADDR1_1 <= 16'd0;
//               CHIP9_ADDR1_2 <= CHIP9_ADDR1_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT2[15:0];      
//             end
//             else if (chip9_read1_en3) begin//
//               CHIP9_ADDR1_2 <= 16'd0;
//               CHIP9_ADDR1_3 <= CHIP9_ADDR1_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT3[15:0];      
//             end
//             else if (chip9_read1_en4) begin//
//               CHIP9_ADDR1_3 <= 16'd0;
//               CHIP9_ADDR1_4 <= CHIP9_ADDR1_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT4[15:0];      
//             end
//             else if (chip9_read1_en5) begin//
//               CHIP9_ADDR1_4 <= 16'd0;
//               CHIP9_ADDR1_5 <= CHIP9_ADDR1_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT5[15:0];      
//             end
//             else if (chip9_read1_en6) begin//
//               CHIP9_ADDR1_5 <= 16'd0;
//               CHIP9_ADDR1_6 <= CHIP9_ADDR1_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT6[15:0];      
//             end
//             else if (chip9_read1_en7) begin//
//               CHIP9_ADDR1_6 <= 16'd0;
//               CHIP9_ADDR1_7 <= CHIP9_ADDR1_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT7[15:0];      
//             end
//             else if (chip9_read1_en8) begin//
//               CHIP9_ADDR1_7 <= 16'd0;
//               CHIP9_ADDR1_8 <= CHIP9_ADDR1_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT8[15:0];      
//             end
//             else if (chip9_read1_en9) begin//
//               CHIP9_ADDR1_8 <= 16'd0;
//               CHIP9_ADDR1_9 <= CHIP9_ADDR1_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT9[15:0];      
//             end
//             else if (chip9_read1_en10) begin//
//               CHIP9_ADDR1_9 <= 16'd0;
//               CHIP9_ADDR1_10 <= CHIP9_ADDR1_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT10[15:0];      
//             end
//             else if (chip9_read1_en11) begin//
//               CHIP9_ADDR1_10 <= 16'd0;
//               CHIP9_ADDR1_11 <= CHIP9_ADDR1_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT11[15:0];      
//             end
//             else if (chip9_read1_en12) begin//
//               CHIP9_ADDR1_11 <= 16'd0;
//               CHIP9_ADDR1_12 <= CHIP9_ADDR1_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT12[15:0];      
//             end


//             else if (chip10_read1_en1) begin//
//               CHIP9_ADDR1_12 <= 16'd0;
//               CHIP10_ADDR1_1 <= CHIP10_ADDR1_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT1[15:0];      
//             end
//             else if (chip10_read1_en2) begin//
//               CHIP10_ADDR1_1 <= 16'd0;
//               CHIP10_ADDR1_2 <= CHIP10_ADDR1_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT2[15:0];      
//             end
//             else if (chip10_read1_en3) begin//
//               CHIP10_ADDR1_2 <= 16'd0;
//               CHIP10_ADDR1_3 <= CHIP10_ADDR1_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT3[15:0];      
//             end
//             else if (chip10_read1_en4) begin//
//               CHIP10_ADDR1_3 <= 16'd0;
//               CHIP10_ADDR1_4 <= CHIP10_ADDR1_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT4[15:0];      
//             end
//             else if (chip10_read1_en5) begin//
//               CHIP10_ADDR1_4 <= 16'd0;
//               CHIP10_ADDR1_5 <= CHIP10_ADDR1_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT5[15:0];      
//             end
//             else if (chip10_read1_en6) begin//
//               CHIP10_ADDR1_5 <= 16'd0;
//               CHIP10_ADDR1_6 <= CHIP10_ADDR1_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT6[15:0];      
//             end
//             else if (chip10_read1_en7) begin//
//               CHIP10_ADDR1_6 <= 16'd0;
//               CHIP10_ADDR1_7 <= CHIP10_ADDR1_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT7[15:0];      
//             end
//             else if (chip10_read1_en8) begin//
//               CHIP10_ADDR1_7 <= 16'd0;
//               CHIP10_ADDR1_8 <= CHIP10_ADDR1_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT8[15:0];      
//             end
//             else if (chip10_read1_en9) begin//
//               CHIP10_ADDR1_8 <= 16'd0;
//               CHIP10_ADDR1_9 <= CHIP10_ADDR1_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT9[15:0];      
//             end
//             else if (chip10_read1_en10) begin//
//               CHIP10_ADDR1_9 <= 16'd0;
//               CHIP10_ADDR1_10 <= CHIP10_ADDR1_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT10[15:0];      
//             end
//             else if (chip10_read1_en11) begin//
//               CHIP10_ADDR1_10 <= 16'd0;
//               CHIP10_ADDR1_11 <= CHIP10_ADDR1_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT11[15:0];      
//             end
//             else if (chip10_read1_en12) begin//
//               CHIP10_ADDR1_11 <= 16'd0;
//               CHIP10_ADDR1_12 <= CHIP10_ADDR1_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT12[15:0];      
//             end



//             else if (chip11_read1_en1) begin//
//               CHIP10_ADDR1_12 <= 16'd0;
//               CHIP11_ADDR1_1 <= CHIP11_ADDR1_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT1[15:0];      
//             end
//             else if (chip11_read1_en2) begin//
//               CHIP11_ADDR1_1 <= 16'd0;
//               CHIP11_ADDR1_2 <= CHIP11_ADDR1_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT2[15:0];      
//             end
//             else if (chip11_read1_en3) begin//
//               CHIP11_ADDR1_2 <= 16'd0;
//               CHIP11_ADDR1_3 <= CHIP11_ADDR1_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT3[15:0];      
//             end
//             else if (chip11_read1_en4) begin//
//               CHIP11_ADDR1_3 <= 16'd0;
//               CHIP11_ADDR1_4 <= CHIP11_ADDR1_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT4[15:0];      
//             end
//             else if (chip11_read1_en5) begin//
//               CHIP11_ADDR1_4 <= 16'd0;
//               CHIP11_ADDR1_5 <= CHIP11_ADDR1_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT5[15:0];      
//             end
//             else if (chip11_read1_en6) begin//
//               CHIP11_ADDR1_5 <= 16'd0;
//               CHIP11_ADDR1_6 <= CHIP11_ADDR1_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT6[15:0];      
//             end
//             else if (chip11_read1_en7) begin//
//               CHIP11_ADDR1_6 <= 16'd0;
//               CHIP11_ADDR1_7 <= CHIP11_ADDR1_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT7[15:0];      
//             end
//             else if (chip11_read1_en8) begin//
//               CHIP11_ADDR1_7 <= 16'd0;
//               CHIP11_ADDR1_8 <= CHIP11_ADDR1_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT8[15:0];      
//             end
//             else if (chip11_read1_en9) begin//
//               CHIP11_ADDR1_8 <= 16'd0;
//               CHIP11_ADDR1_9 <= CHIP11_ADDR1_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT9[15:0];      
//             end
//             else if (chip11_read1_en10) begin//
//               CHIP11_ADDR1_9 <= 16'd0;
//               CHIP11_ADDR1_10 <= CHIP11_ADDR1_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT10[15:0];      
//             end
//             else if (chip11_read1_en11) begin//
//               CHIP11_ADDR1_10 <= 16'd0;
//               CHIP11_ADDR1_11 <= CHIP11_ADDR1_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT11[15:0];      
//             end
//             else if (chip11_read1_en12) begin//
//               CHIP11_ADDR1_11 <= 16'd0;
//               CHIP11_ADDR1_12 <= CHIP11_ADDR1_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT12[15:0];      
//             end


//             else if (chip12_read1_en1) begin//
//               CHIP11_ADDR1_12 <= 16'd0;
//               CHIP12_ADDR1_1 <= CHIP12_ADDR1_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT1[15:0];      
//             end
//             else if (chip12_read1_en2) begin//
//               CHIP12_ADDR1_1 <= 16'd0;
//               CHIP12_ADDR1_2 <= CHIP12_ADDR1_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT2[15:0];      
//             end
//             else if (chip12_read1_en3) begin//
//               CHIP12_ADDR1_2 <= 16'd0;
//               CHIP12_ADDR1_3 <= CHIP12_ADDR1_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT3[15:0];      
//             end
//             else if (chip12_read1_en4) begin//
//               CHIP12_ADDR1_3 <= 16'd0;
//               CHIP12_ADDR1_4 <= CHIP12_ADDR1_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT4[15:0];      
//             end
//             else if (chip12_read1_en5) begin//
//               CHIP12_ADDR1_4 <= 16'd0;
//               CHIP12_ADDR1_5 <= CHIP12_ADDR1_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT5[15:0];      
//             end
//             else if (chip12_read1_en6) begin//
//               CHIP12_ADDR1_5 <= 16'd0;
//               CHIP12_ADDR1_6 <= CHIP12_ADDR1_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT6[15:0];      
//             end
//             else if (chip12_read1_en7) begin//
//               CHIP12_ADDR1_6 <= 16'd0;
//               CHIP12_ADDR1_7 <= CHIP12_ADDR1_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT7[15:0];      
//             end
//             else if (chip12_read1_en8) begin//
//               CHIP12_ADDR1_7 <= 16'd0;
//               CHIP12_ADDR1_8 <= CHIP12_ADDR1_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT8[15:0];      
//             end
//             else if (chip12_read1_en9) begin//
//               CHIP12_ADDR1_8 <= 16'd0;
//               CHIP12_ADDR1_9 <= CHIP12_ADDR1_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT9[15:0];      
//             end
//             else if (chip12_read1_en10) begin//
//               CHIP12_ADDR1_9 <= 16'd0;
//               CHIP12_ADDR1_10 <= CHIP12_ADDR1_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT10[15:0];      
//             end
//             else if (chip12_read1_en11) begin//
//               CHIP12_ADDR1_10 <= 16'd0;
//               CHIP12_ADDR1_11 <= CHIP12_ADDR1_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT11[15:0];      
//             end
//             else if (chip12_read1_en12) begin//
//               CHIP12_ADDR1_11 <= 16'd0;
//               CHIP12_ADDR1_12 <= CHIP12_ADDR1_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT12[15:0];      
//             end


//             else if (chip1_read2_en1) begin//
//               CHIP12_ADDR1_12 <= 16'd0;
//               CHIP1_ADDR2_1 <= CHIP1_ADDR2_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT1[15:0];  
 
//             end
//             else if (chip1_read2_en2) begin//
//               CHIP1_ADDR2_1 <= 16'd0;
//               CHIP1_ADDR2_2 <= CHIP1_ADDR2_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT2[15:0];      
//             end
//             else if (chip1_read2_en3) begin//
//               CHIP1_ADDR2_2 <= 16'd0;
//               CHIP1_ADDR2_3 <= CHIP1_ADDR2_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT3[15:0];      
//             end
//             else if (chip1_read2_en4) begin//
//               CHIP1_ADDR2_3 <= 16'd0;
//               CHIP1_ADDR2_4 <= CHIP1_ADDR2_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT4[15:0];      
//             end
//             else if (chip1_read2_en5) begin//
//               CHIP1_ADDR2_4 <= 16'd0;
//               CHIP1_ADDR2_5 <= CHIP1_ADDR2_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT5[15:0];      
//             end
//             else if (chip1_read2_en6) begin//
//               CHIP1_ADDR2_5 <= 16'd0;
//               CHIP1_ADDR2_6 <= CHIP1_ADDR2_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT6[15:0];      
//             end
//             else if (chip1_read2_en7) begin//
//               CHIP1_ADDR2_6 <= 16'd0;
//               CHIP1_ADDR2_7 <= CHIP1_ADDR2_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT7[15:0];      
//             end
//             else if (chip1_read2_en8) begin//
//               CHIP1_ADDR2_7 <= 16'd0;
//               CHIP1_ADDR2_8 <= CHIP1_ADDR2_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT8[15:0];      
//             end
//             else if (chip1_read2_en9) begin//
//               CHIP1_ADDR2_8 <= 16'd0;
//               CHIP1_ADDR2_9 <= CHIP1_ADDR2_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT9[15:0];      
//             end
//             else if (chip1_read2_en10) begin//
//               CHIP1_ADDR2_9 <= 16'd0;
//               CHIP1_ADDR2_10 <= CHIP1_ADDR2_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT10[15:0];      
//             end
//             else if (chip1_read2_en11) begin//
//               CHIP1_ADDR2_10 <= 16'd0;
//               CHIP1_ADDR2_11 <= CHIP1_ADDR2_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT11[15:0];      
//             end
//             else if (chip1_read2_en12) begin//
//               CHIP1_ADDR2_11 <= 16'd0;
//               CHIP1_ADDR2_12 <= CHIP1_ADDR2_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT12[15:0];      
//             end

//             else if (chip2_read2_en1) begin//
//               CHIP1_ADDR2_12 <= 16'd0;
//               CHIP2_ADDR2_1 <= CHIP2_ADDR2_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT1[15:0];      
//             end
//             else if (chip2_read2_en2) begin//
//               CHIP2_ADDR2_1 <= 16'd0;
//               CHIP2_ADDR2_2 <= CHIP2_ADDR2_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT2[15:0];      
//             end
//             else if (chip2_read2_en3) begin//
//               CHIP2_ADDR2_2 <= 16'd0;
//               CHIP2_ADDR2_3 <= CHIP2_ADDR2_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT3[15:0];      
//             end
//             else if (chip2_read2_en4) begin//
//               CHIP2_ADDR2_3 <= 16'd0;
//               CHIP2_ADDR2_4 <= CHIP2_ADDR2_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT4[15:0];      
//             end
//             else if (chip2_read2_en5) begin//
//               CHIP2_ADDR2_4 <= 16'd0;
//               CHIP2_ADDR2_5 <= CHIP2_ADDR2_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT5[15:0];      
//             end
//             else if (chip2_read2_en6) begin//
//               CHIP2_ADDR2_5 <= 16'd0;
//               CHIP2_ADDR2_6 <= CHIP2_ADDR2_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT6[15:0];      
//             end
//             else if (chip2_read2_en7) begin//
//               CHIP2_ADDR2_6 <= 16'd0;
//               CHIP2_ADDR2_7 <= CHIP2_ADDR2_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT7[15:0];      
//             end
//             else if (chip2_read2_en8) begin//
//               CHIP2_ADDR2_7 <= 16'd0;
//               CHIP2_ADDR2_8 <= CHIP2_ADDR2_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT8[15:0];      
//             end
//             else if (chip2_read2_en9) begin//
//               CHIP2_ADDR2_8 <= 16'd0;
//               CHIP2_ADDR2_9 <= CHIP2_ADDR2_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT9[15:0];      
//             end
//             else if (chip2_read2_en10) begin//
//               CHIP2_ADDR2_9 <= 16'd0;
//               CHIP2_ADDR2_10 <= CHIP2_ADDR2_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT10[15:0];      
//             end
//             else if (chip2_read2_en11) begin//
//               CHIP2_ADDR2_10 <= 16'd0;
//               CHIP2_ADDR2_11 <= CHIP2_ADDR2_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT11[15:0];      
//             end
//             else if (chip2_read2_en12) begin//
//               CHIP2_ADDR2_11 <= 16'd0;
//               CHIP2_ADDR2_12 <= CHIP2_ADDR2_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT12[15:0];      
//             end

//             else if (chip3_read2_en1) begin//
//               CHIP2_ADDR2_12 <= 16'd0;
//               CHIP3_ADDR2_1 <= CHIP3_ADDR2_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT1[15:0];      
//             end
//             else if (chip3_read2_en2) begin//
//               CHIP3_ADDR2_1 <= 16'd0;
//               CHIP3_ADDR2_2 <= CHIP3_ADDR2_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT2[15:0];      
//             end
//             else if (chip3_read2_en3) begin//
//               CHIP3_ADDR2_2 <= 16'd0;
//               CHIP3_ADDR2_3 <= CHIP3_ADDR2_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT3[15:0];      
//             end
//             else if (chip3_read2_en4) begin//
//               CHIP3_ADDR2_3 <= 16'd0;
//               CHIP3_ADDR2_4 <= CHIP3_ADDR2_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT4[15:0];      
//             end
//             else if (chip3_read2_en5) begin//
//               CHIP3_ADDR2_4 <= 16'd0;
//               CHIP3_ADDR2_5 <= CHIP3_ADDR2_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT5[15:0];      
//             end
//             else if (chip3_read2_en6) begin//
//               CHIP3_ADDR2_5 <= 16'd0;
//               CHIP3_ADDR2_6 <= CHIP3_ADDR2_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT6[15:0];      
//             end
//             else if (chip3_read2_en7) begin//
//               CHIP3_ADDR2_6 <= 16'd0;
//               CHIP3_ADDR2_7 <= CHIP3_ADDR2_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT7[15:0];      
//             end
//             else if (chip3_read2_en8) begin//
//               CHIP3_ADDR2_7 <= 16'd0;
//               CHIP3_ADDR2_8 <= CHIP3_ADDR2_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT8[15:0];      
//             end
//             else if (chip3_read2_en9) begin//
//               CHIP3_ADDR2_8 <= 16'd0;
//               CHIP3_ADDR2_9 <= CHIP3_ADDR2_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT9[15:0];      
//             end
//             else if (chip3_read2_en10) begin//
//               CHIP3_ADDR2_9 <= 16'd0;
//               CHIP3_ADDR2_10 <= CHIP3_ADDR2_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT10[15:0];      
//             end
//             else if (chip3_read2_en11) begin//
//               CHIP3_ADDR2_10 <= 16'd0;
//               CHIP3_ADDR2_11 <= CHIP3_ADDR2_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT11[15:0];      
//             end
//             else if (chip3_read2_en12) begin//
//               CHIP3_ADDR2_11 <= 16'd0;
//               CHIP3_ADDR2_12 <= CHIP3_ADDR2_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT12[15:0];      
//             end


//             else if (chip4_read2_en1) begin//
//               CHIP3_ADDR2_12 <= 16'd0;
//               CHIP4_ADDR2_1 <= CHIP4_ADDR2_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT1[15:0];      
//             end
//             else if (chip4_read2_en2) begin//
//               CHIP4_ADDR2_1 <= 16'd0;
//               CHIP4_ADDR2_2 <= CHIP4_ADDR2_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT2[15:0];      
//             end
//             else if (chip4_read2_en3) begin//
//               CHIP4_ADDR2_2 <= 16'd0;
//               CHIP4_ADDR2_3 <= CHIP4_ADDR2_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT3[15:0];      
//             end
//             else if (chip4_read2_en4) begin//
//               CHIP4_ADDR2_3 <= 16'd0;
//               CHIP4_ADDR2_4 <= CHIP4_ADDR2_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT4[15:0];      
//             end
//             else if (chip4_read2_en5) begin//
//               CHIP4_ADDR2_4 <= 16'd0;
//               CHIP4_ADDR2_5 <= CHIP4_ADDR2_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT5[15:0];      
//             end
//             else if (chip4_read2_en6) begin//
//               CHIP4_ADDR2_5 <= 16'd0;
//               CHIP4_ADDR2_6 <= CHIP4_ADDR2_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT6[15:0];      
//             end
//             else if (chip4_read2_en7) begin//
//               CHIP4_ADDR2_6 <= 16'd0;
//               CHIP4_ADDR2_7 <= CHIP4_ADDR2_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT7[15:0];      
//             end
//             else if (chip4_read2_en8) begin//
//               CHIP4_ADDR2_7 <= 16'd0;
//               CHIP4_ADDR2_8 <= CHIP4_ADDR2_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT8[15:0];      
//             end
//             else if (chip4_read2_en9) begin//
//               CHIP4_ADDR2_8 <= 16'd0;
//               CHIP4_ADDR2_9 <= CHIP4_ADDR2_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT9[15:0];      
//             end
//             else if (chip4_read2_en10) begin//
//               CHIP4_ADDR2_9 <= 16'd0;
//               CHIP4_ADDR2_10 <= CHIP4_ADDR2_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT10[15:0];      
//             end
//             else if (chip4_read2_en11) begin//
//               CHIP4_ADDR2_10 <= 16'd0;
//               CHIP4_ADDR2_11 <= CHIP4_ADDR2_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT11[15:0];      
//             end
//             else if (chip4_read2_en12) begin//
//               CHIP4_ADDR2_11 <= 16'd0;
//               CHIP4_ADDR2_12 <= CHIP4_ADDR2_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT12[15:0];      
//             end


//             else if (chip5_read2_en1) begin//
//               CHIP4_ADDR2_12 <= 16'd0;
//               CHIP5_ADDR2_1 <= CHIP5_ADDR2_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT1[15:0];      
//             end
//             else if (chip5_read2_en2) begin//
//               CHIP5_ADDR2_1 <= 16'd0;
//               CHIP5_ADDR2_2 <= CHIP5_ADDR2_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT2[15:0];      
//             end
//             else if (chip5_read2_en3) begin//
//               CHIP5_ADDR2_2 <= 16'd0;
//               CHIP5_ADDR2_3 <= CHIP5_ADDR2_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT3[15:0];      
//             end
//             else if (chip5_read2_en4) begin//
//               CHIP5_ADDR2_3 <= 16'd0;
//               CHIP5_ADDR2_4 <= CHIP5_ADDR2_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT4[15:0];      
//             end
//             else if (chip5_read2_en5) begin//
//               CHIP5_ADDR2_4 <= 16'd0;
//               CHIP5_ADDR2_5 <= CHIP5_ADDR2_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT5[15:0];      
//             end
//             else if (chip5_read2_en6) begin//
//               CHIP5_ADDR2_5 <= 16'd0;
//               CHIP5_ADDR2_6 <= CHIP5_ADDR2_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT6[15:0];      
//             end
//             else if (chip5_read2_en7) begin//
//               CHIP5_ADDR2_6 <= 16'd0;
//               CHIP5_ADDR2_7 <= CHIP5_ADDR2_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT7[15:0];      
//             end
//             else if (chip5_read2_en8) begin//
//               CHIP5_ADDR2_7 <= 16'd0;
//               CHIP5_ADDR2_8 <= CHIP5_ADDR2_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT8[15:0];      
//             end
//             else if (chip5_read2_en9) begin//
//               CHIP5_ADDR2_8 <= 16'd0;
//               CHIP5_ADDR2_9 <= CHIP5_ADDR2_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT9[15:0];      
//             end
//             else if (chip5_read2_en10) begin//
//               CHIP5_ADDR2_9 <= 16'd0;
//               CHIP5_ADDR2_10 <= CHIP5_ADDR2_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT10[15:0];      
//             end
//             else if (chip5_read2_en11) begin//
//               CHIP5_ADDR2_10 <= 16'd0;
//               CHIP5_ADDR2_11 <= CHIP5_ADDR2_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT11[15:0];      
//             end
//             else if (chip5_read2_en12) begin//
//               CHIP5_ADDR2_11 <= 16'd0;
//               CHIP5_ADDR2_12 <= CHIP5_ADDR2_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT12[15:0];      
//             end

//             else if (chip6_read2_en1) begin//
//               CHIP5_ADDR2_12 <= 16'd0;
//               CHIP6_ADDR2_1 <= CHIP6_ADDR2_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT1[15:0];      
//             end
//             else if (chip6_read2_en2) begin//
//               CHIP6_ADDR2_1 <= 16'd0;
//               CHIP6_ADDR2_2 <= CHIP6_ADDR2_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT2[15:0];      
//             end
//             else if (chip6_read2_en3) begin//
//               CHIP6_ADDR2_2 <= 16'd0;
//               CHIP6_ADDR2_3 <= CHIP6_ADDR2_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT3[15:0];      
//             end
//             else if (chip6_read2_en4) begin//
//               CHIP6_ADDR2_3 <= 16'd0;
//               CHIP6_ADDR2_4 <= CHIP6_ADDR2_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT4[15:0];      
//             end
//             else if (chip6_read2_en5) begin//
//               CHIP6_ADDR2_4 <= 16'd0;
//               CHIP6_ADDR2_5 <= CHIP6_ADDR2_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT5[15:0];      
//             end
//             else if (chip6_read2_en6) begin//
//               CHIP6_ADDR2_5 <= 16'd0;
//               CHIP6_ADDR2_6 <= CHIP6_ADDR2_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT6[15:0];      
//             end
//             else if (chip6_read2_en7) begin//
//               CHIP6_ADDR2_6 <= 16'd0;
//               CHIP6_ADDR2_7 <= CHIP6_ADDR2_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT7[15:0];      
//             end
//             else if (chip6_read2_en8) begin//
//               CHIP6_ADDR2_7 <= 16'd0;
//               CHIP6_ADDR2_8 <= CHIP6_ADDR2_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT8[15:0];      
//             end
//             else if (chip6_read2_en9) begin//
//               CHIP6_ADDR2_8 <= 16'd0;
//               CHIP6_ADDR2_9 <= CHIP6_ADDR2_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT9[15:0];      
//             end
//             else if (chip6_read2_en10) begin//
//               CHIP6_ADDR2_9 <= 16'd0;
//               CHIP6_ADDR2_10 <= CHIP6_ADDR2_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT10[15:0];      
//             end
//             else if (chip6_read2_en11) begin//
//               CHIP6_ADDR2_10 <= 16'd0;
//               CHIP6_ADDR2_11 <= CHIP6_ADDR2_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT11[15:0];      
//             end
//             else if (chip6_read2_en12) begin//
//               CHIP6_ADDR2_11 <= 16'd0;
//               CHIP6_ADDR2_12 <= CHIP6_ADDR2_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT12[15:0];      
//             end


//             else if (chip7_read2_en1) begin//
//               CHIP6_ADDR2_12 <= 16'd0;
//               CHIP7_ADDR2_1 <= CHIP7_ADDR2_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT1[15:0];      
//             end
//             else if (chip7_read2_en2) begin//
//               CHIP7_ADDR2_1 <= 16'd0;
//               CHIP7_ADDR2_2 <= CHIP7_ADDR2_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT2[15:0];      
//             end
//             else if (chip7_read2_en3) begin//
//               CHIP7_ADDR2_2 <= 16'd0;
//               CHIP7_ADDR2_3 <= CHIP7_ADDR2_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT3[15:0];      
//             end
//             else if (chip7_read2_en4) begin//
//               CHIP7_ADDR2_3 <= 16'd0;
//               CHIP7_ADDR2_4 <= CHIP7_ADDR2_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT4[15:0];      
//             end
//             else if (chip7_read2_en5) begin//
//               CHIP7_ADDR2_4 <= 16'd0;
//               CHIP7_ADDR2_5 <= CHIP7_ADDR2_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT5[15:0];      
//             end
//             else if (chip7_read2_en6) begin//
//               CHIP7_ADDR2_5 <= 16'd0;
//               CHIP7_ADDR2_6 <= CHIP7_ADDR2_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT6[15:0];      
//             end
//             else if (chip7_read2_en7) begin//
//               CHIP7_ADDR2_6 <= 16'd0;
//               CHIP7_ADDR2_7 <= CHIP7_ADDR2_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT7[15:0];      
//             end
//             else if (chip7_read2_en8) begin//
//               CHIP7_ADDR2_7 <= 16'd0;
//               CHIP7_ADDR2_8 <= CHIP7_ADDR2_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT8[15:0];      
//             end
//             else if (chip7_read2_en9) begin//
//               CHIP7_ADDR2_8 <= 16'd0;
//               CHIP7_ADDR2_9 <= CHIP7_ADDR2_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT9[15:0];      
//             end
//             else if (chip7_read2_en10) begin//
//               CHIP7_ADDR2_9 <= 16'd0;
//               CHIP7_ADDR2_10 <= CHIP7_ADDR2_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT10[15:0];      
//             end
//             else if (chip7_read2_en11) begin//
//               CHIP7_ADDR2_10 <= 16'd0;
//               CHIP7_ADDR2_11 <= CHIP7_ADDR2_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT11[15:0];      
//             end
//             else if (chip7_read2_en12) begin//
//               CHIP7_ADDR2_11 <= 16'd0;
//               CHIP7_ADDR2_12 <= CHIP7_ADDR2_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT12[15:0];      
//             end


//             else if (chip8_read2_en1) begin//
//               CHIP7_ADDR2_12 <= 16'd0;
//               CHIP8_ADDR2_1 <= CHIP8_ADDR2_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT1[15:0];      
//             end
//             else if (chip8_read2_en2) begin//
//               CHIP8_ADDR2_1 <= 16'd0;
//               CHIP8_ADDR2_2 <= CHIP8_ADDR2_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT2[15:0];      
//             end
//             else if (chip8_read2_en3) begin//
//               CHIP8_ADDR2_2 <= 16'd0;
//               CHIP8_ADDR2_3 <= CHIP8_ADDR2_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT3[15:0];      
//             end
//             else if (chip8_read2_en4) begin//
//               CHIP8_ADDR2_3 <= 16'd0;
//               CHIP8_ADDR2_4 <= CHIP8_ADDR2_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT4[15:0];      
//             end
//             else if (chip8_read2_en5) begin//
//               CHIP8_ADDR2_4 <= 16'd0;
//               CHIP8_ADDR2_5 <= CHIP8_ADDR2_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT5[15:0];      
//             end
//             else if (chip8_read2_en6) begin//
//               CHIP8_ADDR2_5 <= 16'd0;
//               CHIP8_ADDR2_6 <= CHIP8_ADDR2_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT6[15:0];      
//             end
//             else if (chip8_read2_en7) begin//
//               CHIP8_ADDR2_6 <= 16'd0;
//               CHIP8_ADDR2_7 <= CHIP8_ADDR2_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT7[15:0];      
//             end
//             else if (chip8_read2_en8) begin//
//               CHIP8_ADDR2_7 <= 16'd0;
//               CHIP8_ADDR2_8 <= CHIP8_ADDR2_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT8[15:0];      
//             end
//             else if (chip8_read2_en9) begin//
//               CHIP8_ADDR2_8 <= 16'd0;
//               CHIP8_ADDR2_9 <= CHIP8_ADDR2_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT9[15:0];      
//             end
//             else if (chip8_read2_en10) begin//
//               CHIP8_ADDR2_9 <= 16'd0;
//               CHIP8_ADDR2_10 <= CHIP8_ADDR2_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT10[15:0];      
//             end
//             else if (chip8_read2_en11) begin//
//               CHIP8_ADDR2_10 <= 16'd0;
//               CHIP8_ADDR2_11 <= CHIP8_ADDR2_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT11[15:0];      
//             end
//             else if (chip8_read2_en12) begin//
//               CHIP8_ADDR2_11 <= 16'd0;
//               CHIP8_ADDR2_12 <= CHIP8_ADDR2_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT12[15:0];      
//             end


//             else if (chip9_read2_en1) begin//
//               CHIP8_ADDR2_12 <= 16'd0;
//               CHIP9_ADDR2_1 <= CHIP9_ADDR2_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT1[15:0];      
//             end
//             else if (chip9_read2_en2) begin//
//               CHIP9_ADDR2_1 <= 16'd0;
//               CHIP9_ADDR2_2 <= CHIP9_ADDR2_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT2[15:0];      
//             end
//             else if (chip9_read2_en3) begin//
//               CHIP9_ADDR2_2 <= 16'd0;
//               CHIP9_ADDR2_3 <= CHIP9_ADDR2_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT3[15:0];      
//             end
//             else if (chip9_read2_en4) begin//
//               CHIP9_ADDR2_3 <= 16'd0;
//               CHIP9_ADDR2_4 <= CHIP9_ADDR2_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT4[15:0];      
//             end
//             else if (chip9_read2_en5) begin//
//               CHIP9_ADDR2_4 <= 16'd0;
//               CHIP9_ADDR2_5 <= CHIP9_ADDR2_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT5[15:0];      
//             end
//             else if (chip9_read2_en6) begin//
//               CHIP9_ADDR2_5 <= 16'd0;
//               CHIP9_ADDR2_6 <= CHIP9_ADDR2_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT2[15:0];      
//             end
//             else if (chip9_read2_en7) begin//
//               CHIP9_ADDR2_6 <= 16'd0;
//               CHIP9_ADDR2_7 <= CHIP9_ADDR2_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT7[15:0];      
//             end
//             else if (chip9_read2_en8) begin//
//               CHIP9_ADDR2_7 <= 16'd0;
//               CHIP9_ADDR2_8 <= CHIP9_ADDR2_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT8[15:0];      
//             end
//             else if (chip9_read2_en9) begin//
//               CHIP9_ADDR2_8 <= 16'd0;
//               CHIP9_ADDR2_9 <= CHIP9_ADDR2_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT9[15:0];      
//             end
//             else if (chip9_read2_en10) begin//
//               CHIP9_ADDR2_9 <= 16'd0;
//               CHIP9_ADDR2_10 <= CHIP9_ADDR2_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT10[15:0];      
//             end
//             else if (chip9_read2_en11) begin//
//               CHIP9_ADDR2_10 <= 16'd0;
//               CHIP9_ADDR2_11 <= CHIP9_ADDR2_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT11[15:0];      
//             end
//             else if (chip9_read2_en12) begin//
//               CHIP9_ADDR2_11 <= 16'd0;
//               CHIP9_ADDR2_12 <= CHIP9_ADDR2_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT12[15:0];      
//             end


//             else if (chip10_read2_en1) begin//
//               CHIP9_ADDR2_12 <= 16'd0;
//               CHIP10_ADDR2_1 <= CHIP10_ADDR2_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT1[15:0];      
//             end
//             else if (chip10_read2_en2) begin//
//               CHIP10_ADDR2_1 <= 16'd0;
//               CHIP10_ADDR2_2 <= CHIP10_ADDR2_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT2[15:0];      
//             end
//             else if (chip10_read2_en3) begin//
//               CHIP10_ADDR2_2 <= 16'd0;
//               CHIP10_ADDR2_3 <= CHIP10_ADDR2_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT3[15:0];      
//             end
//             else if (chip10_read2_en4) begin//
//               CHIP10_ADDR2_3 <= 16'd0;
//               CHIP10_ADDR2_4 <= CHIP10_ADDR2_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT4[15:0];      
//             end
//             else if (chip10_read2_en5) begin//
//               CHIP10_ADDR2_4 <= 16'd0;
//               CHIP10_ADDR2_5 <= CHIP10_ADDR2_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT5[15:0];      
//             end
//             else if (chip10_read2_en6) begin//
//               CHIP10_ADDR2_5 <= 16'd0;
//               CHIP10_ADDR2_6 <= CHIP10_ADDR2_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT6[15:0];      
//             end
//             else if (chip10_read2_en7) begin//
//               CHIP10_ADDR2_6 <= 16'd0;
//               CHIP10_ADDR2_7 <= CHIP10_ADDR2_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT7[15:0];      
//             end
//             else if (chip10_read2_en8) begin//
//               CHIP10_ADDR2_7 <= 16'd0;
//               CHIP10_ADDR2_8 <= CHIP10_ADDR2_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT8[15:0];      
//             end
//             else if (chip10_read2_en9) begin//
//               CHIP10_ADDR2_8 <= 16'd0;
//               CHIP10_ADDR2_9 <= CHIP10_ADDR2_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT9[15:0];      
//             end
//             else if (chip10_read2_en10) begin//
//               CHIP10_ADDR2_9 <= 16'd0;
//               CHIP10_ADDR2_10 <= CHIP10_ADDR2_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT10[15:0];      
//             end
//             else if (chip10_read2_en11) begin//
//               CHIP10_ADDR2_10 <= 16'd0;
//               CHIP10_ADDR2_11 <= CHIP10_ADDR2_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT11[15:0];      
//             end
//             else if (chip10_read2_en12) begin//
//               CHIP10_ADDR2_11 <= 16'd0;
//               CHIP10_ADDR2_12 <= CHIP10_ADDR2_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT12[15:0];      
//             end



//             else if (chip11_read2_en1) begin//
//               CHIP10_ADDR2_12 <= 10'd0;
//               CHIP11_ADDR2_1 <= CHIP11_ADDR2_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT1[15:0];      
//             end
//             else if (chip11_read2_en2) begin//
//               CHIP11_ADDR2_1 <= 10'd0;
//               CHIP11_ADDR2_2 <= CHIP11_ADDR2_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT2[15:0];     
//             end
//             else if (chip11_read2_en3) begin//
//               CHIP11_ADDR2_2 <= 10'd0;
//               CHIP11_ADDR2_3 <= CHIP11_ADDR2_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT3[15:0];       
//             end
//             else if (chip11_read2_en4) begin//
//               CHIP11_ADDR2_3 <= 10'd0;
//               CHIP11_ADDR2_4 <= CHIP11_ADDR2_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT4[15:0];    
//             end
//             else if (chip11_read2_en5) begin//
//               CHIP11_ADDR2_4 <= 10'd0;
//               CHIP11_ADDR2_5 <= CHIP11_ADDR2_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT5[15:0];     
//             end
//             else if (chip11_read2_en6) begin//
//               CHIP11_ADDR2_5 <= 10'd0;
//               CHIP11_ADDR2_6 <= CHIP11_ADDR2_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT6[15:0];      
//             end
//             else if (chip11_read2_en7) begin//
//               CHIP11_ADDR2_6 <= 10'd0;
//               CHIP11_ADDR2_7 <= CHIP11_ADDR2_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT7[15:0];    
//             end
//             else if (chip11_read2_en8) begin//
//               CHIP11_ADDR2_7 <= 10'd0;
//               CHIP11_ADDR2_8 <= CHIP11_ADDR2_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT8[15:0];      
//             end
//             else if (chip11_read2_en9) begin//
//               CHIP11_ADDR2_8 <= 10'd0;
//               CHIP11_ADDR2_9 <= CHIP11_ADDR2_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT9[15:0];      
//             end
//             else if (chip11_read2_en10) begin//
//               CHIP11_ADDR2_9 <= 10'd0;
//               CHIP11_ADDR2_10 <= CHIP11_ADDR2_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT10[15:0];     
//             end
//             else if (chip11_read2_en11) begin//
//               CHIP11_ADDR2_10 <= 10'd0;
//               CHIP11_ADDR2_11 <= CHIP11_ADDR2_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT11[15:0];      
//             end
//             else if (chip11_read2_en12) begin//
//               CHIP11_ADDR2_11 <= 10'd0;
//               CHIP11_ADDR2_12 <= CHIP11_ADDR2_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT12[15:0];      
//             end


//             else if (chip12_read2_en1) begin//
//               CHIP11_ADDR2_12 <= 10'd0;
//               CHIP12_ADDR2_1 <= CHIP12_ADDR2_1+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT1[15:0];       
//             end
//             else if (chip12_read2_en2) begin//
//               CHIP12_ADDR2_1 <= 10'd0;
//               CHIP12_ADDR2_2 <= CHIP12_ADDR2_2+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT2[15:0];      
//             end
//             else if (chip12_read2_en3) begin//
//               CHIP12_ADDR2_2 <= 10'd0;
//               CHIP12_ADDR2_3 <= CHIP12_ADDR2_3+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT3[15:0];     
//             end
//             else if (chip12_read2_en4) begin//
//               CHIP12_ADDR2_3 <= 10'd0;
//               CHIP12_ADDR2_4 <= CHIP12_ADDR2_4+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT4[15:0];        
//             end
//             else if (chip12_read2_en5) begin//
//               CHIP12_ADDR2_4 <= 10'd0;
//               CHIP12_ADDR2_5 <= CHIP12_ADDR2_5+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT5[15:0];     
//             end
//             else if (chip12_read2_en6) begin//
//               CHIP12_ADDR2_5 <= 10'd0;
//               CHIP12_ADDR2_6 <= CHIP12_ADDR2_6+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT6[15:0];      
//             end
//             else if (chip12_read2_en7) begin//
//               CHIP12_ADDR2_6 <= 10'd0;
//               CHIP12_ADDR2_7 <= CHIP12_ADDR2_7+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT7[15:0];       
//             end
//             else if (chip12_read2_en8) begin//
//               CHIP12_ADDR2_7 <= 10'd0;
//               CHIP12_ADDR2_8 <= CHIP12_ADDR2_8+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT8[15:0];    
//             end
//             else if (chip12_read2_en9) begin//
//               CHIP12_ADDR2_8 <= 10'd0;
//               CHIP12_ADDR2_9 <= CHIP12_ADDR2_9+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT9[15:0];      
//             end
//             else if (chip12_read2_en10) begin//
//               CHIP12_ADDR2_9 <= 10'd0;
//               CHIP12_ADDR2_10 <= CHIP12_ADDR2_10+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT10[15:0];      
//             end
//             else if (chip12_read2_en11) begin//
//               CHIP12_ADDR2_10 <= 10'd0;
//               CHIP12_ADDR2_11 <= CHIP12_ADDR2_11+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT11[15:0];      
//             end
//             else if (chip12_read2_en12) begin//
//               CHIP12_ADDR2_11 <= 10'd0;
//               CHIP12_ADDR2_12 <= CHIP12_ADDR2_12+1'b1;
//               RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT12[15:0];      
//             end
//             else if (readx_end) begin//
//               CHIP1_ADDR1_1   <= 10'b0;
//               CHIP1_ADDR1_2   <= 10'b0;
//               CHIP1_ADDR1_3   <= 10'b0;
//               CHIP1_ADDR1_4   <= 10'b0;
//               CHIP1_ADDR1_5   <= 10'b0;
//               CHIP1_ADDR1_6   <= 10'b0;
//               CHIP1_ADDR1_7   <= 10'b0;
//               CHIP1_ADDR1_8   <= 10'b0;
//               CHIP1_ADDR1_9   <= 10'b0;
//               CHIP1_ADDR1_10  <= 10'b0;
//               CHIP1_ADDR1_11  <= 10'b0;
//               CHIP1_ADDR1_12  <= 10'b0;
//               CHIP1_ADDR2_1   <= 10'b0;
//               CHIP1_ADDR2_2   <= 10'b0;
//               CHIP1_ADDR2_3   <= 10'b0;
//               CHIP1_ADDR2_4   <= 10'b0;
//               CHIP1_ADDR2_5   <= 10'b0;
//               CHIP1_ADDR2_6   <= 10'b0;
//               CHIP1_ADDR2_7   <= 10'b0;
//               CHIP1_ADDR2_8   <= 10'b0;
//               CHIP1_ADDR2_9   <= 10'b0;
//               CHIP1_ADDR2_10  <= 10'b0;
//               CHIP1_ADDR2_11  <= 10'b0;
//               CHIP1_ADDR2_12  <= 10'b0;


//               CHIP2_ADDR1_1   <= 10'b0;
//               CHIP2_ADDR1_2   <= 10'b0;
//               CHIP2_ADDR1_3   <= 10'b0;
//               CHIP2_ADDR1_4   <= 10'b0;
//               CHIP2_ADDR1_5   <= 10'b0;
//               CHIP2_ADDR1_6   <= 10'b0;
//               CHIP2_ADDR1_7   <= 10'b0;
//               CHIP2_ADDR1_8   <= 10'b0;
//               CHIP2_ADDR1_9   <= 10'b0;
//               CHIP2_ADDR1_10  <= 10'b0;
//               CHIP2_ADDR1_11  <= 10'b0;
//               CHIP2_ADDR1_12  <= 10'b0;
//               CHIP2_ADDR2_1   <= 10'b0;
//               CHIP2_ADDR2_2   <= 10'b0;
//               CHIP2_ADDR2_3   <= 10'b0;
//               CHIP2_ADDR2_4   <= 10'b0;
//               CHIP2_ADDR2_5   <= 10'b0;
//               CHIP2_ADDR2_6   <= 10'b0;
//               CHIP2_ADDR2_7   <= 10'b0;
//               CHIP2_ADDR2_8   <= 10'b0;
//               CHIP2_ADDR2_9   <= 10'b0;
//               CHIP2_ADDR2_10  <= 10'b0;
//               CHIP2_ADDR2_11  <= 10'b0;
//               CHIP2_ADDR2_12  <= 10'b0;


//               CHIP3_ADDR1_1   <= 10'b0;
//               CHIP3_ADDR1_2   <= 10'b0;
//               CHIP3_ADDR1_3   <= 10'b0;
//               CHIP3_ADDR1_4   <= 10'b0;
//               CHIP3_ADDR1_5   <= 10'b0;
//               CHIP3_ADDR1_6   <= 10'b0;
//               CHIP3_ADDR1_7   <= 10'b0;
//               CHIP3_ADDR1_8   <= 10'b0;
//               CHIP3_ADDR1_9   <= 10'b0;
//               CHIP3_ADDR1_10  <= 10'b0;
//               CHIP3_ADDR1_11  <= 10'b0;
//               CHIP3_ADDR1_12  <= 10'b0;
//               CHIP3_ADDR2_1   <= 10'b0;
//               CHIP3_ADDR2_2   <= 10'b0;
//               CHIP3_ADDR2_3   <= 10'b0;
//               CHIP3_ADDR2_4   <= 10'b0;
//               CHIP3_ADDR2_5   <= 10'b0;
//               CHIP3_ADDR2_6   <= 10'b0;
//               CHIP3_ADDR2_7   <= 10'b0;
//               CHIP3_ADDR2_8   <= 10'b0;
//               CHIP3_ADDR2_9   <= 10'b0;
//               CHIP3_ADDR2_10  <= 10'b0;
//               CHIP3_ADDR2_11  <= 10'b0;
//               CHIP3_ADDR2_12  <= 10'b0;


//               CHIP4_ADDR1_1   <= 10'b0;
//               CHIP4_ADDR1_2   <= 10'b0;
//               CHIP4_ADDR1_3   <= 10'b0;
//               CHIP4_ADDR1_4   <= 10'b0;
//               CHIP4_ADDR1_5   <= 10'b0;
//               CHIP4_ADDR1_6   <= 10'b0;
//               CHIP4_ADDR1_7   <= 10'b0;
//               CHIP4_ADDR1_8   <= 10'b0;
//               CHIP4_ADDR1_9   <= 10'b0;
//               CHIP4_ADDR1_10  <= 10'b0;
//               CHIP4_ADDR1_11  <= 10'b0;
//               CHIP4_ADDR1_12  <= 10'b0;
//               CHIP4_ADDR2_1   <= 10'b0;
//               CHIP4_ADDR2_2   <= 10'b0;
//               CHIP4_ADDR2_3   <= 10'b0;
//               CHIP4_ADDR2_4   <= 10'b0;
//               CHIP4_ADDR2_5   <= 10'b0;
//               CHIP4_ADDR2_6   <= 10'b0;
//               CHIP4_ADDR2_7   <= 10'b0;
//               CHIP4_ADDR2_8   <= 10'b0;
//               CHIP4_ADDR2_9   <= 10'b0;
//               CHIP4_ADDR2_10  <= 10'b0;
//               CHIP4_ADDR2_11  <= 10'b0;
//               CHIP4_ADDR2_12  <= 10'b0;


//               CHIP5_ADDR1_1   <= 10'b0;
//               CHIP5_ADDR1_2   <= 10'b0;
//               CHIP5_ADDR1_3   <= 10'b0;
//               CHIP5_ADDR1_4   <= 10'b0;
//               CHIP5_ADDR1_5   <= 10'b0;
//               CHIP5_ADDR1_6   <= 10'b0;
//               CHIP5_ADDR1_7   <= 10'b0;
//               CHIP5_ADDR1_8   <= 10'b0;
//               CHIP5_ADDR1_9   <= 10'b0;
//               CHIP5_ADDR1_10  <= 10'b0;
//               CHIP5_ADDR1_11  <= 10'b0;
//               CHIP5_ADDR1_12  <= 10'b0;
//               CHIP5_ADDR2_1   <= 10'b0;
//               CHIP5_ADDR2_2   <= 10'b0;
//               CHIP5_ADDR2_3   <= 10'b0;
//               CHIP5_ADDR2_4   <= 10'b0;
//               CHIP5_ADDR2_5   <= 10'b0;
//               CHIP5_ADDR2_6   <= 10'b0;
//               CHIP5_ADDR2_7   <= 10'b0;
//               CHIP5_ADDR2_8   <= 10'b0;
//               CHIP5_ADDR2_9   <= 10'b0;
//               CHIP5_ADDR2_10  <= 10'b0;
//               CHIP5_ADDR2_11  <= 10'b0;
//               CHIP5_ADDR2_12  <= 10'b0;


//               CHIP6_ADDR1_1   <= 10'b0;
//               CHIP6_ADDR1_2   <= 10'b0;
//               CHIP6_ADDR1_3   <= 10'b0;
//               CHIP6_ADDR1_4   <= 10'b0;
//               CHIP6_ADDR1_5   <= 10'b0;
//               CHIP6_ADDR1_6   <= 10'b0;
//               CHIP6_ADDR1_7   <= 10'b0;
//               CHIP6_ADDR1_8   <= 10'b0;
//               CHIP6_ADDR1_9   <= 10'b0;
//               CHIP6_ADDR1_10  <= 10'b0;
//               CHIP6_ADDR1_11  <= 10'b0;
//               CHIP6_ADDR1_12  <= 10'b0;
//               CHIP6_ADDR2_1   <= 10'b0;
//               CHIP6_ADDR2_2   <= 10'b0;
//               CHIP6_ADDR2_3   <= 10'b0;
//               CHIP6_ADDR2_4   <= 10'b0;
//               CHIP6_ADDR2_5   <= 10'b0;
//               CHIP6_ADDR2_6   <= 10'b0;
//               CHIP6_ADDR2_7   <= 10'b0;
//               CHIP6_ADDR2_8   <= 10'b0;
//               CHIP6_ADDR2_9   <= 10'b0;
//               CHIP6_ADDR2_10  <= 10'b0;
//               CHIP6_ADDR2_11  <= 10'b0;
//               CHIP6_ADDR2_12  <= 10'b0;


//               CHIP7_ADDR1_1   <= 10'b0;
//               CHIP7_ADDR1_2   <= 10'b0;
//               CHIP7_ADDR1_3   <= 10'b0;
//               CHIP7_ADDR1_4   <= 10'b0;
//               CHIP7_ADDR1_5   <= 10'b0;
//               CHIP7_ADDR1_6   <= 10'b0;
//               CHIP7_ADDR1_7   <= 10'b0;
//               CHIP7_ADDR1_8   <= 10'b0;
//               CHIP7_ADDR1_9   <= 10'b0;
//               CHIP7_ADDR1_10  <= 10'b0;
//               CHIP7_ADDR1_11  <= 10'b0;
//               CHIP7_ADDR1_12  <= 10'b0;
//               CHIP7_ADDR2_1   <= 10'b0;
//               CHIP7_ADDR2_2   <= 10'b0;
//               CHIP7_ADDR2_3   <= 10'b0;
//               CHIP7_ADDR2_4   <= 10'b0;
//               CHIP7_ADDR2_5   <= 10'b0;
//               CHIP7_ADDR2_6   <= 10'b0;
//               CHIP7_ADDR2_7   <= 10'b0;
//               CHIP7_ADDR2_8   <= 10'b0;
//               CHIP7_ADDR2_9   <= 10'b0;
//               CHIP7_ADDR2_10  <= 10'b0;
//               CHIP7_ADDR2_11  <= 10'b0;
//               CHIP7_ADDR2_12  <= 10'b0;


//               CHIP8_ADDR1_1   <= 10'b0;
//               CHIP8_ADDR1_2   <= 10'b0;
//               CHIP8_ADDR1_3   <= 10'b0;
//               CHIP8_ADDR1_4   <= 10'b0;
//               CHIP8_ADDR1_5   <= 10'b0;
//               CHIP8_ADDR1_6   <= 10'b0;
//               CHIP8_ADDR1_7   <= 10'b0;
//               CHIP8_ADDR1_8   <= 10'b0;
//               CHIP8_ADDR1_9   <= 10'b0;
//               CHIP8_ADDR1_10  <= 10'b0;
//               CHIP8_ADDR1_11  <= 10'b0;
//               CHIP8_ADDR1_12  <= 10'b0;
//               CHIP8_ADDR2_1   <= 10'b0;
//               CHIP8_ADDR2_2   <= 10'b0;
//               CHIP8_ADDR2_3   <= 10'b0;
//               CHIP8_ADDR2_4   <= 10'b0;
//               CHIP8_ADDR2_5   <= 10'b0;
//               CHIP8_ADDR2_6   <= 10'b0;
//               CHIP8_ADDR2_7   <= 10'b0;
//               CHIP8_ADDR2_8   <= 10'b0;
//               CHIP8_ADDR2_9   <= 10'b0;
//               CHIP8_ADDR2_10  <= 10'b0;
//               CHIP8_ADDR2_11  <= 10'b0;
//               CHIP8_ADDR2_12  <= 10'b0;


//               CHIP9_ADDR1_1   <= 10'b0;
//               CHIP9_ADDR1_2   <= 10'b0;
//               CHIP9_ADDR1_3   <= 10'b0;
//               CHIP9_ADDR1_4   <= 10'b0;
//               CHIP9_ADDR1_5   <= 10'b0;
//               CHIP9_ADDR1_6   <= 10'b0;
//               CHIP9_ADDR1_7   <= 10'b0;
//               CHIP9_ADDR1_8   <= 10'b0;
//               CHIP9_ADDR1_9   <= 10'b0;
//               CHIP9_ADDR1_10  <= 10'b0;
//               CHIP9_ADDR1_11  <= 10'b0;
//               CHIP9_ADDR1_12  <= 10'b0;
//               CHIP9_ADDR2_1   <= 10'b0;
//               CHIP9_ADDR2_2   <= 10'b0;
//               CHIP9_ADDR2_3   <= 10'b0;
//               CHIP9_ADDR2_4   <= 10'b0;
//               CHIP9_ADDR2_5   <= 10'b0;
//               CHIP9_ADDR2_6   <= 10'b0;
//               CHIP9_ADDR2_7   <= 10'b0;
//               CHIP9_ADDR2_8   <= 10'b0;
//               CHIP9_ADDR2_9   <= 10'b0;
//               CHIP9_ADDR2_10  <= 10'b0;
//               CHIP9_ADDR2_11  <= 10'b0;
//               CHIP9_ADDR2_12  <= 10'b0;


//               CHIP10_ADDR1_1   <= 10'b0;
//               CHIP10_ADDR1_2   <= 10'b0;
//               CHIP10_ADDR1_3   <= 10'b0;
//               CHIP10_ADDR1_4   <= 10'b0;
//               CHIP10_ADDR1_5   <= 10'b0;
//               CHIP10_ADDR1_6   <= 10'b0;
//               CHIP10_ADDR1_7   <= 10'b0;
//               CHIP10_ADDR1_8   <= 10'b0;
//               CHIP10_ADDR1_9   <= 10'b0;
//               CHIP10_ADDR1_10  <= 10'b0;
//               CHIP10_ADDR1_11  <= 10'b0;
//               CHIP10_ADDR1_12  <= 10'b0;
//               CHIP10_ADDR2_1   <= 10'b0;
//               CHIP10_ADDR2_2   <= 10'b0;
//               CHIP10_ADDR2_3   <= 10'b0;
//               CHIP10_ADDR2_4   <= 10'b0;
//               CHIP10_ADDR2_5   <= 10'b0;
//               CHIP10_ADDR2_6   <= 10'b0;
//               CHIP10_ADDR2_7   <= 10'b0;
//               CHIP10_ADDR2_8   <= 10'b0;
//               CHIP10_ADDR2_9   <= 10'b0;
//               CHIP10_ADDR2_10  <= 10'b0;
//               CHIP10_ADDR2_11  <= 10'b0;
//               CHIP10_ADDR2_12  <= 10'b0;


//               CHIP11_ADDR1_1   <= 10'b0;
//               CHIP11_ADDR1_2   <= 10'b0;
//               CHIP11_ADDR1_3   <= 10'b0;
//               CHIP11_ADDR1_4   <= 10'b0;
//               CHIP11_ADDR1_5   <= 10'b0;
//               CHIP11_ADDR1_6   <= 10'b0;
//               CHIP11_ADDR1_7   <= 10'b0;
//               CHIP11_ADDR1_8   <= 10'b0;
//               CHIP11_ADDR1_9   <= 10'b0;
//               CHIP11_ADDR1_10  <= 10'b0;
//               CHIP11_ADDR1_11  <= 10'b0;
//               CHIP11_ADDR1_12  <= 10'b0;
//               CHIP11_ADDR2_1   <= 10'b0;
//               CHIP11_ADDR2_2   <= 10'b0;
//               CHIP11_ADDR2_3   <= 10'b0;
//               CHIP11_ADDR2_4   <= 10'b0;
//               CHIP11_ADDR2_5   <= 10'b0;
//               CHIP11_ADDR2_6   <= 10'b0;
//               CHIP11_ADDR2_7   <= 10'b0;
//               CHIP11_ADDR2_8   <= 10'b0;
//               CHIP11_ADDR2_9   <= 10'b0;
//               CHIP11_ADDR2_10  <= 10'b0;
//               CHIP11_ADDR2_11  <= 10'b0;
//               CHIP11_ADDR2_12  <= 10'b0;


//               CHIP12_ADDR1_1   <= 10'b0;
//               CHIP12_ADDR1_2   <= 10'b0;
//               CHIP12_ADDR1_3   <= 10'b0;
//               CHIP12_ADDR1_4   <= 10'b0;
//               CHIP12_ADDR1_5   <= 10'b0;
//               CHIP12_ADDR1_6   <= 10'b0;
//               CHIP12_ADDR1_7   <= 10'b0;
//               CHIP12_ADDR1_8   <= 10'b0;
//               CHIP12_ADDR1_9   <= 10'b0;
//               CHIP12_ADDR1_10  <= 10'b0;
//               CHIP12_ADDR1_11  <= 10'b0;
//               CHIP12_ADDR1_12  <= 10'b0;
//               CHIP12_ADDR2_1   <= 10'b0;
//               CHIP12_ADDR2_2   <= 10'b0;
//               CHIP12_ADDR2_3   <= 10'b0;
//               CHIP12_ADDR2_4   <= 10'b0;
//               CHIP12_ADDR2_5   <= 10'b0;
//               CHIP12_ADDR2_6   <= 10'b0;
//               CHIP12_ADDR2_7   <= 10'b0;
//               CHIP12_ADDR2_8   <= 10'b0;
//               CHIP12_ADDR2_9   <= 10'b0;
//               CHIP12_ADDR2_10  <= 10'b0;
//               CHIP12_ADDR2_11  <= 10'b0;
//               CHIP12_ADDR2_12  <= 10'b0;

//               RAM2FIFO[15:0]<= RAM2FIFO[15:0];  

//             end
//             else begin//



//               CHIP1_ADDR1_1   <= CHIP1_ADDR1_1;
//               CHIP1_ADDR1_2   <= CHIP1_ADDR1_2;
//               CHIP1_ADDR1_3   <= CHIP1_ADDR1_3;
//               CHIP1_ADDR1_4   <= CHIP1_ADDR1_4;
//               CHIP1_ADDR1_5   <= CHIP1_ADDR1_5;
//               CHIP1_ADDR1_6   <= CHIP1_ADDR1_6;
//               CHIP1_ADDR1_7   <= CHIP1_ADDR1_7;
//               CHIP1_ADDR1_8   <= CHIP1_ADDR1_8;
//               CHIP1_ADDR1_9   <= CHIP1_ADDR1_9;
//               CHIP1_ADDR1_10  <= CHIP1_ADDR1_10;
//               CHIP1_ADDR1_11  <= CHIP1_ADDR1_11;
//               CHIP1_ADDR1_12  <= CHIP1_ADDR1_12;
//               CHIP1_ADDR2_1   <= CHIP1_ADDR2_1;
//               CHIP1_ADDR2_2   <= CHIP1_ADDR2_2;
//               CHIP1_ADDR2_3   <= CHIP1_ADDR2_3;
//               CHIP1_ADDR2_4   <= CHIP1_ADDR2_4;
//               CHIP1_ADDR2_5   <= CHIP1_ADDR2_5;
//               CHIP1_ADDR2_6   <= CHIP1_ADDR2_6;
//               CHIP1_ADDR2_7   <= CHIP1_ADDR2_7;
//               CHIP1_ADDR2_8   <= CHIP1_ADDR2_8;
//               CHIP1_ADDR2_9   <= CHIP1_ADDR2_9;
//               CHIP1_ADDR2_10  <= CHIP1_ADDR2_10;
//               CHIP1_ADDR2_11  <= CHIP1_ADDR2_11;
//               CHIP1_ADDR2_12  <= CHIP1_ADDR2_12;

//               CHIP2_ADDR1_1   <= CHIP2_ADDR1_1;
//               CHIP2_ADDR1_2   <= CHIP2_ADDR1_2;
//               CHIP2_ADDR1_3   <= CHIP2_ADDR1_3;
//               CHIP2_ADDR1_4   <= CHIP2_ADDR1_4;
//               CHIP2_ADDR1_5   <= CHIP2_ADDR1_5;
//               CHIP2_ADDR1_6   <= CHIP2_ADDR1_6;
//               CHIP2_ADDR1_7   <= CHIP2_ADDR1_7;
//               CHIP2_ADDR1_8   <= CHIP2_ADDR1_8;
//               CHIP2_ADDR1_9   <= CHIP2_ADDR1_9;
//               CHIP2_ADDR1_10  <= CHIP2_ADDR1_10;
//               CHIP2_ADDR1_11  <= CHIP2_ADDR1_11;
//               CHIP2_ADDR1_12  <= CHIP2_ADDR1_12;
//               CHIP2_ADDR2_1   <= CHIP2_ADDR2_1;
//               CHIP2_ADDR2_2   <= CHIP2_ADDR2_2;
//               CHIP2_ADDR2_3   <= CHIP2_ADDR2_3;
//               CHIP2_ADDR2_4   <= CHIP2_ADDR2_4;
//               CHIP2_ADDR2_5   <= CHIP2_ADDR2_5;
//               CHIP2_ADDR2_6   <= CHIP2_ADDR2_6;
//               CHIP2_ADDR2_7   <= CHIP2_ADDR2_7;
//               CHIP2_ADDR2_8   <= CHIP2_ADDR2_8;
//               CHIP2_ADDR2_9   <= CHIP2_ADDR2_9;
//               CHIP2_ADDR2_10  <= CHIP2_ADDR2_10;
//               CHIP2_ADDR2_11  <= CHIP2_ADDR2_11;
//               CHIP2_ADDR2_12  <= CHIP2_ADDR2_12;

//               CHIP3_ADDR1_1   <= CHIP3_ADDR1_1;
//               CHIP3_ADDR1_2   <= CHIP3_ADDR1_2;
//               CHIP3_ADDR1_3   <= CHIP3_ADDR1_3;
//               CHIP3_ADDR1_4   <= CHIP3_ADDR1_4;
//               CHIP3_ADDR1_5   <= CHIP3_ADDR1_5;
//               CHIP3_ADDR1_6   <= CHIP3_ADDR1_6;
//               CHIP3_ADDR1_7   <= CHIP3_ADDR1_7;
//               CHIP3_ADDR1_8   <= CHIP3_ADDR1_8;
//               CHIP3_ADDR1_9   <= CHIP3_ADDR1_9;
//               CHIP3_ADDR1_10  <= CHIP3_ADDR1_10;
//               CHIP3_ADDR1_11  <= CHIP3_ADDR1_11;
//               CHIP3_ADDR1_12  <= CHIP3_ADDR1_12;
//               CHIP3_ADDR2_1   <= CHIP3_ADDR2_1;
//               CHIP3_ADDR2_2   <= CHIP3_ADDR2_2;
//               CHIP3_ADDR2_3   <= CHIP3_ADDR2_3;
//               CHIP3_ADDR2_4   <= CHIP3_ADDR2_4;
//               CHIP3_ADDR2_5   <= CHIP3_ADDR2_5;
//               CHIP3_ADDR2_6   <= CHIP3_ADDR2_6;
//               CHIP3_ADDR2_7   <= CHIP3_ADDR2_7;
//               CHIP3_ADDR2_8   <= CHIP3_ADDR2_8;
//               CHIP3_ADDR2_9   <= CHIP3_ADDR2_9;
//               CHIP3_ADDR2_10  <= CHIP3_ADDR2_10;
//               CHIP3_ADDR2_11  <= CHIP3_ADDR2_11;
//               CHIP3_ADDR2_12  <= CHIP3_ADDR2_12;


//               CHIP4_ADDR1_1   <= CHIP4_ADDR1_1;
//               CHIP4_ADDR1_2   <= CHIP4_ADDR1_2;
//               CHIP4_ADDR1_3   <= CHIP4_ADDR1_3;
//               CHIP4_ADDR1_4   <= CHIP4_ADDR1_4;
//               CHIP4_ADDR1_5   <= CHIP4_ADDR1_5;
//               CHIP4_ADDR1_6   <= CHIP4_ADDR1_6;
//               CHIP4_ADDR1_7   <= CHIP4_ADDR1_7;
//               CHIP4_ADDR1_8   <= CHIP4_ADDR1_8;
//               CHIP4_ADDR1_9   <= CHIP4_ADDR1_9;
//               CHIP4_ADDR1_10  <= CHIP4_ADDR1_10;
//               CHIP4_ADDR1_11  <= CHIP4_ADDR1_11;
//               CHIP4_ADDR1_12  <= CHIP4_ADDR1_12;
//               CHIP4_ADDR2_1   <= CHIP4_ADDR2_1;
//               CHIP4_ADDR2_2   <= CHIP4_ADDR2_2;
//               CHIP4_ADDR2_3   <= CHIP4_ADDR2_3;
//               CHIP4_ADDR2_4   <= CHIP4_ADDR2_4;
//               CHIP4_ADDR2_5   <= CHIP4_ADDR2_5;
//               CHIP4_ADDR2_6   <= CHIP4_ADDR2_6;
//               CHIP4_ADDR2_7   <= CHIP4_ADDR2_7;
//               CHIP4_ADDR2_8   <= CHIP4_ADDR2_8;
//               CHIP4_ADDR2_9   <= CHIP4_ADDR2_9;
//               CHIP4_ADDR2_10  <= CHIP4_ADDR2_10;
//               CHIP4_ADDR2_11  <= CHIP4_ADDR2_11;
//               CHIP4_ADDR2_12  <= CHIP4_ADDR2_12;


//               CHIP5_ADDR1_1   <= CHIP5_ADDR1_1;
//               CHIP5_ADDR1_2   <= CHIP5_ADDR1_2;
//               CHIP5_ADDR1_3   <= CHIP5_ADDR1_3;
//               CHIP5_ADDR1_4   <= CHIP5_ADDR1_4;
//               CHIP5_ADDR1_5   <= CHIP5_ADDR1_5;
//               CHIP5_ADDR1_6   <= CHIP5_ADDR1_6;
//               CHIP5_ADDR1_7   <= CHIP5_ADDR1_7;
//               CHIP5_ADDR1_8   <= CHIP5_ADDR1_8;
//               CHIP5_ADDR1_9   <= CHIP5_ADDR1_9;
//               CHIP5_ADDR1_10  <= CHIP5_ADDR1_10;
//               CHIP5_ADDR1_11  <= CHIP5_ADDR1_11;
//               CHIP5_ADDR1_12  <= CHIP5_ADDR1_12;
//               CHIP5_ADDR2_1   <= CHIP5_ADDR2_1;
//               CHIP5_ADDR2_2   <= CHIP5_ADDR2_2;
//               CHIP5_ADDR2_3   <= CHIP5_ADDR2_3;
//               CHIP5_ADDR2_4   <= CHIP5_ADDR2_4;
//               CHIP5_ADDR2_5   <= CHIP5_ADDR2_5;
//               CHIP5_ADDR2_6   <= CHIP5_ADDR2_6;
//               CHIP5_ADDR2_7   <= CHIP5_ADDR2_7;
//               CHIP5_ADDR2_8   <= CHIP5_ADDR2_8;
//               CHIP5_ADDR2_9   <= CHIP5_ADDR2_9;
//               CHIP5_ADDR2_10  <= CHIP5_ADDR2_10;
//               CHIP5_ADDR2_11  <= CHIP5_ADDR2_11;
//               CHIP5_ADDR2_12  <= CHIP5_ADDR2_12;

//               CHIP6_ADDR1_1   <= CHIP6_ADDR1_1;
//               CHIP6_ADDR1_2   <= CHIP6_ADDR1_2;
//               CHIP6_ADDR1_3   <= CHIP6_ADDR1_3;
//               CHIP6_ADDR1_4   <= CHIP6_ADDR1_4;
//               CHIP6_ADDR1_5   <= CHIP6_ADDR1_5;
//               CHIP6_ADDR1_6   <= CHIP6_ADDR1_6;
//               CHIP6_ADDR1_7   <= CHIP6_ADDR1_7;
//               CHIP6_ADDR1_8   <= CHIP6_ADDR1_8;
//               CHIP6_ADDR1_9   <= CHIP6_ADDR1_9;
//               CHIP6_ADDR1_10  <= CHIP6_ADDR1_10;
//               CHIP6_ADDR1_11  <= CHIP6_ADDR1_11;
//               CHIP6_ADDR1_12  <= CHIP6_ADDR1_12;
//               CHIP6_ADDR2_1   <= CHIP6_ADDR2_1;
//               CHIP6_ADDR2_2   <= CHIP6_ADDR2_2;
//               CHIP6_ADDR2_3   <= CHIP6_ADDR2_3;
//               CHIP6_ADDR2_4   <= CHIP6_ADDR2_4;
//               CHIP6_ADDR2_5   <= CHIP6_ADDR2_5;
//               CHIP6_ADDR2_6   <= CHIP6_ADDR2_6;
//               CHIP6_ADDR2_7   <= CHIP6_ADDR2_7;
//               CHIP6_ADDR2_8   <= CHIP6_ADDR2_8;
//               CHIP6_ADDR2_9   <= CHIP6_ADDR2_9;
//               CHIP6_ADDR2_10  <= CHIP6_ADDR2_10;
//               CHIP6_ADDR2_11  <= CHIP6_ADDR2_11;
//               CHIP6_ADDR2_12  <= CHIP6_ADDR2_12;

//               CHIP7_ADDR1_1   <= CHIP7_ADDR1_1;
//               CHIP7_ADDR1_2   <= CHIP7_ADDR1_2;
//               CHIP7_ADDR1_3   <= CHIP7_ADDR1_3;
//               CHIP7_ADDR1_4   <= CHIP7_ADDR1_4;
//               CHIP7_ADDR1_5   <= CHIP7_ADDR1_5;
//               CHIP7_ADDR1_6   <= CHIP7_ADDR1_6;
//               CHIP7_ADDR1_7   <= CHIP7_ADDR1_7;
//               CHIP7_ADDR1_8   <= CHIP7_ADDR1_8;
//               CHIP7_ADDR1_9   <= CHIP7_ADDR1_9;
//               CHIP7_ADDR1_10  <= CHIP7_ADDR1_10;
//               CHIP7_ADDR1_11  <= CHIP7_ADDR1_11;
//               CHIP7_ADDR1_12  <= CHIP7_ADDR1_12;
//               CHIP7_ADDR2_1   <= CHIP7_ADDR2_1;
//               CHIP7_ADDR2_2   <= CHIP7_ADDR2_2;
//               CHIP7_ADDR2_3   <= CHIP7_ADDR2_3;
//               CHIP7_ADDR2_4   <= CHIP7_ADDR2_4;
//               CHIP7_ADDR2_5   <= CHIP7_ADDR2_5;
//               CHIP7_ADDR2_6   <= CHIP7_ADDR2_6;
//               CHIP7_ADDR2_7   <= CHIP7_ADDR2_7;
//               CHIP7_ADDR2_8   <= CHIP7_ADDR2_8;
//               CHIP7_ADDR2_9   <= CHIP7_ADDR2_9;
//               CHIP7_ADDR2_10  <= CHIP7_ADDR2_10;
//               CHIP7_ADDR2_11  <= CHIP7_ADDR2_11;
//               CHIP7_ADDR2_12  <= CHIP7_ADDR2_12;


//               CHIP8_ADDR1_1   <= CHIP8_ADDR1_1;
//               CHIP8_ADDR1_2   <= CHIP8_ADDR1_2;
//               CHIP8_ADDR1_3   <= CHIP8_ADDR1_3;
//               CHIP8_ADDR1_4   <= CHIP8_ADDR1_4;
//               CHIP8_ADDR1_5   <= CHIP8_ADDR1_5;
//               CHIP8_ADDR1_6   <= CHIP8_ADDR1_6;
//               CHIP8_ADDR1_7   <= CHIP8_ADDR1_7;
//               CHIP8_ADDR1_8   <= CHIP8_ADDR1_8;
//               CHIP8_ADDR1_9   <= CHIP8_ADDR1_9;
//               CHIP8_ADDR1_10  <= CHIP8_ADDR1_10;
//               CHIP8_ADDR1_11  <= CHIP8_ADDR1_11;
//               CHIP8_ADDR1_12  <= CHIP8_ADDR1_12;
//               CHIP8_ADDR2_1   <= CHIP8_ADDR2_1;
//               CHIP8_ADDR2_2   <= CHIP8_ADDR2_2;
//               CHIP8_ADDR2_3   <= CHIP8_ADDR2_3;
//               CHIP8_ADDR2_4   <= CHIP8_ADDR2_4;
//               CHIP8_ADDR2_5   <= CHIP8_ADDR2_5;
//               CHIP8_ADDR2_6   <= CHIP8_ADDR2_6;
//               CHIP8_ADDR2_7   <= CHIP8_ADDR2_7;
//               CHIP8_ADDR2_8   <= CHIP8_ADDR2_8;
//               CHIP8_ADDR2_9   <= CHIP8_ADDR2_9;
//               CHIP8_ADDR2_10  <= CHIP8_ADDR2_10;
//               CHIP8_ADDR2_11  <= CHIP8_ADDR2_11;
//               CHIP8_ADDR2_12  <= CHIP8_ADDR2_12;


//               CHIP9_ADDR1_1   <= CHIP9_ADDR1_1;
//               CHIP9_ADDR1_2   <= CHIP9_ADDR1_2;
//               CHIP9_ADDR1_3   <= CHIP9_ADDR1_3;
//               CHIP9_ADDR1_4   <= CHIP9_ADDR1_4;
//               CHIP9_ADDR1_5   <= CHIP9_ADDR1_5;
//               CHIP9_ADDR1_6   <= CHIP9_ADDR1_6;
//               CHIP9_ADDR1_7   <= CHIP9_ADDR1_7;
//               CHIP9_ADDR1_8   <= CHIP9_ADDR1_8;
//               CHIP9_ADDR1_9   <= CHIP9_ADDR1_9;
//               CHIP9_ADDR1_10  <= CHIP9_ADDR1_10;
//               CHIP9_ADDR1_11  <= CHIP9_ADDR1_11;
//               CHIP9_ADDR1_12  <= CHIP9_ADDR1_12;
//               CHIP9_ADDR2_1   <= CHIP9_ADDR2_1;
//               CHIP9_ADDR2_2   <= CHIP9_ADDR2_2;
//               CHIP9_ADDR2_3   <= CHIP9_ADDR2_3;
//               CHIP9_ADDR2_4   <= CHIP9_ADDR2_4;
//               CHIP9_ADDR2_5   <= CHIP9_ADDR2_5;
//               CHIP9_ADDR2_6   <= CHIP9_ADDR2_6;
//               CHIP9_ADDR2_7   <= CHIP9_ADDR2_7;
//               CHIP9_ADDR2_8   <= CHIP9_ADDR2_8;
//               CHIP9_ADDR2_9   <= CHIP9_ADDR2_9;
//               CHIP9_ADDR2_10  <= CHIP9_ADDR2_10;
//               CHIP9_ADDR2_11  <= CHIP9_ADDR2_11;
//               CHIP9_ADDR2_12  <= CHIP9_ADDR2_12;

//               CHIP10_ADDR1_1   <= CHIP10_ADDR1_1;
//               CHIP10_ADDR1_2   <= CHIP10_ADDR1_2;
//               CHIP10_ADDR1_3   <= CHIP10_ADDR1_3;
//               CHIP10_ADDR1_4   <= CHIP10_ADDR1_4;
//               CHIP10_ADDR1_5   <= CHIP10_ADDR1_5;
//               CHIP10_ADDR1_6   <= CHIP10_ADDR1_6;
//               CHIP10_ADDR1_7   <= CHIP10_ADDR1_7;
//               CHIP10_ADDR1_8   <= CHIP10_ADDR1_8;
//               CHIP10_ADDR1_9   <= CHIP10_ADDR1_9;
//               CHIP10_ADDR1_10  <= CHIP10_ADDR1_10;
//               CHIP10_ADDR1_11  <= CHIP10_ADDR1_11;
//               CHIP10_ADDR1_12  <= CHIP10_ADDR1_12;
//               CHIP10_ADDR2_1   <= CHIP10_ADDR2_1;
//               CHIP10_ADDR2_2   <= CHIP10_ADDR2_2;
//               CHIP10_ADDR2_3   <= CHIP10_ADDR2_3;
//               CHIP10_ADDR2_4   <= CHIP10_ADDR2_4;
//               CHIP10_ADDR2_5   <= CHIP10_ADDR2_5;
//               CHIP10_ADDR2_6   <= CHIP10_ADDR2_6;
//               CHIP10_ADDR2_7   <= CHIP10_ADDR2_7;
//               CHIP10_ADDR2_8   <= CHIP10_ADDR2_8;
//               CHIP10_ADDR2_9   <= CHIP10_ADDR2_9;
//               CHIP10_ADDR2_10  <= CHIP10_ADDR2_10;
//               CHIP10_ADDR2_11  <= CHIP10_ADDR2_11;
//               CHIP10_ADDR2_12  <= CHIP10_ADDR2_12;

//               CHIP11_ADDR1_1   <= CHIP11_ADDR1_1;
//               CHIP11_ADDR1_2   <= CHIP11_ADDR1_2;
//               CHIP11_ADDR1_3   <= CHIP11_ADDR1_3;
//               CHIP11_ADDR1_4   <= CHIP11_ADDR1_4;
//               CHIP11_ADDR1_5   <= CHIP11_ADDR1_5;
//               CHIP11_ADDR1_6   <= CHIP11_ADDR1_6;
//               CHIP11_ADDR1_7   <= CHIP11_ADDR1_7;
//               CHIP11_ADDR1_8   <= CHIP11_ADDR1_8;
//               CHIP11_ADDR1_9   <= CHIP11_ADDR1_9;
//               CHIP11_ADDR1_10  <= CHIP11_ADDR1_10;
//               CHIP11_ADDR1_11  <= CHIP11_ADDR1_11;
//               CHIP11_ADDR1_12  <= CHIP11_ADDR1_12;
//               CHIP11_ADDR2_1   <= CHIP11_ADDR2_1;
//               CHIP11_ADDR2_2   <= CHIP11_ADDR2_2;
//               CHIP11_ADDR2_3   <= CHIP11_ADDR2_3;
//               CHIP11_ADDR2_4   <= CHIP11_ADDR2_4;
//               CHIP11_ADDR2_5   <= CHIP11_ADDR2_5;
//               CHIP11_ADDR2_6   <= CHIP11_ADDR2_6;
//               CHIP11_ADDR2_7   <= CHIP11_ADDR2_7;
//               CHIP11_ADDR2_8   <= CHIP11_ADDR2_8;
//               CHIP11_ADDR2_9   <= CHIP11_ADDR2_9;
//               CHIP11_ADDR2_10  <= CHIP11_ADDR2_10;
//               CHIP11_ADDR2_11  <= CHIP11_ADDR2_11;
//               CHIP11_ADDR2_12  <= CHIP11_ADDR2_12;


//               CHIP12_ADDR1_1   <= CHIP12_ADDR1_1;
//               CHIP12_ADDR1_2   <= CHIP12_ADDR1_2;
//               CHIP12_ADDR1_3   <= CHIP12_ADDR1_3;
//               CHIP12_ADDR1_4   <= CHIP12_ADDR1_4;
//               CHIP12_ADDR1_5   <= CHIP12_ADDR1_5;
//               CHIP12_ADDR1_6   <= CHIP12_ADDR1_6;
//               CHIP12_ADDR1_7   <= CHIP12_ADDR1_7;
//               CHIP12_ADDR1_8   <= CHIP12_ADDR1_8;
//               CHIP12_ADDR1_9   <= CHIP12_ADDR1_9;
//               CHIP12_ADDR1_10  <= CHIP12_ADDR1_10;
//               CHIP12_ADDR1_11  <= CHIP12_ADDR1_11;
//               CHIP12_ADDR1_12  <= CHIP12_ADDR1_12;
//               CHIP12_ADDR2_1   <= CHIP12_ADDR2_1;
//               CHIP12_ADDR2_2   <= CHIP12_ADDR2_2;
//               CHIP12_ADDR2_3   <= CHIP12_ADDR2_3;
//               CHIP12_ADDR2_4   <= CHIP12_ADDR2_4;
//               CHIP12_ADDR2_5   <= CHIP12_ADDR2_5;
//               CHIP12_ADDR2_6   <= CHIP12_ADDR2_6;
//               CHIP12_ADDR2_7   <= CHIP12_ADDR2_7;
//               CHIP12_ADDR2_8   <= CHIP12_ADDR2_8;
//               CHIP12_ADDR2_9   <= CHIP12_ADDR2_9;
//               CHIP12_ADDR2_10  <= CHIP12_ADDR2_10;
//               CHIP12_ADDR2_11  <= CHIP12_ADDR2_11;
//               CHIP12_ADDR2_12  <= CHIP12_ADDR2_12;



//               RAM2FIFO[15:0]<= RAM2FIFO[15:0];  

//             end
// end


always @(posedge CLK_READ or posedge RST) begin//
            if (RST) begin//
              RAM2FIFO <= 16'b0;
            end
            // else if (FRAME_X) begin//
            //   RAM2FIFO[15:0]<= 16'h55AA;  
 
            // end
            else if (state_next==P_EN) begin//
              RAM2FIFO[15:0]<= 16'h55AA;  //(state_reg==P_EN)||(state_reg==C_EN)
 
            end
            else if (state_next==C_EN) begin//
              RAM2FIFO[15:0]<= FRAME_COUNT[15:0];  //(state_reg==P_EN)||(state_reg==C_EN)
 
            end
            else if (state_next==F_EN) begin//
              RAM2FIFO[15:0]<= 16'hBBBB;  //(state_reg==P_EN)||(state_reg==C_EN)
 
            end
            else if (state_next==G_EN) begin//
              RAM2FIFO[15:0]<= 16'hCCCC;  //(state_reg==P_EN)||(state_reg==C_EN)
 
            end
            else if (cchip1_read1_en1) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT1[15:0];  
 
            end
            else if (cchip1_read1_en2) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT2[15:0];      
            end
            else if (cchip1_read1_en3) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT3[15:0];      
            end
            else if (cchip1_read1_en4) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT4[15:0];      
            end
            else if (cchip1_read1_en5) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT5[15:0];      
            end
            else if (cchip1_read1_en6) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT6[15:0];      
            end
            else if (cchip1_read1_en7) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT7[15:0];      
            end
            else if (cchip1_read1_en8) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT8[15:0];      
            end
            else if (cchip1_read1_en9) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT9[15:0];      
            end
            else if (cchip1_read1_en10) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT10[15:0];      
            end
            else if (cchip1_read1_en11) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT11[15:0];      
            end
            else if (cchip1_read1_en12) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR1_DAT12[15:0];      
            end

            else if (cchip2_read1_en1) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT1[15:0];      
            end
            else if (cchip2_read1_en2) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT2[15:0];      
            end
            else if (cchip2_read1_en3) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT3[15:0];      
            end
            else if (cchip2_read1_en4) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT4[15:0];      
            end
            else if (cchip2_read1_en5) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT5[15:0];      
            end
            else if (cchip2_read1_en6) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT6[15:0];      
            end
            else if (cchip2_read1_en7) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT7[15:0];      
            end
            else if (cchip2_read1_en8) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT8[15:0];      
            end
            else if (cchip2_read1_en9) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT9[15:0];      
            end
            else if (cchip2_read1_en10) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT10[15:0];      
            end
            else if (cchip2_read1_en11) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT11[15:0];      
            end
            else if (cchip2_read1_en12) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR1_DAT12[15:0];      
            end

            else if (cchip3_read1_en1) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT1[15:0];      
            end
            else if (cchip3_read1_en2) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT2[15:0];      
            end
            else if (cchip3_read1_en3) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT3[15:0];      
            end
            else if (cchip3_read1_en4) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT4[15:0];      
            end
            else if (cchip3_read1_en5) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT5[15:0];      
            end
            else if (cchip3_read1_en6) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT6[15:0];      
            end
            else if (cchip3_read1_en7) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT7[15:0];      
            end
            else if (cchip3_read1_en8) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT8[15:0];      
            end
            else if (cchip3_read1_en9) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT9[15:0];      
            end
            else if (cchip3_read1_en10) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT10[15:0];      
            end
            else if (cchip3_read1_en11) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT11[15:0];      
            end
            else if (cchip3_read1_en12) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR1_DAT12[15:0];      
            end

            else if (cchip4_read1_en1) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT1[15:0];      
            end
            else if (cchip4_read1_en2) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT2[15:0];      
            end
            else if (cchip4_read1_en3) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT3[15:0];      
            end
            else if (cchip4_read1_en4) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT4[15:0];      
            end
            else if (cchip4_read1_en5) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT5[15:0];      
            end
            else if (cchip4_read1_en6) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT6[15:0];      
            end
            else if (cchip4_read1_en7) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT7[15:0];      
            end
            else if (cchip4_read1_en8) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT8[15:0];      
            end
            else if (cchip4_read1_en9) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT9[15:0];      
            end
            else if (cchip4_read1_en10) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT10[15:0];      
            end
            else if (cchip4_read1_en11) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT11[15:0];      
            end
            else if (cchip4_read1_en12) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR1_DAT12[15:0];      
            end


            else if (cchip5_read1_en1) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT1[15:0];      
            end
            else if (cchip5_read1_en2) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT2[15:0];      
            end
            else if (cchip5_read1_en3) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT3[15:0];      
            end
            else if (cchip5_read1_en4) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT4[15:0];      
            end
            else if (cchip5_read1_en5) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT5[15:0];      
            end
            else if (cchip5_read1_en6) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT6[15:0];      
            end
            else if (cchip5_read1_en7) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT7[15:0];      
            end
            else if (cchip5_read1_en8) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT8[15:0];      
            end
            else if (cchip5_read1_en9) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT9[15:0];      
            end
            else if (cchip5_read1_en10) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT10[15:0];      
            end
            else if (cchip5_read1_en11) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT11[15:0];      
            end
            else if (cchip5_read1_en12) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR1_DAT12[15:0];      
            end

            else if (cchip6_read1_en1) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT1[15:0];      
            end
            else if (cchip6_read1_en2) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT2[15:0];      
            end
            else if (cchip6_read1_en3) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT3[15:0];      
            end
            else if (cchip6_read1_en4) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT4[15:0];      
            end
            else if (cchip6_read1_en5) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT5[15:0];      
            end
            else if (cchip6_read1_en6) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT6[15:0];      
            end
            else if (cchip6_read1_en7) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT7[15:0];      
            end
            else if (cchip6_read1_en8) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT8[15:0];      
            end
            else if (cchip6_read1_en9) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT9[15:0];      
            end
            else if (cchip6_read1_en10) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT10[15:0];      
            end
            else if (cchip6_read1_en11) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT11[15:0];      
            end
            else if (cchip6_read1_en12) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR1_DAT12[15:0];      
            end


            else if (cchip7_read1_en1) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT1[15:0];      
            end
            else if (cchip7_read1_en2) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT2[15:0];      
            end
            else if (cchip7_read1_en3) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT3[15:0];      
            end
            else if (cchip7_read1_en4) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT4[15:0];      
            end
            else if (cchip7_read1_en5) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT5[15:0];      
            end
            else if (cchip7_read1_en6) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT6[15:0];      
            end
            else if (cchip7_read1_en7) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT7[15:0];      
            end
            else if (cchip7_read1_en8) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT8[15:0];      
            end
            else if (cchip7_read1_en9) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT9[15:0];      
            end
            else if (cchip7_read1_en10) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT10[15:0];      
            end
            else if (cchip7_read1_en11) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT11[15:0];      
            end
            else if (cchip7_read1_en12) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR1_DAT12[15:0];      
            end


            else if (cchip8_read1_en1) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT1[15:0];      
            end
            else if (cchip8_read1_en2) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT2[15:0];      
            end
            else if (cchip8_read1_en3) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT3[15:0];      
            end
            else if (cchip8_read1_en4) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT4[15:0];      
            end
            else if (cchip8_read1_en5) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT5[15:0];      
            end
            else if (cchip8_read1_en6) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT6[15:0];      
            end
            else if (cchip8_read1_en7) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT7[15:0];      
            end
            else if (cchip8_read1_en8) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT8[15:0];      
            end
            else if (cchip8_read1_en9) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT9[15:0];      
            end
            else if (cchip8_read1_en10) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT10[15:0];      
            end
            else if (cchip8_read1_en11) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT11[15:0];      
            end
            else if (cchip8_read1_en12) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR1_DAT12[15:0];      
            end


            else if (cchip9_read1_en1) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT1[15:0];      
            end
            else if (cchip9_read1_en2) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT2[15:0];      
            end
            else if (cchip9_read1_en3) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT3[15:0];      
            end
            else if (cchip9_read1_en4) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT4[15:0];      
            end
            else if (cchip9_read1_en5) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT5[15:0];      
            end
            else if (cchip9_read1_en6) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT6[15:0];      
            end
            else if (cchip9_read1_en7) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT7[15:0];      
            end
            else if (cchip9_read1_en8) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT8[15:0];      
            end
            else if (cchip9_read1_en9) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT9[15:0];      
            end
            else if (cchip9_read1_en10) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT10[15:0];      
            end
            else if (cchip9_read1_en11) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT11[15:0];      
            end
            else if (cchip9_read1_en12) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR1_DAT12[15:0];      
            end


            else if (cchip10_read1_en1) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT1[15:0];      
            end
            else if (cchip10_read1_en2) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT2[15:0];      
            end
            else if (cchip10_read1_en3) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT3[15:0];      
            end
            else if (cchip10_read1_en4) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT4[15:0];      
            end
            else if (cchip10_read1_en5) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT5[15:0];      
            end
            else if (cchip10_read1_en6) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT6[15:0];      
            end
            else if (cchip10_read1_en7) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT7[15:0];      
            end
            else if (cchip10_read1_en8) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT8[15:0];      
            end
            else if (cchip10_read1_en9) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT9[15:0];      
            end
            else if (cchip10_read1_en10) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT10[15:0];      
            end
            else if (cchip10_read1_en11) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT11[15:0];      
            end
            else if (cchip10_read1_en12) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR1_DAT12[15:0];      
            end



            else if (cchip11_read1_en1) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT1[15:0];      
            end
            else if (cchip11_read1_en2) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT2[15:0];      
            end
            else if (cchip11_read1_en3) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT3[15:0];      
            end
            else if (cchip11_read1_en4) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT4[15:0];      
            end
            else if (cchip11_read1_en5) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT5[15:0];      
            end
            else if (cchip11_read1_en6) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT6[15:0];      
            end
            else if (cchip11_read1_en7) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT7[15:0];      
            end
            else if (cchip11_read1_en8) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT8[15:0];      
            end
            else if (cchip11_read1_en9) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT9[15:0];      
            end
            else if (cchip11_read1_en10) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT10[15:0];      
            end
            else if (cchip11_read1_en11) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT11[15:0];      
            end
            else if (cchip11_read1_en12) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR1_DAT12[15:0];      
            end


            else if (cchip12_read1_en1) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT1[15:0];      
            end
            else if (cchip12_read1_en2) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT2[15:0];      
            end
            else if (cchip12_read1_en3) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT3[15:0];      
            end
            else if (cchip12_read1_en4) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT4[15:0];      
            end
            else if (cchip12_read1_en5) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT5[15:0];      
            end
            else if (cchip12_read1_en6) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT6[15:0];      
            end
            else if (cchip12_read1_en7) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT7[15:0];      
            end
            else if (cchip12_read1_en8) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT8[15:0];      
            end
            else if (cchip12_read1_en9) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT9[15:0];      
            end
            else if (cchip12_read1_en10) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT10[15:0];      
            end
            else if (cchip12_read1_en11) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT11[15:0];      
            end
            else if (cchip12_read1_en12) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR1_DAT12[15:0];      
            end


            else if (cchip1_read2_en1) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT1[15:0];  
 
            end
            else if (cchip1_read2_en2) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT2[15:0];      
            end
            else if (cchip1_read2_en3) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT3[15:0];      
            end
            else if (cchip1_read2_en4) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT4[15:0];      
            end
            else if (cchip1_read2_en5) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT5[15:0];      
            end
            else if (cchip1_read2_en6) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT6[15:0];      
            end
            else if (cchip1_read2_en7) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT7[15:0];      
            end
            else if (cchip1_read2_en8) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT8[15:0];      
            end
            else if (cchip1_read2_en9) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT9[15:0];      
            end
            else if (cchip1_read2_en10) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT10[15:0];      
            end
            else if (cchip1_read2_en11) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT11[15:0];      
            end
            else if (cchip1_read2_en12) begin//

              RAM2FIFO[15:0]<= CHIP1_ADDR2_DAT12[15:0];      
            end

            else if (cchip2_read2_en1) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT1[15:0];      
            end
            else if (cchip2_read2_en2) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT2[15:0];      
            end
            else if (cchip2_read2_en3) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT3[15:0];      
            end
            else if (cchip2_read2_en4) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT4[15:0];      
            end
            else if (cchip2_read2_en5) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT5[15:0];      
            end
            else if (cchip2_read2_en6) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT6[15:0];      
            end
            else if (cchip2_read2_en7) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT7[15:0];      
            end
            else if (cchip2_read2_en8) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT8[15:0];      
            end
            else if (cchip2_read2_en9) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT9[15:0];      
            end
            else if (cchip2_read2_en10) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT10[15:0];      
            end
            else if (cchip2_read2_en11) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT11[15:0];      
            end
            else if (cchip2_read2_en12) begin//

              RAM2FIFO[15:0]<= CHIP2_ADDR2_DAT12[15:0];      
            end

            else if (cchip3_read2_en1) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT1[15:0];      
            end
            else if (cchip3_read2_en2) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT2[15:0];      
            end
            else if (cchip3_read2_en3) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT3[15:0];      
            end
            else if (cchip3_read2_en4) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT4[15:0];      
            end
            else if (cchip3_read2_en5) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT5[15:0];      
            end
            else if (cchip3_read2_en6) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT6[15:0];      
            end
            else if (cchip3_read2_en7) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT7[15:0];      
            end
            else if (cchip3_read2_en8) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT8[15:0];      
            end
            else if (cchip3_read2_en9) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT9[15:0];      
            end
            else if (cchip3_read2_en10) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT10[15:0];      
            end
            else if (cchip3_read2_en11) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT11[15:0];      
            end
            else if (cchip3_read2_en12) begin//

              RAM2FIFO[15:0]<= CHIP3_ADDR2_DAT12[15:0];      
            end


            else if (cchip4_read2_en1) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT1[15:0];      
            end
            else if (cchip4_read2_en2) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT2[15:0];      
            end
            else if (cchip4_read2_en3) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT3[15:0];      
            end
            else if (cchip4_read2_en4) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT4[15:0];      
            end
            else if (cchip4_read2_en5) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT5[15:0];      
            end
            else if (cchip4_read2_en6) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT6[15:0];      
            end
            else if (cchip4_read2_en7) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT7[15:0];      
            end
            else if (cchip4_read2_en8) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT8[15:0];      
            end
            else if (cchip4_read2_en9) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT9[15:0];      
            end
            else if (cchip4_read2_en10) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT10[15:0];      
            end
            else if (cchip4_read2_en11) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT11[15:0];      
            end
            else if (cchip4_read2_en12) begin//

              RAM2FIFO[15:0]<= CHIP4_ADDR2_DAT12[15:0];      
            end


            else if (cchip5_read2_en1) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT1[15:0];      
            end
            else if (cchip5_read2_en2) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT2[15:0];      
            end
            else if (cchip5_read2_en3) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT3[15:0];      
            end
            else if (cchip5_read2_en4) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT4[15:0];      
            end
            else if (cchip5_read2_en5) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT5[15:0];      
            end
            else if (cchip5_read2_en6) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT6[15:0];      
            end
            else if (cchip5_read2_en7) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT7[15:0];      
            end
            else if (cchip5_read2_en8) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT8[15:0];      
            end
            else if (cchip5_read2_en9) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT9[15:0];      
            end
            else if (cchip5_read2_en10) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT10[15:0];      
            end
            else if (cchip5_read2_en11) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT11[15:0];      
            end
            else if (cchip5_read2_en12) begin//

              RAM2FIFO[15:0]<= CHIP5_ADDR2_DAT12[15:0];      
            end

            else if (cchip6_read2_en1) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT1[15:0];      
            end
            else if (cchip6_read2_en2) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT2[15:0];      
            end
            else if (cchip6_read2_en3) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT3[15:0];      
            end
            else if (cchip6_read2_en4) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT4[15:0];      
            end
            else if (cchip6_read2_en5) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT5[15:0];      
            end
            else if (cchip6_read2_en6) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT6[15:0];      
            end
            else if (cchip6_read2_en7) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT7[15:0];      
            end
            else if (cchip6_read2_en8) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT8[15:0];      
            end
            else if (cchip6_read2_en9) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT9[15:0];      
            end
            else if (cchip6_read2_en10) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT10[15:0];      
            end
            else if (cchip6_read2_en11) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT11[15:0];      
            end
            else if (cchip6_read2_en12) begin//

              RAM2FIFO[15:0]<= CHIP6_ADDR2_DAT12[15:0];      
            end


            else if (cchip7_read2_en1) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT1[15:0];      
            end
            else if (cchip7_read2_en2) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT2[15:0];      
            end
            else if (cchip7_read2_en3) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT3[15:0];      
            end
            else if (cchip7_read2_en4) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT4[15:0];      
            end
            else if (cchip7_read2_en5) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT5[15:0];      
            end
            else if (cchip7_read2_en6) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT6[15:0];      
            end
            else if (cchip7_read2_en7) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT7[15:0];      
            end
            else if (cchip7_read2_en8) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT8[15:0];      
            end
            else if (cchip7_read2_en9) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT9[15:0];      
            end
            else if (cchip7_read2_en10) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT10[15:0];      
            end
            else if (cchip7_read2_en11) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT11[15:0];      
            end
            else if (cchip7_read2_en12) begin//

              RAM2FIFO[15:0]<= CHIP7_ADDR2_DAT12[15:0];      
            end


            else if (cchip8_read2_en1) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT1[15:0];      
            end
            else if (cchip8_read2_en2) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT2[15:0];      
            end
            else if (cchip8_read2_en3) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT3[15:0];      
            end
            else if (cchip8_read2_en4) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT4[15:0];      
            end
            else if (cchip8_read2_en5) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT5[15:0];      
            end
            else if (cchip8_read2_en6) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT6[15:0];      
            end
            else if (cchip8_read2_en7) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT7[15:0];      
            end
            else if (cchip8_read2_en8) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT8[15:0];      
            end
            else if (cchip8_read2_en9) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT9[15:0];      
            end
            else if (cchip8_read2_en10) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT10[15:0];      
            end
            else if (cchip8_read2_en11) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT11[15:0];      
            end
            else if (cchip8_read2_en12) begin//

              RAM2FIFO[15:0]<= CHIP8_ADDR2_DAT12[15:0];      
            end


            else if (cchip9_read2_en1) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT1[15:0];      
            end
            else if (cchip9_read2_en2) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT2[15:0];      
            end
            else if (cchip9_read2_en3) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT3[15:0];      
            end
            else if (cchip9_read2_en4) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT4[15:0];      
            end
            else if (cchip9_read2_en5) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT5[15:0];      
            end
            else if (cchip9_read2_en6) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT6[15:0];      
            end
            else if (cchip9_read2_en7) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT7[15:0];      
            end
            else if (cchip9_read2_en8) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT8[15:0];      
            end
            else if (cchip9_read2_en9) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT9[15:0];      
            end
            else if (cchip9_read2_en10) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT10[15:0];      
            end
            else if (cchip9_read2_en11) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT11[15:0];      
            end
            else if (cchip9_read2_en12) begin//

              RAM2FIFO[15:0]<= CHIP9_ADDR2_DAT12[15:0];      
            end


            else if (cchip10_read2_en1) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT1[15:0];      
            end
            else if (cchip10_read2_en2) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT2[15:0];      
            end
            else if (cchip10_read2_en3) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT3[15:0];      
            end
            else if (cchip10_read2_en4) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT4[15:0];      
            end
            else if (cchip10_read2_en5) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT5[15:0];      
            end
            else if (cchip10_read2_en6) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT6[15:0];      
            end
            else if (cchip10_read2_en7) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT7[15:0];      
            end
            else if (cchip10_read2_en8) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT8[15:0];      
            end
            else if (cchip10_read2_en9) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT9[15:0];      
            end
            else if (cchip10_read2_en10) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT10[15:0];      
            end
            else if (cchip10_read2_en11) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT11[15:0];      
            end
            else if (cchip10_read2_en12) begin//

              RAM2FIFO[15:0]<= CHIP10_ADDR2_DAT12[15:0];      
            end



            else if (cchip11_read2_en1) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT1[15:0];      
            end
            else if (cchip11_read2_en2) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT2[15:0];     
            end
            else if (cchip11_read2_en3) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT3[15:0];       
            end
            else if (cchip11_read2_en4) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT4[15:0];    
            end
            else if (cchip11_read2_en5) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT5[15:0];     
            end
            else if (cchip11_read2_en6) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT6[15:0];      
            end
            else if (cchip11_read2_en7) begin//
   
              RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT7[15:0];    
            end
            else if (cchip11_read2_en8) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT8[15:0];      
            end
            else if (cchip11_read2_en9) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT9[15:0];      
            end
            else if (cchip11_read2_en10) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT10[15:0];     
            end
            else if (cchip11_read2_en11) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT11[15:0];      
            end
            else if (cchip11_read2_en12) begin//

              RAM2FIFO[15:0]<= CHIP11_ADDR2_DAT12[15:0];      
            end


            else if (cchip12_read2_en1) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT1[15:0];       
            end
            else if (cchip12_read2_en2) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT2[15:0];      
            end
            else if (cchip12_read2_en3) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT3[15:0];     
            end
            else if (cchip12_read2_en4) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT4[15:0];        
            end
            else if (cchip12_read2_en5) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT5[15:0];     
            end
            else if (cchip12_read2_en6) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT6[15:0];      
            end
            else if (cchip12_read2_en7) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT7[15:0];       
            end
            else if (cchip12_read2_en8) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT8[15:0];    
            end
            else if (cchip12_read2_en9) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT9[15:0];      
            end
            else if (cchip12_read2_en10) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT10[15:0];      
            end
            else if (cchip12_read2_en11) begin//

              RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT11[15:0];      
            end
            else if (cchip12_read2_en12) begin//
              RAM2FIFO[15:0]<= CHIP12_ADDR2_DAT12[15:0];      
            end
            else if (readx_end) begin//


              RAM2FIFO[15:0]<= RAM2FIFO[15:0];  

            end
            else begin//

              RAM2FIFO[15:0]<= RAM2FIFO[15:0];  

            end
end

reg           cchip1_read1_en1;
reg           cchip1_read1_en2;
reg           cchip1_read1_en3;
reg           cchip1_read1_en4;
reg           cchip1_read1_en5;
reg           cchip1_read1_en6;
reg           cchip1_read1_en7;
reg           cchip1_read1_en8;
reg           cchip1_read1_en9;
reg           cchip1_read1_en10;
reg           cchip1_read1_en11;
reg           cchip1_read1_en12;
reg           cchip1_read2_en1;
reg           cchip1_read2_en2;
reg           cchip1_read2_en3;
reg           cchip1_read2_en4;
reg           cchip1_read2_en5;
reg           cchip1_read2_en6;
reg           cchip1_read2_en7;
reg           cchip1_read2_en8;
reg           cchip1_read2_en9;
reg           cchip1_read2_en10;
reg           cchip1_read2_en11;
reg           cchip1_read2_en12;

reg           cchip2_read1_en1;
reg           cchip2_read1_en2;
reg           cchip2_read1_en3;
reg           cchip2_read1_en4;
reg           cchip2_read1_en5;
reg           cchip2_read1_en6;
reg           cchip2_read1_en7;
reg           cchip2_read1_en8;
reg           cchip2_read1_en9;
reg           cchip2_read1_en10;
reg           cchip2_read1_en11;
reg           cchip2_read1_en12;
reg           cchip2_read2_en1;
reg           cchip2_read2_en2;
reg           cchip2_read2_en3;
reg           cchip2_read2_en4;
reg           cchip2_read2_en5;
reg           cchip2_read2_en6;
reg           cchip2_read2_en7;
reg           cchip2_read2_en8;
reg           cchip2_read2_en9;
reg           cchip2_read2_en10;
reg           cchip2_read2_en11;
reg           cchip2_read2_en12;

reg           cchip3_read1_en1;
reg           cchip3_read1_en2;
reg           cchip3_read1_en3;
reg           cchip3_read1_en4;
reg           cchip3_read1_en5;
reg           cchip3_read1_en6;
reg           cchip3_read1_en7;
reg           cchip3_read1_en8;
reg           cchip3_read1_en9;
reg           cchip3_read1_en10;
reg           cchip3_read1_en11;
reg           cchip3_read1_en12;
reg           cchip3_read2_en1;
reg           cchip3_read2_en2;
reg           cchip3_read2_en3;
reg           cchip3_read2_en4;
reg           cchip3_read2_en5;
reg           cchip3_read2_en6;
reg           cchip3_read2_en7;
reg           cchip3_read2_en8;
reg           cchip3_read2_en9;
reg           cchip3_read2_en10;
reg           cchip3_read2_en11;
reg           cchip3_read2_en12;

reg           cchip4_read1_en1;
reg           cchip4_read1_en2;
reg           cchip4_read1_en3;
reg           cchip4_read1_en4;
reg           cchip4_read1_en5;
reg           cchip4_read1_en6;
reg           cchip4_read1_en7;
reg           cchip4_read1_en8;
reg           cchip4_read1_en9;
reg           cchip4_read1_en10;
reg           cchip4_read1_en11;
reg           cchip4_read1_en12;
reg           cchip4_read2_en1;
reg           cchip4_read2_en2;
reg           cchip4_read2_en3;
reg           cchip4_read2_en4;
reg           cchip4_read2_en5;
reg           cchip4_read2_en6;
reg           cchip4_read2_en7;
reg           cchip4_read2_en8;
reg           cchip4_read2_en9;
reg           cchip4_read2_en10;
reg           cchip4_read2_en11;
reg           cchip4_read2_en12;

reg           cchip5_read1_en1;
reg           cchip5_read1_en2;
reg           cchip5_read1_en3;
reg           cchip5_read1_en4;
reg           cchip5_read1_en5;
reg           cchip5_read1_en6;
reg           cchip5_read1_en7;
reg           cchip5_read1_en8;
reg           cchip5_read1_en9;
reg           cchip5_read1_en10;
reg           cchip5_read1_en11;
reg           cchip5_read1_en12;
reg           cchip5_read2_en1;
reg           cchip5_read2_en2;
reg           cchip5_read2_en3;
reg           cchip5_read2_en4;
reg           cchip5_read2_en5;
reg           cchip5_read2_en6;
reg           cchip5_read2_en7;
reg           cchip5_read2_en8;
reg           cchip5_read2_en9;
reg           cchip5_read2_en10;
reg           cchip5_read2_en11;
reg           cchip5_read2_en12;

reg           cchip6_read1_en1;
reg           cchip6_read1_en2;
reg           cchip6_read1_en3;
reg           cchip6_read1_en4;
reg           cchip6_read1_en5;
reg           cchip6_read1_en6;
reg           cchip6_read1_en7;
reg           cchip6_read1_en8;
reg           cchip6_read1_en9;
reg           cchip6_read1_en10;
reg           cchip6_read1_en11;
reg           cchip6_read1_en12;
reg           cchip6_read2_en1;
reg           cchip6_read2_en2;
reg           cchip6_read2_en3;
reg           cchip6_read2_en4;
reg           cchip6_read2_en5;
reg           cchip6_read2_en6;
reg           cchip6_read2_en7;
reg           cchip6_read2_en8;
reg           cchip6_read2_en9;
reg           cchip6_read2_en10;
reg           cchip6_read2_en11;
reg           cchip6_read2_en12;

reg           cchip7_read1_en1;
reg           cchip7_read1_en2;
reg           cchip7_read1_en3;
reg           cchip7_read1_en4;
reg           cchip7_read1_en5;
reg           cchip7_read1_en6;
reg           cchip7_read1_en7;
reg           cchip7_read1_en8;
reg           cchip7_read1_en9;
reg           cchip7_read1_en10;
reg           cchip7_read1_en11;
reg           cchip7_read1_en12;
reg           cchip7_read2_en1;
reg           cchip7_read2_en2;
reg           cchip7_read2_en3;
reg           cchip7_read2_en4;
reg           cchip7_read2_en5;
reg           cchip7_read2_en6;
reg           cchip7_read2_en7;
reg           cchip7_read2_en8;
reg           cchip7_read2_en9;
reg           cchip7_read2_en10;
reg           cchip7_read2_en11;
reg           cchip7_read2_en12;

reg           cchip8_read1_en1;
reg           cchip8_read1_en2;
reg           cchip8_read1_en3;
reg           cchip8_read1_en4;
reg           cchip8_read1_en5;
reg           cchip8_read1_en6;
reg           cchip8_read1_en7;
reg           cchip8_read1_en8;
reg           cchip8_read1_en9;
reg           cchip8_read1_en10;
reg           cchip8_read1_en11;
reg           cchip8_read1_en12;
reg           cchip8_read2_en1;
reg           cchip8_read2_en2;
reg           cchip8_read2_en3;
reg           cchip8_read2_en4;
reg           cchip8_read2_en5;
reg           cchip8_read2_en6;
reg           cchip8_read2_en7;
reg           cchip8_read2_en8;
reg           cchip8_read2_en9;
reg           cchip8_read2_en10;
reg           cchip8_read2_en11;
reg           cchip8_read2_en12;

reg           cchip9_read1_en1;
reg           cchip9_read1_en2;
reg           cchip9_read1_en3;
reg           cchip9_read1_en4;
reg           cchip9_read1_en5;
reg           cchip9_read1_en6;
reg           cchip9_read1_en7;
reg           cchip9_read1_en8;
reg           cchip9_read1_en9;
reg           cchip9_read1_en10;
reg           cchip9_read1_en11;
reg           cchip9_read1_en12;
reg           cchip9_read2_en1;
reg           cchip9_read2_en2;
reg           cchip9_read2_en3;
reg           cchip9_read2_en4;
reg           cchip9_read2_en5;
reg           cchip9_read2_en6;
reg           cchip9_read2_en7;
reg           cchip9_read2_en8;
reg           cchip9_read2_en9;
reg           cchip9_read2_en10;
reg           cchip9_read2_en11;
reg           cchip9_read2_en12;

reg           cchip10_read1_en1;
reg           cchip10_read1_en2;
reg           cchip10_read1_en3;
reg           cchip10_read1_en4;
reg           cchip10_read1_en5;
reg           cchip10_read1_en6;
reg           cchip10_read1_en7;
reg           cchip10_read1_en8;
reg           cchip10_read1_en9;
reg           cchip10_read1_en10;
reg           cchip10_read1_en11;
reg           cchip10_read1_en12;
reg           cchip10_read2_en1;
reg           cchip10_read2_en2;
reg           cchip10_read2_en3;
reg           cchip10_read2_en4;
reg           cchip10_read2_en5;
reg           cchip10_read2_en6;
reg           cchip10_read2_en7;
reg           cchip10_read2_en8;
reg           cchip10_read2_en9;
reg           cchip10_read2_en10;
reg           cchip10_read2_en11;
reg           cchip10_read2_en12;

reg           cchip11_read1_en1;
reg           cchip11_read1_en2;
reg           cchip11_read1_en3;
reg           cchip11_read1_en4;
reg           cchip11_read1_en5;
reg           cchip11_read1_en6;
reg           cchip11_read1_en7;
reg           cchip11_read1_en8;
reg           cchip11_read1_en9;
reg           cchip11_read1_en10;
reg           cchip11_read1_en11;
reg           cchip11_read1_en12;
reg           cchip11_read2_en1;
reg           cchip11_read2_en2;
reg           cchip11_read2_en3;
reg           cchip11_read2_en4;
reg           cchip11_read2_en5;
reg           cchip11_read2_en6;
reg           cchip11_read2_en7;
reg           cchip11_read2_en8;
reg           cchip11_read2_en9;
reg           cchip11_read2_en10;
reg           cchip11_read2_en11;
reg           cchip11_read2_en12;

reg           cchip12_read1_en1;
reg           cchip12_read1_en2;
reg           cchip12_read1_en3;
reg           cchip12_read1_en4;
reg           cchip12_read1_en5;
reg           cchip12_read1_en6;
reg           cchip12_read1_en7;
reg           cchip12_read1_en8;
reg           cchip12_read1_en9;
reg           cchip12_read1_en10;
reg           cchip12_read1_en11;
reg           cchip12_read1_en12;
reg           cchip12_read2_en1;
reg           cchip12_read2_en2;
reg           cchip12_read2_en3;
reg           cchip12_read2_en4;
reg           cchip12_read2_en5;
reg           cchip12_read2_en6;
reg           cchip12_read2_en7;
reg           cchip12_read2_en8;
reg           cchip12_read2_en9;
reg           cchip12_read2_en10;
reg           cchip12_read2_en11;
reg           cchip12_read2_en12;

always @(posedge CLK_READ) begin
              cchip1_read1_en1  <= chip1_read1_en1;
              cchip1_read1_en2  <= chip1_read1_en2;
              cchip1_read1_en3  <= chip1_read1_en3;
              cchip1_read1_en4  <= chip1_read1_en4;
              cchip1_read1_en5  <= chip1_read1_en5;
              cchip1_read1_en6  <= chip1_read1_en6;
              cchip1_read1_en7  <= chip1_read1_en7;
              cchip1_read1_en8  <= chip1_read1_en8;
              cchip1_read1_en9  <= chip1_read1_en9;
              cchip1_read1_en10 <= chip1_read1_en10;
              cchip1_read1_en11 <= chip1_read1_en11;
              cchip1_read1_en12 <= chip1_read1_en12;
              cchip1_read2_en1  <= chip1_read2_en1;
              cchip1_read2_en2  <= chip1_read2_en2;
              cchip1_read2_en3  <= chip1_read2_en3;
              cchip1_read2_en4  <= chip1_read2_en4;
              cchip1_read2_en5  <= chip1_read2_en5;
              cchip1_read2_en6  <= chip1_read2_en6;
              cchip1_read2_en7  <= chip1_read2_en7;
              cchip1_read2_en8  <= chip1_read2_en8;
              cchip1_read2_en9  <= chip1_read2_en9;
              cchip1_read2_en10 <= chip1_read2_en10;
              cchip1_read2_en11 <= chip1_read2_en11;
              cchip1_read2_en12 <= chip1_read2_en12;


              cchip2_read1_en1  <= chip2_read1_en1;
              cchip2_read1_en2  <= chip2_read1_en2;
              cchip2_read1_en3  <= chip2_read1_en3;
              cchip2_read1_en4  <= chip2_read1_en4;
              cchip2_read1_en5  <= chip2_read1_en5;
              cchip2_read1_en6  <= chip2_read1_en6;
              cchip2_read1_en7  <= chip2_read1_en7;
              cchip2_read1_en8  <= chip2_read1_en8;
              cchip2_read1_en9  <= chip2_read1_en9;
              cchip2_read1_en10 <= chip2_read1_en10;
              cchip2_read1_en11 <= chip2_read1_en11;
              cchip2_read1_en12 <= chip2_read1_en12;
              cchip2_read2_en1  <= chip2_read2_en1;
              cchip2_read2_en2  <= chip2_read2_en2;
              cchip2_read2_en3  <= chip2_read2_en3;
              cchip2_read2_en4  <= chip2_read2_en4;
              cchip2_read2_en5  <= chip2_read2_en5;
              cchip2_read2_en6  <= chip2_read2_en6;
              cchip2_read2_en7  <= chip2_read2_en7;
              cchip2_read2_en8  <= chip2_read2_en8;
              cchip2_read2_en9  <= chip2_read2_en9;
              cchip2_read2_en10 <= chip2_read2_en10;
              cchip2_read2_en11 <= chip2_read2_en11;
              cchip2_read2_en12 <= chip2_read2_en12;


              cchip3_read1_en1  <= chip3_read1_en1;
              cchip3_read1_en2  <= chip3_read1_en2;
              cchip3_read1_en3  <= chip3_read1_en3;
              cchip3_read1_en4  <= chip3_read1_en4;
              cchip3_read1_en5  <= chip3_read1_en5;
              cchip3_read1_en6  <= chip3_read1_en6;
              cchip3_read1_en7  <= chip3_read1_en7;
              cchip3_read1_en8  <= chip3_read1_en8;
              cchip3_read1_en9  <= chip3_read1_en9;
              cchip3_read1_en10 <= chip3_read1_en10;
              cchip3_read1_en11 <= chip3_read1_en11;
              cchip3_read1_en12 <= chip3_read1_en12;
              cchip3_read2_en1  <= chip3_read2_en1;
              cchip3_read2_en2  <= chip3_read2_en2;
              cchip3_read2_en3  <= chip3_read2_en3;
              cchip3_read2_en4  <= chip3_read2_en4;
              cchip3_read2_en5  <= chip3_read2_en5;
              cchip3_read2_en6  <= chip3_read2_en6;
              cchip3_read2_en7  <= chip3_read2_en7;
              cchip3_read2_en8  <= chip3_read2_en8;
              cchip3_read2_en9  <= chip3_read2_en9;
              cchip3_read2_en10 <= chip3_read2_en10;
              cchip3_read2_en11 <= chip3_read2_en11;
              cchip3_read2_en12 <= chip3_read2_en12;


              cchip4_read1_en1  <= chip4_read1_en1;
              cchip4_read1_en2  <= chip4_read1_en2;
              cchip4_read1_en3  <= chip4_read1_en3;
              cchip4_read1_en4  <= chip4_read1_en4;
              cchip4_read1_en5  <= chip4_read1_en5;
              cchip4_read1_en6  <= chip4_read1_en6;
              cchip4_read1_en7  <= chip4_read1_en7;
              cchip4_read1_en8  <= chip4_read1_en8;
              cchip4_read1_en9  <= chip4_read1_en9;
              cchip4_read1_en10 <= chip4_read1_en10;
              cchip4_read1_en11 <= chip4_read1_en11;
              cchip4_read1_en12 <= chip4_read1_en12;
              cchip4_read2_en1  <= chip4_read2_en1;
              cchip4_read2_en2  <= chip4_read2_en2;
              cchip4_read2_en3  <= chip4_read2_en3;
              cchip4_read2_en4  <= chip4_read2_en4;
              cchip4_read2_en5  <= chip4_read2_en5;
              cchip4_read2_en6  <= chip4_read2_en6;
              cchip4_read2_en7  <= chip4_read2_en7;
              cchip4_read2_en8  <= chip4_read2_en8;
              cchip4_read2_en9  <= chip4_read2_en9;
              cchip4_read2_en10 <= chip4_read2_en10;
              cchip4_read2_en11 <= chip4_read2_en11;
              cchip4_read2_en12 <= chip4_read2_en12;



              cchip5_read1_en1  <= chip5_read1_en1;
              cchip5_read1_en2  <= chip5_read1_en2;
              cchip5_read1_en3  <= chip5_read1_en3;
              cchip5_read1_en4  <= chip5_read1_en4;
              cchip5_read1_en5  <= chip5_read1_en5;
              cchip5_read1_en6  <= chip5_read1_en6;
              cchip5_read1_en7  <= chip5_read1_en7;
              cchip5_read1_en8  <= chip5_read1_en8;
              cchip5_read1_en9  <= chip5_read1_en9;
              cchip5_read1_en10 <= chip5_read1_en10;
              cchip5_read1_en11 <= chip5_read1_en11;
              cchip5_read1_en12 <= chip5_read1_en12;
              cchip5_read2_en1  <= chip5_read2_en1;
              cchip5_read2_en2  <= chip5_read2_en2;
              cchip5_read2_en3  <= chip5_read2_en3;
              cchip5_read2_en4  <= chip5_read2_en4;
              cchip5_read2_en5  <= chip5_read2_en5;
              cchip5_read2_en6  <= chip5_read2_en6;
              cchip5_read2_en7  <= chip5_read2_en7;
              cchip5_read2_en8  <= chip5_read2_en8;
              cchip5_read2_en9  <= chip5_read2_en9;
              cchip5_read2_en10 <= chip5_read2_en10;
              cchip5_read2_en11 <= chip5_read2_en11;
              cchip5_read2_en12 <= chip5_read2_en12;


              cchip6_read1_en1  <= chip6_read1_en1;
              cchip6_read1_en2  <= chip6_read1_en2;
              cchip6_read1_en3  <= chip6_read1_en3;
              cchip6_read1_en4  <= chip6_read1_en4;
              cchip6_read1_en5  <= chip6_read1_en5;
              cchip6_read1_en6  <= chip6_read1_en6;
              cchip6_read1_en7  <= chip6_read1_en7;
              cchip6_read1_en8  <= chip6_read1_en8;
              cchip6_read1_en9  <= chip6_read1_en9;
              cchip6_read1_en10 <= chip6_read1_en10;
              cchip6_read1_en11 <= chip6_read1_en11;
              cchip6_read1_en12 <= chip6_read1_en12;
              cchip6_read2_en1  <= chip6_read2_en1;
              cchip6_read2_en2  <= chip6_read2_en2;
              cchip6_read2_en3  <= chip6_read2_en3;
              cchip6_read2_en4  <= chip6_read2_en4;
              cchip6_read2_en5  <= chip6_read2_en5;
              cchip6_read2_en6  <= chip6_read2_en6;
              cchip6_read2_en7  <= chip6_read2_en7;
              cchip6_read2_en8  <= chip6_read2_en8;
              cchip6_read2_en9  <= chip6_read2_en9;
              cchip6_read2_en10 <= chip6_read2_en10;
              cchip6_read2_en11 <= chip6_read2_en11;
              cchip6_read2_en12 <= chip6_read2_en12;


              cchip7_read1_en1  <= chip7_read1_en1;
              cchip7_read1_en2  <= chip7_read1_en2;
              cchip7_read1_en3  <= chip7_read1_en3;
              cchip7_read1_en4  <= chip7_read1_en4;
              cchip7_read1_en5  <= chip7_read1_en5;
              cchip7_read1_en6  <= chip7_read1_en6;
              cchip7_read1_en7  <= chip7_read1_en7;
              cchip7_read1_en8  <= chip7_read1_en8;
              cchip7_read1_en9  <= chip7_read1_en9;
              cchip7_read1_en10 <= chip7_read1_en10;
              cchip7_read1_en11 <= chip7_read1_en11;
              cchip7_read1_en12 <= chip7_read1_en12;
              cchip7_read2_en1  <= chip7_read2_en1;
              cchip7_read2_en2  <= chip7_read2_en2;
              cchip7_read2_en3  <= chip7_read2_en3;
              cchip7_read2_en4  <= chip7_read2_en4;
              cchip7_read2_en5  <= chip7_read2_en5;
              cchip7_read2_en6  <= chip7_read2_en6;
              cchip7_read2_en7  <= chip7_read2_en7;
              cchip7_read2_en8  <= chip7_read2_en8;
              cchip7_read2_en9  <= chip7_read2_en9;
              cchip7_read2_en10 <= chip7_read2_en10;
              cchip7_read2_en11 <= chip7_read2_en11;
              cchip7_read2_en12 <= chip7_read2_en12;



              cchip8_read1_en1  <= chip8_read1_en1;
              cchip8_read1_en2  <= chip8_read1_en2;
              cchip8_read1_en3  <= chip8_read1_en3;
              cchip8_read1_en4  <= chip8_read1_en4;
              cchip8_read1_en5  <= chip8_read1_en5;
              cchip8_read1_en6  <= chip8_read1_en6;
              cchip8_read1_en7  <= chip8_read1_en7;
              cchip8_read1_en8  <= chip8_read1_en8;
              cchip8_read1_en9  <= chip8_read1_en9;
              cchip8_read1_en10 <= chip8_read1_en10;
              cchip8_read1_en11 <= chip8_read1_en11;
              cchip8_read1_en12 <= chip8_read1_en12;
              cchip8_read2_en1  <= chip8_read2_en1;
              cchip8_read2_en2  <= chip8_read2_en2;
              cchip8_read2_en3  <= chip8_read2_en3;
              cchip8_read2_en4  <= chip8_read2_en4;
              cchip8_read2_en5  <= chip8_read2_en5;
              cchip8_read2_en6  <= chip8_read2_en6;
              cchip8_read2_en7  <= chip8_read2_en7;
              cchip8_read2_en8  <= chip8_read2_en8;
              cchip8_read2_en9  <= chip8_read2_en9;
              cchip8_read2_en10 <= chip8_read2_en10;
              cchip8_read2_en11 <= chip8_read2_en11;
              cchip8_read2_en12 <= chip8_read2_en12;



              cchip9_read1_en1  <= chip9_read1_en1;
              cchip9_read1_en2  <= chip9_read1_en2;
              cchip9_read1_en3  <= chip9_read1_en3;
              cchip9_read1_en4  <= chip9_read1_en4;
              cchip9_read1_en5  <= chip9_read1_en5;
              cchip9_read1_en6  <= chip9_read1_en6;
              cchip9_read1_en7  <= chip9_read1_en7;
              cchip9_read1_en8  <= chip9_read1_en8;
              cchip9_read1_en9  <= chip9_read1_en9;
              cchip9_read1_en10 <= chip9_read1_en10;
              cchip9_read1_en11 <= chip9_read1_en11;
              cchip9_read1_en12 <= chip9_read1_en12;
              cchip9_read2_en1  <= chip9_read2_en1;
              cchip9_read2_en2  <= chip9_read2_en2;
              cchip9_read2_en3  <= chip9_read2_en3;
              cchip9_read2_en4  <= chip9_read2_en4;
              cchip9_read2_en5  <= chip9_read2_en5;
              cchip9_read2_en6  <= chip9_read2_en6;
              cchip9_read2_en7  <= chip9_read2_en7;
              cchip9_read2_en8  <= chip9_read2_en8;
              cchip9_read2_en9  <= chip9_read2_en9;
              cchip9_read2_en10 <= chip9_read2_en10;
              cchip9_read2_en11 <= chip9_read2_en11;
              cchip9_read2_en12 <= chip9_read2_en12;



              cchip10_read1_en1  <= chip10_read1_en1;
              cchip10_read1_en2  <= chip10_read1_en2;
              cchip10_read1_en3  <= chip10_read1_en3;
              cchip10_read1_en4  <= chip10_read1_en4;
              cchip10_read1_en5  <= chip10_read1_en5;
              cchip10_read1_en6  <= chip10_read1_en6;
              cchip10_read1_en7  <= chip10_read1_en7;
              cchip10_read1_en8  <= chip10_read1_en8;
              cchip10_read1_en9  <= chip10_read1_en9;
              cchip10_read1_en10 <= chip10_read1_en10;
              cchip10_read1_en11 <= chip10_read1_en11;
              cchip10_read1_en12 <= chip10_read1_en12;
              cchip10_read2_en1  <= chip10_read2_en1;
              cchip10_read2_en2  <= chip10_read2_en2;
              cchip10_read2_en3  <= chip10_read2_en3;
              cchip10_read2_en4  <= chip10_read2_en4;
              cchip10_read2_en5  <= chip10_read2_en5;
              cchip10_read2_en6  <= chip10_read2_en6;
              cchip10_read2_en7  <= chip10_read2_en7;
              cchip10_read2_en8  <= chip10_read2_en8;
              cchip10_read2_en9  <= chip10_read2_en9;
              cchip10_read2_en10 <= chip10_read2_en10;
              cchip10_read2_en11 <= chip10_read2_en11;
              cchip10_read2_en12 <= chip10_read2_en12;



              cchip11_read1_en1  <= chip11_read1_en1;
              cchip11_read1_en2  <= chip11_read1_en2;
              cchip11_read1_en3  <= chip11_read1_en3;
              cchip11_read1_en4  <= chip11_read1_en4;
              cchip11_read1_en5  <= chip11_read1_en5;
              cchip11_read1_en6  <= chip11_read1_en6;
              cchip11_read1_en7  <= chip11_read1_en7;
              cchip11_read1_en8  <= chip11_read1_en8;
              cchip11_read1_en9  <= chip11_read1_en9;
              cchip11_read1_en10 <= chip11_read1_en10;
              cchip11_read1_en11 <= chip11_read1_en11;
              cchip11_read1_en12 <= chip11_read1_en12;
              cchip11_read2_en1  <= chip11_read2_en1;
              cchip11_read2_en2  <= chip11_read2_en2;
              cchip11_read2_en3  <= chip11_read2_en3;
              cchip11_read2_en4  <= chip11_read2_en4;
              cchip11_read2_en5  <= chip11_read2_en5;
              cchip11_read2_en6  <= chip11_read2_en6;
              cchip11_read2_en7  <= chip11_read2_en7;
              cchip11_read2_en8  <= chip11_read2_en8;
              cchip11_read2_en9  <= chip11_read2_en9;
              cchip11_read2_en10 <= chip11_read2_en10;
              cchip11_read2_en11 <= chip11_read2_en11;
              cchip11_read2_en12 <= chip11_read2_en12;




              cchip12_read1_en1  <= chip12_read1_en1;
              cchip12_read1_en2  <= chip12_read1_en2;
              cchip12_read1_en3  <= chip12_read1_en3;
              cchip12_read1_en4  <= chip12_read1_en4;
              cchip12_read1_en5  <= chip12_read1_en5;
              cchip12_read1_en6  <= chip12_read1_en6;
              cchip12_read1_en7  <= chip12_read1_en7;
              cchip12_read1_en8  <= chip12_read1_en8;
              cchip12_read1_en9  <= chip12_read1_en9;
              cchip12_read1_en10 <= chip12_read1_en10;
              cchip12_read1_en11 <= chip12_read1_en11;
              cchip12_read1_en12 <= chip12_read1_en12;
              cchip12_read2_en1  <= chip12_read2_en1;
              cchip12_read2_en2  <= chip12_read2_en2;
              cchip12_read2_en3  <= chip12_read2_en3;
              cchip12_read2_en4  <= chip12_read2_en4;
              cchip12_read2_en5  <= chip12_read2_en5;
              cchip12_read2_en6  <= chip12_read2_en6;
              cchip12_read2_en7  <= chip12_read2_en7;
              cchip12_read2_en8  <= chip12_read2_en8;
              cchip12_read2_en9  <= chip12_read2_en9;
              cchip12_read2_en10 <= chip12_read2_en10;
              cchip12_read2_en11 <= chip12_read2_en11;
              cchip12_read2_en12 <= chip12_read2_en12;              
end




always @(posedge CLK_READ or posedge RST) begin//
            if (RST) begin//

              CHIP1_ADDR1_1   <= 10'b0;
              CHIP1_ADDR1_2   <= 10'b0;
              CHIP1_ADDR1_3   <= 10'b0;
              CHIP1_ADDR1_4   <= 10'b0;
              CHIP1_ADDR1_5   <= 10'b0;
              CHIP1_ADDR1_6   <= 10'b0;
              CHIP1_ADDR1_7   <= 10'b0;
              CHIP1_ADDR1_8   <= 10'b0;
              CHIP1_ADDR1_9   <= 10'b0;
              CHIP1_ADDR1_10  <= 10'b0;
              CHIP1_ADDR1_11  <= 10'b0;
              CHIP1_ADDR1_12  <= 10'b0;
              CHIP1_ADDR2_1   <= 10'b0;
              CHIP1_ADDR2_2   <= 10'b0;
              CHIP1_ADDR2_3   <= 10'b0;
              CHIP1_ADDR2_4   <= 10'b0;
              CHIP1_ADDR2_5   <= 10'b0;
              CHIP1_ADDR2_6   <= 10'b0;
              CHIP1_ADDR2_7   <= 10'b0;
              CHIP1_ADDR2_8   <= 10'b0;
              CHIP1_ADDR2_9   <= 10'b0;
              CHIP1_ADDR2_10  <= 10'b0;
              CHIP1_ADDR2_11  <= 10'b0;
              CHIP1_ADDR2_12  <= 10'b0;


              CHIP2_ADDR1_1   <= 10'b0;
              CHIP2_ADDR1_2   <= 10'b0;
              CHIP2_ADDR1_3   <= 10'b0;
              CHIP2_ADDR1_4   <= 10'b0;
              CHIP2_ADDR1_5   <= 10'b0;
              CHIP2_ADDR1_6   <= 10'b0;
              CHIP2_ADDR1_7   <= 10'b0;
              CHIP2_ADDR1_8   <= 10'b0;
              CHIP2_ADDR1_9   <= 10'b0;
              CHIP2_ADDR1_10  <= 10'b0;
              CHIP2_ADDR1_11  <= 10'b0;
              CHIP2_ADDR1_12  <= 10'b0;
              CHIP2_ADDR2_1   <= 10'b0;
              CHIP2_ADDR2_2   <= 10'b0;
              CHIP2_ADDR2_3   <= 10'b0;
              CHIP2_ADDR2_4   <= 10'b0;
              CHIP2_ADDR2_5   <= 10'b0;
              CHIP2_ADDR2_6   <= 10'b0;
              CHIP2_ADDR2_7   <= 10'b0;
              CHIP2_ADDR2_8   <= 10'b0;
              CHIP2_ADDR2_9   <= 10'b0;
              CHIP2_ADDR2_10  <= 10'b0;
              CHIP2_ADDR2_11  <= 10'b0;
              CHIP2_ADDR2_12  <= 10'b0;


              CHIP3_ADDR1_1   <= 10'b0;
              CHIP3_ADDR1_2   <= 10'b0;
              CHIP3_ADDR1_3   <= 10'b0;
              CHIP3_ADDR1_4   <= 10'b0;
              CHIP3_ADDR1_5   <= 10'b0;
              CHIP3_ADDR1_6   <= 10'b0;
              CHIP3_ADDR1_7   <= 10'b0;
              CHIP3_ADDR1_8   <= 10'b0;
              CHIP3_ADDR1_9   <= 10'b0;
              CHIP3_ADDR1_10  <= 10'b0;
              CHIP3_ADDR1_11  <= 10'b0;
              CHIP3_ADDR1_12  <= 10'b0;
              CHIP3_ADDR2_1   <= 10'b0;
              CHIP3_ADDR2_2   <= 10'b0;
              CHIP3_ADDR2_3   <= 10'b0;
              CHIP3_ADDR2_4   <= 10'b0;
              CHIP3_ADDR2_5   <= 10'b0;
              CHIP3_ADDR2_6   <= 10'b0;
              CHIP3_ADDR2_7   <= 10'b0;
              CHIP3_ADDR2_8   <= 10'b0;
              CHIP3_ADDR2_9   <= 10'b0;
              CHIP3_ADDR2_10  <= 10'b0;
              CHIP3_ADDR2_11  <= 10'b0;
              CHIP3_ADDR2_12  <= 10'b0;


              CHIP4_ADDR1_1   <= 10'b0;
              CHIP4_ADDR1_2   <= 10'b0;
              CHIP4_ADDR1_3   <= 10'b0;
              CHIP4_ADDR1_4   <= 10'b0;
              CHIP4_ADDR1_5   <= 10'b0;
              CHIP4_ADDR1_6   <= 10'b0;
              CHIP4_ADDR1_7   <= 10'b0;
              CHIP4_ADDR1_8   <= 10'b0;
              CHIP4_ADDR1_9   <= 10'b0;
              CHIP4_ADDR1_10  <= 10'b0;
              CHIP4_ADDR1_11  <= 10'b0;
              CHIP4_ADDR1_12  <= 10'b0;
              CHIP4_ADDR2_1   <= 10'b0;
              CHIP4_ADDR2_2   <= 10'b0;
              CHIP4_ADDR2_3   <= 10'b0;
              CHIP4_ADDR2_4   <= 10'b0;
              CHIP4_ADDR2_5   <= 10'b0;
              CHIP4_ADDR2_6   <= 10'b0;
              CHIP4_ADDR2_7   <= 10'b0;
              CHIP4_ADDR2_8   <= 10'b0;
              CHIP4_ADDR2_9   <= 10'b0;
              CHIP4_ADDR2_10  <= 10'b0;
              CHIP4_ADDR2_11  <= 10'b0;
              CHIP4_ADDR2_12  <= 10'b0;


              CHIP5_ADDR1_1   <= 10'b0;
              CHIP5_ADDR1_2   <= 10'b0;
              CHIP5_ADDR1_3   <= 10'b0;
              CHIP5_ADDR1_4   <= 10'b0;
              CHIP5_ADDR1_5   <= 10'b0;
              CHIP5_ADDR1_6   <= 10'b0;
              CHIP5_ADDR1_7   <= 10'b0;
              CHIP5_ADDR1_8   <= 10'b0;
              CHIP5_ADDR1_9   <= 10'b0;
              CHIP5_ADDR1_10  <= 10'b0;
              CHIP5_ADDR1_11  <= 10'b0;
              CHIP5_ADDR1_12  <= 10'b0;
              CHIP5_ADDR2_1   <= 10'b0;
              CHIP5_ADDR2_2   <= 10'b0;
              CHIP5_ADDR2_3   <= 10'b0;
              CHIP5_ADDR2_4   <= 10'b0;
              CHIP5_ADDR2_5   <= 10'b0;
              CHIP5_ADDR2_6   <= 10'b0;
              CHIP5_ADDR2_7   <= 10'b0;
              CHIP5_ADDR2_8   <= 10'b0;
              CHIP5_ADDR2_9   <= 10'b0;
              CHIP5_ADDR2_10  <= 10'b0;
              CHIP5_ADDR2_11  <= 10'b0;
              CHIP5_ADDR2_12  <= 10'b0;


              CHIP6_ADDR1_1   <= 10'b0;
              CHIP6_ADDR1_2   <= 10'b0;
              CHIP6_ADDR1_3   <= 10'b0;
              CHIP6_ADDR1_4   <= 10'b0;
              CHIP6_ADDR1_5   <= 10'b0;
              CHIP6_ADDR1_6   <= 10'b0;
              CHIP6_ADDR1_7   <= 10'b0;
              CHIP6_ADDR1_8   <= 10'b0;
              CHIP6_ADDR1_9   <= 10'b0;
              CHIP6_ADDR1_10  <= 10'b0;
              CHIP6_ADDR1_11  <= 10'b0;
              CHIP6_ADDR1_12  <= 10'b0;
              CHIP6_ADDR2_1   <= 10'b0;
              CHIP6_ADDR2_2   <= 10'b0;
              CHIP6_ADDR2_3   <= 10'b0;
              CHIP6_ADDR2_4   <= 10'b0;
              CHIP6_ADDR2_5   <= 10'b0;
              CHIP6_ADDR2_6   <= 10'b0;
              CHIP6_ADDR2_7   <= 10'b0;
              CHIP6_ADDR2_8   <= 10'b0;
              CHIP6_ADDR2_9   <= 10'b0;
              CHIP6_ADDR2_10  <= 10'b0;
              CHIP6_ADDR2_11  <= 10'b0;
              CHIP6_ADDR2_12  <= 10'b0;


              CHIP7_ADDR1_1   <= 10'b0;
              CHIP7_ADDR1_2   <= 10'b0;
              CHIP7_ADDR1_3   <= 10'b0;
              CHIP7_ADDR1_4   <= 10'b0;
              CHIP7_ADDR1_5   <= 10'b0;
              CHIP7_ADDR1_6   <= 10'b0;
              CHIP7_ADDR1_7   <= 10'b0;
              CHIP7_ADDR1_8   <= 10'b0;
              CHIP7_ADDR1_9   <= 10'b0;
              CHIP7_ADDR1_10  <= 10'b0;
              CHIP7_ADDR1_11  <= 10'b0;
              CHIP7_ADDR1_12  <= 10'b0;
              CHIP7_ADDR2_1   <= 10'b0;
              CHIP7_ADDR2_2   <= 10'b0;
              CHIP7_ADDR2_3   <= 10'b0;
              CHIP7_ADDR2_4   <= 10'b0;
              CHIP7_ADDR2_5   <= 10'b0;
              CHIP7_ADDR2_6   <= 10'b0;
              CHIP7_ADDR2_7   <= 10'b0;
              CHIP7_ADDR2_8   <= 10'b0;
              CHIP7_ADDR2_9   <= 10'b0;
              CHIP7_ADDR2_10  <= 10'b0;
              CHIP7_ADDR2_11  <= 10'b0;
              CHIP7_ADDR2_12  <= 10'b0;


              CHIP8_ADDR1_1   <= 10'b0;
              CHIP8_ADDR1_2   <= 10'b0;
              CHIP8_ADDR1_3   <= 10'b0;
              CHIP8_ADDR1_4   <= 10'b0;
              CHIP8_ADDR1_5   <= 10'b0;
              CHIP8_ADDR1_6   <= 10'b0;
              CHIP8_ADDR1_7   <= 10'b0;
              CHIP8_ADDR1_8   <= 10'b0;
              CHIP8_ADDR1_9   <= 10'b0;
              CHIP8_ADDR1_10  <= 10'b0;
              CHIP8_ADDR1_11  <= 10'b0;
              CHIP8_ADDR1_12  <= 10'b0;
              CHIP8_ADDR2_1   <= 10'b0;
              CHIP8_ADDR2_2   <= 10'b0;
              CHIP8_ADDR2_3   <= 10'b0;
              CHIP8_ADDR2_4   <= 10'b0;
              CHIP8_ADDR2_5   <= 10'b0;
              CHIP8_ADDR2_6   <= 10'b0;
              CHIP8_ADDR2_7   <= 10'b0;
              CHIP8_ADDR2_8   <= 10'b0;
              CHIP8_ADDR2_9   <= 10'b0;
              CHIP8_ADDR2_10  <= 10'b0;
              CHIP8_ADDR2_11  <= 10'b0;
              CHIP8_ADDR2_12  <= 10'b0;


              CHIP9_ADDR1_1   <= 10'b0;
              CHIP9_ADDR1_2   <= 10'b0;
              CHIP9_ADDR1_3   <= 10'b0;
              CHIP9_ADDR1_4   <= 10'b0;
              CHIP9_ADDR1_5   <= 10'b0;
              CHIP9_ADDR1_6   <= 10'b0;
              CHIP9_ADDR1_7   <= 10'b0;
              CHIP9_ADDR1_8   <= 10'b0;
              CHIP9_ADDR1_9   <= 10'b0;
              CHIP9_ADDR1_10  <= 10'b0;
              CHIP9_ADDR1_11  <= 10'b0;
              CHIP9_ADDR1_12  <= 10'b0;
              CHIP9_ADDR2_1   <= 10'b0;
              CHIP9_ADDR2_2   <= 10'b0;
              CHIP9_ADDR2_3   <= 10'b0;
              CHIP9_ADDR2_4   <= 10'b0;
              CHIP9_ADDR2_5   <= 10'b0;
              CHIP9_ADDR2_6   <= 10'b0;
              CHIP9_ADDR2_7   <= 10'b0;
              CHIP9_ADDR2_8   <= 10'b0;
              CHIP9_ADDR2_9   <= 10'b0;
              CHIP9_ADDR2_10  <= 10'b0;
              CHIP9_ADDR2_11  <= 10'b0;
              CHIP9_ADDR2_12  <= 10'b0;


              CHIP10_ADDR1_1   <= 10'b0;
              CHIP10_ADDR1_2   <= 10'b0;
              CHIP10_ADDR1_3   <= 10'b0;
              CHIP10_ADDR1_4   <= 10'b0;
              CHIP10_ADDR1_5   <= 10'b0;
              CHIP10_ADDR1_6   <= 10'b0;
              CHIP10_ADDR1_7   <= 10'b0;
              CHIP10_ADDR1_8   <= 10'b0;
              CHIP10_ADDR1_9   <= 10'b0;
              CHIP10_ADDR1_10  <= 10'b0;
              CHIP10_ADDR1_11  <= 10'b0;
              CHIP10_ADDR1_12  <= 10'b0;
              CHIP10_ADDR2_1   <= 10'b0;
              CHIP10_ADDR2_2   <= 10'b0;
              CHIP10_ADDR2_3   <= 10'b0;
              CHIP10_ADDR2_4   <= 10'b0;
              CHIP10_ADDR2_5   <= 10'b0;
              CHIP10_ADDR2_6   <= 10'b0;
              CHIP10_ADDR2_7   <= 10'b0;
              CHIP10_ADDR2_8   <= 10'b0;
              CHIP10_ADDR2_9   <= 10'b0;
              CHIP10_ADDR2_10  <= 10'b0;
              CHIP10_ADDR2_11  <= 10'b0;
              CHIP10_ADDR2_12  <= 10'b0;


              CHIP11_ADDR1_1   <= 10'b0;
              CHIP11_ADDR1_2   <= 10'b0;
              CHIP11_ADDR1_3   <= 10'b0;
              CHIP11_ADDR1_4   <= 10'b0;
              CHIP11_ADDR1_5   <= 10'b0;
              CHIP11_ADDR1_6   <= 10'b0;
              CHIP11_ADDR1_7   <= 10'b0;
              CHIP11_ADDR1_8   <= 10'b0;
              CHIP11_ADDR1_9   <= 10'b0;
              CHIP11_ADDR1_10  <= 10'b0;
              CHIP11_ADDR1_11  <= 10'b0;
              CHIP11_ADDR1_12  <= 10'b0;
              CHIP11_ADDR2_1   <= 10'b0;
              CHIP11_ADDR2_2   <= 10'b0;
              CHIP11_ADDR2_3   <= 10'b0;
              CHIP11_ADDR2_4   <= 10'b0;
              CHIP11_ADDR2_5   <= 10'b0;
              CHIP11_ADDR2_6   <= 10'b0;
              CHIP11_ADDR2_7   <= 10'b0;
              CHIP11_ADDR2_8   <= 10'b0;
              CHIP11_ADDR2_9   <= 10'b0;
              CHIP11_ADDR2_10  <= 10'b0;
              CHIP11_ADDR2_11  <= 10'b0;
              CHIP11_ADDR2_12  <= 10'b0;


              CHIP12_ADDR1_1   <= 10'b0;
              CHIP12_ADDR1_2   <= 10'b0;
              CHIP12_ADDR1_3   <= 10'b0;
              CHIP12_ADDR1_4   <= 10'b0;
              CHIP12_ADDR1_5   <= 10'b0;
              CHIP12_ADDR1_6   <= 10'b0;
              CHIP12_ADDR1_7   <= 10'b0;
              CHIP12_ADDR1_8   <= 10'b0;
              CHIP12_ADDR1_9   <= 10'b0;
              CHIP12_ADDR1_10  <= 10'b0;
              CHIP12_ADDR1_11  <= 10'b0;
              CHIP12_ADDR1_12  <= 10'b0;
              CHIP12_ADDR2_1   <= 10'b0;
              CHIP12_ADDR2_2   <= 10'b0;
              CHIP12_ADDR2_3   <= 10'b0;
              CHIP12_ADDR2_4   <= 10'b0;
              CHIP12_ADDR2_5   <= 10'b0;
              CHIP12_ADDR2_6   <= 10'b0;
              CHIP12_ADDR2_7   <= 10'b0;
              CHIP12_ADDR2_8   <= 10'b0;
              CHIP12_ADDR2_9   <= 10'b0;
              CHIP12_ADDR2_10  <= 10'b0;
              CHIP12_ADDR2_11  <= 10'b0;
              CHIP12_ADDR2_12  <= 10'b0;
            end

            else if (chip1_read1_en1) begin//
              CHIP1_ADDR1_1 <= CHIP1_ADDR1_1+1'b1;

 
            end
            else if (chip1_read1_en2) begin//
              CHIP1_ADDR1_1 <= 16'd0;
              CHIP1_ADDR1_2 <= CHIP1_ADDR1_2+1'b1;
   
            end
            else if (chip1_read1_en3) begin//
              CHIP1_ADDR1_2 <= 16'd0;
              CHIP1_ADDR1_3 <= CHIP1_ADDR1_3+1'b1;
     
            end
            else if (chip1_read1_en4) begin//
              CHIP1_ADDR1_3 <= 16'd0;
              CHIP1_ADDR1_4 <= CHIP1_ADDR1_4+1'b1;
      
            end
            else if (chip1_read1_en5) begin//
              CHIP1_ADDR1_4 <= 16'd0;
              CHIP1_ADDR1_5 <= CHIP1_ADDR1_5+1'b1;
     
            end
            else if (chip1_read1_en6) begin//
              CHIP1_ADDR1_5 <= 16'd0;
              CHIP1_ADDR1_6 <= CHIP1_ADDR1_6+1'b1;
    
            end
            else if (chip1_read1_en7) begin//
              CHIP1_ADDR1_6 <= 16'd0;
              CHIP1_ADDR1_7 <= CHIP1_ADDR1_7+1'b1;
    
            end
            else if (chip1_read1_en8) begin//
              CHIP1_ADDR1_7 <= 16'd0;
              CHIP1_ADDR1_8 <= CHIP1_ADDR1_8+1'b1;
     
            end
            else if (chip1_read1_en9) begin//
              CHIP1_ADDR1_8 <= 16'd0;
              CHIP1_ADDR1_9 <= CHIP1_ADDR1_9+1'b1;
     
            end
            else if (chip1_read1_en10) begin//
              CHIP1_ADDR1_9 <= 16'd0;
              CHIP1_ADDR1_10 <= CHIP1_ADDR1_10+1'b1;
     
            end
            else if (chip1_read1_en11) begin//
              CHIP1_ADDR1_10 <= 16'd0;
              CHIP1_ADDR1_11 <= CHIP1_ADDR1_11+1'b1;
      
            end
            else if (chip1_read1_en12) begin//
              CHIP1_ADDR1_11 <= 16'd0;
              CHIP1_ADDR1_12 <= CHIP1_ADDR1_12+1'b1;
     
            end

            else if (chip2_read1_en1) begin//
              CHIP1_ADDR1_12 <= 16'd0;
              CHIP2_ADDR1_1 <= CHIP2_ADDR1_1+1'b1;
     
            end
            else if (chip2_read1_en2) begin//
              CHIP2_ADDR1_1 <= 16'd0;
              CHIP2_ADDR1_2 <= CHIP2_ADDR1_2+1'b1;
      
            end
            else if (chip2_read1_en3) begin//
              CHIP2_ADDR1_2 <= 16'd0;
              CHIP2_ADDR1_3 <= CHIP2_ADDR1_3+1'b1;
    
            end
            else if (chip2_read1_en4) begin//
              CHIP2_ADDR1_3 <= 16'd0;
              CHIP2_ADDR1_4 <= CHIP2_ADDR1_4+1'b1;
     
            end
            else if (chip2_read1_en5) begin//
              CHIP2_ADDR1_4 <= 16'd0;
              CHIP2_ADDR1_5 <= CHIP2_ADDR1_5+1'b1;
    
            end
            else if (chip2_read1_en6) begin//
              CHIP2_ADDR1_5 <= 16'd0;
              CHIP2_ADDR1_6 <= CHIP2_ADDR1_6+1'b1;
    
            end
            else if (chip2_read1_en7) begin//
              CHIP2_ADDR1_6 <= 16'd0;
              CHIP2_ADDR1_7 <= CHIP2_ADDR1_7+1'b1;
     
            end
            else if (chip2_read1_en8) begin//
              CHIP2_ADDR1_7 <= 16'd0;
              CHIP2_ADDR1_8 <= CHIP2_ADDR1_8+1'b1;
     
            end
            else if (chip2_read1_en9) begin//
              CHIP2_ADDR1_8 <= 16'd0;
              CHIP2_ADDR1_9 <= CHIP2_ADDR1_9+1'b1;
      
            end
            else if (chip2_read1_en10) begin//
              CHIP2_ADDR1_9 <= 16'd0;
              CHIP2_ADDR1_10 <= CHIP2_ADDR1_10+1'b1;
      
            end
            else if (chip2_read1_en11) begin//
              CHIP2_ADDR1_10 <= 16'd0;
              CHIP2_ADDR1_11 <= CHIP2_ADDR1_11+1'b1;
     
            end
            else if (chip2_read1_en12) begin//
              CHIP2_ADDR1_11 <= 16'd0;
              CHIP2_ADDR1_12 <= CHIP2_ADDR1_12+1'b1;
     
            end

            else if (chip3_read1_en1) begin//
              CHIP2_ADDR1_12 <= 16'd0;
              CHIP3_ADDR1_1 <= CHIP3_ADDR1_1+1'b1;
    
            end
            else if (chip3_read1_en2) begin//
              CHIP3_ADDR1_1 <= 16'd0;
              CHIP3_ADDR1_2 <= CHIP3_ADDR1_2+1'b1;
      
            end
            else if (chip3_read1_en3) begin//
              CHIP3_ADDR1_2 <= 16'd0;
              CHIP3_ADDR1_3 <= CHIP3_ADDR1_3+1'b1;
      
            end
            else if (chip3_read1_en4) begin//
              CHIP3_ADDR1_3 <= 16'd0;
              CHIP3_ADDR1_4 <= CHIP3_ADDR1_4+1'b1;
    
            end
            else if (chip3_read1_en5) begin//
              CHIP3_ADDR1_4 <= 16'd0;
              CHIP3_ADDR1_5 <= CHIP3_ADDR1_5+1'b1;
      
            end
            else if (chip3_read1_en6) begin//
              CHIP3_ADDR1_5 <= 16'd0;
              CHIP3_ADDR1_6 <= CHIP3_ADDR1_6+1'b1;
    
            end
            else if (chip3_read1_en7) begin//
              CHIP3_ADDR1_6 <= 16'd0;
              CHIP3_ADDR1_7 <= CHIP3_ADDR1_7+1'b1;
    
            end
            else if (chip3_read1_en8) begin//
              CHIP3_ADDR1_7 <= 16'd0;
              CHIP3_ADDR1_8 <= CHIP3_ADDR1_8+1'b1;
   
            end
            else if (chip3_read1_en9) begin//
              CHIP3_ADDR1_8 <= 16'd0;
              CHIP3_ADDR1_9 <= CHIP3_ADDR1_9+1'b1;
     
            end
            else if (chip3_read1_en10) begin//
              CHIP3_ADDR1_9 <= 16'd0;
              CHIP3_ADDR1_10 <= CHIP3_ADDR1_10+1'b1;
   
            end
            else if (chip3_read1_en11) begin//
              CHIP3_ADDR1_10 <= 16'd0;
              CHIP3_ADDR1_11 <= CHIP3_ADDR1_11+1'b1;
  
            end
            else if (chip3_read1_en12) begin//
              CHIP3_ADDR1_11 <= 16'd0;
              CHIP3_ADDR1_12 <= CHIP3_ADDR1_12+1'b1;
    
            end


            else if (chip4_read1_en1) begin//
              CHIP3_ADDR1_12 <= 16'd0;
              CHIP4_ADDR1_1 <= CHIP4_ADDR1_1+1'b1;
      
            end
            else if (chip4_read1_en2) begin//
              CHIP4_ADDR1_1 <= 16'd0;
              CHIP4_ADDR1_2 <= CHIP4_ADDR1_2+1'b1;
      
            end
            else if (chip4_read1_en3) begin//
              CHIP4_ADDR1_2 <= 16'd0;
              CHIP4_ADDR1_3 <= CHIP4_ADDR1_3+1'b1;
    
            end
            else if (chip4_read1_en4) begin//
              CHIP4_ADDR1_3 <= 16'd0;
              CHIP4_ADDR1_4 <= CHIP4_ADDR1_4+1'b1;
   
            end
            else if (chip4_read1_en5) begin//
              CHIP4_ADDR1_4 <= 16'd0;
              CHIP4_ADDR1_5 <= CHIP4_ADDR1_5+1'b1;
     
            end
            else if (chip4_read1_en6) begin//
              CHIP4_ADDR1_5 <= 16'd0;
              CHIP4_ADDR1_6 <= CHIP4_ADDR1_6+1'b1;
   
            end
            else if (chip4_read1_en7) begin//
              CHIP4_ADDR1_6 <= 16'd0;
              CHIP4_ADDR1_7 <= CHIP4_ADDR1_7+1'b1;
     
            end
            else if (chip4_read1_en8) begin//
              CHIP4_ADDR1_7 <= 16'd0;
              CHIP4_ADDR1_8 <= CHIP4_ADDR1_8+1'b1;
     
            end
            else if (chip4_read1_en9) begin//
              CHIP4_ADDR1_8 <= 16'd0;
              CHIP4_ADDR1_9 <= CHIP4_ADDR1_9+1'b1;
   
            end
            else if (chip4_read1_en10) begin//
              CHIP4_ADDR1_9 <= 16'd0;
              CHIP4_ADDR1_10 <= CHIP4_ADDR1_10+1'b1;
     
            end
            else if (chip4_read1_en11) begin//
              CHIP4_ADDR1_10 <= 16'd0;
              CHIP4_ADDR1_11 <= CHIP4_ADDR1_11+1'b1;
    
            end
            else if (chip4_read1_en12) begin//
              CHIP4_ADDR1_11 <= 16'd0;
              CHIP4_ADDR1_12 <= CHIP4_ADDR1_12+1'b1;
    
            end


            else if (chip5_read1_en1) begin//
              CHIP4_ADDR1_12 <= 16'd0;
              CHIP5_ADDR1_1 <= CHIP5_ADDR1_1+1'b1;
     
            end
            else if (chip5_read1_en2) begin//
              CHIP5_ADDR1_1 <= 16'd0;
              CHIP5_ADDR1_2 <= CHIP5_ADDR1_2+1'b1;
  
            end
            else if (chip5_read1_en3) begin//
              CHIP5_ADDR1_2 <= 16'd0;
              CHIP5_ADDR1_3 <= CHIP5_ADDR1_3+1'b1;
    
            end
            else if (chip5_read1_en4) begin//
              CHIP5_ADDR1_3 <= 16'd0;
              CHIP5_ADDR1_4 <= CHIP5_ADDR1_4+1'b1;
     
            end
            else if (chip5_read1_en5) begin//
              CHIP5_ADDR1_4 <= 16'd0;
              CHIP5_ADDR1_5 <= CHIP5_ADDR1_5+1'b1;
    
            end
            else if (chip5_read1_en6) begin//
              CHIP5_ADDR1_5 <= 16'd0;
              CHIP5_ADDR1_6 <= CHIP5_ADDR1_6+1'b1;
    
            end
            else if (chip5_read1_en7) begin//
              CHIP5_ADDR1_6 <= 16'd0;
              CHIP5_ADDR1_7 <= CHIP5_ADDR1_7+1'b1;
     
            end
            else if (chip5_read1_en8) begin//
              CHIP5_ADDR1_7 <= 16'd0;
              CHIP5_ADDR1_8 <= CHIP5_ADDR1_8+1'b1;
   
            end
            else if (chip5_read1_en9) begin//
              CHIP5_ADDR1_8 <= 16'd0;
              CHIP5_ADDR1_9 <= CHIP5_ADDR1_9+1'b1;
     
            end
            else if (chip5_read1_en10) begin//
              CHIP5_ADDR1_9 <= 16'd0;
              CHIP5_ADDR1_10 <= CHIP5_ADDR1_10+1'b1;
      
            end
            else if (chip5_read1_en11) begin//
              CHIP5_ADDR1_10 <= 16'd0;
              CHIP5_ADDR1_11 <= CHIP5_ADDR1_11+1'b1;
    
            end
            else if (chip5_read1_en12) begin//
              CHIP5_ADDR1_11 <= 16'd0;
              CHIP5_ADDR1_12 <= CHIP5_ADDR1_12+1'b1;
  
            end

            else if (chip6_read1_en1) begin//
              CHIP5_ADDR1_12 <= 16'd0;
              CHIP6_ADDR1_1 <= CHIP6_ADDR1_1+1'b1;
    
            end
            else if (chip6_read1_en2) begin//
              CHIP6_ADDR1_1 <= 16'd0;
              CHIP6_ADDR1_2 <= CHIP6_ADDR1_2+1'b1;
     
            end
            else if (chip6_read1_en3) begin//
              CHIP6_ADDR1_2 <= 16'd0;
              CHIP6_ADDR1_3 <= CHIP6_ADDR1_3+1'b1;
     
            end
            else if (chip6_read1_en4) begin//
              CHIP6_ADDR1_3 <= 16'd0;
              CHIP6_ADDR1_4 <= CHIP6_ADDR1_4+1'b1;
     
            end
            else if (chip6_read1_en5) begin//
              CHIP6_ADDR1_4 <= 16'd0;
              CHIP6_ADDR1_5 <= CHIP6_ADDR1_5+1'b1;
     
            end
            else if (chip6_read1_en6) begin//
              CHIP6_ADDR1_5 <= 16'd0;
              CHIP6_ADDR1_6 <= CHIP6_ADDR1_6+1'b1;
     
            end
            else if (chip6_read1_en7) begin//
              CHIP6_ADDR1_6 <= 16'd0;
              CHIP6_ADDR1_7 <= CHIP6_ADDR1_7+1'b1;
      
            end
            else if (chip6_read1_en8) begin//
              CHIP6_ADDR1_7 <= 16'd0;
              CHIP6_ADDR1_8 <= CHIP6_ADDR1_8+1'b1;
     
            end
            else if (chip6_read1_en9) begin//
              CHIP6_ADDR1_8 <= 16'd0;
              CHIP6_ADDR1_9 <= CHIP6_ADDR1_9+1'b1;
         
            end
            else if (chip6_read1_en10) begin//
              CHIP6_ADDR1_9 <= 16'd0;
              CHIP6_ADDR1_10 <= CHIP6_ADDR1_10+1'b1;
    
            end
            else if (chip6_read1_en11) begin//
              CHIP6_ADDR1_10 <= 16'd0;
              CHIP6_ADDR1_11 <= CHIP6_ADDR1_11+1'b1;
         
            end
            else if (chip6_read1_en12) begin//
              CHIP6_ADDR1_11 <= 16'd0;
              CHIP6_ADDR1_12 <= CHIP6_ADDR1_12+1'b1;
     
            end


            else if (chip7_read1_en1) begin//
              CHIP6_ADDR1_12 <= 16'd0;
              CHIP7_ADDR1_1 <= CHIP7_ADDR1_1+1'b1;
       
            end
            else if (chip7_read1_en2) begin//
              CHIP7_ADDR1_1 <= 16'd0;
              CHIP7_ADDR1_2 <= CHIP7_ADDR1_2+1'b1;
     
            end
            else if (chip7_read1_en3) begin//
              CHIP7_ADDR1_2 <= 16'd0;
              CHIP7_ADDR1_3 <= CHIP7_ADDR1_3+1'b1;
    
            end
            else if (chip7_read1_en4) begin//
              CHIP7_ADDR1_3 <= 16'd0;
              CHIP7_ADDR1_4 <= CHIP7_ADDR1_4+1'b1;
  
            end
            else if (chip7_read1_en5) begin//
              CHIP7_ADDR1_4 <= 16'd0;
              CHIP7_ADDR1_5 <= CHIP7_ADDR1_5+1'b1;
    
            end
            else if (chip7_read1_en6) begin//
              CHIP7_ADDR1_5 <= 16'd0;
              CHIP7_ADDR1_6 <= CHIP7_ADDR1_6+1'b1;
     
            end
            else if (chip7_read1_en7) begin//
              CHIP7_ADDR1_6 <= 16'd0;
              CHIP7_ADDR1_7 <= CHIP7_ADDR1_7+1'b1;
        
            end
            else if (chip7_read1_en8) begin//
              CHIP7_ADDR1_7 <= 16'd0;
              CHIP7_ADDR1_8 <= CHIP7_ADDR1_8+1'b1;
      
            end
            else if (chip7_read1_en9) begin//
              CHIP7_ADDR1_8 <= 16'd0;
              CHIP7_ADDR1_9 <= CHIP7_ADDR1_9+1'b1;
              
            end
            else if (chip7_read1_en10) begin//
              CHIP7_ADDR1_9 <= 16'd0;
              CHIP7_ADDR1_10 <= CHIP7_ADDR1_10+1'b1;
             
            end
            else if (chip7_read1_en11) begin//
              CHIP7_ADDR1_10 <= 16'd0;
              CHIP7_ADDR1_11 <= CHIP7_ADDR1_11+1'b1;
          
            end
            else if (chip7_read1_en12) begin//
              CHIP7_ADDR1_11 <= 16'd0;
              CHIP7_ADDR1_12 <= CHIP7_ADDR1_12+1'b1;
        
            end


            else if (chip8_read1_en1) begin//
              CHIP7_ADDR1_12 <= 16'd0;
              CHIP8_ADDR1_1 <= CHIP8_ADDR1_1+1'b1;
           
            end
            else if (chip8_read1_en2) begin//
              CHIP8_ADDR1_1 <= 16'd0;
              CHIP8_ADDR1_2 <= CHIP8_ADDR1_2+1'b1;
    
            end
            else if (chip8_read1_en3) begin//
              CHIP8_ADDR1_2 <= 16'd0;
              CHIP8_ADDR1_3 <= CHIP8_ADDR1_3+1'b1;
             
            end
            else if (chip8_read1_en4) begin//
              CHIP8_ADDR1_3 <= 16'd0;
              CHIP8_ADDR1_4 <= CHIP8_ADDR1_4+1'b1;
               
            end
            else if (chip8_read1_en5) begin//
              CHIP8_ADDR1_4 <= 16'd0;
              CHIP8_ADDR1_5 <= CHIP8_ADDR1_5+1'b1;
     
            end
            else if (chip8_read1_en6) begin//
              CHIP8_ADDR1_5 <= 16'd0;
              CHIP8_ADDR1_6 <= CHIP8_ADDR1_6+1'b1;
           
            end
            else if (chip8_read1_en7) begin//
              CHIP8_ADDR1_6 <= 16'd0;
              CHIP8_ADDR1_7 <= CHIP8_ADDR1_7+1'b1;
      
            end
            else if (chip8_read1_en8) begin//
              CHIP8_ADDR1_7 <= 16'd0;
              CHIP8_ADDR1_8 <= CHIP8_ADDR1_8+1'b1;
         
            end
            else if (chip8_read1_en9) begin//
              CHIP8_ADDR1_8 <= 16'd0;
              CHIP8_ADDR1_9 <= CHIP8_ADDR1_9+1'b1;
            
            end
            else if (chip8_read1_en10) begin//
              CHIP8_ADDR1_9 <= 16'd0;
              CHIP8_ADDR1_10 <= CHIP8_ADDR1_10+1'b1;
         
            end
            else if (chip8_read1_en11) begin//
              CHIP8_ADDR1_10 <= 16'd0;
              CHIP8_ADDR1_11 <= CHIP8_ADDR1_11+1'b1;
              
            end
            else if (chip8_read1_en12) begin//
              CHIP8_ADDR1_11 <= 16'd0;
              CHIP8_ADDR1_12 <= CHIP8_ADDR1_12+1'b1;
        
            end


            else if (chip9_read1_en1) begin//
              CHIP8_ADDR1_12 <= 16'd0;
              CHIP9_ADDR1_1 <= CHIP9_ADDR1_1+1'b1;
          
            end
            else if (chip9_read1_en2) begin//
              CHIP9_ADDR1_1 <= 16'd0;
              CHIP9_ADDR1_2 <= CHIP9_ADDR1_2+1'b1;
        
            end
            else if (chip9_read1_en3) begin//
              CHIP9_ADDR1_2 <= 16'd0;
              CHIP9_ADDR1_3 <= CHIP9_ADDR1_3+1'b1;
       
            end
            else if (chip9_read1_en4) begin//
              CHIP9_ADDR1_3 <= 16'd0;
              CHIP9_ADDR1_4 <= CHIP9_ADDR1_4+1'b1;
      
            end
            else if (chip9_read1_en5) begin//
              CHIP9_ADDR1_4 <= 16'd0;
              CHIP9_ADDR1_5 <= CHIP9_ADDR1_5+1'b1;
          
            end
            else if (chip9_read1_en6) begin//
              CHIP9_ADDR1_5 <= 16'd0;
              CHIP9_ADDR1_6 <= CHIP9_ADDR1_6+1'b1;
       
            end
            else if (chip9_read1_en7) begin//
              CHIP9_ADDR1_6 <= 16'd0;
              CHIP9_ADDR1_7 <= CHIP9_ADDR1_7+1'b1;
         
            end
            else if (chip9_read1_en8) begin//
              CHIP9_ADDR1_7 <= 16'd0;
              CHIP9_ADDR1_8 <= CHIP9_ADDR1_8+1'b1;
          
            end
            else if (chip9_read1_en9) begin//
              CHIP9_ADDR1_8 <= 16'd0;
              CHIP9_ADDR1_9 <= CHIP9_ADDR1_9+1'b1;
           
            end
            else if (chip9_read1_en10) begin//
              CHIP9_ADDR1_9 <= 16'd0;
              CHIP9_ADDR1_10 <= CHIP9_ADDR1_10+1'b1;
       
            end
            else if (chip9_read1_en11) begin//
              CHIP9_ADDR1_10 <= 16'd0;
              CHIP9_ADDR1_11 <= CHIP9_ADDR1_11+1'b1;
              
            end
            else if (chip9_read1_en12) begin//
              CHIP9_ADDR1_11 <= 16'd0;
              CHIP9_ADDR1_12 <= CHIP9_ADDR1_12+1'b1;
             
            end


            else if (chip10_read1_en1) begin//
              CHIP9_ADDR1_12 <= 16'd0;
              CHIP10_ADDR1_1 <= CHIP10_ADDR1_1+1'b1;
      
            end
            else if (chip10_read1_en2) begin//
              CHIP10_ADDR1_1 <= 16'd0;
              CHIP10_ADDR1_2 <= CHIP10_ADDR1_2+1'b1;
        
            end
            else if (chip10_read1_en3) begin//
              CHIP10_ADDR1_2 <= 16'd0;
              CHIP10_ADDR1_3 <= CHIP10_ADDR1_3+1'b1;
           
            end
            else if (chip10_read1_en4) begin//
              CHIP10_ADDR1_3 <= 16'd0;
              CHIP10_ADDR1_4 <= CHIP10_ADDR1_4+1'b1;
             
            end
            else if (chip10_read1_en5) begin//
              CHIP10_ADDR1_4 <= 16'd0;
              CHIP10_ADDR1_5 <= CHIP10_ADDR1_5+1'b1;
         
            end
            else if (chip10_read1_en6) begin//
              CHIP10_ADDR1_5 <= 16'd0;
              CHIP10_ADDR1_6 <= CHIP10_ADDR1_6+1'b1;
        
            end
            else if (chip10_read1_en7) begin//
              CHIP10_ADDR1_6 <= 16'd0;
              CHIP10_ADDR1_7 <= CHIP10_ADDR1_7+1'b1;
         
            end
            else if (chip10_read1_en8) begin//
              CHIP10_ADDR1_7 <= 16'd0;
              CHIP10_ADDR1_8 <= CHIP10_ADDR1_8+1'b1;
               
            end
            else if (chip10_read1_en9) begin//
              CHIP10_ADDR1_8 <= 16'd0;
              CHIP10_ADDR1_9 <= CHIP10_ADDR1_9+1'b1;
          
            end
            else if (chip10_read1_en10) begin//
              CHIP10_ADDR1_9 <= 16'd0;
              CHIP10_ADDR1_10 <= CHIP10_ADDR1_10+1'b1;
              
            end
            else if (chip10_read1_en11) begin//
              CHIP10_ADDR1_10 <= 16'd0;
              CHIP10_ADDR1_11 <= CHIP10_ADDR1_11+1'b1;
          
            end
            else if (chip10_read1_en12) begin//
              CHIP10_ADDR1_11 <= 16'd0;
              CHIP10_ADDR1_12 <= CHIP10_ADDR1_12+1'b1;
         
            end



            else if (chip11_read1_en1) begin//
              CHIP10_ADDR1_12 <= 16'd0;
              CHIP11_ADDR1_1 <= CHIP11_ADDR1_1+1'b1;
          
            end
            else if (chip11_read1_en2) begin//
              CHIP11_ADDR1_1 <= 16'd0;
              CHIP11_ADDR1_2 <= CHIP11_ADDR1_2+1'b1;
            
            end
            else if (chip11_read1_en3) begin//
              CHIP11_ADDR1_2 <= 16'd0;
              CHIP11_ADDR1_3 <= CHIP11_ADDR1_3+1'b1;
         
            end
            else if (chip11_read1_en4) begin//
              CHIP11_ADDR1_3 <= 16'd0;
              CHIP11_ADDR1_4 <= CHIP11_ADDR1_4+1'b1;
           
            end
            else if (chip11_read1_en5) begin//
              CHIP11_ADDR1_4 <= 16'd0;
              CHIP11_ADDR1_5 <= CHIP11_ADDR1_5+1'b1;
      
            end
            else if (chip11_read1_en6) begin//
              CHIP11_ADDR1_5 <= 16'd0;
              CHIP11_ADDR1_6 <= CHIP11_ADDR1_6+1'b1;
           
            end
            else if (chip11_read1_en7) begin//
              CHIP11_ADDR1_6 <= 16'd0;
              CHIP11_ADDR1_7 <= CHIP11_ADDR1_7+1'b1;
       
            end
            else if (chip11_read1_en8) begin//
              CHIP11_ADDR1_7 <= 16'd0;
              CHIP11_ADDR1_8 <= CHIP11_ADDR1_8+1'b1;
       
            end
            else if (chip11_read1_en9) begin//
              CHIP11_ADDR1_8 <= 16'd0;
              CHIP11_ADDR1_9 <= CHIP11_ADDR1_9+1'b1;
           
            end
            else if (chip11_read1_en10) begin//
              CHIP11_ADDR1_9 <= 16'd0;
              CHIP11_ADDR1_10 <= CHIP11_ADDR1_10+1'b1;
     
            end
            else if (chip11_read1_en11) begin//
              CHIP11_ADDR1_10 <= 16'd0;
              CHIP11_ADDR1_11 <= CHIP11_ADDR1_11+1'b1;
        
            end
            else if (chip11_read1_en12) begin//
              CHIP11_ADDR1_11 <= 16'd0;
              CHIP11_ADDR1_12 <= CHIP11_ADDR1_12+1'b1;
        
            end


            else if (chip12_read1_en1) begin//
              CHIP11_ADDR1_12 <= 16'd0;
              CHIP12_ADDR1_1 <= CHIP12_ADDR1_1+1'b1;
      
            end
            else if (chip12_read1_en2) begin//
              CHIP12_ADDR1_1 <= 16'd0;
              CHIP12_ADDR1_2 <= CHIP12_ADDR1_2+1'b1;
     
            end
            else if (chip12_read1_en3) begin//
              CHIP12_ADDR1_2 <= 16'd0;
              CHIP12_ADDR1_3 <= CHIP12_ADDR1_3+1'b1;
                
            end
            else if (chip12_read1_en4) begin//
              CHIP12_ADDR1_3 <= 16'd0;
              CHIP12_ADDR1_4 <= CHIP12_ADDR1_4+1'b1;
           
            end
            else if (chip12_read1_en5) begin//
              CHIP12_ADDR1_4 <= 16'd0;
              CHIP12_ADDR1_5 <= CHIP12_ADDR1_5+1'b1;
    
            end
            else if (chip12_read1_en6) begin//
              CHIP12_ADDR1_5 <= 16'd0;
              CHIP12_ADDR1_6 <= CHIP12_ADDR1_6+1'b1;
            
            end
            else if (chip12_read1_en7) begin//
              CHIP12_ADDR1_6 <= 16'd0;
              CHIP12_ADDR1_7 <= CHIP12_ADDR1_7+1'b1;
           
            end
            else if (chip12_read1_en8) begin//
              CHIP12_ADDR1_7 <= 16'd0;
              CHIP12_ADDR1_8 <= CHIP12_ADDR1_8+1'b1;
          
            end
            else if (chip12_read1_en9) begin//
              CHIP12_ADDR1_8 <= 16'd0;
              CHIP12_ADDR1_9 <= CHIP12_ADDR1_9+1'b1;
              
            end
            else if (chip12_read1_en10) begin//
              CHIP12_ADDR1_9 <= 16'd0;
              CHIP12_ADDR1_10 <= CHIP12_ADDR1_10+1'b1;
             
            end
            else if (chip12_read1_en11) begin//
              CHIP12_ADDR1_10 <= 16'd0;
              CHIP12_ADDR1_11 <= CHIP12_ADDR1_11+1'b1;
        
            end
            else if (chip12_read1_en12) begin//
              CHIP12_ADDR1_11 <= 16'd0;
              CHIP12_ADDR1_12 <= CHIP12_ADDR1_12+1'b1;
          
            end


            else if (chip1_read2_en1) begin//
              CHIP12_ADDR1_12 <= 16'd0;
              CHIP1_ADDR2_1 <= CHIP1_ADDR2_1+1'b1;

 
            end
            else if (chip1_read2_en2) begin//
              CHIP1_ADDR2_1 <= 16'd0;
              CHIP1_ADDR2_2 <= CHIP1_ADDR2_2+1'b1;
           
            end
            else if (chip1_read2_en3) begin//
              CHIP1_ADDR2_2 <= 16'd0;
              CHIP1_ADDR2_3 <= CHIP1_ADDR2_3+1'b1;
           
            end
            else if (chip1_read2_en4) begin//
              CHIP1_ADDR2_3 <= 16'd0;
              CHIP1_ADDR2_4 <= CHIP1_ADDR2_4+1'b1;
         
            end
            else if (chip1_read2_en5) begin//
              CHIP1_ADDR2_4 <= 16'd0;
              CHIP1_ADDR2_5 <= CHIP1_ADDR2_5+1'b1;
             
            end
            else if (chip1_read2_en6) begin//
              CHIP1_ADDR2_5 <= 16'd0;
              CHIP1_ADDR2_6 <= CHIP1_ADDR2_6+1'b1;
           
            end
            else if (chip1_read2_en7) begin//
              CHIP1_ADDR2_6 <= 16'd0;
              CHIP1_ADDR2_7 <= CHIP1_ADDR2_7+1'b1;
     
            end
            else if (chip1_read2_en8) begin//
              CHIP1_ADDR2_7 <= 16'd0;
              CHIP1_ADDR2_8 <= CHIP1_ADDR2_8+1'b1;
             
            end
            else if (chip1_read2_en9) begin//
              CHIP1_ADDR2_8 <= 16'd0;
              CHIP1_ADDR2_9 <= CHIP1_ADDR2_9+1'b1;
               
            end
            else if (chip1_read2_en10) begin//
              CHIP1_ADDR2_9 <= 16'd0;
              CHIP1_ADDR2_10 <= CHIP1_ADDR2_10+1'b1;
                 
            end
            else if (chip1_read2_en11) begin//
              CHIP1_ADDR2_10 <= 16'd0;
              CHIP1_ADDR2_11 <= CHIP1_ADDR2_11+1'b1;
             
            end
            else if (chip1_read2_en12) begin//
              CHIP1_ADDR2_11 <= 16'd0;
              CHIP1_ADDR2_12 <= CHIP1_ADDR2_12+1'b1;
        
            end

            else if (chip2_read2_en1) begin//
              CHIP1_ADDR2_12 <= 16'd0;
              CHIP2_ADDR2_1 <= CHIP2_ADDR2_1+1'b1;
              
            end
            else if (chip2_read2_en2) begin//
              CHIP2_ADDR2_1 <= 16'd0;
              CHIP2_ADDR2_2 <= CHIP2_ADDR2_2+1'b1;
           
            end
            else if (chip2_read2_en3) begin//
              CHIP2_ADDR2_2 <= 16'd0;
              CHIP2_ADDR2_3 <= CHIP2_ADDR2_3+1'b1;
         
            end
            else if (chip2_read2_en4) begin//
              CHIP2_ADDR2_3 <= 16'd0;
              CHIP2_ADDR2_4 <= CHIP2_ADDR2_4+1'b1;
      
            end
            else if (chip2_read2_en5) begin//
              CHIP2_ADDR2_4 <= 16'd0;
              CHIP2_ADDR2_5 <= CHIP2_ADDR2_5+1'b1;
              
            end
            else if (chip2_read2_en6) begin//
              CHIP2_ADDR2_5 <= 16'd0;
              CHIP2_ADDR2_6 <= CHIP2_ADDR2_6+1'b1;
              
            end
            else if (chip2_read2_en7) begin//
              CHIP2_ADDR2_6 <= 16'd0;
              CHIP2_ADDR2_7 <= CHIP2_ADDR2_7+1'b1;
              
            end
            else if (chip2_read2_en8) begin//
              CHIP2_ADDR2_7 <= 16'd0;
              CHIP2_ADDR2_8 <= CHIP2_ADDR2_8+1'b1;
                
            end
            else if (chip2_read2_en9) begin//
              CHIP2_ADDR2_8 <= 16'd0;
              CHIP2_ADDR2_9 <= CHIP2_ADDR2_9+1'b1;
          
            end
            else if (chip2_read2_en10) begin//
              CHIP2_ADDR2_9 <= 16'd0;
              CHIP2_ADDR2_10 <= CHIP2_ADDR2_10+1'b1;
            
            end
            else if (chip2_read2_en11) begin//
              CHIP2_ADDR2_10 <= 16'd0;
              CHIP2_ADDR2_11 <= CHIP2_ADDR2_11+1'b1;
          
            end
            else if (chip2_read2_en12) begin//
              CHIP2_ADDR2_11 <= 16'd0;
              CHIP2_ADDR2_12 <= CHIP2_ADDR2_12+1'b1;
         
            end

            else if (chip3_read2_en1) begin//
              CHIP2_ADDR2_12 <= 16'd0;
              CHIP3_ADDR2_1 <= CHIP3_ADDR2_1+1'b1;
   
            end
            else if (chip3_read2_en2) begin//
              CHIP3_ADDR2_1 <= 16'd0;
              CHIP3_ADDR2_2 <= CHIP3_ADDR2_2+1'b1;
    
            end
            else if (chip3_read2_en3) begin//
              CHIP3_ADDR2_2 <= 16'd0;
              CHIP3_ADDR2_3 <= CHIP3_ADDR2_3+1'b1;
    
            end
            else if (chip3_read2_en4) begin//
              CHIP3_ADDR2_3 <= 16'd0;
              CHIP3_ADDR2_4 <= CHIP3_ADDR2_4+1'b1;
       
            end
            else if (chip3_read2_en5) begin//
              CHIP3_ADDR2_4 <= 16'd0;
              CHIP3_ADDR2_5 <= CHIP3_ADDR2_5+1'b1;
          
            end
            else if (chip3_read2_en6) begin//
              CHIP3_ADDR2_5 <= 16'd0;
              CHIP3_ADDR2_6 <= CHIP3_ADDR2_6+1'b1;
   
            end
            else if (chip3_read2_en7) begin//
              CHIP3_ADDR2_6 <= 16'd0;
              CHIP3_ADDR2_7 <= CHIP3_ADDR2_7+1'b1;
     
            end
            else if (chip3_read2_en8) begin//
              CHIP3_ADDR2_7 <= 16'd0;
              CHIP3_ADDR2_8 <= CHIP3_ADDR2_8+1'b1;
     
            end
            else if (chip3_read2_en9) begin//
              CHIP3_ADDR2_8 <= 16'd0;
              CHIP3_ADDR2_9 <= CHIP3_ADDR2_9+1'b1;
      
            end
            else if (chip3_read2_en10) begin//
              CHIP3_ADDR2_9 <= 16'd0;
              CHIP3_ADDR2_10 <= CHIP3_ADDR2_10+1'b1;
          
            end
            else if (chip3_read2_en11) begin//
              CHIP3_ADDR2_10 <= 16'd0;
              CHIP3_ADDR2_11 <= CHIP3_ADDR2_11+1'b1;
           
            end
            else if (chip3_read2_en12) begin//
              CHIP3_ADDR2_11 <= 16'd0;
              CHIP3_ADDR2_12 <= CHIP3_ADDR2_12+1'b1;
       
            end


            else if (chip4_read2_en1) begin//
              CHIP3_ADDR2_12 <= 16'd0;
              CHIP4_ADDR2_1 <= CHIP4_ADDR2_1+1'b1;
            
            end
            else if (chip4_read2_en2) begin//
              CHIP4_ADDR2_1 <= 16'd0;
              CHIP4_ADDR2_2 <= CHIP4_ADDR2_2+1'b1;
           
            end
            else if (chip4_read2_en3) begin//
              CHIP4_ADDR2_2 <= 16'd0;
              CHIP4_ADDR2_3 <= CHIP4_ADDR2_3+1'b1;
    
            end
            else if (chip4_read2_en4) begin//
              CHIP4_ADDR2_3 <= 16'd0;
              CHIP4_ADDR2_4 <= CHIP4_ADDR2_4+1'b1;
   
            end
            else if (chip4_read2_en5) begin//
              CHIP4_ADDR2_4 <= 16'd0;
              CHIP4_ADDR2_5 <= CHIP4_ADDR2_5+1'b1;
     
            end
            else if (chip4_read2_en6) begin//
              CHIP4_ADDR2_5 <= 16'd0;
              CHIP4_ADDR2_6 <= CHIP4_ADDR2_6+1'b1;
            
            end
            else if (chip4_read2_en7) begin//
              CHIP4_ADDR2_6 <= 16'd0;
              CHIP4_ADDR2_7 <= CHIP4_ADDR2_7+1'b1;
            
            end
            else if (chip4_read2_en8) begin//
              CHIP4_ADDR2_7 <= 16'd0;
              CHIP4_ADDR2_8 <= CHIP4_ADDR2_8+1'b1;
       
            end
            else if (chip4_read2_en9) begin//
              CHIP4_ADDR2_8 <= 16'd0;
              CHIP4_ADDR2_9 <= CHIP4_ADDR2_9+1'b1;
           
            end
            else if (chip4_read2_en10) begin//
              CHIP4_ADDR2_9 <= 16'd0;
              CHIP4_ADDR2_10 <= CHIP4_ADDR2_10+1'b1;
        
            end
            else if (chip4_read2_en11) begin//
              CHIP4_ADDR2_10 <= 16'd0;
              CHIP4_ADDR2_11 <= CHIP4_ADDR2_11+1'b1;
          
            end
            else if (chip4_read2_en12) begin//
              CHIP4_ADDR2_11 <= 16'd0;
              CHIP4_ADDR2_12 <= CHIP4_ADDR2_12+1'b1;
             
            end


            else if (chip5_read2_en1) begin//
              CHIP4_ADDR2_12 <= 16'd0;
              CHIP5_ADDR2_1 <= CHIP5_ADDR2_1+1'b1;
           
            end
            else if (chip5_read2_en2) begin//
              CHIP5_ADDR2_1 <= 16'd0;
              CHIP5_ADDR2_2 <= CHIP5_ADDR2_2+1'b1;
          
            end
            else if (chip5_read2_en3) begin//
              CHIP5_ADDR2_2 <= 16'd0;
              CHIP5_ADDR2_3 <= CHIP5_ADDR2_3+1'b1;
       
            end
            else if (chip5_read2_en4) begin//
              CHIP5_ADDR2_3 <= 16'd0;
              CHIP5_ADDR2_4 <= CHIP5_ADDR2_4+1'b1;
         
            end
            else if (chip5_read2_en5) begin//
              CHIP5_ADDR2_4 <= 16'd0;
              CHIP5_ADDR2_5 <= CHIP5_ADDR2_5+1'b1;
        
            end
            else if (chip5_read2_en6) begin//
              CHIP5_ADDR2_5 <= 16'd0;
              CHIP5_ADDR2_6 <= CHIP5_ADDR2_6+1'b1;
       
            end
            else if (chip5_read2_en7) begin//
              CHIP5_ADDR2_6 <= 16'd0;
              CHIP5_ADDR2_7 <= CHIP5_ADDR2_7+1'b1;
  
            end
            else if (chip5_read2_en8) begin//
              CHIP5_ADDR2_7 <= 16'd0;
              CHIP5_ADDR2_8 <= CHIP5_ADDR2_8+1'b1;
  
            end
            else if (chip5_read2_en9) begin//
              CHIP5_ADDR2_8 <= 16'd0;
              CHIP5_ADDR2_9 <= CHIP5_ADDR2_9+1'b1;
      
            end
            else if (chip5_read2_en10) begin//
              CHIP5_ADDR2_9 <= 16'd0;
              CHIP5_ADDR2_10 <= CHIP5_ADDR2_10+1'b1;
  
            end
            else if (chip5_read2_en11) begin//
              CHIP5_ADDR2_10 <= 16'd0;
              CHIP5_ADDR2_11 <= CHIP5_ADDR2_11+1'b1;
    
            end
            else if (chip5_read2_en12) begin//
              CHIP5_ADDR2_11 <= 16'd0;
              CHIP5_ADDR2_12 <= CHIP5_ADDR2_12+1'b1;
        
            end

            else if (chip6_read2_en1) begin//
              CHIP5_ADDR2_12 <= 16'd0;
              CHIP6_ADDR2_1 <= CHIP6_ADDR2_1+1'b1;
   
            end
            else if (chip6_read2_en2) begin//
              CHIP6_ADDR2_1 <= 16'd0;
              CHIP6_ADDR2_2 <= CHIP6_ADDR2_2+1'b1;
             
            end
            else if (chip6_read2_en3) begin//
              CHIP6_ADDR2_2 <= 16'd0;
              CHIP6_ADDR2_3 <= CHIP6_ADDR2_3+1'b1;
  
            end
            else if (chip6_read2_en4) begin//
              CHIP6_ADDR2_3 <= 16'd0;
              CHIP6_ADDR2_4 <= CHIP6_ADDR2_4+1'b1;
     
            end
            else if (chip6_read2_en5) begin//
              CHIP6_ADDR2_4 <= 16'd0;
              CHIP6_ADDR2_5 <= CHIP6_ADDR2_5+1'b1;
     
            end
            else if (chip6_read2_en6) begin//
              CHIP6_ADDR2_5 <= 16'd0;
              CHIP6_ADDR2_6 <= CHIP6_ADDR2_6+1'b1;
     
            end
            else if (chip6_read2_en7) begin//
              CHIP6_ADDR2_6 <= 16'd0;
              CHIP6_ADDR2_7 <= CHIP6_ADDR2_7+1'b1;
        
            end
            else if (chip6_read2_en8) begin//
              CHIP6_ADDR2_7 <= 16'd0;
              CHIP6_ADDR2_8 <= CHIP6_ADDR2_8+1'b1;
             
            end
            else if (chip6_read2_en9) begin//
              CHIP6_ADDR2_8 <= 16'd0;
              CHIP6_ADDR2_9 <= CHIP6_ADDR2_9+1'b1;
     
            end
            else if (chip6_read2_en10) begin//
              CHIP6_ADDR2_9 <= 16'd0;
              CHIP6_ADDR2_10 <= CHIP6_ADDR2_10+1'b1;
       
            end
            else if (chip6_read2_en11) begin//
              CHIP6_ADDR2_10 <= 16'd0;
              CHIP6_ADDR2_11 <= CHIP6_ADDR2_11+1'b1;
       
            end
            else if (chip6_read2_en12) begin//
              CHIP6_ADDR2_11 <= 16'd0;
              CHIP6_ADDR2_12 <= CHIP6_ADDR2_12+1'b1;
    
            end


            else if (chip7_read2_en1) begin//
              CHIP6_ADDR2_12 <= 16'd0;
              CHIP7_ADDR2_1 <= CHIP7_ADDR2_1+1'b1;
         
            end
            else if (chip7_read2_en2) begin//
              CHIP7_ADDR2_1 <= 16'd0;
              CHIP7_ADDR2_2 <= CHIP7_ADDR2_2+1'b1;
       
            end
            else if (chip7_read2_en3) begin//
              CHIP7_ADDR2_2 <= 16'd0;
              CHIP7_ADDR2_3 <= CHIP7_ADDR2_3+1'b1;
       
            end
            else if (chip7_read2_en4) begin//
              CHIP7_ADDR2_3 <= 16'd0;
              CHIP7_ADDR2_4 <= CHIP7_ADDR2_4+1'b1;
         
            end
            else if (chip7_read2_en5) begin//
              CHIP7_ADDR2_4 <= 16'd0;
              CHIP7_ADDR2_5 <= CHIP7_ADDR2_5+1'b1;
      
            end
            else if (chip7_read2_en6) begin//
              CHIP7_ADDR2_5 <= 16'd0;
              CHIP7_ADDR2_6 <= CHIP7_ADDR2_6+1'b1;
           
            end
            else if (chip7_read2_en7) begin//
              CHIP7_ADDR2_6 <= 16'd0;
              CHIP7_ADDR2_7 <= CHIP7_ADDR2_7+1'b1;
     
            end
            else if (chip7_read2_en8) begin//
              CHIP7_ADDR2_7 <= 16'd0;
              CHIP7_ADDR2_8 <= CHIP7_ADDR2_8+1'b1;
             
            end
            else if (chip7_read2_en9) begin//
              CHIP7_ADDR2_8 <= 16'd0;
              CHIP7_ADDR2_9 <= CHIP7_ADDR2_9+1'b1;
         
            end
            else if (chip7_read2_en10) begin//
              CHIP7_ADDR2_9 <= 16'd0;
              CHIP7_ADDR2_10 <= CHIP7_ADDR2_10+1'b1;
      
            end
            else if (chip7_read2_en11) begin//
              CHIP7_ADDR2_10 <= 16'd0;
              CHIP7_ADDR2_11 <= CHIP7_ADDR2_11+1'b1;
              
            end
            else if (chip7_read2_en12) begin//
              CHIP7_ADDR2_11 <= 16'd0;
              CHIP7_ADDR2_12 <= CHIP7_ADDR2_12+1'b1;
      
            end


            else if (chip8_read2_en1) begin//
              CHIP7_ADDR2_12 <= 16'd0;
              CHIP8_ADDR2_1 <= CHIP8_ADDR2_1+1'b1;
        
            end
            else if (chip8_read2_en2) begin//
              CHIP8_ADDR2_1 <= 16'd0;
              CHIP8_ADDR2_2 <= CHIP8_ADDR2_2+1'b1;
      
            end
            else if (chip8_read2_en3) begin//
              CHIP8_ADDR2_2 <= 16'd0;
              CHIP8_ADDR2_3 <= CHIP8_ADDR2_3+1'b1;
   
            end
            else if (chip8_read2_en4) begin//
              CHIP8_ADDR2_3 <= 16'd0;
              CHIP8_ADDR2_4 <= CHIP8_ADDR2_4+1'b1;
        
            end
            else if (chip8_read2_en5) begin//
              CHIP8_ADDR2_4 <= 16'd0;
              CHIP8_ADDR2_5 <= CHIP8_ADDR2_5+1'b1;
                
            end
            else if (chip8_read2_en6) begin//
              CHIP8_ADDR2_5 <= 16'd0;
              CHIP8_ADDR2_6 <= CHIP8_ADDR2_6+1'b1;
                
            end
            else if (chip8_read2_en7) begin//
              CHIP8_ADDR2_6 <= 16'd0;
              CHIP8_ADDR2_7 <= CHIP8_ADDR2_7+1'b1;
            
            end
            else if (chip8_read2_en8) begin//
              CHIP8_ADDR2_7 <= 16'd0;
              CHIP8_ADDR2_8 <= CHIP8_ADDR2_8+1'b1;
           
            end
            else if (chip8_read2_en9) begin//
              CHIP8_ADDR2_8 <= 16'd0;
              CHIP8_ADDR2_9 <= CHIP8_ADDR2_9+1'b1;
   
            end
            else if (chip8_read2_en10) begin//
              CHIP8_ADDR2_9 <= 16'd0;
              CHIP8_ADDR2_10 <= CHIP8_ADDR2_10+1'b1;
           
            end
            else if (chip8_read2_en11) begin//
              CHIP8_ADDR2_10 <= 16'd0;
              CHIP8_ADDR2_11 <= CHIP8_ADDR2_11+1'b1;
               
            end
            else if (chip8_read2_en12) begin//
              CHIP8_ADDR2_11 <= 16'd0;
              CHIP8_ADDR2_12 <= CHIP8_ADDR2_12+1'b1;
         
            end


            else if (chip9_read2_en1) begin//
              CHIP8_ADDR2_12 <= 16'd0;
              CHIP9_ADDR2_1 <= CHIP9_ADDR2_1+1'b1;
   
            end
            else if (chip9_read2_en2) begin//
              CHIP9_ADDR2_1 <= 16'd0;
              CHIP9_ADDR2_2 <= CHIP9_ADDR2_2+1'b1;
      
            end
            else if (chip9_read2_en3) begin//
              CHIP9_ADDR2_2 <= 16'd0;
              CHIP9_ADDR2_3 <= CHIP9_ADDR2_3+1'b1;
          
            end
            else if (chip9_read2_en4) begin//
              CHIP9_ADDR2_3 <= 16'd0;
              CHIP9_ADDR2_4 <= CHIP9_ADDR2_4+1'b1;
     
            end
            else if (chip9_read2_en5) begin//
              CHIP9_ADDR2_4 <= 16'd0;
              CHIP9_ADDR2_5 <= CHIP9_ADDR2_5+1'b1;
       
            end
            else if (chip9_read2_en6) begin//
              CHIP9_ADDR2_5 <= 16'd0;
              CHIP9_ADDR2_6 <= CHIP9_ADDR2_6+1'b1;
        
            end
            else if (chip9_read2_en7) begin//
              CHIP9_ADDR2_6 <= 16'd0;
              CHIP9_ADDR2_7 <= CHIP9_ADDR2_7+1'b1;
    
            end
            else if (chip9_read2_en8) begin//
              CHIP9_ADDR2_7 <= 16'd0;
              CHIP9_ADDR2_8 <= CHIP9_ADDR2_8+1'b1;
             
            end
            else if (chip9_read2_en9) begin//
              CHIP9_ADDR2_8 <= 16'd0;
              CHIP9_ADDR2_9 <= CHIP9_ADDR2_9+1'b1;
           
            end
            else if (chip9_read2_en10) begin//
              CHIP9_ADDR2_9 <= 16'd0;
              CHIP9_ADDR2_10 <= CHIP9_ADDR2_10+1'b1;
         
            end
            else if (chip9_read2_en11) begin//
              CHIP9_ADDR2_10 <= 16'd0;
              CHIP9_ADDR2_11 <= CHIP9_ADDR2_11+1'b1;
         
            end
            else if (chip9_read2_en12) begin//
              CHIP9_ADDR2_11 <= 16'd0;
              CHIP9_ADDR2_12 <= CHIP9_ADDR2_12+1'b1;
 
            end


            else if (chip10_read2_en1) begin//
              CHIP9_ADDR2_12 <= 16'd0;
              CHIP10_ADDR2_1 <= CHIP10_ADDR2_1+1'b1;
     
            end
            else if (chip10_read2_en2) begin//
              CHIP10_ADDR2_1 <= 16'd0;
              CHIP10_ADDR2_2 <= CHIP10_ADDR2_2+1'b1;
     
            end
            else if (chip10_read2_en3) begin//
              CHIP10_ADDR2_2 <= 16'd0;
              CHIP10_ADDR2_3 <= CHIP10_ADDR2_3+1'b1;
        
            end
            else if (chip10_read2_en4) begin//
              CHIP10_ADDR2_3 <= 16'd0;
              CHIP10_ADDR2_4 <= CHIP10_ADDR2_4+1'b1;
   
            end
            else if (chip10_read2_en5) begin//
              CHIP10_ADDR2_4 <= 16'd0;
              CHIP10_ADDR2_5 <= CHIP10_ADDR2_5+1'b1;
          
            end
            else if (chip10_read2_en6) begin//
              CHIP10_ADDR2_5 <= 16'd0;
              CHIP10_ADDR2_6 <= CHIP10_ADDR2_6+1'b1;
     
            end
            else if (chip10_read2_en7) begin//
              CHIP10_ADDR2_6 <= 16'd0;
              CHIP10_ADDR2_7 <= CHIP10_ADDR2_7+1'b1;

            end
            else if (chip10_read2_en8) begin//
              CHIP10_ADDR2_7 <= 16'd0;
              CHIP10_ADDR2_8 <= CHIP10_ADDR2_8+1'b1;
     
            end
            else if (chip10_read2_en9) begin//
              CHIP10_ADDR2_8 <= 16'd0;
              CHIP10_ADDR2_9 <= CHIP10_ADDR2_9+1'b1;
   
            end
            else if (chip10_read2_en10) begin//
              CHIP10_ADDR2_9 <= 16'd0;
              CHIP10_ADDR2_10 <= CHIP10_ADDR2_10+1'b1;
              
            end
            else if (chip10_read2_en11) begin//
              CHIP10_ADDR2_10 <= 16'd0;
              CHIP10_ADDR2_11 <= CHIP10_ADDR2_11+1'b1;
       
            end
            else if (chip10_read2_en12) begin//
              CHIP10_ADDR2_11 <= 16'd0;
              CHIP10_ADDR2_12 <= CHIP10_ADDR2_12+1'b1;
           
            end



            else if (chip11_read2_en1) begin//
              CHIP10_ADDR2_12 <= 10'd0;
              CHIP11_ADDR2_1 <= CHIP11_ADDR2_1+1'b1;
     
            end
            else if (chip11_read2_en2) begin//
              CHIP11_ADDR2_1 <= 10'd0;
              CHIP11_ADDR2_2 <= CHIP11_ADDR2_2+1'b1;
          
            end
            else if (chip11_read2_en3) begin//
              CHIP11_ADDR2_2 <= 10'd0;
              CHIP11_ADDR2_3 <= CHIP11_ADDR2_3+1'b1;
            
            end
            else if (chip11_read2_en4) begin//
              CHIP11_ADDR2_3 <= 10'd0;
              CHIP11_ADDR2_4 <= CHIP11_ADDR2_4+1'b1;
           
            end
            else if (chip11_read2_en5) begin//
              CHIP11_ADDR2_4 <= 10'd0;
              CHIP11_ADDR2_5 <= CHIP11_ADDR2_5+1'b1;
               
            end
            else if (chip11_read2_en6) begin//
              CHIP11_ADDR2_5 <= 10'd0;
              CHIP11_ADDR2_6 <= CHIP11_ADDR2_6+1'b1;
             
            end
            else if (chip11_read2_en7) begin//
              CHIP11_ADDR2_6 <= 10'd0;
              CHIP11_ADDR2_7 <= CHIP11_ADDR2_7+1'b1;
            
            end
            else if (chip11_read2_en8) begin//
              CHIP11_ADDR2_7 <= 10'd0;
              CHIP11_ADDR2_8 <= CHIP11_ADDR2_8+1'b1;
        
            end
            else if (chip11_read2_en9) begin//
              CHIP11_ADDR2_8 <= 10'd0;
              CHIP11_ADDR2_9 <= CHIP11_ADDR2_9+1'b1;
     
            end
            else if (chip11_read2_en10) begin//
              CHIP11_ADDR2_9 <= 10'd0;
              CHIP11_ADDR2_10 <= CHIP11_ADDR2_10+1'b1;
         
            end
            else if (chip11_read2_en11) begin//
              CHIP11_ADDR2_10 <= 10'd0;
              CHIP11_ADDR2_11 <= CHIP11_ADDR2_11+1'b1;
        
            end
            else if (chip11_read2_en12) begin//
              CHIP11_ADDR2_11 <= 10'd0;
              CHIP11_ADDR2_12 <= CHIP11_ADDR2_12+1'b1;
      
            end


            else if (chip12_read2_en1) begin//
              CHIP11_ADDR2_12 <= 10'd0;
              CHIP12_ADDR2_1 <= CHIP12_ADDR2_1+1'b1;
          
            end
            else if (chip12_read2_en2) begin//
              CHIP12_ADDR2_1 <= 10'd0;
              CHIP12_ADDR2_2 <= CHIP12_ADDR2_2+1'b1;
          
            end
            else if (chip12_read2_en3) begin//
              CHIP12_ADDR2_2 <= 10'd0;
              CHIP12_ADDR2_3 <= CHIP12_ADDR2_3+1'b1;
           
            end
            else if (chip12_read2_en4) begin//
              CHIP12_ADDR2_3 <= 10'd0;
              CHIP12_ADDR2_4 <= CHIP12_ADDR2_4+1'b1;
     
            end
            else if (chip12_read2_en5) begin//
              CHIP12_ADDR2_4 <= 10'd0;
              CHIP12_ADDR2_5 <= CHIP12_ADDR2_5+1'b1;
         
            end
            else if (chip12_read2_en6) begin//
              CHIP12_ADDR2_5 <= 10'd0;
              CHIP12_ADDR2_6 <= CHIP12_ADDR2_6+1'b1;
             
            end
            else if (chip12_read2_en7) begin//
              CHIP12_ADDR2_6 <= 10'd0;
              CHIP12_ADDR2_7 <= CHIP12_ADDR2_7+1'b1;
        
            end
            else if (chip12_read2_en8) begin//
              CHIP12_ADDR2_7 <= 10'd0;
              CHIP12_ADDR2_8 <= CHIP12_ADDR2_8+1'b1;
         
            end
            else if (chip12_read2_en9) begin//
              CHIP12_ADDR2_8 <= 10'd0;
              CHIP12_ADDR2_9 <= CHIP12_ADDR2_9+1'b1;
       
            end
            else if (chip12_read2_en10) begin//
              CHIP12_ADDR2_9 <= 10'd0;
              CHIP12_ADDR2_10 <= CHIP12_ADDR2_10+1'b1;
           
            end
            else if (chip12_read2_en11) begin//
              CHIP12_ADDR2_10 <= 10'd0;
              CHIP12_ADDR2_11 <= CHIP12_ADDR2_11+1'b1;
      
            end
            else if (chip12_read2_en12) begin//
              CHIP12_ADDR2_11 <= 10'd0;
              CHIP12_ADDR2_12 <= CHIP12_ADDR2_12+1'b1;
            
            end
            else if (readx_end) begin//
              CHIP1_ADDR1_1   <= 10'b0;
              CHIP1_ADDR1_2   <= 10'b0;
              CHIP1_ADDR1_3   <= 10'b0;
              CHIP1_ADDR1_4   <= 10'b0;
              CHIP1_ADDR1_5   <= 10'b0;
              CHIP1_ADDR1_6   <= 10'b0;
              CHIP1_ADDR1_7   <= 10'b0;
              CHIP1_ADDR1_8   <= 10'b0;
              CHIP1_ADDR1_9   <= 10'b0;
              CHIP1_ADDR1_10  <= 10'b0;
              CHIP1_ADDR1_11  <= 10'b0;
              CHIP1_ADDR1_12  <= 10'b0;
              CHIP1_ADDR2_1   <= 10'b0;
              CHIP1_ADDR2_2   <= 10'b0;
              CHIP1_ADDR2_3   <= 10'b0;
              CHIP1_ADDR2_4   <= 10'b0;
              CHIP1_ADDR2_5   <= 10'b0;
              CHIP1_ADDR2_6   <= 10'b0;
              CHIP1_ADDR2_7   <= 10'b0;
              CHIP1_ADDR2_8   <= 10'b0;
              CHIP1_ADDR2_9   <= 10'b0;
              CHIP1_ADDR2_10  <= 10'b0;
              CHIP1_ADDR2_11  <= 10'b0;
              CHIP1_ADDR2_12  <= 10'b0;


              CHIP2_ADDR1_1   <= 10'b0;
              CHIP2_ADDR1_2   <= 10'b0;
              CHIP2_ADDR1_3   <= 10'b0;
              CHIP2_ADDR1_4   <= 10'b0;
              CHIP2_ADDR1_5   <= 10'b0;
              CHIP2_ADDR1_6   <= 10'b0;
              CHIP2_ADDR1_7   <= 10'b0;
              CHIP2_ADDR1_8   <= 10'b0;
              CHIP2_ADDR1_9   <= 10'b0;
              CHIP2_ADDR1_10  <= 10'b0;
              CHIP2_ADDR1_11  <= 10'b0;
              CHIP2_ADDR1_12  <= 10'b0;
              CHIP2_ADDR2_1   <= 10'b0;
              CHIP2_ADDR2_2   <= 10'b0;
              CHIP2_ADDR2_3   <= 10'b0;
              CHIP2_ADDR2_4   <= 10'b0;
              CHIP2_ADDR2_5   <= 10'b0;
              CHIP2_ADDR2_6   <= 10'b0;
              CHIP2_ADDR2_7   <= 10'b0;
              CHIP2_ADDR2_8   <= 10'b0;
              CHIP2_ADDR2_9   <= 10'b0;
              CHIP2_ADDR2_10  <= 10'b0;
              CHIP2_ADDR2_11  <= 10'b0;
              CHIP2_ADDR2_12  <= 10'b0;


              CHIP3_ADDR1_1   <= 10'b0;
              CHIP3_ADDR1_2   <= 10'b0;
              CHIP3_ADDR1_3   <= 10'b0;
              CHIP3_ADDR1_4   <= 10'b0;
              CHIP3_ADDR1_5   <= 10'b0;
              CHIP3_ADDR1_6   <= 10'b0;
              CHIP3_ADDR1_7   <= 10'b0;
              CHIP3_ADDR1_8   <= 10'b0;
              CHIP3_ADDR1_9   <= 10'b0;
              CHIP3_ADDR1_10  <= 10'b0;
              CHIP3_ADDR1_11  <= 10'b0;
              CHIP3_ADDR1_12  <= 10'b0;
              CHIP3_ADDR2_1   <= 10'b0;
              CHIP3_ADDR2_2   <= 10'b0;
              CHIP3_ADDR2_3   <= 10'b0;
              CHIP3_ADDR2_4   <= 10'b0;
              CHIP3_ADDR2_5   <= 10'b0;
              CHIP3_ADDR2_6   <= 10'b0;
              CHIP3_ADDR2_7   <= 10'b0;
              CHIP3_ADDR2_8   <= 10'b0;
              CHIP3_ADDR2_9   <= 10'b0;
              CHIP3_ADDR2_10  <= 10'b0;
              CHIP3_ADDR2_11  <= 10'b0;
              CHIP3_ADDR2_12  <= 10'b0;


              CHIP4_ADDR1_1   <= 10'b0;
              CHIP4_ADDR1_2   <= 10'b0;
              CHIP4_ADDR1_3   <= 10'b0;
              CHIP4_ADDR1_4   <= 10'b0;
              CHIP4_ADDR1_5   <= 10'b0;
              CHIP4_ADDR1_6   <= 10'b0;
              CHIP4_ADDR1_7   <= 10'b0;
              CHIP4_ADDR1_8   <= 10'b0;
              CHIP4_ADDR1_9   <= 10'b0;
              CHIP4_ADDR1_10  <= 10'b0;
              CHIP4_ADDR1_11  <= 10'b0;
              CHIP4_ADDR1_12  <= 10'b0;
              CHIP4_ADDR2_1   <= 10'b0;
              CHIP4_ADDR2_2   <= 10'b0;
              CHIP4_ADDR2_3   <= 10'b0;
              CHIP4_ADDR2_4   <= 10'b0;
              CHIP4_ADDR2_5   <= 10'b0;
              CHIP4_ADDR2_6   <= 10'b0;
              CHIP4_ADDR2_7   <= 10'b0;
              CHIP4_ADDR2_8   <= 10'b0;
              CHIP4_ADDR2_9   <= 10'b0;
              CHIP4_ADDR2_10  <= 10'b0;
              CHIP4_ADDR2_11  <= 10'b0;
              CHIP4_ADDR2_12  <= 10'b0;


              CHIP5_ADDR1_1   <= 10'b0;
              CHIP5_ADDR1_2   <= 10'b0;
              CHIP5_ADDR1_3   <= 10'b0;
              CHIP5_ADDR1_4   <= 10'b0;
              CHIP5_ADDR1_5   <= 10'b0;
              CHIP5_ADDR1_6   <= 10'b0;
              CHIP5_ADDR1_7   <= 10'b0;
              CHIP5_ADDR1_8   <= 10'b0;
              CHIP5_ADDR1_9   <= 10'b0;
              CHIP5_ADDR1_10  <= 10'b0;
              CHIP5_ADDR1_11  <= 10'b0;
              CHIP5_ADDR1_12  <= 10'b0;
              CHIP5_ADDR2_1   <= 10'b0;
              CHIP5_ADDR2_2   <= 10'b0;
              CHIP5_ADDR2_3   <= 10'b0;
              CHIP5_ADDR2_4   <= 10'b0;
              CHIP5_ADDR2_5   <= 10'b0;
              CHIP5_ADDR2_6   <= 10'b0;
              CHIP5_ADDR2_7   <= 10'b0;
              CHIP5_ADDR2_8   <= 10'b0;
              CHIP5_ADDR2_9   <= 10'b0;
              CHIP5_ADDR2_10  <= 10'b0;
              CHIP5_ADDR2_11  <= 10'b0;
              CHIP5_ADDR2_12  <= 10'b0;


              CHIP6_ADDR1_1   <= 10'b0;
              CHIP6_ADDR1_2   <= 10'b0;
              CHIP6_ADDR1_3   <= 10'b0;
              CHIP6_ADDR1_4   <= 10'b0;
              CHIP6_ADDR1_5   <= 10'b0;
              CHIP6_ADDR1_6   <= 10'b0;
              CHIP6_ADDR1_7   <= 10'b0;
              CHIP6_ADDR1_8   <= 10'b0;
              CHIP6_ADDR1_9   <= 10'b0;
              CHIP6_ADDR1_10  <= 10'b0;
              CHIP6_ADDR1_11  <= 10'b0;
              CHIP6_ADDR1_12  <= 10'b0;
              CHIP6_ADDR2_1   <= 10'b0;
              CHIP6_ADDR2_2   <= 10'b0;
              CHIP6_ADDR2_3   <= 10'b0;
              CHIP6_ADDR2_4   <= 10'b0;
              CHIP6_ADDR2_5   <= 10'b0;
              CHIP6_ADDR2_6   <= 10'b0;
              CHIP6_ADDR2_7   <= 10'b0;
              CHIP6_ADDR2_8   <= 10'b0;
              CHIP6_ADDR2_9   <= 10'b0;
              CHIP6_ADDR2_10  <= 10'b0;
              CHIP6_ADDR2_11  <= 10'b0;
              CHIP6_ADDR2_12  <= 10'b0;


              CHIP7_ADDR1_1   <= 10'b0;
              CHIP7_ADDR1_2   <= 10'b0;
              CHIP7_ADDR1_3   <= 10'b0;
              CHIP7_ADDR1_4   <= 10'b0;
              CHIP7_ADDR1_5   <= 10'b0;
              CHIP7_ADDR1_6   <= 10'b0;
              CHIP7_ADDR1_7   <= 10'b0;
              CHIP7_ADDR1_8   <= 10'b0;
              CHIP7_ADDR1_9   <= 10'b0;
              CHIP7_ADDR1_10  <= 10'b0;
              CHIP7_ADDR1_11  <= 10'b0;
              CHIP7_ADDR1_12  <= 10'b0;
              CHIP7_ADDR2_1   <= 10'b0;
              CHIP7_ADDR2_2   <= 10'b0;
              CHIP7_ADDR2_3   <= 10'b0;
              CHIP7_ADDR2_4   <= 10'b0;
              CHIP7_ADDR2_5   <= 10'b0;
              CHIP7_ADDR2_6   <= 10'b0;
              CHIP7_ADDR2_7   <= 10'b0;
              CHIP7_ADDR2_8   <= 10'b0;
              CHIP7_ADDR2_9   <= 10'b0;
              CHIP7_ADDR2_10  <= 10'b0;
              CHIP7_ADDR2_11  <= 10'b0;
              CHIP7_ADDR2_12  <= 10'b0;


              CHIP8_ADDR1_1   <= 10'b0;
              CHIP8_ADDR1_2   <= 10'b0;
              CHIP8_ADDR1_3   <= 10'b0;
              CHIP8_ADDR1_4   <= 10'b0;
              CHIP8_ADDR1_5   <= 10'b0;
              CHIP8_ADDR1_6   <= 10'b0;
              CHIP8_ADDR1_7   <= 10'b0;
              CHIP8_ADDR1_8   <= 10'b0;
              CHIP8_ADDR1_9   <= 10'b0;
              CHIP8_ADDR1_10  <= 10'b0;
              CHIP8_ADDR1_11  <= 10'b0;
              CHIP8_ADDR1_12  <= 10'b0;
              CHIP8_ADDR2_1   <= 10'b0;
              CHIP8_ADDR2_2   <= 10'b0;
              CHIP8_ADDR2_3   <= 10'b0;
              CHIP8_ADDR2_4   <= 10'b0;
              CHIP8_ADDR2_5   <= 10'b0;
              CHIP8_ADDR2_6   <= 10'b0;
              CHIP8_ADDR2_7   <= 10'b0;
              CHIP8_ADDR2_8   <= 10'b0;
              CHIP8_ADDR2_9   <= 10'b0;
              CHIP8_ADDR2_10  <= 10'b0;
              CHIP8_ADDR2_11  <= 10'b0;
              CHIP8_ADDR2_12  <= 10'b0;


              CHIP9_ADDR1_1   <= 10'b0;
              CHIP9_ADDR1_2   <= 10'b0;
              CHIP9_ADDR1_3   <= 10'b0;
              CHIP9_ADDR1_4   <= 10'b0;
              CHIP9_ADDR1_5   <= 10'b0;
              CHIP9_ADDR1_6   <= 10'b0;
              CHIP9_ADDR1_7   <= 10'b0;
              CHIP9_ADDR1_8   <= 10'b0;
              CHIP9_ADDR1_9   <= 10'b0;
              CHIP9_ADDR1_10  <= 10'b0;
              CHIP9_ADDR1_11  <= 10'b0;
              CHIP9_ADDR1_12  <= 10'b0;
              CHIP9_ADDR2_1   <= 10'b0;
              CHIP9_ADDR2_2   <= 10'b0;
              CHIP9_ADDR2_3   <= 10'b0;
              CHIP9_ADDR2_4   <= 10'b0;
              CHIP9_ADDR2_5   <= 10'b0;
              CHIP9_ADDR2_6   <= 10'b0;
              CHIP9_ADDR2_7   <= 10'b0;
              CHIP9_ADDR2_8   <= 10'b0;
              CHIP9_ADDR2_9   <= 10'b0;
              CHIP9_ADDR2_10  <= 10'b0;
              CHIP9_ADDR2_11  <= 10'b0;
              CHIP9_ADDR2_12  <= 10'b0;


              CHIP10_ADDR1_1   <= 10'b0;
              CHIP10_ADDR1_2   <= 10'b0;
              CHIP10_ADDR1_3   <= 10'b0;
              CHIP10_ADDR1_4   <= 10'b0;
              CHIP10_ADDR1_5   <= 10'b0;
              CHIP10_ADDR1_6   <= 10'b0;
              CHIP10_ADDR1_7   <= 10'b0;
              CHIP10_ADDR1_8   <= 10'b0;
              CHIP10_ADDR1_9   <= 10'b0;
              CHIP10_ADDR1_10  <= 10'b0;
              CHIP10_ADDR1_11  <= 10'b0;
              CHIP10_ADDR1_12  <= 10'b0;
              CHIP10_ADDR2_1   <= 10'b0;
              CHIP10_ADDR2_2   <= 10'b0;
              CHIP10_ADDR2_3   <= 10'b0;
              CHIP10_ADDR2_4   <= 10'b0;
              CHIP10_ADDR2_5   <= 10'b0;
              CHIP10_ADDR2_6   <= 10'b0;
              CHIP10_ADDR2_7   <= 10'b0;
              CHIP10_ADDR2_8   <= 10'b0;
              CHIP10_ADDR2_9   <= 10'b0;
              CHIP10_ADDR2_10  <= 10'b0;
              CHIP10_ADDR2_11  <= 10'b0;
              CHIP10_ADDR2_12  <= 10'b0;


              CHIP11_ADDR1_1   <= 10'b0;
              CHIP11_ADDR1_2   <= 10'b0;
              CHIP11_ADDR1_3   <= 10'b0;
              CHIP11_ADDR1_4   <= 10'b0;
              CHIP11_ADDR1_5   <= 10'b0;
              CHIP11_ADDR1_6   <= 10'b0;
              CHIP11_ADDR1_7   <= 10'b0;
              CHIP11_ADDR1_8   <= 10'b0;
              CHIP11_ADDR1_9   <= 10'b0;
              CHIP11_ADDR1_10  <= 10'b0;
              CHIP11_ADDR1_11  <= 10'b0;
              CHIP11_ADDR1_12  <= 10'b0;
              CHIP11_ADDR2_1   <= 10'b0;
              CHIP11_ADDR2_2   <= 10'b0;
              CHIP11_ADDR2_3   <= 10'b0;
              CHIP11_ADDR2_4   <= 10'b0;
              CHIP11_ADDR2_5   <= 10'b0;
              CHIP11_ADDR2_6   <= 10'b0;
              CHIP11_ADDR2_7   <= 10'b0;
              CHIP11_ADDR2_8   <= 10'b0;
              CHIP11_ADDR2_9   <= 10'b0;
              CHIP11_ADDR2_10  <= 10'b0;
              CHIP11_ADDR2_11  <= 10'b0;
              CHIP11_ADDR2_12  <= 10'b0;


              CHIP12_ADDR1_1   <= 10'b0;
              CHIP12_ADDR1_2   <= 10'b0;
              CHIP12_ADDR1_3   <= 10'b0;
              CHIP12_ADDR1_4   <= 10'b0;
              CHIP12_ADDR1_5   <= 10'b0;
              CHIP12_ADDR1_6   <= 10'b0;
              CHIP12_ADDR1_7   <= 10'b0;
              CHIP12_ADDR1_8   <= 10'b0;
              CHIP12_ADDR1_9   <= 10'b0;
              CHIP12_ADDR1_10  <= 10'b0;
              CHIP12_ADDR1_11  <= 10'b0;
              CHIP12_ADDR1_12  <= 10'b0;
              CHIP12_ADDR2_1   <= 10'b0;
              CHIP12_ADDR2_2   <= 10'b0;
              CHIP12_ADDR2_3   <= 10'b0;
              CHIP12_ADDR2_4   <= 10'b0;
              CHIP12_ADDR2_5   <= 10'b0;
              CHIP12_ADDR2_6   <= 10'b0;
              CHIP12_ADDR2_7   <= 10'b0;
              CHIP12_ADDR2_8   <= 10'b0;
              CHIP12_ADDR2_9   <= 10'b0;
              CHIP12_ADDR2_10  <= 10'b0;
              CHIP12_ADDR2_11  <= 10'b0;
              CHIP12_ADDR2_12  <= 10'b0;


            end
            else begin//



              CHIP1_ADDR1_1   <= CHIP1_ADDR1_1;
              CHIP1_ADDR1_2   <= CHIP1_ADDR1_2;
              CHIP1_ADDR1_3   <= CHIP1_ADDR1_3;
              CHIP1_ADDR1_4   <= CHIP1_ADDR1_4;
              CHIP1_ADDR1_5   <= CHIP1_ADDR1_5;
              CHIP1_ADDR1_6   <= CHIP1_ADDR1_6;
              CHIP1_ADDR1_7   <= CHIP1_ADDR1_7;
              CHIP1_ADDR1_8   <= CHIP1_ADDR1_8;
              CHIP1_ADDR1_9   <= CHIP1_ADDR1_9;
              CHIP1_ADDR1_10  <= CHIP1_ADDR1_10;
              CHIP1_ADDR1_11  <= CHIP1_ADDR1_11;
              CHIP1_ADDR1_12  <= CHIP1_ADDR1_12;
              CHIP1_ADDR2_1   <= CHIP1_ADDR2_1;
              CHIP1_ADDR2_2   <= CHIP1_ADDR2_2;
              CHIP1_ADDR2_3   <= CHIP1_ADDR2_3;
              CHIP1_ADDR2_4   <= CHIP1_ADDR2_4;
              CHIP1_ADDR2_5   <= CHIP1_ADDR2_5;
              CHIP1_ADDR2_6   <= CHIP1_ADDR2_6;
              CHIP1_ADDR2_7   <= CHIP1_ADDR2_7;
              CHIP1_ADDR2_8   <= CHIP1_ADDR2_8;
              CHIP1_ADDR2_9   <= CHIP1_ADDR2_9;
              CHIP1_ADDR2_10  <= CHIP1_ADDR2_10;
              CHIP1_ADDR2_11  <= CHIP1_ADDR2_11;
              CHIP1_ADDR2_12  <= CHIP1_ADDR2_12;

              CHIP2_ADDR1_1   <= CHIP2_ADDR1_1;
              CHIP2_ADDR1_2   <= CHIP2_ADDR1_2;
              CHIP2_ADDR1_3   <= CHIP2_ADDR1_3;
              CHIP2_ADDR1_4   <= CHIP2_ADDR1_4;
              CHIP2_ADDR1_5   <= CHIP2_ADDR1_5;
              CHIP2_ADDR1_6   <= CHIP2_ADDR1_6;
              CHIP2_ADDR1_7   <= CHIP2_ADDR1_7;
              CHIP2_ADDR1_8   <= CHIP2_ADDR1_8;
              CHIP2_ADDR1_9   <= CHIP2_ADDR1_9;
              CHIP2_ADDR1_10  <= CHIP2_ADDR1_10;
              CHIP2_ADDR1_11  <= CHIP2_ADDR1_11;
              CHIP2_ADDR1_12  <= CHIP2_ADDR1_12;
              CHIP2_ADDR2_1   <= CHIP2_ADDR2_1;
              CHIP2_ADDR2_2   <= CHIP2_ADDR2_2;
              CHIP2_ADDR2_3   <= CHIP2_ADDR2_3;
              CHIP2_ADDR2_4   <= CHIP2_ADDR2_4;
              CHIP2_ADDR2_5   <= CHIP2_ADDR2_5;
              CHIP2_ADDR2_6   <= CHIP2_ADDR2_6;
              CHIP2_ADDR2_7   <= CHIP2_ADDR2_7;
              CHIP2_ADDR2_8   <= CHIP2_ADDR2_8;
              CHIP2_ADDR2_9   <= CHIP2_ADDR2_9;
              CHIP2_ADDR2_10  <= CHIP2_ADDR2_10;
              CHIP2_ADDR2_11  <= CHIP2_ADDR2_11;
              CHIP2_ADDR2_12  <= CHIP2_ADDR2_12;

              CHIP3_ADDR1_1   <= CHIP3_ADDR1_1;
              CHIP3_ADDR1_2   <= CHIP3_ADDR1_2;
              CHIP3_ADDR1_3   <= CHIP3_ADDR1_3;
              CHIP3_ADDR1_4   <= CHIP3_ADDR1_4;
              CHIP3_ADDR1_5   <= CHIP3_ADDR1_5;
              CHIP3_ADDR1_6   <= CHIP3_ADDR1_6;
              CHIP3_ADDR1_7   <= CHIP3_ADDR1_7;
              CHIP3_ADDR1_8   <= CHIP3_ADDR1_8;
              CHIP3_ADDR1_9   <= CHIP3_ADDR1_9;
              CHIP3_ADDR1_10  <= CHIP3_ADDR1_10;
              CHIP3_ADDR1_11  <= CHIP3_ADDR1_11;
              CHIP3_ADDR1_12  <= CHIP3_ADDR1_12;
              CHIP3_ADDR2_1   <= CHIP3_ADDR2_1;
              CHIP3_ADDR2_2   <= CHIP3_ADDR2_2;
              CHIP3_ADDR2_3   <= CHIP3_ADDR2_3;
              CHIP3_ADDR2_4   <= CHIP3_ADDR2_4;
              CHIP3_ADDR2_5   <= CHIP3_ADDR2_5;
              CHIP3_ADDR2_6   <= CHIP3_ADDR2_6;
              CHIP3_ADDR2_7   <= CHIP3_ADDR2_7;
              CHIP3_ADDR2_8   <= CHIP3_ADDR2_8;
              CHIP3_ADDR2_9   <= CHIP3_ADDR2_9;
              CHIP3_ADDR2_10  <= CHIP3_ADDR2_10;
              CHIP3_ADDR2_11  <= CHIP3_ADDR2_11;
              CHIP3_ADDR2_12  <= CHIP3_ADDR2_12;


              CHIP4_ADDR1_1   <= CHIP4_ADDR1_1;
              CHIP4_ADDR1_2   <= CHIP4_ADDR1_2;
              CHIP4_ADDR1_3   <= CHIP4_ADDR1_3;
              CHIP4_ADDR1_4   <= CHIP4_ADDR1_4;
              CHIP4_ADDR1_5   <= CHIP4_ADDR1_5;
              CHIP4_ADDR1_6   <= CHIP4_ADDR1_6;
              CHIP4_ADDR1_7   <= CHIP4_ADDR1_7;
              CHIP4_ADDR1_8   <= CHIP4_ADDR1_8;
              CHIP4_ADDR1_9   <= CHIP4_ADDR1_9;
              CHIP4_ADDR1_10  <= CHIP4_ADDR1_10;
              CHIP4_ADDR1_11  <= CHIP4_ADDR1_11;
              CHIP4_ADDR1_12  <= CHIP4_ADDR1_12;
              CHIP4_ADDR2_1   <= CHIP4_ADDR2_1;
              CHIP4_ADDR2_2   <= CHIP4_ADDR2_2;
              CHIP4_ADDR2_3   <= CHIP4_ADDR2_3;
              CHIP4_ADDR2_4   <= CHIP4_ADDR2_4;
              CHIP4_ADDR2_5   <= CHIP4_ADDR2_5;
              CHIP4_ADDR2_6   <= CHIP4_ADDR2_6;
              CHIP4_ADDR2_7   <= CHIP4_ADDR2_7;
              CHIP4_ADDR2_8   <= CHIP4_ADDR2_8;
              CHIP4_ADDR2_9   <= CHIP4_ADDR2_9;
              CHIP4_ADDR2_10  <= CHIP4_ADDR2_10;
              CHIP4_ADDR2_11  <= CHIP4_ADDR2_11;
              CHIP4_ADDR2_12  <= CHIP4_ADDR2_12;


              CHIP5_ADDR1_1   <= CHIP5_ADDR1_1;
              CHIP5_ADDR1_2   <= CHIP5_ADDR1_2;
              CHIP5_ADDR1_3   <= CHIP5_ADDR1_3;
              CHIP5_ADDR1_4   <= CHIP5_ADDR1_4;
              CHIP5_ADDR1_5   <= CHIP5_ADDR1_5;
              CHIP5_ADDR1_6   <= CHIP5_ADDR1_6;
              CHIP5_ADDR1_7   <= CHIP5_ADDR1_7;
              CHIP5_ADDR1_8   <= CHIP5_ADDR1_8;
              CHIP5_ADDR1_9   <= CHIP5_ADDR1_9;
              CHIP5_ADDR1_10  <= CHIP5_ADDR1_10;
              CHIP5_ADDR1_11  <= CHIP5_ADDR1_11;
              CHIP5_ADDR1_12  <= CHIP5_ADDR1_12;
              CHIP5_ADDR2_1   <= CHIP5_ADDR2_1;
              CHIP5_ADDR2_2   <= CHIP5_ADDR2_2;
              CHIP5_ADDR2_3   <= CHIP5_ADDR2_3;
              CHIP5_ADDR2_4   <= CHIP5_ADDR2_4;
              CHIP5_ADDR2_5   <= CHIP5_ADDR2_5;
              CHIP5_ADDR2_6   <= CHIP5_ADDR2_6;
              CHIP5_ADDR2_7   <= CHIP5_ADDR2_7;
              CHIP5_ADDR2_8   <= CHIP5_ADDR2_8;
              CHIP5_ADDR2_9   <= CHIP5_ADDR2_9;
              CHIP5_ADDR2_10  <= CHIP5_ADDR2_10;
              CHIP5_ADDR2_11  <= CHIP5_ADDR2_11;
              CHIP5_ADDR2_12  <= CHIP5_ADDR2_12;

              CHIP6_ADDR1_1   <= CHIP6_ADDR1_1;
              CHIP6_ADDR1_2   <= CHIP6_ADDR1_2;
              CHIP6_ADDR1_3   <= CHIP6_ADDR1_3;
              CHIP6_ADDR1_4   <= CHIP6_ADDR1_4;
              CHIP6_ADDR1_5   <= CHIP6_ADDR1_5;
              CHIP6_ADDR1_6   <= CHIP6_ADDR1_6;
              CHIP6_ADDR1_7   <= CHIP6_ADDR1_7;
              CHIP6_ADDR1_8   <= CHIP6_ADDR1_8;
              CHIP6_ADDR1_9   <= CHIP6_ADDR1_9;
              CHIP6_ADDR1_10  <= CHIP6_ADDR1_10;
              CHIP6_ADDR1_11  <= CHIP6_ADDR1_11;
              CHIP6_ADDR1_12  <= CHIP6_ADDR1_12;
              CHIP6_ADDR2_1   <= CHIP6_ADDR2_1;
              CHIP6_ADDR2_2   <= CHIP6_ADDR2_2;
              CHIP6_ADDR2_3   <= CHIP6_ADDR2_3;
              CHIP6_ADDR2_4   <= CHIP6_ADDR2_4;
              CHIP6_ADDR2_5   <= CHIP6_ADDR2_5;
              CHIP6_ADDR2_6   <= CHIP6_ADDR2_6;
              CHIP6_ADDR2_7   <= CHIP6_ADDR2_7;
              CHIP6_ADDR2_8   <= CHIP6_ADDR2_8;
              CHIP6_ADDR2_9   <= CHIP6_ADDR2_9;
              CHIP6_ADDR2_10  <= CHIP6_ADDR2_10;
              CHIP6_ADDR2_11  <= CHIP6_ADDR2_11;
              CHIP6_ADDR2_12  <= CHIP6_ADDR2_12;

              CHIP7_ADDR1_1   <= CHIP7_ADDR1_1;
              CHIP7_ADDR1_2   <= CHIP7_ADDR1_2;
              CHIP7_ADDR1_3   <= CHIP7_ADDR1_3;
              CHIP7_ADDR1_4   <= CHIP7_ADDR1_4;
              CHIP7_ADDR1_5   <= CHIP7_ADDR1_5;
              CHIP7_ADDR1_6   <= CHIP7_ADDR1_6;
              CHIP7_ADDR1_7   <= CHIP7_ADDR1_7;
              CHIP7_ADDR1_8   <= CHIP7_ADDR1_8;
              CHIP7_ADDR1_9   <= CHIP7_ADDR1_9;
              CHIP7_ADDR1_10  <= CHIP7_ADDR1_10;
              CHIP7_ADDR1_11  <= CHIP7_ADDR1_11;
              CHIP7_ADDR1_12  <= CHIP7_ADDR1_12;
              CHIP7_ADDR2_1   <= CHIP7_ADDR2_1;
              CHIP7_ADDR2_2   <= CHIP7_ADDR2_2;
              CHIP7_ADDR2_3   <= CHIP7_ADDR2_3;
              CHIP7_ADDR2_4   <= CHIP7_ADDR2_4;
              CHIP7_ADDR2_5   <= CHIP7_ADDR2_5;
              CHIP7_ADDR2_6   <= CHIP7_ADDR2_6;
              CHIP7_ADDR2_7   <= CHIP7_ADDR2_7;
              CHIP7_ADDR2_8   <= CHIP7_ADDR2_8;
              CHIP7_ADDR2_9   <= CHIP7_ADDR2_9;
              CHIP7_ADDR2_10  <= CHIP7_ADDR2_10;
              CHIP7_ADDR2_11  <= CHIP7_ADDR2_11;
              CHIP7_ADDR2_12  <= CHIP7_ADDR2_12;


              CHIP8_ADDR1_1   <= CHIP8_ADDR1_1;
              CHIP8_ADDR1_2   <= CHIP8_ADDR1_2;
              CHIP8_ADDR1_3   <= CHIP8_ADDR1_3;
              CHIP8_ADDR1_4   <= CHIP8_ADDR1_4;
              CHIP8_ADDR1_5   <= CHIP8_ADDR1_5;
              CHIP8_ADDR1_6   <= CHIP8_ADDR1_6;
              CHIP8_ADDR1_7   <= CHIP8_ADDR1_7;
              CHIP8_ADDR1_8   <= CHIP8_ADDR1_8;
              CHIP8_ADDR1_9   <= CHIP8_ADDR1_9;
              CHIP8_ADDR1_10  <= CHIP8_ADDR1_10;
              CHIP8_ADDR1_11  <= CHIP8_ADDR1_11;
              CHIP8_ADDR1_12  <= CHIP8_ADDR1_12;
              CHIP8_ADDR2_1   <= CHIP8_ADDR2_1;
              CHIP8_ADDR2_2   <= CHIP8_ADDR2_2;
              CHIP8_ADDR2_3   <= CHIP8_ADDR2_3;
              CHIP8_ADDR2_4   <= CHIP8_ADDR2_4;
              CHIP8_ADDR2_5   <= CHIP8_ADDR2_5;
              CHIP8_ADDR2_6   <= CHIP8_ADDR2_6;
              CHIP8_ADDR2_7   <= CHIP8_ADDR2_7;
              CHIP8_ADDR2_8   <= CHIP8_ADDR2_8;
              CHIP8_ADDR2_9   <= CHIP8_ADDR2_9;
              CHIP8_ADDR2_10  <= CHIP8_ADDR2_10;
              CHIP8_ADDR2_11  <= CHIP8_ADDR2_11;
              CHIP8_ADDR2_12  <= CHIP8_ADDR2_12;


              CHIP9_ADDR1_1   <= CHIP9_ADDR1_1;
              CHIP9_ADDR1_2   <= CHIP9_ADDR1_2;
              CHIP9_ADDR1_3   <= CHIP9_ADDR1_3;
              CHIP9_ADDR1_4   <= CHIP9_ADDR1_4;
              CHIP9_ADDR1_5   <= CHIP9_ADDR1_5;
              CHIP9_ADDR1_6   <= CHIP9_ADDR1_6;
              CHIP9_ADDR1_7   <= CHIP9_ADDR1_7;
              CHIP9_ADDR1_8   <= CHIP9_ADDR1_8;
              CHIP9_ADDR1_9   <= CHIP9_ADDR1_9;
              CHIP9_ADDR1_10  <= CHIP9_ADDR1_10;
              CHIP9_ADDR1_11  <= CHIP9_ADDR1_11;
              CHIP9_ADDR1_12  <= CHIP9_ADDR1_12;
              CHIP9_ADDR2_1   <= CHIP9_ADDR2_1;
              CHIP9_ADDR2_2   <= CHIP9_ADDR2_2;
              CHIP9_ADDR2_3   <= CHIP9_ADDR2_3;
              CHIP9_ADDR2_4   <= CHIP9_ADDR2_4;
              CHIP9_ADDR2_5   <= CHIP9_ADDR2_5;
              CHIP9_ADDR2_6   <= CHIP9_ADDR2_6;
              CHIP9_ADDR2_7   <= CHIP9_ADDR2_7;
              CHIP9_ADDR2_8   <= CHIP9_ADDR2_8;
              CHIP9_ADDR2_9   <= CHIP9_ADDR2_9;
              CHIP9_ADDR2_10  <= CHIP9_ADDR2_10;
              CHIP9_ADDR2_11  <= CHIP9_ADDR2_11;
              CHIP9_ADDR2_12  <= CHIP9_ADDR2_12;

              CHIP10_ADDR1_1   <= CHIP10_ADDR1_1;
              CHIP10_ADDR1_2   <= CHIP10_ADDR1_2;
              CHIP10_ADDR1_3   <= CHIP10_ADDR1_3;
              CHIP10_ADDR1_4   <= CHIP10_ADDR1_4;
              CHIP10_ADDR1_5   <= CHIP10_ADDR1_5;
              CHIP10_ADDR1_6   <= CHIP10_ADDR1_6;
              CHIP10_ADDR1_7   <= CHIP10_ADDR1_7;
              CHIP10_ADDR1_8   <= CHIP10_ADDR1_8;
              CHIP10_ADDR1_9   <= CHIP10_ADDR1_9;
              CHIP10_ADDR1_10  <= CHIP10_ADDR1_10;
              CHIP10_ADDR1_11  <= CHIP10_ADDR1_11;
              CHIP10_ADDR1_12  <= CHIP10_ADDR1_12;
              CHIP10_ADDR2_1   <= CHIP10_ADDR2_1;
              CHIP10_ADDR2_2   <= CHIP10_ADDR2_2;
              CHIP10_ADDR2_3   <= CHIP10_ADDR2_3;
              CHIP10_ADDR2_4   <= CHIP10_ADDR2_4;
              CHIP10_ADDR2_5   <= CHIP10_ADDR2_5;
              CHIP10_ADDR2_6   <= CHIP10_ADDR2_6;
              CHIP10_ADDR2_7   <= CHIP10_ADDR2_7;
              CHIP10_ADDR2_8   <= CHIP10_ADDR2_8;
              CHIP10_ADDR2_9   <= CHIP10_ADDR2_9;
              CHIP10_ADDR2_10  <= CHIP10_ADDR2_10;
              CHIP10_ADDR2_11  <= CHIP10_ADDR2_11;
              CHIP10_ADDR2_12  <= CHIP10_ADDR2_12;

              CHIP11_ADDR1_1   <= CHIP11_ADDR1_1;
              CHIP11_ADDR1_2   <= CHIP11_ADDR1_2;
              CHIP11_ADDR1_3   <= CHIP11_ADDR1_3;
              CHIP11_ADDR1_4   <= CHIP11_ADDR1_4;
              CHIP11_ADDR1_5   <= CHIP11_ADDR1_5;
              CHIP11_ADDR1_6   <= CHIP11_ADDR1_6;
              CHIP11_ADDR1_7   <= CHIP11_ADDR1_7;
              CHIP11_ADDR1_8   <= CHIP11_ADDR1_8;
              CHIP11_ADDR1_9   <= CHIP11_ADDR1_9;
              CHIP11_ADDR1_10  <= CHIP11_ADDR1_10;
              CHIP11_ADDR1_11  <= CHIP11_ADDR1_11;
              CHIP11_ADDR1_12  <= CHIP11_ADDR1_12;
              CHIP11_ADDR2_1   <= CHIP11_ADDR2_1;
              CHIP11_ADDR2_2   <= CHIP11_ADDR2_2;
              CHIP11_ADDR2_3   <= CHIP11_ADDR2_3;
              CHIP11_ADDR2_4   <= CHIP11_ADDR2_4;
              CHIP11_ADDR2_5   <= CHIP11_ADDR2_5;
              CHIP11_ADDR2_6   <= CHIP11_ADDR2_6;
              CHIP11_ADDR2_7   <= CHIP11_ADDR2_7;
              CHIP11_ADDR2_8   <= CHIP11_ADDR2_8;
              CHIP11_ADDR2_9   <= CHIP11_ADDR2_9;
              CHIP11_ADDR2_10  <= CHIP11_ADDR2_10;
              CHIP11_ADDR2_11  <= CHIP11_ADDR2_11;
              CHIP11_ADDR2_12  <= CHIP11_ADDR2_12;


              CHIP12_ADDR1_1   <= CHIP12_ADDR1_1;
              CHIP12_ADDR1_2   <= CHIP12_ADDR1_2;
              CHIP12_ADDR1_3   <= CHIP12_ADDR1_3;
              CHIP12_ADDR1_4   <= CHIP12_ADDR1_4;
              CHIP12_ADDR1_5   <= CHIP12_ADDR1_5;
              CHIP12_ADDR1_6   <= CHIP12_ADDR1_6;
              CHIP12_ADDR1_7   <= CHIP12_ADDR1_7;
              CHIP12_ADDR1_8   <= CHIP12_ADDR1_8;
              CHIP12_ADDR1_9   <= CHIP12_ADDR1_9;
              CHIP12_ADDR1_10  <= CHIP12_ADDR1_10;
              CHIP12_ADDR1_11  <= CHIP12_ADDR1_11;
              CHIP12_ADDR1_12  <= CHIP12_ADDR1_12;
              CHIP12_ADDR2_1   <= CHIP12_ADDR2_1;
              CHIP12_ADDR2_2   <= CHIP12_ADDR2_2;
              CHIP12_ADDR2_3   <= CHIP12_ADDR2_3;
              CHIP12_ADDR2_4   <= CHIP12_ADDR2_4;
              CHIP12_ADDR2_5   <= CHIP12_ADDR2_5;
              CHIP12_ADDR2_6   <= CHIP12_ADDR2_6;
              CHIP12_ADDR2_7   <= CHIP12_ADDR2_7;
              CHIP12_ADDR2_8   <= CHIP12_ADDR2_8;
              CHIP12_ADDR2_9   <= CHIP12_ADDR2_9;
              CHIP12_ADDR2_10  <= CHIP12_ADDR2_10;
              CHIP12_ADDR2_11  <= CHIP12_ADDR2_11;
              CHIP12_ADDR2_12  <= CHIP12_ADDR2_12;


            end
end





// wire           cchip1_read1_en1;
// wire           cchip1_read1_en2;
// wire           cchip1_read1_en3;
// wire           cchip1_read1_en4;
// wire           cchip1_read1_en5;
// wire           cchip1_read1_en6;
// wire           cchip1_read1_en7;
// wire           cchip1_read1_en8;
// wire           cchip1_read1_en9;
// wire           cchip1_read1_en10;
// wire           cchip1_read1_en11;
// wire           cchip1_read1_en12;
// wire           cchip1_read2_en1;
// wire           cchip1_read2_en2;
// wire           cchip1_read2_en3;
// wire           cchip1_read2_en4;
// wire           cchip1_read2_en5;
// wire           cchip1_read2_en6;
// wire           cchip1_read2_en7;
// wire           cchip1_read2_en8;
// wire           cchip1_read2_en9;
// wire           cchip1_read2_en10;
// wire           cchip1_read2_en11;
// wire           cchip1_read2_en12;

// wire           cchip2_read1_en1;
// wire           cchip2_read1_en2;
// wire           cchip2_read1_en3;
// wire           cchip2_read1_en4;
// wire           cchip2_read1_en5;
// wire           cchip2_read1_en6;
// wire           cchip2_read1_en7;
// wire           cchip2_read1_en8;
// wire           cchip2_read1_en9;
// wire           cchip2_read1_en10;
// wire           cchip2_read1_en11;
// wire           cchip2_read1_en12;
// wire           cchip2_read2_en1;
// wire           cchip2_read2_en2;
// wire           cchip2_read2_en3;
// wire           cchip2_read2_en4;
// wire           cchip2_read2_en5;
// wire           cchip2_read2_en6;
// wire           cchip2_read2_en7;
// wire           cchip2_read2_en8;
// wire           cchip2_read2_en9;
// wire           cchip2_read2_en10;
// wire           cchip2_read2_en11;
// wire           cchip2_read2_en12;

// wire           cchip3_read1_en1;
// wire           cchip3_read1_en2;
// wire           cchip3_read1_en3;
// wire           cchip3_read1_en4;
// wire           cchip3_read1_en5;
// wire           cchip3_read1_en6;
// wire           cchip3_read1_en7;
// wire           cchip3_read1_en8;
// wire           cchip3_read1_en9;
// wire           cchip3_read1_en10;
// wire           cchip3_read1_en11;
// wire           cchip3_read1_en12;
// wire           cchip3_read2_en1;
// wire           cchip3_read2_en2;
// wire           cchip3_read2_en3;
// wire           cchip3_read2_en4;
// wire           cchip3_read2_en5;
// wire           cchip3_read2_en6;
// wire           cchip3_read2_en7;
// wire           cchip3_read2_en8;
// wire           cchip3_read2_en9;
// wire           cchip3_read2_en10;
// wire           cchip3_read2_en11;
// wire           cchip3_read2_en12;

// wire           cchip4_read1_en1;
// wire           cchip4_read1_en2;
// wire           cchip4_read1_en3;
// wire           cchip4_read1_en4;
// wire           cchip4_read1_en5;
// wire           cchip4_read1_en6;
// wire           cchip4_read1_en7;
// wire           cchip4_read1_en8;
// wire           cchip4_read1_en9;
// wire           cchip4_read1_en10;
// wire           cchip4_read1_en11;
// wire           cchip4_read1_en12;
// wire           cchip4_read2_en1;
// wire           cchip4_read2_en2;
// wire           cchip4_read2_en3;
// wire           cchip4_read2_en4;
// wire           cchip4_read2_en5;
// wire           cchip4_read2_en6;
// wire           cchip4_read2_en7;
// wire           cchip4_read2_en8;
// wire           cchip4_read2_en9;
// wire           cchip4_read2_en10;
// wire           cchip4_read2_en11;
// wire           cchip4_read2_en12;

// wire           cchip5_read1_en1;
// wire           cchip5_read1_en2;
// wire           cchip5_read1_en3;
// wire           cchip5_read1_en4;
// wire           cchip5_read1_en5;
// wire           cchip5_read1_en6;
// wire           cchip5_read1_en7;
// wire           cchip5_read1_en8;
// wire           cchip5_read1_en9;
// wire           cchip5_read1_en10;
// wire           cchip5_read1_en11;
// wire           cchip5_read1_en12;
// wire           cchip5_read2_en1;
// wire           cchip5_read2_en2;
// wire           cchip5_read2_en3;
// wire           cchip5_read2_en4;
// wire           cchip5_read2_en5;
// wire           cchip5_read2_en6;
// wire           cchip5_read2_en7;
// wire           cchip5_read2_en8;
// wire           cchip5_read2_en9;
// wire           cchip5_read2_en10;
// wire           cchip5_read2_en11;
// wire           cchip5_read2_en12;

// wire           cchip6_read1_en1;
// wire           cchip6_read1_en2;
// wire           cchip6_read1_en3;
// wire           cchip6_read1_en4;
// wire           cchip6_read1_en5;
// wire           cchip6_read1_en6;
// wire           cchip6_read1_en7;
// wire           cchip6_read1_en8;
// wire           cchip6_read1_en9;
// wire           cchip6_read1_en10;
// wire           cchip6_read1_en11;
// wire           cchip6_read1_en12;
// wire           cchip6_read2_en1;
// wire           cchip6_read2_en2;
// wire           cchip6_read2_en3;
// wire           cchip6_read2_en4;
// wire           cchip6_read2_en5;
// wire           cchip6_read2_en6;
// wire           cchip6_read2_en7;
// wire           cchip6_read2_en8;
// wire           cchip6_read2_en9;
// wire           cchip6_read2_en10;
// wire           cchip6_read2_en11;
// wire           cchip6_read2_en12;

// wire           cchip7_read1_en1;
// wire           cchip7_read1_en2;
// wire           cchip7_read1_en3;
// wire           cchip7_read1_en4;
// wire           cchip7_read1_en5;
// wire           cchip7_read1_en6;
// wire           cchip7_read1_en7;
// wire           cchip7_read1_en8;
// wire           cchip7_read1_en9;
// wire           cchip7_read1_en10;
// wire           cchip7_read1_en11;
// wire           cchip7_read1_en12;
// wire           cchip7_read2_en1;
// wire           cchip7_read2_en2;
// wire           cchip7_read2_en3;
// wire           cchip7_read2_en4;
// wire           cchip7_read2_en5;
// wire           cchip7_read2_en6;
// wire           cchip7_read2_en7;
// wire           cchip7_read2_en8;
// wire           cchip7_read2_en9;
// wire           cchip7_read2_en10;
// wire           cchip7_read2_en11;
// wire           cchip7_read2_en12;

// wire           cchip8_read1_en1;
// wire           cchip8_read1_en2;
// wire           cchip8_read1_en3;
// wire           cchip8_read1_en4;
// wire           cchip8_read1_en5;
// wire           cchip8_read1_en6;
// wire           cchip8_read1_en7;
// wire           cchip8_read1_en8;
// wire           cchip8_read1_en9;
// wire           cchip8_read1_en10;
// wire           cchip8_read1_en11;
// wire           cchip8_read1_en12;
// wire           cchip8_read2_en1;
// wire           cchip8_read2_en2;
// wire           cchip8_read2_en3;
// wire           cchip8_read2_en4;
// wire           cchip8_read2_en5;
// wire           cchip8_read2_en6;
// wire           cchip8_read2_en7;
// wire           cchip8_read2_en8;
// wire           cchip8_read2_en9;
// wire           cchip8_read2_en10;
// wire           cchip8_read2_en11;
// wire           cchip8_read2_en12;

// wire           cchip9_read1_en1;
// wire           cchip9_read1_en2;
// wire           cchip9_read1_en3;
// wire           cchip9_read1_en4;
// wire           cchip9_read1_en5;
// wire           cchip9_read1_en6;
// wire           cchip9_read1_en7;
// wire           cchip9_read1_en8;
// wire           cchip9_read1_en9;
// wire           cchip9_read1_en10;
// wire           cchip9_read1_en11;
// wire           cchip9_read1_en12;
// wire           cchip9_read2_en1;
// wire           cchip9_read2_en2;
// wire           cchip9_read2_en3;
// wire           cchip9_read2_en4;
// wire           cchip9_read2_en5;
// wire           cchip9_read2_en6;
// wire           cchip9_read2_en7;
// wire           cchip9_read2_en8;
// wire           cchip9_read2_en9;
// wire           cchip9_read2_en10;
// wire           cchip9_read2_en11;
// wire           cchip9_read2_en12;

// wire           cchip10_read1_en1;
// wire           cchip10_read1_en2;
// wire           cchip10_read1_en3;
// wire           cchip10_read1_en4;
// wire           cchip10_read1_en5;
// wire           cchip10_read1_en6;
// wire           cchip10_read1_en7;
// wire           cchip10_read1_en8;
// wire           cchip10_read1_en9;
// wire           cchip10_read1_en10;
// wire           cchip10_read1_en11;
// wire           cchip10_read1_en12;
// wire           cchip10_read2_en1;
// wire           cchip10_read2_en2;
// wire           cchip10_read2_en3;
// wire           cchip10_read2_en4;
// wire           cchip10_read2_en5;
// wire           cchip10_read2_en6;
// wire           cchip10_read2_en7;
// wire           cchip10_read2_en8;
// wire           cchip10_read2_en9;
// wire           cchip10_read2_en10;
// wire           cchip10_read2_en11;
// wire           cchip10_read2_en12;

// wire           cchip11_read1_en1;
// wire           cchip11_read1_en2;
// wire           cchip11_read1_en3;
// wire           cchip11_read1_en4;
// wire           cchip11_read1_en5;
// wire           cchip11_read1_en6;
// wire           cchip11_read1_en7;
// wire           cchip11_read1_en8;
// wire           cchip11_read1_en9;
// wire           cchip11_read1_en10;
// wire           cchip11_read1_en11;
// wire           cchip11_read1_en12;
// wire           cchip11_read2_en1;
// wire           cchip11_read2_en2;
// wire           cchip11_read2_en3;
// wire           cchip11_read2_en4;
// wire           cchip11_read2_en5;
// wire           cchip11_read2_en6;
// wire           cchip11_read2_en7;
// wire           cchip11_read2_en8;
// wire           cchip11_read2_en9;
// wire           cchip11_read2_en10;
// wire           cchip11_read2_en11;
// wire           cchip11_read2_en12;

// wire           cchip12_read1_en1;
// wire           cchip12_read1_en2;
// wire           cchip12_read1_en3;
// wire           cchip12_read1_en4;
// wire           cchip12_read1_en5;
// wire           cchip12_read1_en6;
// wire           cchip12_read1_en7;
// wire           cchip12_read1_en8;
// wire           cchip12_read1_en9;
// wire           cchip12_read1_en10;
// wire           cchip12_read1_en11;
// wire           cchip12_read1_en12;
// wire           cchip12_read2_en1;
// wire           cchip12_read2_en2;
// wire           cchip12_read2_en3;
// wire           cchip12_read2_en4;
// wire           cchip12_read2_en5;
// wire           cchip12_read2_en6;
// wire           cchip12_read2_en7;
// wire           cchip12_read2_en8;
// wire           cchip12_read2_en9;
// wire           cchip12_read2_en10;
// wire           cchip12_read2_en11;
// wire           cchip12_read2_en12;

// FD RD1  (.D(chip1_read1_en1),  .C(CLK_80M), .Q(cchip1_read1_en1));
// FD RD2  (.D(chip1_read1_en2),  .C(CLK_80M), .Q(cchip1_read1_en2));
// FD RD3  (.D(chip1_read1_en3),  .C(CLK_80M), .Q(cchip1_read1_en3));
// FD RD4  (.D(chip1_read1_en4),  .C(CLK_80M), .Q(cchip1_read1_en4));
// FD RD5  (.D(chip1_read1_en5),  .C(CLK_80M), .Q(cchip1_read1_en5));
// FD RD6  (.D(chip1_read1_en6),  .C(CLK_80M), .Q(cchip1_read1_en6));
// FD RD7  (.D(chip1_read1_en7),  .C(CLK_80M), .Q(cchip1_read1_en7));
// FD RD8  (.D(chip1_read1_en8),  .C(CLK_80M), .Q(cchip1_read1_en8));
// FD RD9  (.D(chip1_read1_en9),  .C(CLK_80M), .Q(cchip1_read1_en9));
// FD RD10 (.D(chip1_read1_en10), .C(CLK_80M), .Q(cchip1_read1_en10));
// FD RD11 (.D(chip1_read1_en11), .C(CLK_80M), .Q(cchip1_read1_en11));
// FD RD12 (.D(chip1_read1_en12), .C(CLK_80M), .Q(cchip1_read1_en12));
// FD RD13 (.D(chip1_read2_en1),  .C(CLK_80M), .Q(cchip1_read2_en1));
// FD RD14 (.D(chip1_read2_en2),  .C(CLK_80M), .Q(cchip1_read2_en2));
// FD RD15 (.D(chip1_read2_en3),  .C(CLK_80M), .Q(cchip1_read2_en3));
// FD RD16 (.D(chip1_read2_en4),  .C(CLK_80M), .Q(cchip1_read2_en4));
// FD RD17 (.D(chip1_read2_en5),  .C(CLK_80M), .Q(cchip1_read2_en5));
// FD RD18 (.D(chip1_read2_en6),  .C(CLK_80M), .Q(cchip1_read2_en6));
// FD RD19 (.D(chip1_read2_en7),  .C(CLK_80M), .Q(cchip1_read2_en7));
// FD RD20 (.D(chip1_read2_en8),  .C(CLK_80M), .Q(cchip1_read2_en8));
// FD RD21 (.D(chip1_read2_en9),  .C(CLK_80M), .Q(cchip1_read2_en9));
// FD RD22 (.D(chip1_read2_en10), .C(CLK_80M), .Q(cchip1_read2_en10));
// FD RD23 (.D(chip1_read2_en11), .C(CLK_80M), .Q(cchip1_read2_en11));
// FD RD24 (.D(chip1_read2_en12), .C(CLK_80M), .Q(cchip1_read2_en12));

// FD RD25 (.D(chip2_read1_en1),  .C(CLK_80M), .Q(cchip2_read1_en1));
// FD RD26 (.D(chip2_read1_en2),  .C(CLK_80M), .Q(cchip2_read1_en2));
// FD RD27 (.D(chip2_read1_en3),  .C(CLK_80M), .Q(cchip2_read1_en3));
// FD RD28 (.D(chip2_read1_en4),  .C(CLK_80M), .Q(cchip2_read1_en4));
// FD RD29 (.D(chip2_read1_en5),  .C(CLK_80M), .Q(cchip2_read1_en5));
// FD RD30 (.D(chip2_read1_en6),  .C(CLK_80M), .Q(cchip2_read1_en6));
// FD RD31 (.D(chip2_read1_en7),  .C(CLK_80M), .Q(cchip2_read1_en7));
// FD RD32 (.D(chip2_read1_en8),  .C(CLK_80M), .Q(cchip2_read1_en8));
// FD RD33 (.D(chip2_read1_en9),  .C(CLK_80M), .Q(cchip2_read1_en9));
// FD RD34 (.D(chip2_read1_en10), .C(CLK_80M), .Q(cchip2_read1_en10));
// FD RD35 (.D(chip2_read1_en11), .C(CLK_80M), .Q(cchip2_read1_en11));
// FD RD36 (.D(chip2_read1_en12), .C(CLK_80M), .Q(cchip2_read1_en12));
// FD RD37 (.D(chip2_read2_en1),  .C(CLK_80M), .Q(cchip2_read2_en1));
// FD RD38 (.D(chip2_read2_en2),  .C(CLK_80M), .Q(cchip2_read2_en2));
// FD RD39 (.D(chip2_read2_en3),  .C(CLK_80M), .Q(cchip2_read2_en3));
// FD RD40 (.D(chip2_read2_en4),  .C(CLK_80M), .Q(cchip2_read2_en4));
// FD RD41 (.D(chip2_read2_en5),  .C(CLK_80M), .Q(cchip2_read2_en5));
// FD RD42 (.D(chip2_read2_en6),  .C(CLK_80M), .Q(cchip2_read2_en6));
// FD RD43 (.D(chip2_read2_en7),  .C(CLK_80M), .Q(cchip2_read2_en7));
// FD RD44 (.D(chip2_read2_en8),  .C(CLK_80M), .Q(cchip2_read2_en8));
// FD RD45 (.D(chip2_read2_en9),  .C(CLK_80M), .Q(cchip2_read2_en9));
// FD RD46 (.D(chip2_read2_en10), .C(CLK_80M), .Q(cchip2_read2_en10));
// FD RD47 (.D(chip2_read2_en11), .C(CLK_80M), .Q(cchip2_read2_en11));
// FD RD48 (.D(chip2_read2_en12), .C(CLK_80M), .Q(cchip2_read2_en12));

// FD RD49 (.D(chip3_read1_en1),  .C(CLK_80M), .Q(cchip3_read1_en1));
// FD RD50 (.D(chip3_read1_en2),  .C(CLK_80M), .Q(cchip3_read1_en2));
// FD RD51 (.D(chip3_read1_en3),  .C(CLK_80M), .Q(cchip3_read1_en3));
// FD RD52 (.D(chip3_read1_en4),  .C(CLK_80M), .Q(cchip3_read1_en4));
// FD RD53 (.D(chip3_read1_en5),  .C(CLK_80M), .Q(cchip3_read1_en5));
// FD RD54 (.D(chip3_read1_en6),  .C(CLK_80M), .Q(cchip3_read1_en6));
// FD RD55 (.D(chip3_read1_en7),  .C(CLK_80M), .Q(cchip3_read1_en7));
// FD RD56 (.D(chip3_read1_en8),  .C(CLK_80M), .Q(cchip3_read1_en8));
// FD RD57 (.D(chip3_read1_en9),  .C(CLK_80M), .Q(cchip3_read1_en9));
// FD RD58 (.D(chip3_read1_en10), .C(CLK_80M), .Q(cchip3_read1_en10));
// FD RD59 (.D(chip3_read1_en11), .C(CLK_80M), .Q(cchip3_read1_en11));
// FD RD60 (.D(chip3_read1_en12), .C(CLK_80M), .Q(cchip3_read1_en12));
// FD RD61 (.D(chip3_read2_en1),  .C(CLK_80M), .Q(cchip3_read2_en1));
// FD RD62 (.D(chip3_read2_en2),  .C(CLK_80M), .Q(cchip3_read2_en2));
// FD RD63 (.D(chip3_read2_en3),  .C(CLK_80M), .Q(cchip3_read2_en3));
// FD RD64 (.D(chip3_read2_en4),  .C(CLK_80M), .Q(cchip3_read2_en4));
// FD RD65 (.D(chip3_read2_en5),  .C(CLK_80M), .Q(cchip3_read2_en5));
// FD RD66 (.D(chip3_read2_en6),  .C(CLK_80M), .Q(cchip3_read2_en6));
// FD RD67 (.D(chip3_read2_en7),  .C(CLK_80M), .Q(cchip3_read2_en7));
// FD RD68 (.D(chip3_read2_en8),  .C(CLK_80M), .Q(cchip3_read2_en8));
// FD RD69 (.D(chip3_read2_en9),  .C(CLK_80M), .Q(cchip3_read2_en9));
// FD RD70 (.D(chip3_read2_en10), .C(CLK_80M), .Q(cchip3_read2_en10));
// FD RD71 (.D(chip3_read2_en11), .C(CLK_80M), .Q(cchip3_read2_en11));
// FD RD72 (.D(chip3_read2_en12), .C(CLK_80M), .Q(cchip3_read2_en12));

// FD RD73 (.D(chip4_read1_en1),  .C(CLK_80M), .Q(cchip4_read1_en1));
// FD RD74 (.D(chip4_read1_en2),  .C(CLK_80M), .Q(cchip4_read1_en2));
// FD RD75 (.D(chip4_read1_en3),  .C(CLK_80M), .Q(cchip4_read1_en3));
// FD RD76 (.D(chip4_read1_en4),  .C(CLK_80M), .Q(cchip4_read1_en4));
// FD RD77 (.D(chip4_read1_en5),  .C(CLK_80M), .Q(cchip4_read1_en5));
// FD RD78 (.D(chip4_read1_en6),  .C(CLK_80M), .Q(cchip4_read1_en6));
// FD RD79 (.D(chip4_read1_en7),  .C(CLK_80M), .Q(cchip4_read1_en7));
// FD RD80 (.D(chip4_read1_en8),  .C(CLK_80M), .Q(cchip4_read1_en8));
// FD RD81 (.D(chip4_read1_en9),  .C(CLK_80M), .Q(cchip4_read1_en9));
// FD RD82 (.D(chip4_read1_en10), .C(CLK_80M), .Q(cchip4_read1_en10));
// FD RD83 (.D(chip4_read1_en11), .C(CLK_80M), .Q(cchip4_read1_en11));
// FD RD84 (.D(chip4_read1_en12), .C(CLK_80M), .Q(cchip4_read1_en12));
// FD RD85 (.D(chip4_read2_en1),  .C(CLK_80M), .Q(cchip4_read2_en1));
// FD RD86 (.D(chip4_read2_en2),  .C(CLK_80M), .Q(cchip4_read2_en2));
// FD RD87 (.D(chip4_read2_en3),  .C(CLK_80M), .Q(cchip4_read2_en3));
// FD RD88 (.D(chip4_read2_en4),  .C(CLK_80M), .Q(cchip4_read2_en4));
// FD RD89 (.D(chip4_read2_en5),  .C(CLK_80M), .Q(cchip4_read2_en5));
// FD RD90 (.D(chip4_read2_en6),  .C(CLK_80M), .Q(cchip4_read2_en6));
// FD RD91 (.D(chip4_read2_en7),  .C(CLK_80M), .Q(cchip4_read2_en7));
// FD RD92 (.D(chip4_read2_en8),  .C(CLK_80M), .Q(cchip4_read2_en8));
// FD RD93 (.D(chip4_read2_en9),  .C(CLK_80M), .Q(cchip4_read2_en9));
// FD RD94 (.D(chip4_read2_en10), .C(CLK_80M), .Q(cchip4_read2_en10));
// FD RD95 (.D(chip4_read2_en11), .C(CLK_80M), .Q(cchip4_read2_en11));
// FD RD96 (.D(chip4_read2_en12), .C(CLK_80M), .Q(cchip4_read2_en12));

// FD RD97  (.D(chip5_read1_en1),  .C(CLK_80M), .Q(cchip5_read1_en1));
// FD RD98  (.D(chip5_read1_en2),  .C(CLK_80M), .Q(cchip5_read1_en2));
// FD RD99  (.D(chip5_read1_en3),  .C(CLK_80M), .Q(cchip5_read1_en3));
// FD RD100 (.D(chip5_read1_en4),  .C(CLK_80M), .Q(cchip5_read1_en4));
// FD RD101 (.D(chip5_read1_en5),  .C(CLK_80M), .Q(cchip5_read1_en5));
// FD RD102 (.D(chip5_read1_en6),  .C(CLK_80M), .Q(cchip5_read1_en6));
// FD RD103 (.D(chip5_read1_en7),  .C(CLK_80M), .Q(cchip5_read1_en7));
// FD RD104 (.D(chip5_read1_en8),  .C(CLK_80M), .Q(cchip5_read1_en8));
// FD RD105 (.D(chip5_read1_en9),  .C(CLK_80M), .Q(cchip5_read1_en9));
// FD RD106 (.D(chip5_read1_en10), .C(CLK_80M), .Q(cchip5_read1_en10));
// FD RD107 (.D(chip5_read1_en11), .C(CLK_80M), .Q(cchip5_read1_en11));
// FD RD108 (.D(chip5_read1_en12), .C(CLK_80M), .Q(cchip5_read1_en12));
// FD RD109 (.D(chip5_read2_en1),  .C(CLK_80M), .Q(cchip5_read2_en1));
// FD RD110 (.D(chip5_read2_en2),  .C(CLK_80M), .Q(cchip5_read2_en2));
// FD RD111 (.D(chip5_read2_en3),  .C(CLK_80M), .Q(cchip5_read2_en3));
// FD RD112 (.D(chip5_read2_en4),  .C(CLK_80M), .Q(cchip5_read2_en4));
// FD RD113 (.D(chip5_read2_en5),  .C(CLK_80M), .Q(cchip5_read2_en5));
// FD RD114 (.D(chip5_read2_en6),  .C(CLK_80M), .Q(cchip5_read2_en6));
// FD RD115 (.D(chip5_read2_en7),  .C(CLK_80M), .Q(cchip5_read2_en7));
// FD RD116 (.D(chip5_read2_en8),  .C(CLK_80M), .Q(cchip5_read2_en8));
// FD RD117 (.D(chip5_read2_en9),  .C(CLK_80M), .Q(cchip5_read2_en9));
// FD RD118 (.D(chip5_read2_en10), .C(CLK_80M), .Q(cchip5_read2_en10));
// FD RD119 (.D(chip5_read2_en11), .C(CLK_80M), .Q(cchip5_read2_en11));
// FD RD120 (.D(chip5_read2_en12), .C(CLK_80M), .Q(cchip5_read2_en12));

// FD RD121 (.D(chip6_read1_en1),  .C(CLK_80M), .Q(cchip6_read1_en1));
// FD RD122 (.D(chip6_read1_en2),  .C(CLK_80M), .Q(cchip6_read1_en2));
// FD RD123 (.D(chip6_read1_en3),  .C(CLK_80M), .Q(cchip6_read1_en3));
// FD RD124 (.D(chip6_read1_en4),  .C(CLK_80M), .Q(cchip6_read1_en4));
// FD RD125 (.D(chip6_read1_en5),  .C(CLK_80M), .Q(cchip6_read1_en5));
// FD RD126 (.D(chip6_read1_en6),  .C(CLK_80M), .Q(cchip6_read1_en6));
// FD RD127 (.D(chip6_read1_en7),  .C(CLK_80M), .Q(cchip6_read1_en7));
// FD RD128 (.D(chip6_read1_en8),  .C(CLK_80M), .Q(cchip6_read1_en8));
// FD RD129 (.D(chip6_read1_en9),  .C(CLK_80M), .Q(cchip6_read1_en9));
// FD RD130 (.D(chip6_read1_en10), .C(CLK_80M), .Q(cchip6_read1_en10));
// FD RD131 (.D(chip6_read1_en11), .C(CLK_80M), .Q(cchip6_read1_en11));
// FD RD132 (.D(chip6_read1_en12), .C(CLK_80M), .Q(cchip6_read1_en12));
// FD RD133 (.D(chip6_read2_en1),  .C(CLK_80M), .Q(cchip6_read2_en1));
// FD RD134 (.D(chip6_read2_en2),  .C(CLK_80M), .Q(cchip6_read2_en2));
// FD RD135 (.D(chip6_read2_en3),  .C(CLK_80M), .Q(cchip6_read2_en3));
// FD RD136 (.D(chip6_read2_en4),  .C(CLK_80M), .Q(cchip6_read2_en4));
// FD RD137 (.D(chip6_read2_en5),  .C(CLK_80M), .Q(cchip6_read2_en5));
// FD RD138 (.D(chip6_read2_en6),  .C(CLK_80M), .Q(cchip6_read2_en6));
// FD RD139 (.D(chip6_read2_en7),  .C(CLK_80M), .Q(cchip6_read2_en7));
// FD RD140 (.D(chip6_read2_en8),  .C(CLK_80M), .Q(cchip6_read2_en8));
// FD RD141 (.D(chip6_read2_en9),  .C(CLK_80M), .Q(cchip6_read2_en9));
// FD RD142 (.D(chip6_read2_en10), .C(CLK_80M), .Q(cchip6_read2_en10));
// FD RD143 (.D(chip6_read2_en11), .C(CLK_80M), .Q(cchip6_read2_en11));
// FD RD144 (.D(chip6_read2_en12), .C(CLK_80M), .Q(cchip6_read2_en12));


// FD RD145 (.D(chip7_read1_en1),  .C(CLK_80M), .Q(cchip7_read1_en1));
// FD RD146 (.D(chip7_read1_en2),  .C(CLK_80M), .Q(cchip7_read1_en2));
// FD RD147 (.D(chip7_read1_en3),  .C(CLK_80M), .Q(cchip7_read1_en3));
// FD RD148 (.D(chip7_read1_en4),  .C(CLK_80M), .Q(cchip7_read1_en4));
// FD RD149 (.D(chip7_read1_en5),  .C(CLK_80M), .Q(cchip7_read1_en5));
// FD RD150 (.D(chip7_read1_en6),  .C(CLK_80M), .Q(cchip7_read1_en6));
// FD RD151 (.D(chip7_read1_en7),  .C(CLK_80M), .Q(cchip7_read1_en7));
// FD RD152 (.D(chip7_read1_en8),  .C(CLK_80M), .Q(cchip7_read1_en8));
// FD RD153 (.D(chip7_read1_en9),  .C(CLK_80M), .Q(cchip7_read1_en9));
// FD RD154 (.D(chip7_read1_en10), .C(CLK_80M), .Q(cchip7_read1_en10));
// FD RD155 (.D(chip7_read1_en11), .C(CLK_80M), .Q(cchip7_read1_en11));
// FD RD156 (.D(chip7_read1_en12), .C(CLK_80M), .Q(cchip7_read1_en12));
// FD RD157 (.D(chip7_read2_en1),  .C(CLK_80M), .Q(cchip7_read2_en1));
// FD RD158 (.D(chip7_read2_en2),  .C(CLK_80M), .Q(cchip7_read2_en2));
// FD RD159 (.D(chip7_read2_en3),  .C(CLK_80M), .Q(cchip7_read2_en3));
// FD RD160 (.D(chip7_read2_en4),  .C(CLK_80M), .Q(cchip7_read2_en4));
// FD RD161 (.D(chip7_read2_en5),  .C(CLK_80M), .Q(cchip7_read2_en5));
// FD RD162 (.D(chip7_read2_en6),  .C(CLK_80M), .Q(cchip7_read2_en6));
// FD RD163 (.D(chip7_read2_en7),  .C(CLK_80M), .Q(cchip7_read2_en7));
// FD RD164 (.D(chip7_read2_en8),  .C(CLK_80M), .Q(cchip7_read2_en8));
// FD RD165 (.D(chip7_read2_en9),  .C(CLK_80M), .Q(cchip7_read2_en9));
// FD RD166 (.D(chip7_read2_en10), .C(CLK_80M), .Q(cchip7_read2_en10));
// FD RD167 (.D(chip7_read2_en11), .C(CLK_80M), .Q(cchip7_read2_en11));
// FD RD168 (.D(chip7_read2_en12), .C(CLK_80M), .Q(cchip7_read2_en12));

// FD RD169 (.D(chip8_read1_en1),  .C(CLK_80M), .Q(cchip8_read1_en1));
// FD RD170 (.D(chip8_read1_en2),  .C(CLK_80M), .Q(cchip8_read1_en2));
// FD RD171 (.D(chip8_read1_en3),  .C(CLK_80M), .Q(cchip8_read1_en3));
// FD RD172 (.D(chip8_read1_en4),  .C(CLK_80M), .Q(cchip8_read1_en4));
// FD RD173 (.D(chip8_read1_en5),  .C(CLK_80M), .Q(cchip8_read1_en5));
// FD RD174 (.D(chip8_read1_en6),  .C(CLK_80M), .Q(cchip8_read1_en6));
// FD RD175 (.D(chip8_read1_en7),  .C(CLK_80M), .Q(cchip8_read1_en7));
// FD RD176 (.D(chip8_read1_en8),  .C(CLK_80M), .Q(cchip8_read1_en8));
// FD RD177 (.D(chip8_read1_en9),  .C(CLK_80M), .Q(cchip8_read1_en9));
// FD RD178 (.D(chip8_read1_en10), .C(CLK_80M), .Q(cchip8_read1_en10));
// FD RD179 (.D(chip8_read1_en11), .C(CLK_80M), .Q(cchip8_read1_en11));
// FD RD180 (.D(chip8_read1_en12), .C(CLK_80M), .Q(cchip8_read1_en12));
// FD RD181 (.D(chip8_read2_en1),  .C(CLK_80M), .Q(cchip8_read2_en1));
// FD RD182 (.D(chip8_read2_en2),  .C(CLK_80M), .Q(cchip8_read2_en2));
// FD RD183 (.D(chip8_read2_en3),  .C(CLK_80M), .Q(cchip8_read2_en3));
// FD RD184 (.D(chip8_read2_en4),  .C(CLK_80M), .Q(cchip8_read2_en4));
// FD RD185 (.D(chip8_read2_en5),  .C(CLK_80M), .Q(cchip8_read2_en5));
// FD RD186 (.D(chip8_read2_en6),  .C(CLK_80M), .Q(cchip8_read2_en6));
// FD RD187 (.D(chip8_read2_en7),  .C(CLK_80M), .Q(cchip8_read2_en7));
// FD RD188 (.D(chip8_read2_en8),  .C(CLK_80M), .Q(cchip8_read2_en8));
// FD RD189 (.D(chip8_read2_en9),  .C(CLK_80M), .Q(cchip8_read2_en9));
// FD RD190 (.D(chip8_read2_en10), .C(CLK_80M), .Q(cchip8_read2_en10));
// FD RD191 (.D(chip8_read2_en11), .C(CLK_80M), .Q(cchip8_read2_en11));
// FD RD192 (.D(chip8_read2_en12), .C(CLK_80M), .Q(cchip8_read2_en12));

// FD RD193 (.D(chip9_read1_en1),  .C(CLK_80M), .Q(cchip9_read1_en1));
// FD RD194 (.D(chip9_read1_en2),  .C(CLK_80M), .Q(cchip9_read1_en2));
// FD RD195 (.D(chip9_read1_en3),  .C(CLK_80M), .Q(cchip9_read1_en3));
// FD RD196 (.D(chip9_read1_en4),  .C(CLK_80M), .Q(cchip9_read1_en4));
// FD RD197 (.D(chip9_read1_en5),  .C(CLK_80M), .Q(cchip9_read1_en5));
// FD RD198 (.D(chip9_read1_en6),  .C(CLK_80M), .Q(cchip9_read1_en6));
// FD RD199 (.D(chip9_read1_en7),  .C(CLK_80M), .Q(cchip9_read1_en7));
// FD RD200 (.D(chip9_read1_en8),  .C(CLK_80M), .Q(cchip9_read1_en8));
// FD RD201 (.D(chip9_read1_en9),  .C(CLK_80M), .Q(cchip9_read1_en9));
// FD RD202 (.D(chip9_read1_en10), .C(CLK_80M), .Q(cchip9_read1_en10));
// FD RD203 (.D(chip9_read1_en11), .C(CLK_80M), .Q(cchip9_read1_en11));
// FD RD204 (.D(chip9_read1_en12), .C(CLK_80M), .Q(cchip9_read1_en12));
// FD RD205 (.D(chip9_read2_en1),  .C(CLK_80M), .Q(cchip9_read2_en1));
// FD RD206 (.D(chip9_read2_en2),  .C(CLK_80M), .Q(cchip9_read2_en2));
// FD RD207 (.D(chip9_read2_en3),  .C(CLK_80M), .Q(cchip9_read2_en3));
// FD RD208 (.D(chip9_read2_en4),  .C(CLK_80M), .Q(cchip9_read2_en4));
// FD RD209 (.D(chip9_read2_en5),  .C(CLK_80M), .Q(cchip9_read2_en5));
// FD RD210 (.D(chip9_read2_en6),  .C(CLK_80M), .Q(cchip9_read2_en6));
// FD RD211 (.D(chip9_read2_en7),  .C(CLK_80M), .Q(cchip9_read2_en7));
// FD RD212 (.D(chip9_read2_en8),  .C(CLK_80M), .Q(cchip9_read2_en8));
// FD RD213 (.D(chip9_read2_en9),  .C(CLK_80M), .Q(cchip9_read2_en9));
// FD RD214 (.D(chip9_read2_en10), .C(CLK_80M), .Q(cchip9_read2_en10));
// FD RD215 (.D(chip9_read2_en11), .C(CLK_80M), .Q(cchip9_read2_en11));
// FD RD216 (.D(chip9_read2_en12), .C(CLK_80M), .Q(cchip9_read2_en12));

// FD RD217 (.D(chip10_read1_en1),  .C(CLK_80M), .Q(cchip10_read1_en1));
// FD RD218 (.D(chip10_read1_en2),  .C(CLK_80M), .Q(cchip10_read1_en2));
// FD RD219 (.D(chip10_read1_en3),  .C(CLK_80M), .Q(cchip10_read1_en3));
// FD RD220 (.D(chip10_read1_en4),  .C(CLK_80M), .Q(cchip10_read1_en4));
// FD RD221 (.D(chip10_read1_en5),  .C(CLK_80M), .Q(cchip10_read1_en5));
// FD RD222 (.D(chip10_read1_en6),  .C(CLK_80M), .Q(cchip10_read1_en6));
// FD RD223 (.D(chip10_read1_en7),  .C(CLK_80M), .Q(cchip10_read1_en7));
// FD RD224 (.D(chip10_read1_en8),  .C(CLK_80M), .Q(cchip10_read1_en8));
// FD RD225 (.D(chip10_read1_en9),  .C(CLK_80M), .Q(cchip10_read1_en9));
// FD RD226 (.D(chip10_read1_en10), .C(CLK_80M), .Q(cchip10_read1_en10));
// FD RD227 (.D(chip10_read1_en11), .C(CLK_80M), .Q(cchip10_read1_en11));
// FD RD228 (.D(chip10_read1_en12), .C(CLK_80M), .Q(cchip10_read1_en12));
// FD RD229 (.D(chip10_read2_en1),  .C(CLK_80M), .Q(cchip10_read2_en1));
// FD RD230 (.D(chip10_read2_en2),  .C(CLK_80M), .Q(cchip10_read2_en2));
// FD RD231 (.D(chip10_read2_en3),  .C(CLK_80M), .Q(cchip10_read2_en3));
// FD RD232 (.D(chip10_read2_en4),  .C(CLK_80M), .Q(cchip10_read2_en4));
// FD RD233 (.D(chip10_read2_en5),  .C(CLK_80M), .Q(cchip10_read2_en5));
// FD RD234 (.D(chip10_read2_en6),  .C(CLK_80M), .Q(cchip10_read2_en6));
// FD RD235 (.D(chip10_read2_en7),  .C(CLK_80M), .Q(cchip10_read2_en7));
// FD RD236 (.D(chip10_read2_en8),  .C(CLK_80M), .Q(cchip10_read2_en8));
// FD RD237 (.D(chip10_read2_en9),  .C(CLK_80M), .Q(cchip10_read2_en9));
// FD RD238 (.D(chip10_read2_en10), .C(CLK_80M), .Q(cchip10_read2_en10));
// FD RD239 (.D(chip10_read2_en11), .C(CLK_80M), .Q(cchip10_read2_en11));
// FD RD240 (.D(chip10_read2_en12), .C(CLK_80M), .Q(cchip10_read2_en12));

// FD RD241 (.D(chip11_read1_en1),  .C(CLK_80M), .Q(cchip11_read1_en1));
// FD RD242 (.D(chip11_read1_en2),  .C(CLK_80M), .Q(cchip11_read1_en2));
// FD RD243 (.D(chip11_read1_en3),  .C(CLK_80M), .Q(cchip11_read1_en3));
// FD RD244 (.D(chip11_read1_en4),  .C(CLK_80M), .Q(cchip11_read1_en4));
// FD RD245 (.D(chip11_read1_en5),  .C(CLK_80M), .Q(cchip11_read1_en5));
// FD RD246 (.D(chip11_read1_en6),  .C(CLK_80M), .Q(cchip11_read1_en6));
// FD RD247 (.D(chip11_read1_en7),  .C(CLK_80M), .Q(cchip11_read1_en7));
// FD RD248 (.D(chip11_read1_en8),  .C(CLK_80M), .Q(cchip11_read1_en8));
// FD RD249 (.D(chip11_read1_en9),  .C(CLK_80M), .Q(cchip11_read1_en9));
// FD RD250 (.D(chip11_read1_en10), .C(CLK_80M), .Q(cchip11_read1_en10));
// FD RD251 (.D(chip11_read1_en11), .C(CLK_80M), .Q(cchip11_read1_en11));
// FD RD252 (.D(chip11_read1_en12), .C(CLK_80M), .Q(cchip11_read1_en12));
// FD RD253 (.D(chip11_read2_en1),  .C(CLK_80M), .Q(cchip11_read2_en1));
// FD RD254 (.D(chip11_read2_en2),  .C(CLK_80M), .Q(cchip11_read2_en2));
// FD RD255 (.D(chip11_read2_en3),  .C(CLK_80M), .Q(cchip11_read2_en3));
// FD RD256 (.D(chip11_read2_en4),  .C(CLK_80M), .Q(cchip11_read2_en4));
// FD RD257 (.D(chip11_read2_en5),  .C(CLK_80M), .Q(cchip11_read2_en5));
// FD RD258 (.D(chip11_read2_en6),  .C(CLK_80M), .Q(cchip11_read2_en6));
// FD RD259 (.D(chip11_read2_en7),  .C(CLK_80M), .Q(cchip11_read2_en7));
// FD RD260 (.D(chip11_read2_en8),  .C(CLK_80M), .Q(cchip11_read2_en8));
// FD RD261 (.D(chip11_read2_en9),  .C(CLK_80M), .Q(cchip11_read2_en9));
// FD RD262 (.D(chip11_read2_en10), .C(CLK_80M), .Q(cchip11_read2_en10));
// FD RD263 (.D(chip11_read2_en11), .C(CLK_80M), .Q(cchip11_read2_en11));
// FD RD264 (.D(chip11_read2_en12), .C(CLK_80M), .Q(cchip11_read2_en12));

// FD RD265 (.D(chip12_read1_en1),  .C(CLK_80M), .Q(cchip12_read1_en1));
// FD RD266 (.D(chip12_read1_en2),  .C(CLK_80M), .Q(cchip12_read1_en2));
// FD RD267 (.D(chip12_read1_en3),  .C(CLK_80M), .Q(cchip12_read1_en3));
// FD RD268 (.D(chip12_read1_en4),  .C(CLK_80M), .Q(cchip12_read1_en4));
// FD RD269 (.D(chip12_read1_en5),  .C(CLK_80M), .Q(cchip12_read1_en5));
// FD RD270 (.D(chip12_read1_en6),  .C(CLK_80M), .Q(cchip12_read1_en6));
// FD RD271 (.D(chip12_read1_en7),  .C(CLK_80M), .Q(cchip12_read1_en7));
// FD RD272 (.D(chip12_read1_en8),  .C(CLK_80M), .Q(cchip12_read1_en8));
// FD RD273 (.D(chip12_read1_en9),  .C(CLK_80M), .Q(cchip12_read1_en9));
// FD RD274 (.D(chip12_read1_en10), .C(CLK_80M), .Q(cchip12_read1_en10));
// FD RD275 (.D(chip12_read1_en11), .C(CLK_80M), .Q(cchip12_read1_en11));
// FD RD276 (.D(chip12_read1_en12), .C(CLK_80M), .Q(cchip12_read1_en12));
// FD RD277 (.D(chip12_read2_en1),  .C(CLK_80M), .Q(cchip12_read2_en1));
// FD RD278 (.D(chip12_read2_en2),  .C(CLK_80M), .Q(cchip12_read2_en2));
// FD RD279 (.D(chip12_read2_en3),  .C(CLK_80M), .Q(cchip12_read2_en3));
// FD RD280 (.D(chip12_read2_en4),  .C(CLK_80M), .Q(cchip12_read2_en4));
// FD RD281 (.D(chip12_read2_en5),  .C(CLK_80M), .Q(cchip12_read2_en5));
// FD RD282 (.D(chip12_read2_en6),  .C(CLK_80M), .Q(cchip12_read2_en6));
// FD RD283 (.D(chip12_read2_en7),  .C(CLK_80M), .Q(cchip12_read2_en7));
// FD RD284 (.D(chip12_read2_en8),  .C(CLK_80M), .Q(cchip12_read2_en8));
// FD RD285 (.D(chip12_read2_en9),  .C(CLK_80M), .Q(cchip12_read2_en9));
// FD RD286 (.D(chip12_read2_en10), .C(CLK_80M), .Q(cchip12_read2_en10));
// FD RD287 (.D(chip12_read2_en11), .C(CLK_80M), .Q(cchip12_read2_en11));
// FD RD288 (.D(chip12_read2_en12), .C(CLK_80M), .Q(cchip12_read2_en12));







// wire  c1_r1_1;
// wire  c1_r1_2;
// wire  c1_r1_3;
// wire  c1_r1_4;
// wire  c1_r1_5;
// wire  c1_r1_6;
// wire  c1_r1_7;
// wire  c1_r1_8;
// wire  c1_r1_9;
// wire  c1_r1_10;
// wire  c1_r1_11;
// wire  c1_r1_12;
// wire  c1_r2_1;
// wire  c1_r2_2;
// wire  c1_r2_3;
// wire  c1_r2_4;
// wire  c1_r2_5;
// wire  c1_r2_6;
// wire  c1_r2_7;
// wire  c1_r2_8;
// wire  c1_r2_9;
// wire  c1_r2_10;
// wire  c1_r2_11;
// wire  c1_r2_12;

// wire  c2_r1_1;
// wire  c2_r1_2;
// wire  c2_r1_3;
// wire  c2_r1_4;
// wire  c2_r1_5;
// wire  c2_r1_6;
// wire  c2_r1_7;
// wire  c2_r1_8;
// wire  c2_r1_9;
// wire  c2_r1_10;
// wire  c2_r1_11;
// wire  c2_r1_12;
// wire  c2_r2_1;
// wire  c2_r2_2;
// wire  c2_r2_3;
// wire  c2_r2_4;
// wire  c2_r2_5;
// wire  c2_r2_6;
// wire  c2_r2_7;
// wire  c2_r2_8;
// wire  c2_r2_9;
// wire  c2_r2_10;
// wire  c2_r2_11;
// wire  c2_r2_12;

// wire  c3_r1_1;
// wire  c3_r1_2;
// wire  c3_r1_3;
// wire  c3_r1_4;
// wire  c3_r1_5;
// wire  c3_r1_6;
// wire  c3_r1_7;
// wire  c3_r1_8;
// wire  c3_r1_9;
// wire  c3_r1_10;
// wire  c3_r1_11;
// wire  c3_r1_12;
// wire  c3_r2_1;
// wire  c3_r2_2;
// wire  c3_r2_3;
// wire  c3_r2_4;
// wire  c3_r2_5;
// wire  c3_r2_6;
// wire  c3_r2_7;
// wire  c3_r2_8;
// wire  c3_r2_9;
// wire  c3_r2_10;
// wire  c3_r2_11;
// wire  c3_r2_12;

// wire  c4_r1_1;
// wire  c4_r1_2;
// wire  c4_r1_3;
// wire  c4_r1_4;
// wire  c4_r1_5;
// wire  c4_r1_6;
// wire  c4_r1_7;
// wire  c4_r1_8;
// wire  c4_r1_9;
// wire  c4_r1_10;
// wire  c4_r1_11;
// wire  c4_r1_12;
// wire  c4_r2_1;
// wire  c4_r2_2;
// wire  c4_r2_3;
// wire  c4_r2_4;
// wire  c4_r2_5;
// wire  c4_r2_6;
// wire  c4_r2_7;
// wire  c4_r2_8;
// wire  c4_r2_9;
// wire  c4_r2_10;
// wire  c4_r2_11;
// wire  c4_r2_12;

// wire  c5_r1_1;
// wire  c5_r1_2;
// wire  c5_r1_3;
// wire  c5_r1_4;
// wire  c5_r1_5;
// wire  c5_r1_6;
// wire  c5_r1_7;
// wire  c5_r1_8;
// wire  c5_r1_9;
// wire  c5_r1_10;
// wire  c5_r1_11;
// wire  c5_r1_12;
// wire  c5_r2_1;
// wire  c5_r2_2;
// wire  c5_r2_3;
// wire  c5_r2_4;
// wire  c5_r2_5;
// wire  c5_r2_6;
// wire  c5_r2_7;
// wire  c5_r2_8;
// wire  c5_r2_9;
// wire  c5_r2_10;
// wire  c5_r2_11;
// wire  c5_r2_12;

// wire  c6_r1_1;
// wire  c6_r1_2;
// wire  c6_r1_3;
// wire  c6_r1_4;
// wire  c6_r1_5;
// wire  c6_r1_6;
// wire  c6_r1_7;
// wire  c6_r1_8;
// wire  c6_r1_9;
// wire  c6_r1_10;
// wire  c6_r1_11;
// wire  c6_r1_12;
// wire  c6_r2_1;
// wire  c6_r2_2;
// wire  c6_r2_3;
// wire  c6_r2_4;
// wire  c6_r2_5;
// wire  c6_r2_6;
// wire  c6_r2_7;
// wire  c6_r2_8;
// wire  c6_r2_9;
// wire  c6_r2_10;
// wire  c6_r2_11;
// wire  c6_r2_12;

// wire  c7_r1_1;
// wire  c7_r1_2;
// wire  c7_r1_3;
// wire  c7_r1_4;
// wire  c7_r1_5;
// wire  c7_r1_6;
// wire  c7_r1_7;
// wire  c7_r1_8;
// wire  c7_r1_9;
// wire  c7_r1_10;
// wire  c7_r1_11;
// wire  c7_r1_12;
// wire  c7_r2_1;
// wire  c7_r2_2;
// wire  c7_r2_3;
// wire  c7_r2_4;
// wire  c7_r2_5;
// wire  c7_r2_6;
// wire  c7_r2_7;
// wire  c7_r2_8;
// wire  c7_r2_9;
// wire  c7_r2_10;
// wire  c7_r2_11;
// wire  c7_r2_12;

// wire  c8_r1_1;
// wire  c8_r1_2;
// wire  c8_r1_3;
// wire  c8_r1_4;
// wire  c8_r1_5;
// wire  c8_r1_6;
// wire  c8_r1_7;
// wire  c8_r1_8;
// wire  c8_r1_9;
// wire  c8_r1_10;
// wire  c8_r1_11;
// wire  c8_r1_12;
// wire  c8_r2_1;
// wire  c8_r2_2;
// wire  c8_r2_3;
// wire  c8_r2_4;
// wire  c8_r2_5;
// wire  c8_r2_6;
// wire  c8_r2_7;
// wire  c8_r2_8;
// wire  c8_r2_9;
// wire  c8_r2_10;
// wire  c8_r2_11;
// wire  c8_r2_12;

// wire  c9_r1_1;
// wire  c9_r1_2;
// wire  c9_r1_3;
// wire  c9_r1_4;
// wire  c9_r1_5;
// wire  c9_r1_6;
// wire  c9_r1_7;
// wire  c9_r1_8;
// wire  c9_r1_9;
// wire  c9_r1_10;
// wire  c9_r1_11;
// wire  c9_r1_12;
// wire  c9_r2_1;
// wire  c9_r2_2;
// wire  c9_r2_3;
// wire  c9_r2_4;
// wire  c9_r2_5;
// wire  c9_r2_6;
// wire  c9_r2_7;
// wire  c9_r2_8;
// wire  c9_r2_9;
// wire  c9_r2_10;
// wire  c9_r2_11;
// wire  c9_r2_12;

// wire  c10_r1_1;
// wire  c10_r1_2;
// wire  c10_r1_3;
// wire  c10_r1_4;
// wire  c10_r1_5;
// wire  c10_r1_6;
// wire  c10_r1_7;
// wire  c10_r1_8;
// wire  c10_r1_9;
// wire  c10_r1_10;
// wire  c10_r1_11;
// wire  c10_r1_12;
// wire  c10_r2_1;
// wire  c10_r2_2;
// wire  c10_r2_3;
// wire  c10_r2_4;
// wire  c10_r2_5;
// wire  c10_r2_6;
// wire  c10_r2_7;
// wire  c10_r2_8;
// wire  c10_r2_9;
// wire  c10_r2_10;
// wire  c10_r2_11;
// wire  c10_r2_12;

// wire  c11_r1_1;
// wire  c11_r1_2;
// wire  c11_r1_3;
// wire  c11_r1_4;
// wire  c11_r1_5;
// wire  c11_r1_6;
// wire  c11_r1_7;
// wire  c11_r1_8;
// wire  c11_r1_9;
// wire  c11_r1_10;
// wire  c11_r1_11;
// wire  c11_r1_12;
// wire  c11_r2_1;
// wire  c11_r2_2;
// wire  c11_r2_3;
// wire  c11_r2_4;
// wire  c11_r2_5;
// wire  c11_r2_6;
// wire  c11_r2_7;
// wire  c11_r2_8;
// wire  c11_r2_9;
// wire  c11_r2_10;
// wire  c11_r2_11;
// wire  c11_r2_12;

// wire  c12_r1_1;
// wire  c12_r1_2;
// wire  c12_r1_3;
// wire  c12_r1_4;
// wire  c12_r1_5;
// wire  c12_r1_6;
// wire  c12_r1_7;
// wire  c12_r1_8;
// wire  c12_r1_9;
// wire  c12_r1_10;
// wire  c12_r1_11;
// wire  c12_r1_12;
// wire  c12_r2_1;
// wire  c12_r2_2;
// wire  c12_r2_3;
// wire  c12_r2_4;
// wire  c12_r2_5;
// wire  c12_r2_6;
// wire  c12_r2_7;
// wire  c12_r2_8;
// wire  c12_r2_9;
// wire  c12_r2_10;
// wire  c12_r2_11;
// wire  c12_r2_12;




// FD RRD1  (.D(cchip1_read1_en1),  .C(CLK_80M), .Q(c1_r1_1));
// FD RRD2  (.D(cchip1_read1_en2),  .C(CLK_80M), .Q(c1_r1_2));
// FD RRD3  (.D(cchip1_read1_en3),  .C(CLK_80M), .Q(c1_r1_3));
// FD RRD4  (.D(cchip1_read1_en4),  .C(CLK_80M), .Q(c1_r1_4));
// FD RRD5  (.D(cchip1_read1_en5),  .C(CLK_80M), .Q(c1_r1_5));
// FD RRD6  (.D(cchip1_read1_en6),  .C(CLK_80M), .Q(c1_r1_6));
// FD RRD7  (.D(cchip1_read1_en7),  .C(CLK_80M), .Q(c1_r1_7));
// FD RRD8  (.D(cchip1_read1_en8),  .C(CLK_80M), .Q(c1_r1_8));
// FD RRD9  (.D(cchip1_read1_en9),  .C(CLK_80M), .Q(c1_r1_9));
// FD RRD10 (.D(cchip1_read1_en10), .C(CLK_80M), .Q(c1_r1_10));
// FD RRD11 (.D(cchip1_read1_en11), .C(CLK_80M), .Q(c1_r1_11));
// FD RRD12 (.D(cchip1_read1_en12), .C(CLK_80M), .Q(c1_r1_12));
// FD RRD13 (.D(cchip1_read2_en1),  .C(CLK_80M), .Q(c1_r2_1));
// FD RRD14 (.D(cchip1_read2_en2),  .C(CLK_80M), .Q(c1_r2_2));
// FD RRD15 (.D(cchip1_read2_en3),  .C(CLK_80M), .Q(c1_r2_3));
// FD RRD16 (.D(cchip1_read2_en4),  .C(CLK_80M), .Q(c1_r2_4));
// FD RRD17 (.D(cchip1_read2_en5),  .C(CLK_80M), .Q(c1_r2_5));
// FD RRD18 (.D(cchip1_read2_en6),  .C(CLK_80M), .Q(c1_r2_6));
// FD RRD19 (.D(cchip1_read2_en7),  .C(CLK_80M), .Q(c1_r2_7));
// FD RRD20 (.D(cchip1_read2_en8),  .C(CLK_80M), .Q(c1_r2_8));
// FD RRD21 (.D(cchip1_read2_en9),  .C(CLK_80M), .Q(c1_r2_9));
// FD RRD22 (.D(cchip1_read2_en10), .C(CLK_80M), .Q(c1_r2_10));
// FD RRD23 (.D(cchip1_read2_en11), .C(CLK_80M), .Q(c1_r2_11));
// FD RRD24 (.D(cchip1_read2_en12), .C(CLK_80M), .Q(c1_r2_12));

// FD RRD25 (.D(cchip2_read1_en1),  .C(CLK_80M), .Q(c2_r1_1));
// FD RRD26 (.D(cchip2_read1_en2),  .C(CLK_80M), .Q(c2_r1_2));
// FD RRD27 (.D(cchip2_read1_en3),  .C(CLK_80M), .Q(c2_r1_3));
// FD RRD28 (.D(cchip2_read1_en4),  .C(CLK_80M), .Q(c2_r1_4));
// FD RRD29 (.D(cchip2_read1_en5),  .C(CLK_80M), .Q(c2_r1_5));
// FD RRD30 (.D(cchip2_read1_en6),  .C(CLK_80M), .Q(c2_r1_6));
// FD RRD31 (.D(cchip2_read1_en7),  .C(CLK_80M), .Q(c2_r1_7));
// FD RRD32 (.D(cchip2_read1_en8),  .C(CLK_80M), .Q(c2_r1_8));
// FD RRD33 (.D(cchip2_read1_en9),  .C(CLK_80M), .Q(c2_r1_9));
// FD RRD34 (.D(cchip2_read1_en10), .C(CLK_80M), .Q(c2_r1_10));
// FD RRD35 (.D(cchip2_read1_en11), .C(CLK_80M), .Q(c2_r1_11));
// FD RRD36 (.D(cchip2_read1_en12), .C(CLK_80M), .Q(c2_r1_12));
// FD RRD37 (.D(cchip2_read2_en1),  .C(CLK_80M), .Q(c2_r2_1));
// FD RRD38 (.D(cchip2_read2_en2),  .C(CLK_80M), .Q(c2_r2_2));
// FD RRD39 (.D(cchip2_read2_en3),  .C(CLK_80M), .Q(c2_r2_3));
// FD RRD40 (.D(cchip2_read2_en4),  .C(CLK_80M), .Q(c2_r2_4));
// FD RRD41 (.D(cchip2_read2_en5),  .C(CLK_80M), .Q(c2_r2_5));
// FD RRD42 (.D(cchip2_read2_en6),  .C(CLK_80M), .Q(c2_r2_6));
// FD RRD43 (.D(cchip2_read2_en7),  .C(CLK_80M), .Q(c2_r2_7));
// FD RRD44 (.D(cchip2_read2_en8),  .C(CLK_80M), .Q(c2_r2_8));
// FD RRD45 (.D(cchip2_read2_en9),  .C(CLK_80M), .Q(c2_r2_9));
// FD RRD46 (.D(cchip2_read2_en10), .C(CLK_80M), .Q(c2_r2_10));
// FD RRD47 (.D(cchip2_read2_en11), .C(CLK_80M), .Q(c2_r2_11));
// FD RRD48 (.D(cchip2_read2_en12), .C(CLK_80M), .Q(c2_r2_12));

// FD RRD49 (.D(cchip3_read1_en1),  .C(CLK_80M), .Q(c3_r1_1));
// FD RRD50 (.D(cchip3_read1_en2),  .C(CLK_80M), .Q(c3_r1_2));
// FD RRD51 (.D(cchip3_read1_en3),  .C(CLK_80M), .Q(c3_r1_3));
// FD RRD52 (.D(cchip3_read1_en4),  .C(CLK_80M), .Q(c3_r1_4));
// FD RRD53 (.D(cchip3_read1_en5),  .C(CLK_80M), .Q(c3_r1_5));
// FD RRD54 (.D(cchip3_read1_en6),  .C(CLK_80M), .Q(c3_r1_6));
// FD RRD55 (.D(cchip3_read1_en7),  .C(CLK_80M), .Q(c3_r1_7));
// FD RRD56 (.D(cchip3_read1_en8),  .C(CLK_80M), .Q(c3_r1_8));
// FD RRD57 (.D(cchip3_read1_en9),  .C(CLK_80M), .Q(c3_r1_9));
// FD RRD58 (.D(cchip3_read1_en10), .C(CLK_80M), .Q(c3_r1_10));
// FD RRD59 (.D(cchip3_read1_en11), .C(CLK_80M), .Q(c3_r1_11));
// FD RRD60 (.D(cchip3_read1_en12), .C(CLK_80M), .Q(c3_r1_12));
// FD RRD61 (.D(cchip3_read2_en1),  .C(CLK_80M), .Q(c3_r2_1));
// FD RRD62 (.D(cchip3_read2_en2),  .C(CLK_80M), .Q(c3_r2_2));
// FD RRD63 (.D(cchip3_read2_en3),  .C(CLK_80M), .Q(c3_r2_3));
// FD RRD64 (.D(cchip3_read2_en4),  .C(CLK_80M), .Q(c3_r2_4));
// FD RRD65 (.D(cchip3_read2_en5),  .C(CLK_80M), .Q(c3_r2_5));
// FD RRD66 (.D(cchip3_read2_en6),  .C(CLK_80M), .Q(c3_r2_6));
// FD RRD67 (.D(cchip3_read2_en7),  .C(CLK_80M), .Q(c3_r2_7));
// FD RRD68 (.D(cchip3_read2_en8),  .C(CLK_80M), .Q(c3_r2_8));
// FD RRD69 (.D(cchip3_read2_en9),  .C(CLK_80M), .Q(c3_r2_9));
// FD RRD70 (.D(cchip3_read2_en10), .C(CLK_80M), .Q(c3_r2_10));
// FD RRD71 (.D(cchip3_read2_en11), .C(CLK_80M), .Q(c3_r2_11));
// FD RRD72 (.D(cchip3_read2_en12), .C(CLK_80M), .Q(c3_r2_12));

// FD RRD73 (.D(cchip4_read1_en1),  .C(CLK_80M), .Q(c4_r1_1));
// FD RRD74 (.D(cchip4_read1_en2),  .C(CLK_80M), .Q(c4_r1_2));
// FD RRD75 (.D(cchip4_read1_en3),  .C(CLK_80M), .Q(c4_r1_3));
// FD RRD76 (.D(cchip4_read1_en4),  .C(CLK_80M), .Q(c4_r1_4));
// FD RRD77 (.D(cchip4_read1_en5),  .C(CLK_80M), .Q(c4_r1_5));
// FD RRD78 (.D(cchip4_read1_en6),  .C(CLK_80M), .Q(c4_r1_6));
// FD RRD79 (.D(cchip4_read1_en7),  .C(CLK_80M), .Q(c4_r1_7));
// FD RRD80 (.D(cchip4_read1_en8),  .C(CLK_80M), .Q(c4_r1_8));
// FD RRD81 (.D(cchip4_read1_en9),  .C(CLK_80M), .Q(c4_r1_9));
// FD RRD82 (.D(cchip4_read1_en10), .C(CLK_80M), .Q(c4_r1_10));
// FD RRD83 (.D(cchip4_read1_en11), .C(CLK_80M), .Q(c4_r1_11));
// FD RRD84 (.D(cchip4_read1_en12), .C(CLK_80M), .Q(c4_r1_12));
// FD RRD85 (.D(cchip4_read2_en1),  .C(CLK_80M), .Q(c4_r2_1));
// FD RRD86 (.D(cchip4_read2_en2),  .C(CLK_80M), .Q(c4_r2_2));
// FD RRD87 (.D(cchip4_read2_en3),  .C(CLK_80M), .Q(c4_r2_3));
// FD RRD88 (.D(cchip4_read2_en4),  .C(CLK_80M), .Q(c4_r2_4));
// FD RRD89 (.D(cchip4_read2_en5),  .C(CLK_80M), .Q(c4_r2_5));
// FD RRD90 (.D(cchip4_read2_en6),  .C(CLK_80M), .Q(c4_r2_6));
// FD RRD91 (.D(cchip4_read2_en7),  .C(CLK_80M), .Q(c4_r2_7));
// FD RRD92 (.D(cchip4_read2_en8),  .C(CLK_80M), .Q(c4_r2_8));
// FD RRD93 (.D(cchip4_read2_en9),  .C(CLK_80M), .Q(c4_r2_9));
// FD RRD94 (.D(cchip4_read2_en10), .C(CLK_80M), .Q(c4_r2_10));
// FD RRD95 (.D(cchip4_read2_en11), .C(CLK_80M), .Q(c4_r2_11));
// FD RRD96 (.D(cchip4_read2_en12), .C(CLK_80M), .Q(c4_r2_12));

// FD RRD97  (.D(cchip5_read1_en1),  .C(CLK_80M), .Q(c5_r1_1));
// FD RRD98  (.D(cchip5_read1_en2),  .C(CLK_80M), .Q(c5_r1_2));
// FD RRD99  (.D(cchip5_read1_en3),  .C(CLK_80M), .Q(c5_r1_3));
// FD RRD100 (.D(cchip5_read1_en4),  .C(CLK_80M), .Q(c5_r1_4));
// FD RRD101 (.D(cchip5_read1_en5),  .C(CLK_80M), .Q(c5_r1_5));
// FD RRD102 (.D(cchip5_read1_en6),  .C(CLK_80M), .Q(c5_r1_6));
// FD RRD103 (.D(cchip5_read1_en7),  .C(CLK_80M), .Q(c5_r1_7));
// FD RRD104 (.D(cchip5_read1_en8),  .C(CLK_80M), .Q(c5_r1_8));
// FD RRD105 (.D(cchip5_read1_en9),  .C(CLK_80M), .Q(c5_r1_9));
// FD RRD106 (.D(cchip5_read1_en10), .C(CLK_80M), .Q(c5_r1_10));
// FD RRD107 (.D(cchip5_read1_en11), .C(CLK_80M), .Q(c5_r1_11));
// FD RRD108 (.D(cchip5_read1_en12), .C(CLK_80M), .Q(c5_r1_12));
// FD RRD109 (.D(cchip5_read2_en1),  .C(CLK_80M), .Q(c5_r2_1));
// FD RRD110 (.D(cchip5_read2_en2),  .C(CLK_80M), .Q(c5_r2_2));
// FD RRD111 (.D(cchip5_read2_en3),  .C(CLK_80M), .Q(c5_r2_3));
// FD RRD112 (.D(cchip5_read2_en4),  .C(CLK_80M), .Q(c5_r2_4));
// FD RRD113 (.D(cchip5_read2_en5),  .C(CLK_80M), .Q(c5_r2_5));
// FD RRD114 (.D(cchip5_read2_en6),  .C(CLK_80M), .Q(c5_r2_6));
// FD RRD115 (.D(cchip5_read2_en7),  .C(CLK_80M), .Q(c5_r2_7));
// FD RRD116 (.D(cchip5_read2_en8),  .C(CLK_80M), .Q(c5_r2_8));
// FD RRD117 (.D(cchip5_read2_en9),  .C(CLK_80M), .Q(c5_r2_9));
// FD RRD118 (.D(cchip5_read2_en10), .C(CLK_80M), .Q(c5_r2_10));
// FD RRD119 (.D(cchip5_read2_en11), .C(CLK_80M), .Q(c5_r2_11));
// FD RRD120 (.D(cchip5_read2_en12), .C(CLK_80M), .Q(c5_r2_12));

// FD RRD121 (.D(cchip6_read1_en1),  .C(CLK_80M), .Q(c6_r1_1));
// FD RRD122 (.D(cchip6_read1_en2),  .C(CLK_80M), .Q(c6_r1_2));
// FD RRD123 (.D(cchip6_read1_en3),  .C(CLK_80M), .Q(c6_r1_3));
// FD RRD124 (.D(cchip6_read1_en4),  .C(CLK_80M), .Q(c6_r1_4));
// FD RRD125 (.D(cchip6_read1_en5),  .C(CLK_80M), .Q(c6_r1_5));
// FD RRD126 (.D(cchip6_read1_en6),  .C(CLK_80M), .Q(c6_r1_6));
// FD RRD127 (.D(cchip6_read1_en7),  .C(CLK_80M), .Q(c6_r1_7));
// FD RRD128 (.D(cchip6_read1_en8),  .C(CLK_80M), .Q(c6_r1_8));
// FD RRD129 (.D(cchip6_read1_en9),  .C(CLK_80M), .Q(c6_r1_9));
// FD RRD130 (.D(cchip6_read1_en10), .C(CLK_80M), .Q(c6_r1_10));
// FD RRD131 (.D(cchip6_read1_en11), .C(CLK_80M), .Q(c6_r1_11));
// FD RRD132 (.D(cchip6_read1_en12), .C(CLK_80M), .Q(c6_r1_12));
// FD RRD133 (.D(cchip6_read2_en1),  .C(CLK_80M), .Q(c6_r2_1));
// FD RRD134 (.D(cchip6_read2_en2),  .C(CLK_80M), .Q(c6_r2_2));
// FD RRD135 (.D(cchip6_read2_en3),  .C(CLK_80M), .Q(c6_r2_3));
// FD RRD136 (.D(cchip6_read2_en4),  .C(CLK_80M), .Q(c6_r2_4));
// FD RRD137 (.D(cchip6_read2_en5),  .C(CLK_80M), .Q(c6_r2_5));
// FD RRD138 (.D(cchip6_read2_en6),  .C(CLK_80M), .Q(c6_r2_6));
// FD RRD139 (.D(cchip6_read2_en7),  .C(CLK_80M), .Q(c6_r2_7));
// FD RRD140 (.D(cchip6_read2_en8),  .C(CLK_80M), .Q(c6_r2_8));
// FD RRD141 (.D(cchip6_read2_en9),  .C(CLK_80M), .Q(c6_r2_9));
// FD RRD142 (.D(cchip6_read2_en10), .C(CLK_80M), .Q(c6_r2_10));
// FD RRD143 (.D(cchip6_read2_en11), .C(CLK_80M), .Q(c6_r2_11));
// FD RRD144 (.D(cchip6_read2_en12), .C(CLK_80M), .Q(c6_r2_12));


// FD RRD145 (.D(cchip7_read1_en1),  .C(CLK_80M), .Q(c7_r1_1));
// FD RRD146 (.D(cchip7_read1_en2),  .C(CLK_80M), .Q(c7_r1_2));
// FD RRD147 (.D(cchip7_read1_en3),  .C(CLK_80M), .Q(c7_r1_3));
// FD RRD148 (.D(cchip7_read1_en4),  .C(CLK_80M), .Q(c7_r1_4));
// FD RRD149 (.D(cchip7_read1_en5),  .C(CLK_80M), .Q(c7_r1_5));
// FD RRD150 (.D(cchip7_read1_en6),  .C(CLK_80M), .Q(c7_r1_6));
// FD RRD151 (.D(cchip7_read1_en7),  .C(CLK_80M), .Q(c7_r1_7));
// FD RRD152 (.D(cchip7_read1_en8),  .C(CLK_80M), .Q(c7_r1_8));
// FD RRD153 (.D(cchip7_read1_en9),  .C(CLK_80M), .Q(c7_r1_9));
// FD RRD154 (.D(cchip7_read1_en10), .C(CLK_80M), .Q(c7_r1_10));
// FD RRD155 (.D(cchip7_read1_en11), .C(CLK_80M), .Q(c7_r1_11));
// FD RRD156 (.D(cchip7_read1_en12), .C(CLK_80M), .Q(c7_r1_12));
// FD RRD157 (.D(cchip7_read2_en1),  .C(CLK_80M), .Q(c7_r2_1));
// FD RRD158 (.D(cchip7_read2_en2),  .C(CLK_80M), .Q(c7_r2_2));
// FD RRD159 (.D(cchip7_read2_en3),  .C(CLK_80M), .Q(c7_r2_3));
// FD RRD160 (.D(cchip7_read2_en4),  .C(CLK_80M), .Q(c7_r2_4));
// FD RRD161 (.D(cchip7_read2_en5),  .C(CLK_80M), .Q(c7_r2_5));
// FD RRD162 (.D(cchip7_read2_en6),  .C(CLK_80M), .Q(c7_r2_6));
// FD RRD163 (.D(cchip7_read2_en7),  .C(CLK_80M), .Q(c7_r2_7));
// FD RRD164 (.D(cchip7_read2_en8),  .C(CLK_80M), .Q(c7_r2_8));
// FD RRD165 (.D(cchip7_read2_en9),  .C(CLK_80M), .Q(c7_r2_9));
// FD RRD166 (.D(cchip7_read2_en10), .C(CLK_80M), .Q(c7_r2_10));
// FD RRD167 (.D(cchip7_read2_en11), .C(CLK_80M), .Q(c7_r2_11));
// FD RRD168 (.D(cchip7_read2_en12), .C(CLK_80M), .Q(c7_r2_12));

// FD RRD169 (.D(cchip8_read1_en1),  .C(CLK_80M), .Q(c8_r1_1));
// FD RRD170 (.D(cchip8_read1_en2),  .C(CLK_80M), .Q(c8_r1_2));
// FD RRD171 (.D(cchip8_read1_en3),  .C(CLK_80M), .Q(c8_r1_3));
// FD RRD172 (.D(cchip8_read1_en4),  .C(CLK_80M), .Q(c8_r1_4));
// FD RRD173 (.D(cchip8_read1_en5),  .C(CLK_80M), .Q(c8_r1_5));
// FD RRD174 (.D(cchip8_read1_en6),  .C(CLK_80M), .Q(c8_r1_6));
// FD RRD175 (.D(cchip8_read1_en7),  .C(CLK_80M), .Q(c8_r1_7));
// FD RRD176 (.D(cchip8_read1_en8),  .C(CLK_80M), .Q(c8_r1_8));
// FD RRD177 (.D(cchip8_read1_en9),  .C(CLK_80M), .Q(c8_r1_9));
// FD RRD178 (.D(cchip8_read1_en10), .C(CLK_80M), .Q(c8_r1_10));
// FD RRD179 (.D(cchip8_read1_en11), .C(CLK_80M), .Q(c8_r1_11));
// FD RRD180 (.D(cchip8_read1_en12), .C(CLK_80M), .Q(c8_r1_12));
// FD RRD181 (.D(cchip8_read2_en1),  .C(CLK_80M), .Q(c8_r2_1));
// FD RRD182 (.D(cchip8_read2_en2),  .C(CLK_80M), .Q(c8_r2_2));
// FD RRD183 (.D(cchip8_read2_en3),  .C(CLK_80M), .Q(c8_r2_3));
// FD RRD184 (.D(cchip8_read2_en4),  .C(CLK_80M), .Q(c8_r2_4));
// FD RRD185 (.D(cchip8_read2_en5),  .C(CLK_80M), .Q(c8_r2_5));
// FD RRD186 (.D(cchip8_read2_en6),  .C(CLK_80M), .Q(c8_r2_6));
// FD RRD187 (.D(cchip8_read2_en7),  .C(CLK_80M), .Q(c8_r2_7));
// FD RRD188 (.D(cchip8_read2_en8),  .C(CLK_80M), .Q(c8_r2_8));
// FD RRD189 (.D(cchip8_read2_en9),  .C(CLK_80M), .Q(c8_r2_9));
// FD RRD190 (.D(cchip8_read2_en10), .C(CLK_80M), .Q(c8_r2_10));
// FD RRD191 (.D(cchip8_read2_en11), .C(CLK_80M), .Q(c8_r2_11));
// FD RRD192 (.D(cchip8_read2_en12), .C(CLK_80M), .Q(c8_r2_12));

// FD RRD193 (.D(cchip9_read1_en1),  .C(CLK_80M), .Q(c9_r1_1));
// FD RRD194 (.D(cchip9_read1_en2),  .C(CLK_80M), .Q(c9_r1_2));
// FD RRD195 (.D(cchip9_read1_en3),  .C(CLK_80M), .Q(c9_r1_3));
// FD RRD196 (.D(cchip9_read1_en4),  .C(CLK_80M), .Q(c9_r1_4));
// FD RRD197 (.D(cchip9_read1_en5),  .C(CLK_80M), .Q(c9_r1_5));
// FD RRD198 (.D(cchip9_read1_en6),  .C(CLK_80M), .Q(c9_r1_6));
// FD RRD199 (.D(cchip9_read1_en7),  .C(CLK_80M), .Q(c9_r1_7));
// FD RRD200 (.D(cchip9_read1_en8),  .C(CLK_80M), .Q(c9_r1_8));
// FD RRD201 (.D(cchip9_read1_en9),  .C(CLK_80M), .Q(c9_r1_9));
// FD RRD202 (.D(cchip9_read1_en10), .C(CLK_80M), .Q(c9_r1_10));
// FD RRD203 (.D(cchip9_read1_en11), .C(CLK_80M), .Q(c9_r1_11));
// FD RRD204 (.D(cchip9_read1_en12), .C(CLK_80M), .Q(c9_r1_12));
// FD RRD205 (.D(cchip9_read2_en1),  .C(CLK_80M), .Q(c9_r2_1));
// FD RRD206 (.D(cchip9_read2_en2),  .C(CLK_80M), .Q(c9_r2_2));
// FD RRD207 (.D(cchip9_read2_en3),  .C(CLK_80M), .Q(c9_r2_3));
// FD RRD208 (.D(cchip9_read2_en4),  .C(CLK_80M), .Q(c9_r2_4));
// FD RRD209 (.D(cchip9_read2_en5),  .C(CLK_80M), .Q(c9_r2_5));
// FD RRD210 (.D(cchip9_read2_en6),  .C(CLK_80M), .Q(c9_r2_6));
// FD RRD211 (.D(cchip9_read2_en7),  .C(CLK_80M), .Q(c9_r2_7));
// FD RRD212 (.D(cchip9_read2_en8),  .C(CLK_80M), .Q(c9_r2_8));
// FD RRD213 (.D(cchip9_read2_en9),  .C(CLK_80M), .Q(c9_r2_9));
// FD RRD214 (.D(cchip9_read2_en10), .C(CLK_80M), .Q(c9_r2_10));
// FD RRD215 (.D(cchip9_read2_en11), .C(CLK_80M), .Q(c9_r2_11));
// FD RRD216 (.D(cchip9_read2_en12), .C(CLK_80M), .Q(c9_r2_12));

// FD RRD217 (.D(cchip10_read1_en1),  .C(CLK_80M), .Q(c10_r1_1));
// FD RRD218 (.D(cchip10_read1_en2),  .C(CLK_80M), .Q(c10_r1_2));
// FD RRD219 (.D(cchip10_read1_en3),  .C(CLK_80M), .Q(c10_r1_3));
// FD RRD220 (.D(cchip10_read1_en4),  .C(CLK_80M), .Q(c10_r1_4));
// FD RRD221 (.D(cchip10_read1_en5),  .C(CLK_80M), .Q(c10_r1_5));
// FD RRD222 (.D(cchip10_read1_en6),  .C(CLK_80M), .Q(c10_r1_6));
// FD RRD223 (.D(cchip10_read1_en7),  .C(CLK_80M), .Q(c10_r1_7));
// FD RRD224 (.D(cchip10_read1_en8),  .C(CLK_80M), .Q(c10_r1_8));
// FD RRD225 (.D(cchip10_read1_en9),  .C(CLK_80M), .Q(c10_r1_9));
// FD RRD226 (.D(cchip10_read1_en10), .C(CLK_80M), .Q(c10_r1_10));
// FD RRD227 (.D(cchip10_read1_en11), .C(CLK_80M), .Q(c10_r1_11));
// FD RRD228 (.D(cchip10_read1_en12), .C(CLK_80M), .Q(c10_r1_12));
// FD RRD229 (.D(cchip10_read2_en1),  .C(CLK_80M), .Q(c10_r2_1));
// FD RRD230 (.D(cchip10_read2_en2),  .C(CLK_80M), .Q(c10_r2_2));
// FD RRD231 (.D(cchip10_read2_en3),  .C(CLK_80M), .Q(c10_r2_3));
// FD RRD232 (.D(cchip10_read2_en4),  .C(CLK_80M), .Q(c10_r2_4));
// FD RRD233 (.D(cchip10_read2_en5),  .C(CLK_80M), .Q(c10_r2_5));
// FD RRD234 (.D(cchip10_read2_en6),  .C(CLK_80M), .Q(c10_r2_6));
// FD RRD235 (.D(cchip10_read2_en7),  .C(CLK_80M), .Q(c10_r2_7));
// FD RRD236 (.D(cchip10_read2_en8),  .C(CLK_80M), .Q(c10_r2_8));
// FD RRD237 (.D(cchip10_read2_en9),  .C(CLK_80M), .Q(c10_r2_9));
// FD RRD238 (.D(cchip10_read2_en10), .C(CLK_80M), .Q(c10_r2_10));
// FD RRD239 (.D(cchip10_read2_en11), .C(CLK_80M), .Q(c10_r2_11));
// FD RRD240 (.D(cchip10_read2_en12), .C(CLK_80M), .Q(c10_r2_12));

// FD RRD241 (.D(cchip11_read1_en1),  .C(CLK_80M), .Q(c11_r1_1));
// FD RRD242 (.D(cchip11_read1_en2),  .C(CLK_80M), .Q(c11_r1_2));
// FD RRD243 (.D(cchip11_read1_en3),  .C(CLK_80M), .Q(c11_r1_3));
// FD RRD244 (.D(cchip11_read1_en4),  .C(CLK_80M), .Q(c11_r1_4));
// FD RRD245 (.D(cchip11_read1_en5),  .C(CLK_80M), .Q(c11_r1_5));
// FD RRD246 (.D(cchip11_read1_en6),  .C(CLK_80M), .Q(c11_r1_6));
// FD RRD247 (.D(cchip11_read1_en7),  .C(CLK_80M), .Q(c11_r1_7));
// FD RRD248 (.D(cchip11_read1_en8),  .C(CLK_80M), .Q(c11_r1_8));
// FD RRD249 (.D(cchip11_read1_en9),  .C(CLK_80M), .Q(c11_r1_9));
// FD RRD250 (.D(cchip11_read1_en10), .C(CLK_80M), .Q(c11_r1_10));
// FD RRD251 (.D(cchip11_read1_en11), .C(CLK_80M), .Q(c11_r1_11));
// FD RRD252 (.D(cchip11_read1_en12), .C(CLK_80M), .Q(c11_r1_12));
// FD RRD253 (.D(cchip11_read2_en1),  .C(CLK_80M), .Q(c11_r2_1));
// FD RRD254 (.D(cchip11_read2_en2),  .C(CLK_80M), .Q(c11_r2_2));
// FD RRD255 (.D(cchip11_read2_en3),  .C(CLK_80M), .Q(c11_r2_3));
// FD RRD256 (.D(cchip11_read2_en4),  .C(CLK_80M), .Q(c11_r2_4));
// FD RRD257 (.D(cchip11_read2_en5),  .C(CLK_80M), .Q(c11_r2_5));
// FD RRD258 (.D(cchip11_read2_en6),  .C(CLK_80M), .Q(c11_r2_6));
// FD RRD259 (.D(cchip11_read2_en7),  .C(CLK_80M), .Q(c11_r2_7));
// FD RRD260 (.D(cchip11_read2_en8),  .C(CLK_80M), .Q(c11_r2_8));
// FD RRD261 (.D(cchip11_read2_en9),  .C(CLK_80M), .Q(c11_r2_9));
// FD RRD262 (.D(cchip11_read2_en10), .C(CLK_80M), .Q(c11_r2_10));
// FD RRD263 (.D(cchip11_read2_en11), .C(CLK_80M), .Q(c11_r2_11));
// FD RRD264 (.D(cchip11_read2_en12), .C(CLK_80M), .Q(c11_r2_12));

// FD RRD265 (.D(cchip12_read1_en1),  .C(CLK_80M), .Q(c12_r1_1));
// FD RRD266 (.D(cchip12_read1_en2),  .C(CLK_80M), .Q(c12_r1_2));
// FD RRD267 (.D(cchip12_read1_en3),  .C(CLK_80M), .Q(c12_r1_3));
// FD RRD268 (.D(cchip12_read1_en4),  .C(CLK_80M), .Q(c12_r1_4));
// FD RRD269 (.D(cchip12_read1_en5),  .C(CLK_80M), .Q(c12_r1_5));
// FD RRD270 (.D(cchip12_read1_en6),  .C(CLK_80M), .Q(c12_r1_6));
// FD RRD271 (.D(cchip12_read1_en7),  .C(CLK_80M), .Q(c12_r1_7));
// FD RRD272 (.D(cchip12_read1_en8),  .C(CLK_80M), .Q(c12_r1_8));
// FD RRD273 (.D(cchip12_read1_en9),  .C(CLK_80M), .Q(c12_r1_9));
// FD RRD274 (.D(cchip12_read1_en10), .C(CLK_80M), .Q(c12_r1_10));
// FD RRD275 (.D(cchip12_read1_en11), .C(CLK_80M), .Q(c12_r1_11));
// FD RRD276 (.D(cchip12_read1_en12), .C(CLK_80M), .Q(c12_r1_12));
// FD RRD277 (.D(cchip12_read2_en1),  .C(CLK_80M), .Q(c12_r2_1));
// FD RRD278 (.D(cchip12_read2_en2),  .C(CLK_80M), .Q(c12_r2_2));
// FD RRD279 (.D(cchip12_read2_en3),  .C(CLK_80M), .Q(c12_r2_3));
// FD RRD280 (.D(cchip12_read2_en4),  .C(CLK_80M), .Q(c12_r2_4));
// FD RRD281 (.D(cchip12_read2_en5),  .C(CLK_80M), .Q(c12_r2_5));
// FD RRD282 (.D(cchip12_read2_en6),  .C(CLK_80M), .Q(c12_r2_6));
// FD RRD283 (.D(cchip12_read2_en7),  .C(CLK_80M), .Q(c12_r2_7));
// FD RRD284 (.D(cchip12_read2_en8),  .C(CLK_80M), .Q(c12_r2_8));
// FD RRD285 (.D(cchip12_read2_en9),  .C(CLK_80M), .Q(c12_r2_9));
// FD RRD286 (.D(cchip12_read2_en10), .C(CLK_80M), .Q(c12_r2_10));
// FD RRD287 (.D(cchip12_read2_en11), .C(CLK_80M), .Q(c12_r2_11));
// FD RRD288 (.D(cchip12_read2_en12), .C(CLK_80M), .Q(c12_r2_12));







wire       poll_start_r;

wire       poll_start_rr;

wire       poll_start_rrr;

FD RD (.D(poll_start), .C(CLK_READ), .Q(poll_start_r));

FD RRD (.D(poll_start_r), .C(CLK_READ), .Q(poll_start_rr));


FD RRRD (.D(poll_start_rr), .C(CLK_READ), .Q(poll_start_rrr));

// wire  FRAME_IN_reg;

// FD XDD1 (.D(FRAME_IN), .C(CLK_80M), .Q(FRAME_IN_reg));

// wire  FRAME_X_reg;

// FD XDD2 (.D(FRAME_X), .C(CLK_80M), .Q(FRAME_X_reg));

wire    poll_end_r;

FD POLLD (.D(poll_end), .C(CLK_READ), .Q(poll_end_r));


wire    poll_end_rr;

FD POLLDD (.D(poll_end_r), .C(CLK_READ), .Q(poll_end_rr));

reg       poll_start_rrrr;

always @(posedge CLK_READ or posedge RST) begin
            if (RST) begin
              poll_start_rrrr <= 1'b0;
            end
            else if (poll_cnt[19:0]==20'd2) begin //spiee_r
              // w_12 <= 1'b1;
              poll_start_rrrr <= 1'b1;
            end 
            else if (poll_end_rr) begin //spi_cnt[9:0]==10'd326
              poll_start_rrrr <= 1'b0;
            end
            else begin
              poll_start_rrrr <= poll_start_rrrr;
            end
end

assign FIFO_EN = (state_reg==P_EN)||(state_reg==C_EN)||poll_start_rrrr||(state_reg==F_EN)||(state_reg==G_EN);


wire    RD_ST_R;

FD RDST (.D(state_reg==G_EN), .C(CLK_READ), .Q(RD_ST_R));

assign RD_ST_OUT = RD_ST_R;

// assign fifo_tcp_wren=(~fifo_empty_stream) & tcp_open &(~tcp_tx_full);
wire   fifo_tcp_wren;

wire   empty;
wire   valid;

// wire [15:0]  data_fifo_out;

// assign fifo_tcp_wren=(~empty)&(~TX_FULL);

// wire   fifo1_full;

// fifo_generator_1 fifo_generator_1(
//     .rst(RST),
//     .wr_clk(CLK_READ),
//     .rd_clk(CLK_80M),
//     .din(RAM2FIFO[15:0]),   
//     .wr_en(FIFO_EN),
//     .rd_en(fifo_tcp_wren),
//     .dout(FIFO_DOUT),
//     .full(fifo1_full),
//     .empty(empty),
//     .valid(FIFO_VALID),           
//     .wr_rst_busy(),
//     .rd_rst_busy()
//   );

assign DATA_OUT[15:0] = RAM2FIFO[15:0];

assign DATA_EN = FIFO_EN;

assign FRAME_OUT = FRAME_O;

// fifo_generator_3 fifo_generator_3 (
//   .clk(RST),      // input wire clk
//   .srst(srst),    // input wire srst
//   .din(din),      // input wire [15 : 0] din
//   .wr_en(wr_en),  // input wire wr_en
//   .rd_en(rd_en),  // input wire rd_en
//   .dout(dout),    // output wire [15 : 0] dout
//   .full(full),    // output wire full
//   .empty(empty),  // output wire empty
//   .valid(valid)  // output wire valid
// );

//125M


//80M
// ila_bp_top ila_bp_top (
//   .clk(CLK_80M), // input wire clk
//   .probe0(FIFO_VALID), // input wire [0:0]  probe0  
//   .probe1(fifo1_full)
// );




//  ila_XXX ila_XXX (
//   .clk(CLK_READ), // input wire clk
//   .probe0(chip1_read1_en1), // input wire [0:0]  probe0  
//   .probe1(chip1_read1_en12), // input wire [0:0]  probe1 
//   .probe2(chip1_read2_en1), // input wire [0:0]  probe2 
//   .probe3(chip1_read2_en12), // input wire [0:0]  probe3 
//   .probe4(FIFO_EN), // input wire [0:0]  probe4 
//   .probe5(CHIP1_ADDR1_1[9:0]), // input wire [9:0]  probe5 
//   .probe6(CHIP1_ADDR1_12[9:0]), // input wire [9:0]  probe6 
//   .probe7(CHIP1_ADDR2_1[9:0]), // input wire [9:0]  probe7 
//   .probe8(CHIP1_ADDR2_12[9:0]), // input wire [9:0]  probe8 
//   .probe9(CHIP1_ADDR1_DAT1[15:0]), // input wire [15:0]  probe9 
//   .probe10(CHIP1_ADDR1_DAT12[15:0]), // input wire [15:0]  probe10 
//   .probe11(CHIP1_ADDR2_DAT1[15:0]), // input wire [15:0]  probe11 
//   .probe12(CHIP1_ADDR2_DAT12[15:0]), // input wire [15:0]  probe12 
//   .probe13(RAM2FIFO[15:0]) // input wire [15:0]  probe13
// ); 



// ila_WHAT ila_WHAT (
//   .clk(CLK_READ), // input wire clk


//   .probe0(RD_OUTEN), // input wire [0:0]  probe0  
//   .probe1(state_reg[2:0]), // input wire [2:0]  probe1 
//   .probe2(state_next[2:0]), // input wire [2:0]  probe2 
//   .probe3(RAM2FIFO[15:0]) // input wire [15:0]  probe3
// );
assign SYNC_ALL = 1'b1;

reg [2:0]  rd_cnt;
wire       rd_start;
wire       rd_end;

always @(posedge CLK_120M or posedge RST) begin
  if (RST) begin
    rd_cnt[2:0] <= 0; 
  end
  else if (rd_start) begin
      if(rd_end)begin
        rd_cnt[2:0] <= 0;
      end
      else begin
        rd_cnt[2:0] <= rd_cnt[2:0] + 1;
      end
  end
end
assign rd_start = SYNC_ALL;
assign rd_end   = rd_start&&(rd_cnt[2:0]==3'd5);//12288


reg [4:0]  s_cnt;

always @(posedge CLK_120M or posedge RST) begin
  if (RST) begin
    s_cnt[4:0] <= 0; 
  end
  else if (s_cnt[4:0]==5'd23) begin
    s_cnt[4:0] <= 5'd0;
  end
  else begin
    s_cnt[4:0] <= s_cnt[4:0] + 1;
  end
end

reg [2:0]      phase_r;

reg            phase_ok;

always @(posedge CLK_120M or posedge RST) begin
            if (RST) begin
              phase_ok <= 1'b0;
            end
            else if (s_cnt[4:0]==5'd11) begin //spiee_r
              phase_r <= rd_cnt;
            end 
            else if (s_cnt[4:0]==5'd23) begin //spi_cnt[9:0]==10'd326
              phase_ok <= phase_r==rd_cnt;
            end           
            else begin
              phase_ok <= phase_ok;
            end
end

// ila_bp0 ila_bp0 (
//   .clk(CLK_120M), // input wire clk
//   .probe0(SYNC1), // input wire [0:0]  probe0  
//   .probe1(SYNC2), // input wire [0:0]  probe1 
//   .probe2(SYNC3), // input wire [0:0]  probe2 
//   .probe3(SYNC4), // input wire [0:0]  probe3 
//   .probe4(SYNC5), // input wire [0:0]  probe4 
//   .probe5(SYNC6), // input wire [9:0]  probe5 
//   .probe6(SYNC7), // input wire [9:0]  probe6 
//   .probe7(SYNC8), // input wire [9:0]  probe7 
//   .probe8(SYNC9), // input wire [9:0]  probe8 
//   .probe9(SYNC10), // input wire [15:0]  probe9 
//   .probe10(SYNC11), // input wire [15:0]  probe10 
//   .probe11(SYNC12), // input wire [15:0]  probe11 
//   .probe12(rd_cnt[2:0]),
//   .probe13(s_cnt[4:0]),
//   .probe14(phase_r[2:0]),
//   .probe15(phase_ok)    
// );
// ila_p0 ila_p0 (
//  .clk(CLK_120M), // input wire clk


//  .probe0(FRAME_IN), // input wire [0:0]  probe0  
//  .probe1(SYNC1), // input wire [0:0]  probe1 
//  .probe2(SYNC2), // input wire [0:0]  probe2 
//  .probe3(SYNC3), // input wire [0:0]  probe3 
//  .probe4(SYNC4), // input wire [0:0]  probe4 
//  .probe5(SYNC5), // input wire [0:0]  probe5 
//  .probe6(SYNC6), // input wire [0:0]  probe6 
//  .probe7(SYNC7), // input wire [0:0]  probe7 
//  .probe8(SYNC8), // input wire [0:0]  probe8 
//  .probe9(SYNC9), // input wire [0:0]  probe9 
//  .probe10(SYNC10), // input wire [0:0]  probe10 
//  .probe11(SYNC11), // input wire [0:0]  probe11 
//  .probe12(SYNC12), // input wire [0:0]  probe12 
//  .probe13(chip1), // input wire [0:0]  probe13 
//  .probe14(chip2), // input wire [0:0]  probe14 
//  .probe15(chip3), // input wire [0:0]  probe15 
//  .probe16(chip4), // input wire [0:0]  probe16 
//  .probe17(chip5), // input wire [0:0]  probe17 
//  .probe18(chip6), // input wire [0:0]  probe18 
//  .probe19(chip7), // input wire [0:0]  probe19 
//  .probe20(chip8), // input wire [0:0]  probe20 
//  .probe21(chip9), // input wire [0:0]  probe21 
//  .probe22(chip10), // input wire [0:0]  probe22 
//  .probe23(chip11), // input wire [0:0]  probe23 
//  .probe24(chip12), // input wire [0:0]  probe24 
//  .probe25(P_OK), // input wire [0:0]  probe25
//  .probe26(FRAME2),
//  .probe27(FRAME3),
//  .probe28(FRAME4),
//  .probe29(FRAME5),
//  .probe30(FRAME6),
//  .probe31(FRAME7),
//  .probe32(FRAME8),
//  .probe33(FRAME9),
//  .probe34(FRAME10),
//  .probe35(FRAME11),
//  .probe36(FRAME12) 
// );


assign P_OK = phase_ok;
assign NEX_ST = next_start;

reg [31:0] f_end_cnt;

always @(posedge CLK_120M or posedge RST) begin
  if (RST) begin
    f_end_cnt[31:0] <= 32'd0; 
  end
  else if (fout_end) begin
    f_end_cnt[31:0] <= f_end_cnt[31:0] + 1;
  end
  else begin
    f_end_cnt[31:0] <= f_end_cnt[31:0];
  end
end

ila_fcnt ila_fcnt (
  .clk(CLK_120M), // input wire clk


  .probe0(fout_end), // input wire [0:0]  probe0  
  .probe1(f_end_cnt[31:0]) // input wire [31:0]  probe1
);

endmodule
