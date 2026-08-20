`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/25 14:08:27
// Design Name: 
// Module Name: ARRAY_RC
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


module ARRAY_RC(
  input            RST,        // Reset
  input            CLK,     // independent clock (20M)
  input            CLK_20M,
  input            RST_CONFIG,
  output           chip_tcp_done,
  input            t_empty,
  input            TCP_RX_WR,
  input  [7:0]     TCP_RX_DATA,
  input            ARRAY1_ENB,
  input   [11:0]   ARRAY1_ADDRB,
  output  [31:0]   ARRAY1_DATA,
  input            ARRAY2_ENB,
  input   [11:0]   ARRAY2_ADDRB,
  output  [31:0]   ARRAY2_DATA,
  input            ARRAY3_ENB,
  input   [11:0]   ARRAY3_ADDRB,
  output  [31:0]   ARRAY3_DATA,
  input            ARRAY4_ENB,
  input   [11:0]   ARRAY4_ADDRB,
  output  [31:0]   ARRAY4_DATA,
  input            ARRAY5_ENB,
  input   [11:0]   ARRAY5_ADDRB,
  output  [31:0]   ARRAY5_DATA,
  input            ARRAY6_ENB,
  input   [11:0]   ARRAY6_ADDRB,
  output  [31:0]   ARRAY6_DATA,
  input            ARRAY7_ENB,
  input   [11:0]   ARRAY7_ADDRB,
  output  [31:0]   ARRAY7_DATA,
  input            ARRAY8_ENB,
  input   [11:0]   ARRAY8_ADDRB,
  output  [31:0]   ARRAY8_DATA,
  output  [3:0]    LDAC_CNT,
  output           RC_END
    );

wire               a1_ena;//
wire               a1_wea;//
wire [13 : 0]      a1_addra;//
wire [7 : 0]       a1_dina;//
wire               reg1_ceb;

ARRAY1_RAM ARRAY1_RAM (
  .clka(CLK),    // input wire clka
  .ena(a1_ena),      // input wire ena
  .wea(a1_wea),      // input wire [0 : 0] wea
  .addra(a1_addra[13 : 0]),  // input wire [13 : 0] addra
  .dina(a1_dina[7 : 0]),    // input wire [7 : 0] dina
  .clkb(CLK_20M),    // input wire clkb
  .enb(ARRAY1_ENB),      // input wire enb
  .regceb(reg1_ceb),  // input wire regceb
  .addrb(ARRAY1_ADDRB[11:0]),  // input wire [11 : 0] addrb
  .doutb(ARRAY1_DATA[31:0])  // output wire [31 : 0] doutb
);

wire               a2_ena;
wire               a2_wea;
wire [13 : 0]      a2_addra;
wire [7 : 0]       a2_dina;
wire               reg2_ceb;

ARRAY2_RAM ARRAY2_RAM (
  .clka(CLK),    // input wire clka
  .ena(a2_ena),      // input wire ena
  .wea(a2_wea),      // input wire [0 : 0] wea
  .addra(a2_addra[13 : 0]),  // input wire [13 : 0] addra
  .dina(a2_dina[7 : 0]),    // input wire [7 : 0] dina
  .clkb(CLK_20M),    // input wire clkb
  .enb(ARRAY2_ENB),      // input wire enb
  .regceb(reg2_ceb),  // input wire regceb
  .addrb(ARRAY2_ADDRB[11:0]),  // input wire [11 : 0] addrb
  .doutb(ARRAY2_DATA[31:0])  // output wire [31 : 0] doutb
);

wire               a3_ena;
wire               a3_wea;
wire [13 : 0]      a3_addra;
wire [7 : 0]       a3_dina;
wire               reg3_ceb;

ARRAY3_RAM ARRAY3_RAM (
  .clka(CLK),    // input wire clka
  .ena(a3_ena),      // input wire ena
  .wea(a3_wea),      // input wire [0 : 0] wea
  .addra(a3_addra[13 : 0]),  // input wire [13 : 0] addra
  .dina(a3_dina[7 : 0]),    // input wire [7 : 0] dina
  .clkb(CLK_20M),    // input wire clkb
  .enb(ARRAY3_ENB),      // input wire enb
  .regceb(reg3_ceb),  // input wire regceb
  .addrb(ARRAY3_ADDRB[11:0]),  // input wire [11 : 0] addrb
  .doutb(ARRAY3_DATA[31:0])  // output wire [31 : 0] doutb
);


wire               a4_ena;
wire               a4_wea;
wire [13 : 0]      a4_addra;
wire [7 : 0]       a4_dina;
wire               reg4_ceb;

ARRAY4_RAM ARRAY4_RAM (
  .clka(CLK),    // input wire clka
  .ena(a4_ena),      // input wire ena
  .wea(a4_wea),      // input wire [0 : 0] wea
  .addra(a4_addra[13 : 0]),  // input wire [13 : 0] addra
  .dina(a4_dina[7 : 0]),    // input wire [7 : 0] dina
  .clkb(CLK_20M),    // input wire clkb
  .enb(ARRAY4_ENB),      // input wire enb
  .regceb(reg4_ceb),  // input wire regceb
  .addrb(ARRAY4_ADDRB[11:0]),  // input wire [11 : 0] addrb
  .doutb(ARRAY4_DATA[31:0])  // output wire [31 : 0] doutb
);


wire               a5_ena;
wire               a5_wea;
wire [13 : 0]      a5_addra;
wire [7 : 0]       a5_dina;
wire               reg5_ceb;

ARRAY5_RAM ARRAY5_RAM (
  .clka(CLK),    // input wire clka
  .ena(a5_ena),      // input wire ena
  .wea(a5_wea),      // input wire [0 : 0] wea
  .addra(a5_addra[13 : 0]),  // input wire [13 : 0] addra
  .dina(a5_dina[7 : 0]),    // input wire [7 : 0] dina
  .clkb(CLK_20M),    // input wire clkb
  .enb(ARRAY5_ENB),      // input wire enb
  .regceb(reg5_ceb),  // input wire regceb
  .addrb(ARRAY5_ADDRB[11:0]),  // input wire [11 : 0] addrb
  .doutb(ARRAY5_DATA[31:0])  // output wire [31 : 0] doutb
);

wire               a6_ena;
wire               a6_wea;
wire [13 : 0]      a6_addra;
wire [7 : 0]       a6_dina;
wire               reg6_ceb;

ARRAY6_RAM ARRAY6_RAM (
  .clka(CLK),    // input wire clka
  .ena(a6_ena),      // input wire ena
  .wea(a6_wea),      // input wire [0 : 0] wea
  .addra(a6_addra[13 : 0]),  // input wire [13 : 0] addra
  .dina(a6_dina[7 : 0]),    // input wire [7 : 0] dina
  .clkb(CLK_20M),    // input wire clkb
  .enb(ARRAY6_ENB),      // input wire enb
  .regceb(reg6_ceb),  // input wire regceb
  .addrb(ARRAY6_ADDRB[11:0]),  // input wire [11 : 0] addrb
  .doutb(ARRAY6_DATA[31:0])  // output wire [31 : 0] doutb
);

wire               a7_ena;
wire               a7_wea;
wire [13 : 0]      a7_addra;
wire [7 : 0]       a7_dina;
wire               reg7_ceb;

ARRAY7_RAM ARRAY7_RAM (
  .clka(CLK),    // input wire clka
  .ena(a7_ena),      // input wire ena
  .wea(a7_wea),      // input wire [0 : 0] wea
  .addra(a7_addra[13 : 0]),  // input wire [13 : 0] addra
  .dina(a7_dina[7 : 0]),    // input wire [7 : 0] dina
  .clkb(CLK_20M),    // input wire clkb
  .enb(ARRAY7_ENB),      // input wire enb
  .regceb(reg7_ceb),  // input wire regceb
  .addrb(ARRAY7_ADDRB[11:0]),  // input wire [11 : 0] addrb
  .doutb(ARRAY7_DATA[31:0])  // output wire [31 : 0] doutb
);

wire               a8_ena;
wire               a8_wea;
wire [13 : 0]      a8_addra;
wire [7 : 0]       a8_dina;
wire               reg8_ceb;

ARRAY8_RAM ARRAY8_RAM (
  .clka(CLK),    // input wire clka
  .ena(a8_ena),      // input wire ena
  .wea(a8_wea),      // input wire [0 : 0] wea
  .addra(a8_addra[13 : 0]),  // input wire [13 : 0] addra
  .dina(a8_dina[7 : 0]),    // input wire [7 : 0] dina
  .clkb(CLK_20M),    // input wire clkb
  .enb(ARRAY8_ENB),      // input wire enb
  .regceb(reg8_ceb),  // input wire regceb
  .addrb(ARRAY8_ADDRB[11:0]),  // input wire [11 : 0] addrb
  .doutb(ARRAY8_DATA[31:0])  // output wire [31 : 0] doutb
);



// ip timer
// the pointer of ip should be added to 4 at first time

reg  [19:0]   ip_cnt;
wire          ip_start;
wire          ip_end;    



always @(posedge CLK or posedge RST_C) begin //RST_C
  if (RST_C) begin
    ip_cnt[19:0] <= 0; 
  end
  else if (ip_start) begin
      if(ip_end)begin
        ip_cnt[19:0] <= 0;
      end
      else begin
        ip_cnt[19:0] <= ip_cnt[19:0] + 1;
      end
  end
end
assign ip_start = TCP_RX_WR;
// assign ip_end   = ip_start&&(ip_cnt[19:0]==20'd43007);
// assign ip_end   = ip_start&&(ip_cnt[19:0]==20'd589823);//589824 12288
// assign ip_end   = ip_start&&(ip_cnt[19:0]==20'd49151);//589824 12288
assign ip_end   = ip_start&&(ip_cnt[19:0]==20'd98303);//98304 12288
//ip_flag

reg           ip1_flag;
reg           ip2_flag;
reg           ip3_flag;
reg           ip4_flag;
reg           ip5_flag;
reg           ip6_flag;
reg           ip7_flag;
reg           ip8_flag;

//12286 24574 36862 49150 61438 73726 86014 98302 110590  122878  135166  147454  159742  172030  184318  196606  208894  221182  233470  245758  258046  270334  282622  294910  307198  319486  331774  344062  356350  368638  380926  393214  405502  417790  430078  442366  454654  466942  479230  491518  503806  516094  528382  540670  552958  565246  577534  589822
always @(posedge CLK or posedge RST_C) begin//RST_C
            if (RST_C) begin
              ip1_flag<= 1'b0;
              ip2_flag<= 1'b0; 
              ip3_flag<= 1'b0; 
              ip4_flag<= 1'b0;  
              ip5_flag<= 1'b0;
              ip6_flag<= 1'b0;
              ip7_flag<= 1'b0;
              ip8_flag<= 1'b0;

            end
            else if (ip_start&&(ip_cnt[19:0]==20'd12286)) begin //d10751
              ip1_flag<= 1'b1; 
              ip2_flag<= 1'b0; 
              ip3_flag<= 1'b0; 
              ip4_flag<= 1'b0;
              ip5_flag<= 1'b0;
              ip6_flag<= 1'b0;
              ip7_flag<= 1'b0;
              ip8_flag<= 1'b0;
             
            end
            else if (ip_start&&(ip_cnt[19:0]==20'd24574)) begin //d21503
              ip1_flag<= 1'b0; 
              ip2_flag<= 1'b1; 
              ip3_flag<= 1'b0; 
              ip4_flag<= 1'b0;  
              ip5_flag<= 1'b0;
              ip6_flag<= 1'b0;
              ip7_flag<= 1'b0;
              ip8_flag<= 1'b0;

            end
            else if (ip_start&&(ip_cnt[19:0]==20'd36862)) begin //d32255
              ip1_flag<= 1'b0; 
              ip2_flag<= 1'b0; 
              ip3_flag<= 1'b1; 
              ip4_flag<= 1'b0;   
              ip5_flag<= 1'b0;
              ip6_flag<= 1'b0;
              ip7_flag<= 1'b0;
              ip8_flag<= 1'b0;

            end
            else if (ip_start&&(ip_cnt[19:0]==20'd49150)) begin //d43007
              ip1_flag<= 1'b0; 
              ip2_flag<= 1'b0; 
              ip3_flag<= 1'b0; 
              ip4_flag<= 1'b1;   
              ip5_flag<= 1'b0;
              ip6_flag<= 1'b0;
              ip7_flag<= 1'b0;
              ip8_flag<= 1'b0;

            end 
            else if (ip_start&&(ip_cnt[19:0]==20'd61438)) begin //d53760
              ip1_flag<= 1'b0; 
              ip2_flag<= 1'b0; 
              ip3_flag<= 1'b0; 
              ip4_flag<= 1'b0;   
              ip5_flag<= 1'b1;
              ip6_flag<= 1'b0;
              ip7_flag<= 1'b0;
              ip8_flag<= 1'b0;

            end 
            else if (ip_start&&(ip_cnt[19:0]==20'd73726)) begin //d64512
              ip1_flag<= 1'b0; 
              ip2_flag<= 1'b0; 
              ip3_flag<= 1'b0; 
              ip4_flag<= 1'b0;   
              ip5_flag<= 1'b0;
              ip6_flag<= 1'b1;
              ip7_flag<= 1'b0;
              ip8_flag<= 1'b0;

            end 
            else if (ip_start&&(ip_cnt[19:0]==20'd86014)) begin //d75264
              ip1_flag<= 1'b0; 
              ip2_flag<= 1'b0; 
              ip3_flag<= 1'b0; 
              ip4_flag<= 1'b0;   
              ip5_flag<= 1'b0;
              ip6_flag<= 1'b0;
              ip7_flag<= 1'b1;
              ip8_flag<= 1'b0;

            end 
            else if (ip_start&&(ip_cnt[19:0]==20'd98302)) begin //d86016
              ip1_flag<= 1'b0; 
              ip2_flag<= 1'b0; 
              ip3_flag<= 1'b0; 
              ip4_flag<= 1'b0;   
              ip5_flag<= 1'b0;
              ip6_flag<= 1'b0;
              ip7_flag<= 1'b0;
              ip8_flag<= 1'b1;

            end 
     
            else begin
              ip1_flag<= 1'b0;
              ip2_flag<= 1'b0; 
              ip3_flag<= 1'b0; 
              ip4_flag<= 1'b0; 
              ip5_flag<= 1'b0;
              ip6_flag<= 1'b0;
              ip7_flag<= 1'b0;
              ip8_flag<= 1'b0;

            end
end

//a1_ena
reg           a1_ena_reg_reg;

wire          a1_ena_reg;

assign RST_C = RST||RST_CONFIG;

always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a1_ena_reg_reg<= 1'b0;
            end
            else if (TCP_RX_WR) begin
              a1_ena_reg_reg<= 1'b1;             
            end
            else if (ip1_flag) begin
              a1_ena_reg_reg<= 1'b0;  
            end
            else begin
              a1_ena_reg_reg<= a1_ena_reg_reg;
            end
end
assign a1_ena_reg = TCP_RX_WR && !(a2_ena_reg||a3_ena_reg||a4_ena_reg||a5_ena_reg||a6_ena_reg||a7_ena_reg||a8_ena_reg);
// assign a1_ena_reg = TCP_RX_WR && !(a2_ena_reg||a3_ena_reg||a4_ena_reg||a5_ena_reg||a6_ena_reg||a7_ena_reg||a8_ena_reg||a9_ena_reg||a10_ena_reg||a11_ena_reg||a12_ena_reg||a13_ena_reg||a14_ena_reg||a15_ena_reg||a16_ena_reg||a17_ena_reg||a18_ena_reg||a19_ena_reg||a20_ena_reg||a21_ena_reg||a22_ena_reg||a23_ena_reg||a24_ena_reg||a25_ena_reg||a26_ena_reg||a26_ena_reg||a27_ena_reg||a28_ena_reg||a29_ena_reg||a30_ena_reg||a31_ena_reg||a32_ena_reg||a33_ena_reg||a34_ena_reg||a35_ena_reg||a36_ena_reg||a37_ena_reg||a38_ena_reg||a39_ena_reg||a40_ena_reg||a41_ena_reg||a42_ena_reg||a43_ena_reg||a44_ena_reg||a45_ena_reg||a46_ena_reg||a47_ena_reg||a48_ena_reg);
// assign a1_ena = a1_ena_reg&&TCP_RX_WR;
// assign a1_ena = TCP_RX_WR && !(a2_ena_reg||a3_ena_reg||a4_ena_reg);
assign a1_ena = a1_ena_reg;
// assign a1_ena = a1_ena_reg&&TCP_RX_WR;
//a2_ena
reg           a2_ena_reg;

always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a2_ena_reg<= 1'b0;
            end
            else if (ip1_flag) begin
              a2_ena_reg<= 1'b1;             
            end
            else if (ip2_flag) begin
              a2_ena_reg<= 1'b0;  
            end
            else begin
              a2_ena_reg<= a2_ena_reg;
            end
end
assign a2_ena = a2_ena_reg&&TCP_RX_WR;

//a3_ena
reg           a3_ena_reg;

always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a3_ena_reg<= 1'b0;
            end
            else if (ip2_flag) begin
              a3_ena_reg<= 1'b1;             
            end
            else if (ip3_flag) begin
              a3_ena_reg<= 1'b0;  
            end
            else begin
              a3_ena_reg<= a3_ena_reg;
            end
end
assign a3_ena = a3_ena_reg&&TCP_RX_WR;

//a4_ena
reg           a4_ena_reg;

always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a4_ena_reg<= 1'b0;
            end
            else if (ip3_flag) begin
              a4_ena_reg<= 1'b1;             
            end
            else if (ip4_flag) begin
              a4_ena_reg<= 1'b0;  
            end
            else begin
              a4_ena_reg<= a4_ena_reg;
            end
end
assign a4_ena = a4_ena_reg&&TCP_RX_WR;


//a5_ena
reg           a5_ena_reg;

always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a5_ena_reg<= 1'b0;
            end
            else if (ip4_flag) begin
              a5_ena_reg<= 1'b1;             
            end
            else if (ip5_flag) begin
              a5_ena_reg<= 1'b0;  
            end
            else begin
              a5_ena_reg<= a5_ena_reg;
            end
end
assign a5_ena = a5_ena_reg&&TCP_RX_WR;

//a6_ena
reg           a6_ena_reg;

always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a6_ena_reg<= 1'b0;
            end
            else if (ip5_flag) begin
              a6_ena_reg<= 1'b1;             
            end
            else if (ip6_flag) begin
              a6_ena_reg<= 1'b0;  
            end
            else begin
              a6_ena_reg<= a6_ena_reg;
            end
end
assign a6_ena = a6_ena_reg&&TCP_RX_WR;

//a7_ena
reg           a7_ena_reg;

always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a7_ena_reg<= 1'b0;
            end
            else if (ip6_flag) begin
              a7_ena_reg<= 1'b1;             
            end
            else if (ip7_flag) begin
              a7_ena_reg<= 1'b0;  
            end
            else begin
              a7_ena_reg<= a7_ena_reg;
            end
end
assign a7_ena = a7_ena_reg&&TCP_RX_WR;

//a8_ena
reg           a8_ena_reg;

always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a8_ena_reg<= 1'b0;
            end
            else if (ip7_flag) begin
              a8_ena_reg<= 1'b1;             
            end
            else if (ip8_flag) begin
              a8_ena_reg<= 1'b0;  
            end
            else begin
              a8_ena_reg<= a8_ena_reg;
            end
end
assign a8_ena = a8_ena_reg&&TCP_RX_WR;



//a1_dina[7:0]
assign a1_dina[7:0] = a1_ena_reg ? TCP_RX_DATA[7:0] : 8'd0;

//a2_dina[7:0]
assign a2_dina[7:0] = a2_ena_reg ? TCP_RX_DATA[7:0] : 8'd0;

//a3_dina[7:0]
assign a3_dina[7:0] = a3_ena_reg ? TCP_RX_DATA[7:0] : 8'd0;

//a4_dina[7:0]
assign a4_dina[7:0] = a4_ena_reg ? TCP_RX_DATA[7:0] : 8'd0;
// a5_dina[7:0]
assign a5_dina[7:0] = a5_ena_reg ? TCP_RX_DATA[7:0] : 8'd0;
//a6_dina[7:0]
assign a6_dina[7:0] = a6_ena_reg ? TCP_RX_DATA[7:0] : 8'd0;
//a7_dina[7:0]
assign a7_dina[7:0] = a7_ena_reg ? TCP_RX_DATA[7:0] : 8'd0;
//a8_dina[7:0]
assign a8_dina[7:0] = a8_ena_reg ? TCP_RX_DATA[7:0] : 8'd0;
//a9_dina[7:0]


reg [13:0]    a1_addra_reg;

always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a1_addra_reg[13:0]<= 14'b0;
            end
            else if (a1_ena) begin
              a1_addra_reg[13:0]<= a1_addra_reg[13:0] + 14'b1;             
            end
            else begin
              a1_addra_reg[13:0]<= a1_addra_reg[13:0];
            end
end
assign a1_addra = a1_addra_reg;

//a2_addra[13:0]

reg [13:0]    a2_addra_reg;

always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a2_addra_reg[13:0]<= 14'b0;
            end
            else if (a2_ena) begin
              a2_addra_reg[13:0]<= a2_addra_reg[13:0] + 14'b1;             
            end
            else begin
              a2_addra_reg[13:0]<= a2_addra_reg[13:0];
            end
end
assign a2_addra = a2_addra_reg;

//a3_addra[13:0]

reg [13:0]    a3_addra_reg;

always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a3_addra_reg[13:0]<= 14'b0;
            end
            else if (a3_ena) begin
              a3_addra_reg[13:0]<= a3_addra_reg[13:0] + 14'b1;             
            end
            else begin
              a3_addra_reg[13:0]<= a3_addra_reg[13:0];
            end
end
assign a3_addra = a3_addra_reg;

//a4_addra[13:0]

reg [13:0]    a4_addra_reg;

always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a4_addra_reg[13:0]<= 14'b0;
            end
            else if (a4_ena) begin
              a4_addra_reg[13:0]<= a4_addra_reg[13:0] + 14'b1;             
            end
            else begin
              a4_addra_reg[13:0]<= a4_addra_reg[13:0];
            end
end
assign a4_addra = a4_addra_reg;
// a5_addra[13:0]
reg [13:0]    a5_addra_reg;
always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a5_addra_reg[13:0]<= 14'b0;
            end
            else if (a5_ena) begin
              a5_addra_reg[13:0]<= a5_addra_reg[13:0] + 14'b1;             
            end
            else begin
              a5_addra_reg[13:0]<= a5_addra_reg[13:0];
            end
end
assign a5_addra = a5_addra_reg;
//a6_addra[13:0]
reg [13:0]    a6_addra_reg;
always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a6_addra_reg[13:0]<= 14'b0;
            end
            else if (a6_ena) begin
              a6_addra_reg[13:0]<= a6_addra_reg[13:0] + 14'b1;             
            end
            else begin
              a6_addra_reg[13:0]<= a6_addra_reg[13:0];
            end
end
assign a6_addra = a6_addra_reg;
//a7_addra[13:0]
reg [13:0]    a7_addra_reg;
always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a7_addra_reg[13:0]<= 14'b0;
            end
            else if (a7_ena) begin
              a7_addra_reg[13:0]<= a7_addra_reg[13:0] + 14'b1;             
            end
            else begin
              a7_addra_reg[13:0]<= a7_addra_reg[13:0];
            end
end
assign a7_addra = a7_addra_reg;
//a8_addra[13:0]
reg [13:0]    a8_addra_reg;
always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a8_addra_reg[13:0]<= 14'b0;
            end
            else if (a8_ena) begin
              a8_addra_reg[13:0]<= a8_addra_reg[13:0] + 14'b1;             
            end
            else begin
              a8_addra_reg[13:0]<= a8_addra_reg[13:0];
            end
end
assign a8_addra = a8_addra_reg;
//a9_addra[13:0]


//ax_wea
reg           a1_wea_reg;
reg           a2_wea_reg;
reg           a3_wea_reg;
reg           a4_wea_reg;
reg           a5_wea_reg;
reg           a6_wea_reg;
reg           a7_wea_reg;
reg           a8_wea_reg;

always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a1_wea_reg<= 1'b1;
            end
            else if (ip_end) begin
              a1_wea_reg<= 1'b0;             
            end
            else begin
              a1_wea_reg<= a1_wea_reg;
            end
end
assign a1_wea = a1_wea_reg;
assign reg1_ceb = ~a1_wea;

always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a2_wea_reg<= 1'b1;
            end
            else if (ip_end) begin
              a2_wea_reg<= 1'b0;             
            end
            else begin
              a2_wea_reg<= a2_wea_reg;
            end
end
assign a2_wea = a2_wea_reg;
assign reg2_ceb = ~a2_wea;

always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a3_wea_reg<= 1'b1;
            end
            else if (ip_end) begin
              a3_wea_reg<= 1'b0;             
            end
            else begin
              a3_wea_reg<= a3_wea_reg;
            end
end
assign a3_wea = a3_wea_reg;
assign reg3_ceb = ~a3_wea;

always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a4_wea_reg<= 1'b1;
            end
            else if (ip_end) begin
              a4_wea_reg<= 1'b0;             
            end
            else begin
              a4_wea_reg<= a4_wea_reg;
            end
end
assign a4_wea = a4_wea_reg;
assign reg4_ceb = ~a4_wea;

always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a5_wea_reg<= 1'b1;
            end
            else if (ip_end) begin
              a5_wea_reg<= 1'b0;             
            end
            else begin
              a5_wea_reg<= a5_wea_reg;
            end
end
assign a5_wea = a5_wea_reg;
assign reg5_ceb = ~a5_wea;
always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a6_wea_reg<= 1'b1;
            end
            else if (ip_end) begin
              a6_wea_reg<= 1'b0;             
            end
            else begin
              a6_wea_reg<= a6_wea_reg;
            end
end
assign a6_wea = a6_wea_reg;
assign reg6_ceb = ~a6_wea;
always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a7_wea_reg<= 1'b1;
            end
            else if (ip_end) begin
              a7_wea_reg<= 1'b0;             
            end
            else begin
              a7_wea_reg<= a7_wea_reg;
            end
end
assign a7_wea = a7_wea_reg;
assign reg7_ceb = ~a7_wea;
always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              a8_wea_reg<= 1'b1;
            end
            else if (ip_end) begin
              a8_wea_reg<= 1'b0;             
            end
            else begin
              a8_wea_reg<= a8_wea_reg;
            end
end
assign a8_wea = a8_wea_reg;
assign reg8_ceb = ~a8_wea;




reg [3:0] ip_end_cnt;

always @(posedge CLK or posedge RST) begin
            if (RST) begin
              ip_end_cnt<= 0;
            end
            else if (ip_end&&(ip_end_cnt==0)) begin
              ip_end_cnt<= 4'd1;             
            end   
            else if (ip_end&&(ip_end_cnt==1)) begin
              ip_end_cnt<= 4'd2;             
            end 
            else if (ip_end&&(ip_end_cnt==2)) begin
              ip_end_cnt<= 4'd3;             
            end 
            else if (ip_end&&(ip_end_cnt==3)) begin
              ip_end_cnt<= 4'd4;             
            end    
            else if (ip_end&&(ip_end_cnt==4)) begin
              ip_end_cnt<= 4'd5;             
            end   
            else if (ip_end&&(ip_end_cnt==5)) begin
              ip_end_cnt<= 4'd6;             
            end 
            else if (ip_end&&(ip_end_cnt==6)) begin
              ip_end_cnt<= 4'd7;             
            end 
            else if (ip_end&&(ip_end_cnt==7)) begin
              ip_end_cnt<= 4'd8;             
            end  
            else if (ip_end&&(ip_end_cnt==8)) begin
              ip_end_cnt<= 4'd9;             
            end   
            else if (ip_end&&(ip_end_cnt==9)) begin
              ip_end_cnt<= 4'd10;             
            end 
            else if (ip_end&&(ip_end_cnt==10)) begin
              ip_end_cnt<= 4'd11;             
            end 
            else if (ip_end&&(ip_end_cnt==11)) begin
              ip_end_cnt<= 4'd0;             
            end                                                                                        
            else begin
              ip_end_cnt<= ip_end_cnt;
            end
end


assign LDAC_CNT = ip_end_cnt[3:0];

ila_ip ila_ip (
  .clk(CLK), // input wire clk


  .probe0(ip_end_cnt), // input wire [3:0] probe0
  .probe1(ip_end) // input wire [0:0]  probe1  
);


reg  tcp_done_reg;

always @(posedge CLK or posedge RST_C) begin
            if (RST_C) begin
              tcp_done_reg<= 1'b0;
            end
            else if (ip_end&&t_empty) begin
              tcp_done_reg<= 1'b1;             
            end                                                                                          
            else begin
              tcp_done_reg<= tcp_done_reg;
            end
end

assign chip_tcp_done = tcp_done_reg;

reg         end_reg;
reg [6:0]   end_cnt;

wire        ip1_end;

FD UNCOM1 (.D(ip_end), .C(CLK), .Q(ip1_end));

always @(posedge CLK or posedge RST) begin
            if (RST) begin
              end_reg<= 1'b0;
              end_cnt[6:0]<= 7'd0;
            end
            else if (ip1_end) begin
              end_reg<= 1'b1; 
              end_cnt[6:0]<= end_cnt[6:0]+1'd1;            
            end
            else if (end_cnt[6:0]==7'd125) begin
              end_reg<= 1'b0;  
              end_cnt[6:0]<= 7'd0;           
            end
            else begin
              end_reg<= end_reg;
              end_cnt[6:0]<= end_cnt[6:0]+1'd1;   
            end
end


reg     e_gg;
always @(posedge CLK or posedge RST) begin
            if (RST) begin
              e_gg<= 1'b0;
            end
            else if (end_reg) begin
              e_gg<= 1'b1; 
            end         
            else begin
              e_gg<= e_gg;
            end
end

assign RC_END = e_gg;





endmodule
