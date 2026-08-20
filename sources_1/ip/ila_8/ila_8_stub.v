// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Wed Aug 16 20:22:03 2023
// Host        : DESKTOP-ETC8FLI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/BP40_R5_B/BP40_single_RTM_120M/BP40_single_RTM/xfelv3_diff_hsul12_2020_1.srcs/sources_1/ip/ila_8/ila_8_stub.v
// Design      : ila_8
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2020.1" *)
module ila_8(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7, probe8, probe9, probe10, probe11, probe12, probe13)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[0:0],probe1[0:0],probe2[0:0],probe3[0:0],probe4[0:0],probe5[3:0],probe6[3:0],probe7[11:0],probe8[11:0],probe9[0:0],probe10[3:0],probe11[3:0],probe12[0:0],probe13[0:0]" */;
  input clk;
  input [0:0]probe0;
  input [0:0]probe1;
  input [0:0]probe2;
  input [0:0]probe3;
  input [0:0]probe4;
  input [3:0]probe5;
  input [3:0]probe6;
  input [11:0]probe7;
  input [11:0]probe8;
  input [0:0]probe9;
  input [3:0]probe10;
  input [3:0]probe11;
  input [0:0]probe12;
  input [0:0]probe13;
endmodule
