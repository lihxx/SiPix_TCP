`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/07 19:43:53
// Design Name: 
// Module Name: system
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



module readout_system#(
  parameter         USE_CHIPSCOPE = 1,
  parameter [31:0]  SYN_DATE      = 32'h2205_3008, // the date of compiling
  parameter [7:0]   FPGA_VER      = 8'h01,         // the code version
  parameter [31:0]  BASE_IP_ADDR  = 32'hC0A8_0A10, // 192.168.10.16
  parameter [4 :0]  PHY_ADDRESS   = 5'b0
)(
  input           RST_B,
  input           CLK_IN_200_P,
  input           CLK_IN_200_N,
  input   [7 : 0] DIPSW,
  output          RLED_B,
  output          GLED_B,
  output          BLED_B,
  output  [3 : 0] TESTPIN,        // Test Pin
  inout           FPGA_SCL,
  inout           FPGA_SDA,
  input           GATE_IN,

  input           EXTERNAL_TRIG0,
  input           EXTERNAL_TRIG1,
  input           EXTERNAL_TRIG2,
  input           EXTERNAL_TRIG3,


  input   [7 : 0] CS_COUNT,


  output          TCP_OPEN,
  output          HV_ON,
// GbE PHY - RGMII
  input           PHY_CLK,
  output          PHY_TX_CLK,
  output          PHY_TX_CTRL,
  output  [3 : 0] PHY_TX_D,
  input           PHY_RX_CLK,
  input           PHY_RX_CTRL,
  input   [3 : 0] PHY_RX_D,
  inout   [1 : 0] PHY_GPIO,
  output          PHY_PWDN_B,
  output          PHY_RST_B,
  inout           PHY_MDC,
  inout           PHY_MDIO,

  // output           RTM2AMC_P16,
  // output           RTM2AMC_N16,
  // input            AMC2RTM_P16,
  // input            AMC2RTM_N16,

  input           chip_tcp_done,

  output          CSD_DONE,



  output          RST_CONFIG,//0519

  output  [31:0]   ARRAY_REG,


  //  chip_pins
    input data_p0,
    input data_p1,
    input data_p2,
    input data_p3,
    input data_p4,
    input data_p5,
    input data_p6,
    input data_p7,
    input data_p8,
    input data_p9,
    input data_p10,
    input data_p11,
    input data_n0,
    input data_n1,
    input data_n2,
    input data_n3,
    input data_n4,
    input data_n5,
    input data_n6,
    input data_n7,
    input data_n8,
    input data_n9,
    input data_n10,
    input data_n11,

    input data1_p0,
    input data1_p1,
    input data1_p2,
    input data1_p3,
    input data1_p4,
    input data1_p5,
    input data1_p6,
    input data1_p7,
    input data1_p8,
    input data1_p9,
    input data1_p10,
    input data1_p11,
    input data1_n0,
    input data1_n1,
    input data1_n2,
    input data1_n3,
    input data1_n4,
    input data1_n5,
    input data1_n6,
    input data1_n7,
    input data1_n8,
    input data1_n9,
    input data1_n10,
    input data1_n11,


    
    input sync_p0,
    input sync_p1,
    input sync_p2,
    input sync_p3,
    input sync_p4,
    input sync_p5,
    input sync_p6,
    input sync_p7,
    input sync_p8,
    input sync_p9,
    input sync_p10,
    input sync_p11,
    input sync_n0,
    input sync_n1,
    input sync_n2,
    input sync_n3,
    input sync_n4,
    input sync_n5,
    input sync_n6,
    input sync_n7,
    input sync_n8,
    input sync_n9,
    input sync_n10,
    input sync_n11,

    input sync1_p0,
    input sync1_p1,
    input sync1_p2,
    input sync1_p3,
    input sync1_p4,
    input sync1_p5,
    input sync1_p6,
    input sync1_p7,
    input sync1_p8,
    input sync1_p9,
    input sync1_p10,
    input sync1_p11,
    input sync1_n0,
    input sync1_n1,
    input sync1_n2,
    input sync1_n3,
    input sync1_n4,
    input sync1_n5,
    input sync1_n6,
    input sync1_n7,
    input sync1_n8,
    input sync1_n9,
    input sync1_n10,
    input sync1_n11,

 
    output gate_p0,
    output gate_p1,
    output gate_n0,
    output gate_n1,

    output gate1_p0,
    output gate1_p1,
    output gate1_n0,
    output gate1_n1,    
         
    output clk_p0,
    output clk_p1,
    output clk_n0,
    output clk_n1,

    output clk1_p0,
    output clk1_p1,
    output clk1_n0,
    output clk1_n1,
                  
    output frame_p0,
    output frame_p1,
    output frame_n0,
    output frame_n1,

    output frame1_p0,
    output frame1_p1,
    output frame1_n0,
    output frame1_n1,    
    
    output cs0,
    output cs1,
    output cs2,
    output cs3,
    output cs4,
    output cs5,
    output cs6,
    output cs7,
    output cs8,
    output cs9,
    output cs10,
    output cs11,
 
    
    output array_in0,
    output array_in1,
    output array_in2,
    output clk_spi, //
    output array_in3,

    output array_in4,
    output array_in5,
    output array_in6,
    output clk3_spi, //
    output array_in7,


    output refresh,
    output load_gdac,//

    output load_gdac3,

    output rstb, //
    output CLK_3,
    input [15:0] TCP_RX_WC,
    output TCP_RX_WR,      
    output [7:0] TCP_RX_DATA,
    output CLK_125,
    output CLK_7,
    output CONFIG_ST,
    output CONFIG2_ST,
    output CONFIG3_ST,
    output CONFIG4_ST,
    output CONFIG5_ST,
    output CONFIG6_ST,
    output CONFIG7_ST,
    output CONFIG8_ST,
    output CONFIG9_ST,
    output CONFIG10_ST,
    output CONFIG11_ST,
    output CONFIG12_ST,
    output RST_ST,
    output RST_DDR,


    input    S2CL,
    output   S2CL_OEN,
    output   S2CL_O,
    input    S2DA,
    output   S2DA_OEN,
    output   S2DA_O,
    input    S3CL,
    output   S3CL_OEN,
    output   S3CL_O,
    input    S3DA,
    output   S3DA_OEN,
    output   S3DA_O,

    input    S4CL,
    output   S4CL_OEN,
    output   S4CL_O,
    input    S4DA,
    output   S4DA_OEN,
    output   S4DA_O,
// DDR3 interface
  // Inouts
  inout  [63:0]          ddr3_dq,
  inout  [7:0]           ddr3_dqs_n,
  inout  [7:0]           ddr3_dqs_p,
  // Outputs
  output [15:0]    ddr3_addr,
  output [2:0]     ddr3_ba,
  output           ddr3_ras_n,
  output           ddr3_cas_n,
  output           ddr3_we_n,
  output           ddr3_reset_n,
  output [1:0]     ddr3_ck_p,
  output [1:0]     ddr3_ck_n,
  output [1:0]     ddr3_cke,
  
  output [1:0]     ddr3_cs_n,
  
  output [7:0]     ddr3_dm,
  
  output [1:0]     ddr3_odt
);


wire                                ddr3_fifo_wr_en;
wire  [63:0]                        ddr3_fifo_wr_data;
wire                                ddr3_fifo_rd_en;
wire                                ddr3_fifo_rd_valid;
wire                                ddr3_fifo_empty;
wire                                ddr3_fifo_full;
wire  [63:0]                        ddr3_fifo_rd_data;



assign TCP_OPEN = tcp_open;

wire clk200_in, clk200;
IBUFDS IBUFDS_clk200 (
  .O            (clk200_in),
  .I            (CLK_IN_200_P),
  .IB           (CLK_IN_200_N)
);
BUFG BUFG_200 (
  .O            (clk200),
  .I            (clk200_in)
);

wire clk30, clk360, clk125,locked;
wire clk30_270;
wire clk_80;
wire clk_60;
wire clk_read;

// clk_wiz_0 clk_wiz_0(
//   // Clock in ports
//   .clk_in1    (clk200),
//   // Clock out ports
//   .clk_out1   (clk360), //ser clk 360MHz, sys clk 30MHz clk_60
//   .clk_out2(clk125),// clk360
//   .clk_out3(clk_60),// clk125
//   .clk_out4(clk30_270),
//   .clk_out5(clk_80),
//   .clk_out6(clk30),
//   .clk_out7(clk_read),
//   // Status and control signals
//   .resetn     (RST_B),
//   .locked     (locked)
// );
clk_wiz_0 clk_wiz_0(
  // Clock in ports
  .clk_in1    (clk200),
  // Clock out ports
  .clk_out1   (clk125), //ser clk 360MHz, sys clk 30MHz clk_60
  .clk_out2(clk_60),// clk360
  .clk_out3(clk360),// clk125
  .clk_out4(clk_read),
  .clk_out5(clk30_270),
  .clk_out6(clk_80),
  .clk_out7(clk30),
  // Status and control signals
  .resetn     (RST_B),
  .locked     (locked)
);
assign CLK_125 = clk125;
assign CLK_3 = clk30;//clk3
assign CLK_7 = clk15;

reg clk15;
reg clk7;
reg clk3;
reg clk1M;

always@(posedge clk30)
begin
    clk15<=~clk15;
end
always@(posedge clk15)
begin
    clk7<=~clk7;
end
always@(posedge clk7)
begin
    clk3<=~clk3;
end
always@(posedge clk3)
begin
    clk1M<=~clk1M;
end

// An IDELAYCTRL primitive needs to be instantiated for the Fixed Tap Delay
// mode of the IDELAY.
wire dlyctrl_rdy;
IDELAYCTRL dlyctrl (
  .RDY      (dlyctrl_rdy),
  .REFCLK   (clk200),
  .RST      (~RST_B)
);
assign  io_reset  =   locked ? ~rstb_tcp:1'b1;

reg    LD_R;

always @(posedge clk125) begin
      LD_R <= LD;
end 


wire   LD_X;

assign LD_X = ~LD_R&&LD;

wire       datax_chip0;
wire       datax_chip1;
wire       datax_chip2;
wire       datax_chip3;
wire       datax_chip4;
wire       datax_chip5;
wire       datax_chip6;
wire       datax_chip7;
wire       datax_chip8;
wire       datax_chip9;
wire       datax_chip10;
wire       datax_chip11;


wire       data1x_chip0;
wire       data1x_chip1;
wire       data1x_chip2;
wire       data1x_chip3;
wire       data1x_chip4;
wire       data1x_chip5;
wire       data1x_chip6;
wire       data1x_chip7;
wire       data1x_chip8;
wire       data1x_chip9;
wire       data1x_chip10;
wire       data1x_chip11;

wire [4:0] CNT1_VALUEOUT;
wire [4:0] CNT2_VALUEOUT;
wire [4:0] CNT3_VALUEOUT;
wire [4:0] CNT4_VALUEOUT;
wire [4:0] CNT5_VALUEOUT;
wire [4:0] CNT6_VALUEOUT;
wire [4:0] CNT7_VALUEOUT;
wire [4:0] CNT8_VALUEOUT;
wire [4:0] CNT9_VALUEOUT;
wire [4:0] CNT10_VALUEOUT;
wire [4:0] CNT11_VALUEOUT;
wire [4:0] CNT12_VALUEOUT;


// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE1_1inst(
//    .CNTVALUEOUT(CNT1_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(datax_chip0),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data_chip0),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE1_2inst(
//    .CNTVALUEOUT(CNT2_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(datax_chip1),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap1_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data_chip1),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );


// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE1_3inst(
//    .CNTVALUEOUT(CNT3_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(datax_chip2),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap2_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data_chip2),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE1_4inst(
//    .CNTVALUEOUT(CNT4_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(datax_chip3),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap3_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data_chip3),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE1_5inst(
//    .CNTVALUEOUT(CNT5_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(datax_chip4),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap4_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data_chip4),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE1_6inst(
//    .CNTVALUEOUT(CNT6_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(datax_chip5),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap5_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data_chip5),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE1_7inst(
//    .CNTVALUEOUT(CNT7_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(datax_chip6),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap6_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data_chip6),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE1_8inst(
//    .CNTVALUEOUT(CNT8_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(datax_chip7),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap7_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data_chip7),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE1_9inst(
//    .CNTVALUEOUT(CNT9_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(datax_chip8),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap8_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data_chip8),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE1_10inst(
//    .CNTVALUEOUT(CNT10_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(datax_chip9),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap9_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data_chip9),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE1_11inst(
//    .CNTVALUEOUT(CNT11_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(datax_chip10),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap10_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data_chip10),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE1_12inst(
//    .CNTVALUEOUT(CNT12_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(datax_chip11),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap11_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data_chip11),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );
// //DATE_CHIP1

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE2_1inst(
//    .CNTVALUEOUT(CNT1_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(data1x_chip0),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data1_chip0),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE2_2inst(
//    .CNTVALUEOUT(CNT2_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(data1x_chip1),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap1_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data1_chip1),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );


// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE2_3inst(
//    .CNTVALUEOUT(CNT3_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(data1x_chip2),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap2_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data1_chip2),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE2_4inst(
//    .CNTVALUEOUT(CNT4_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(data1x_chip3),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap3_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data1_chip3),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE2_5inst(
//    .CNTVALUEOUT(CNT5_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(data1x_chip4),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap4_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data1_chip4),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE2_6inst(
//    .CNTVALUEOUT(CNT6_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(data1x_chip5),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap5_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data1_chip5),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE2_7inst(
//    .CNTVALUEOUT(CNT7_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(data1x_chip6),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap6_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data1_chip6),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE2_8inst(
//    .CNTVALUEOUT(CNT8_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(data1x_chip7),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap7_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data1_chip7),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE2_9inst(
//    .CNTVALUEOUT(CNT9_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(data1x_chip8),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap8_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data1_chip8),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE2_10inst(
//    .CNTVALUEOUT(CNT10_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(data1x_chip9),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap9_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data1_chip9),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE2_11inst(
//    .CNTVALUEOUT(CNT11_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(data1x_chip10),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap10_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data1_chip10),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

// IDELAYE2 #(
//    .DELAY_SRC("IDATAIN"),                // Delay input (IDATAIN, DATAIN)
//    .HIGH_PERFORMANCE_MODE("TRUE"),     // Reduced jitter ("TRUE"), Reduced power ("FALSE")
//    .IDELAY_TYPE("VAR_LOAD"),                 // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
//    .IDELAY_VALUE(0),                       // Input delay tap setting (0-31)
//    .REFCLK_FREQUENCY(200.0))             // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
// IDELAYE2_12inst(
//    .CNTVALUEOUT(CNT12_VALUEOUT),   // 5-bit output: Counter value output
//    .DATAOUT(data1x_chip11),         // 1-bit output: Delayed data output
//    .C(clk125),                             // 1-bit input: Clock input
//    .CE(1'b0),                           // 1-bit input: Active high enable increment/decrement input
//    .CINVCTRL(1'b0),                // 1-bit input: Dynamic clock inversion input
//    .CNTVALUEIN(tap11_io[4:0]),     // 5-bit input: Counter value input
//    .DATAIN(1'b0),                    // 1-bit input: Internal delay data input
//    .IDATAIN(data1_chip11),          // 1-bit input: Data input from the I/O
//    .INC(1'b0),                    // 1-bit input: Increment / Decrement tap delay input
//    .LD(LD_X),                              // 1-bit input: Load IDELAY_VALUE input
//    .LDPIPEEN(1'b0),                // 1-bit input: Enable PIPELINE register to load data input
//    .REGRST(1'b0)                   // 1-bit input: Active-high reset tap-delay input
// );

////////////////////////////////////////////////////////////////////////////////////
// System
wire usrclk, rst;
assign usrclk = clk125;

async2sync_reset reset_usrclk(
  .rst_in   (~(locked & dlyctrl_rdy)),
  .clk      (usrclk),
  .rst_out  (rst)
);

wire frame;
reg  test_counter;
wire data_chip0;
wire data_chip1;
wire data_chip2;
wire data_chip3;
wire data_chip4;
wire data_chip5;
wire data_chip6;
wire data_chip7;
wire data_chip8;
wire data_chip9;
wire data_chip10;
wire data_chip11;

wire data1_chip0;
wire data1_chip1;
wire data1_chip2;
wire data1_chip3;
wire data1_chip4;
wire data1_chip5;
wire data1_chip6;
wire data1_chip7;
wire data1_chip8;
wire data1_chip9;
wire data1_chip10;
wire data1_chip11;

wire sync0;
wire sync1;
wire sync2;
wire sync3;
wire sync4;
wire sync5;
wire sync6;
wire sync7;
wire sync8;
wire sync9;
wire sync10;
wire sync11;


wire sync1_0;
wire sync1_1;
wire sync1_2;
wire sync1_3;
wire sync1_4;
wire sync1_5;
wire sync1_6;
wire sync1_7;
wire sync1_8;
wire sync1_9;
wire sync1_10;
wire sync1_11;

reg chip_clk_en=0;

Chip_Core chip0(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data_chip0),
  .sync(sync0), 
  .data_p(data_p0),
    .data_n(data_n0),
  .sync_p(sync_p0),  //sync is the 30MHz sys clk
  .sync_n(sync_n0)
); 
Chip_Core chip1(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data_chip1),
  .sync(sync1), 
  .data_p(data_p1),
    .data_n(data_n1),
  .sync_p(sync_p1),  //sync is the 31MHz sys clk
  .sync_n(sync_n1)
); 
Chip_Core chip2(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data_chip2),
  .sync(sync2), 
  .data_p(data_p2),
    .data_n(data_n2),
  .sync_p(sync_p2),  //sync is the 32MHz sys clk
  .sync_n(sync_n2)
); 
Chip_Core chip3(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data_chip3),
  .sync(sync3), 
  .data_p(data_p3),
    .data_n(data_n3),
  .sync_p(sync_p3),  //sync is the 30MHz sys clk
  .sync_n(sync_n3)
); 
Chip_Core chip4(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data_chip4),
  .sync(sync4), 
  .data_p(data_p4),
    .data_n(data_n4),
  .sync_p(sync_p4),  //sync is the 30MHz sys clk
  .sync_n(sync_n4)
);
Chip_Core chip5(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data_chip5),
  .sync(sync5), 
  .data_p(data_p5),
    .data_n(data_n5),
  .sync_p(sync_p5),  //sync is the 30MHz sys clk
  .sync_n(sync_n5)
);
Chip_Core chip6(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data_chip6),
  .sync(sync6), 
  .data_p(data_p6),
    .data_n(data_n6),
  .sync_p(sync_p6),  //sync is the 30MHz sys clk
  .sync_n(sync_n6)
);
Chip_Core chip7(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data_chip7),
  .sync(sync7), 
  .data_p(data_p7),
    .data_n(data_n7),
  .sync_p(sync_p7),  //sync is the 30MHz sys clk
  .sync_n(sync_n7)
);
Chip_Core chip8(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data_chip8),
  .sync(sync8), 
  .data_p(data_p8),
    .data_n(data_n8),
  .sync_p(sync_p8),  //sync is the 30MHz sys clk
  .sync_n(sync_n8)
);
Chip_Core chip9(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data_chip9),
  .sync(sync9), 
  .data_p(data_p9),
    .data_n(data_n9),
  .sync_p(sync_p9),  //sync is the 30MHz sys clk
  .sync_n(sync_n9)
);
Chip_Core chip10(   
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data_chip10),
  .sync(sync10),  
  .data_p(data_p10),
    .data_n(data_n10),
  .sync_p(sync_p10),  //sync is the 30MHz sys clk
  .sync_n(sync_n10)
);
Chip_Core chip11(   
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data_chip11),
  .sync(sync11),  
  .data_p(data_p11),
    .data_n(data_n11),
  .sync_p(sync_p11),  //sync is the 30MHz sys clk
  .sync_n(sync_n11)
);



Chip_Core chip1_0(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data1_chip0),
  .sync(sync1_0), 
  .data_p(data1_p0),
    .data_n(data1_n0),
  .sync_p(sync1_p0),  //sync is the 30MHz sys clk
  .sync_n(sync1_n0)
); 
Chip_Core chip1_1(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data1_chip1),
  .sync(sync1_1), 
  .data_p(data1_p1),
    .data_n(data1_n1),
  .sync_p(sync1_p1),  //sync is the 31MHz sys clk
  .sync_n(sync1_n1)
); 
Chip_Core chip1_2(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data1_chip2),
  .sync(sync1_2), 
  .data_p(data1_p2),
    .data_n(data1_n2),
  .sync_p(sync1_p2),  //sync is the 32MHz sys clk
  .sync_n(sync1_n2)
); 
Chip_Core chip1_3(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data1_chip3),
  .sync(sync1_3), 
  .data_p(data1_p3),
    .data_n(data1_n3),
  .sync_p(sync1_p3),  //sync is the 30MHz sys clk
  .sync_n(sync1_n3)
); 
Chip_Core chip1_4(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data1_chip4),
  .sync(sync1_4), 
  .data_p(data1_p4),
    .data_n(data1_n4),
  .sync_p(sync1_p4),  //sync is the 30MHz sys clk
  .sync_n(sync1_n4)
);
Chip_Core chip1_5(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data1_chip5),
  .sync(sync1_5), 
  .data_p(data1_p5),
    .data_n(data1_n5),
  .sync_p(sync1_p5),  //sync is the 30MHz sys clk
  .sync_n(sync1_n5)
);
Chip_Core chip1_6(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data1_chip6),
  .sync(sync1_6), 
  .data_p(data1_p6),
    .data_n(data1_n6),
  .sync_p(sync1_p6),  //sync is the 30MHz sys clk
  .sync_n(sync1_n6)
);
Chip_Core chip1_7(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data1_chip7),
  .sync(sync1_7), 
  .data_p(data1_p7),
    .data_n(data1_n7),
  .sync_p(sync1_p7),  //sync is the 30MHz sys clk
  .sync_n(sync1_n7)
);
Chip_Core chip1_8(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data1_chip8),
  .sync(sync1_8), 
  .data_p(data1_p8),
    .data_n(data1_n8),
  .sync_p(sync1_p8),  //sync is the 30MHz sys clk
  .sync_n(sync1_n8)
);
Chip_Core chip1_9(    
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data1_chip9),
  .sync(sync1_9), 
  .data_p(data1_p9),
    .data_n(data1_n9),
  .sync_p(sync1_p9),  //sync is the 30MHz sys clk
  .sync_n(sync1_n9)
);
Chip_Core chip1_10(   
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data1_chip10),
  .sync(sync1_10),  
  .data_p(data1_p10),
    .data_n(data1_n10),
  .sync_p(sync1_p10),  //sync is the 30MHz sys clk
  .sync_n(sync1_n10)
);
Chip_Core chip1_11(   
  .clk360(clk360), //chip ser clk, for FIFO write
  .data_chip_reg(data1_chip11),
  .sync(sync1_11),  
  .data_p(data1_p11),
    .data_n(data1_n11),
  .sync_p(sync1_p11),  //sync is the 30MHz sys clk
  .sync_n(sync1_n11)
);

// ila_8 ila_8 (
//   .clk(clk360), // input wire clk


//   .probe0(sync0), // input wire [0:0]  probe0  
//   .probe1(sync1), // input wire [0:0]  probe1 
//   .probe2(sync2), // input wire [0:0]  probe2 
//   .probe3(sync3), // input wire [0:0]  probe3 
//   .probe4(sync4), // input wire [0:0]  probe4
//   .probe5(sync5), 
//   .probe6(sync6), // input wire [3:0]  probe5 
//   .probe7(sync7), // input wire [11:0]  probe6 
//   .probe8(sync8), // input wire [11:0]  probe7
//   .probe9(sync9),
//   .probe10(sync10),
//   .probe11(sync11),
//   .probe12(data_chip0),
//   .probe13(data_chip1),
//   .probe14(data_chip2),
//   .probe15(data_chip3),
//   .probe16(data_chip4),
//   .probe17(data_chip5),
//   .probe18(data_chip6),
//   .probe19(data_chip7),
//   .probe20(data_chip8),
//   .probe21(data_chip9),
//   .probe22(data_chip10),
//   .probe23(data_chip11)
// );





OBUFDS OBUFDS_PLL_REF0(
      .O(clk_p0),     // Diff_p output (connect directly to top-level port)
      .OB(clk_n0),   // Diff_n output (connect directly to top-level port)
      .I(clk360 & chip_clk_en)      // Buffer input
);
OBUFDS OBUFDS_PLL_REF1(
      .O(clk_p1),     // Diff_p output (connect directly to top-level port)
      .OB(clk_n1),   // Diff_n output (connect directly to top-level port)
      .I(clk360 & chip_clk_en)      // Buffer input
);

OBUFDS OBUFDS_test_counter0(
      .O(gate_p0),     // Diff_p output (connect directly to top-level port)
      .OB(gate_n0),   // Diff_n output (connect directly to top-level port)
      .I(test_counterx)      // Buffer input
);
OBUFDS OBUFDS_test_counter1(
      .O(gate_p1),     // Diff_p output (connect directly to top-level port)
      .OB(gate_n1),   // Diff_n output (connect directly to top-level port)
      .I(test_counterx)      // Buffer input
);
OBUFDS OBUFDS_frame0(
      .O(frame_p0),     // Diff_p output (connect directly to top-level port)
      .OB(frame_n0),   // Diff_n output (connect directly to top-level port)
      .I(FRAME_OUT & chip_clk_en)      // Buffer input
);
OBUFDS OBUFDS_frame1(
      .O(frame_p1),     // Diff_p output (connect directly to top-level port)
      .OB(frame_n1),   // Diff_n output (connect directly to top-level port)
      .I(FRAME_OUT & chip_clk_en)      // Buffer input
);


OBUFDS OBUFDS1_PLL_REF0(
      .O(clk1_p0),     // Diff_p output (connect directly to top-level port)
      .OB(clk1_n0),   // Diff_n output (connect directly to top-level port)
      .I(clk360 & chip_clk_en)      // Buffer input
);
OBUFDS OBUFDS1_PLL_REF1(
      .O(clk1_p1),     // Diff_p output (connect directly to top-level port)
      .OB(clk1_n1),   // Diff_n output (connect directly to top-level port)
      .I(clk360 & chip_clk_en)      // Buffer input
);

OBUFDS OBUFDS1_test_counter0(
      .O(gate1_p0),     // Diff_p output (connect directly to top-level port)
      .OB(gate1_n0),   // Diff_n output (connect directly to top-level port)
      .I(test_counterx)      // Buffer input
);
OBUFDS OBUFDS1_test_counter1(
      .O(gate1_p1),     // Diff_p output (connect directly to top-level port)
      .OB(gate1_n1),   // Diff_n output (connect directly to top-level port)
      .I(test_counterx)      // Buffer input
);
OBUFDS OBUFDS1_frame0(
      .O(frame1_p0),     // Diff_p output (connect directly to top-level port)
      .OB(frame1_n0),   // Diff_n output (connect directly to top-level port)
      .I(FRAME1_OUT & chip_clk_en)      // Buffer input
);
OBUFDS OBUFDS1_frame1(
      .O(frame1_p1),     // Diff_p output (connect directly to top-level port)
      .OB(frame1_n1),   // Diff_n output (connect directly to top-level port)
      .I(FRAME1_OUT & chip_clk_en)      // Buffer input
);

reg config_en;
assign cs0=~(config_en_count==4'd1);
assign cs1=~(config_en_count==4'd2);
assign cs2=~(config_en_count==4'd3);
assign cs3=~(config_en_count==4'd4);
assign cs4=~(config_en_count==4'd5);
assign cs5=~(config_en_count==4'd6);
assign cs6=~(config_en_count==4'd7);
assign cs7=~(config_en_count==4'd8);
assign cs8=~(config_en_count==4'd9);
assign cs9=~(config_en_count==4'd10);
assign cs10=~(config_en_count==4'd11);
assign cs11=~(config_en_count==4'd12);

reg clk_spi_tcp;
reg load_gdac_tcp;
reg load_gdac_tcp3;
reg in_spi_tcp;
reg spi_gdac_arrayb;
reg array_loaden;
reg [4:0]vth2pix;
reg [4:0]vth1pix;
reg [1:0]polpix;
reg cal_en;

reg rstb_array_load;
reg [27:0]pixel_spi_word;

reg [16:0]array_spi_cnt;
reg refresh_reg;
reg clk_spi_en;
wire clk_spi_FPGA;
// assign refresh=refresh_reg;
// assign clk_spi=(spi_gdac_arrayb)?clk_spi_tcp:clk_spi_FPGA;
// assign load_gdac=load_gdac_tcp;
// assign array_in0=pixel_spi_word[27];
// assign array_in1=(spi_gdac_arrayb)?in_spi_tcp:pixel_spi_word[27]; //shared by gdac_in_spi & array_in_spi
// assign array_in2=pixel_spi_word[27];
// assign array_in3=pixel_spi_word[27];

assign refresh=1'b0;
// assign clk_spi=(spi_gdac_arrayb)?clk_spi_tcp:1'b0;
assign clk_spi=sck_o;
assign clk3_spi=sck3_o;

assign load_gdac=load_gdac_tcp;
assign load_gdac3=load_gdac_tcp3;


assign array_in0=1'b0;
// assign array_in1=(spi_gdac_arrayb)?in_spi_tcp:1'b0; //shared by gdac_in_spi & array_in_spi
assign array_in1=mosi_o;

assign array_in2=1'b0;
assign array_in3=1'b0;


assign array_in4=1'b0;
// assign array_in1=(spi_gdac_arrayb)?in_spi_tcp:1'b0; //shared by gdac_in_spi & array_in_spi
assign array_in5=mosi3_o;

assign array_in6=1'b0;
assign array_in7=1'b0;


assign clk_spi_FPGA=(clk_spi_en)?clk1M:0;

reg [31:0]clk_cnt=0;
reg rstb_tcp;
reg rstb_chip=1;
//assign rstb=rstb_chip||((!(phase_ok&&phase0_ok))&&read_start_matlab);
assign rstb=rstb_chip;

assign RST_CONFIG = ~rstb_tcp;

// ila_RST ila_RST (
//   .clk(clk125), // input wire clk


//   .probe0(rstb_chip) // input wire [0:0] probe0
// );

///////////////////////////////////////////////////////////////////////////////////

reg [3:0]sync_bit;
reg [11:0]rowWord_fifowr;

reg [15:0]sync_cnt;

always@(negedge clk1M or negedge rstb_array_load)
begin
    if(~rstb_array_load)
    begin
        array_spi_cnt<=0;
        clk_spi_en<=0;
        pixel_spi_word<={15'd0,vth2pix,vth1pix,polpix,1'b1}; 
 //              pixel_spi_word<=28'hfffffff;
    end
    else if(array_spi_cnt<17'd86015)
    begin
        clk_spi_en<=1;
        pixel_spi_word<={pixel_spi_word[26:0],pixel_spi_word[27]};
        array_spi_cnt<=array_spi_cnt+1'b1;
    end
    else if(array_spi_cnt==(17'd86015))
    begin
        array_spi_cnt<=array_spi_cnt+1'b1;
        clk_spi_en<=0;
    end
    else if(array_spi_cnt==(17'd86016))
    begin
        array_spi_cnt<=array_spi_cnt+1'b1;
        refresh_reg<=1;
        clk_spi_en<=0;
    end
    else
    begin
        refresh_reg<=0;
    end
end


//0707
// reg       config_reg;

// reg       config_fre;

// reg [4:0] config_cnt;

// always@(negedge clk1M or negedge config_load)
// begin
//     if(~config_load)
//     begin
//         config_reg<=0; 
//         config_fre<=0;
//         config_cnt<=0;
//     end
//     else if(config_cnt<5'd60)
//     begin
//         config_reg<=1;
//         config_cnt<=config_cnt+1'b1;
//     end
//     else if(config_cnt==(5'd60))
//     begin
//         config_reg<=0;
//         config_cnt<=config_cnt+1'b1;
//     end
//     else if(config_cnt==(5'd61))
//     begin
//         config_reg<=0;
//         config_cnt<=config_cnt+1'b1;
//     end
//     else
//     begin
//         config_fre<=0;
//     end
// end
reg config_load_r;
reg config_load_rr;
always@(posedge clk30)
begin
  config_load_r<=config_load; 
end
always@(posedge clk30)
begin
  config_load_rr<=config_load_r; 
end
assign CONFIG_ST = ~config_load_rr&&config_load_r;
//0707
//0710
reg       rst_reg;
reg       rst_fre;
reg [7:0] rst_cnt;
// always@(negedge clk1M or negedge config_rst)
// begin
//     if(~config_rst)
//     begin
//         rst_reg<=0; 
//         rst_fre<=0;
//         rst_cnt<=0;
//     end
//     else if(rst_cnt<8'd240)
//     begin
//         rst_reg<=1;
//         rst_cnt<=rst_cnt+1'b1;
//     end
//     else if(rst_cnt==(8'd240))
//     begin
//         rst_reg<=0;
//         rst_cnt<=rst_cnt+1'b1;
//     end
//     else if(rst_cnt==(8'd241))
//     begin
//         rst_reg<=0;
//         rst_cnt<=rst_cnt+1'b1;
//     end
//     else
//     begin
//         rst_fre<=0;
//     end
// end

assign RST_ST = config_rst;
//0710
reg [9:0]frame_cnt;
reg read_start_matlab;

wire [31:0]    frame_countall;

assign frame_countall[31:0] = {frame_count4[7:0],frame_count3[7:0],frame_count2[7:0],frame_count1[7:0]};

// wire [31:0]    trgtail_cnt;
// assign trgtail_cnt[31:0] = {trig_tail0[7:0],trig_tail1[7:0],trig_tail2[7:0],trig_tail3[7:0]};
// always @(posedge clk30 or negedge rstb_tcp )  //frame=1 clk30 wide; ignore the first 4 frames
// begin
//   if(~rstb_tcp)
//   begin 
//         frame<=0;
//         frame_cnt<=0;
//         clk_cnt<=0;
//   end
//   else if(chip_clk_en)
//   begin
//     if(read_start_matlab)//one read operation for PC
//     begin
//       if(clk_cnt==frame_countall[31:0]) // 128*8*14*2 steps for 1 frame// frame_count1//32'd2000000
//       begin
//           // if(frame_cnt<=10'd1000)
//           // begin
//           //      frame <= 1; //drop first 3, save only frame 4
//           // end
//                frame<=1;
//           // if(frame_cnt<=10'd1023)
//           // begin
//           //      frame_cnt<=frame_cnt+1'b1;
//           // end
//         clk_cnt<=32'd0; 
//       end
//       else
//       begin
//         frame<=0;
//         clk_cnt<=clk_cnt + 1'b1;
//       end
//     end
//     else
//     begin
//       frame<=0;
//       clk_cnt<=0;
//       frame_cnt<=0;
//     end
//   end
// end



reg       trg_reg;
reg       trg_fre;
reg [4:0] trgg_cnt;

always@(negedge clk1M or negedge start_trg)
begin
    if(~start_trg)
    begin
        trg_reg<=0; 
        trg_fre<=0;
        trgg_cnt<=0;
    end
    else if(trgg_cnt<5'd50)
    begin
        trg_reg<=1;
        trgg_cnt<=trgg_cnt+1'b1;
    end
    else if(trgg_cnt==(5'd50))
    begin
        trg_reg<=0;
        trgg_cnt<=trgg_cnt+1'b1;
    end
    else if(trgg_cnt==(5'd51))
    begin
        trg_reg<=0;
        trgg_cnt<=trgg_cnt+1'b1;
    end
    else
    begin
        trg_fre<=0;
    end
end

wire       trgx_in;


reg       ex_reg;
reg       ex_fre;
reg [4:0] ex_cnt;

// always@(negedge clk1M or negedge EXTERNAL_TRIG1)
// begin
//     if(~EXTERNAL_TRIG1)
//     begin
//         ex_reg<=0; 
//         ex_fre<=0;
//         ex_cnt<=0;
//     end
//     else if(ex_cnt<5'd50)
//     begin
//         ex_reg<=1;
//         ex_cnt<=ex_cnt+1'b1;
//     end
//     else if(ex_cnt==(5'd50))
//     begin
//         ex_reg<=0;
//         ex_cnt<=ex_cnt+1'b1;
//     end
//     else if(ex_cnt==(5'd51))
//     begin
//         ex_reg<=0;
//         ex_cnt<=ex_cnt+1'b1;
//     end
//     else
//     begin
//         ex_fre<=0;
//     end
// end

reg   external_trig;
reg   external_trig_r;
always@(negedge clk30)
begin
        external_trig_r<=EXTERNAL_TRIG1;

end

always@(negedge clk30)
begin
        external_trig<=external_trig_r;

end

wire external_trigr;
assign external_trigr = (~external_trig)&&external_trig_r;

reg external_trig_zr;
reg external_trig_z;
always@(negedge clk30)
begin
        external_trig_zr<=external_trig;

end
always@(negedge clk30)
begin
        external_trig_z<=external_trig_zr;

end

wire test_countery;
wire test_counterx;
assign test_countery = ~external_trig_z;
assign test_counterx = (mode_en[1:0]==2'd3)?test_countery:test_counter;

// State Machine
reg  state_reg, state_next;
localparam
  IDLE           = 0,
  T_B            = 1;

always @(posedge clk30 or posedge rst) begin//
  if (rst) state_reg <= IDLE;
  else state_reg <= state_next;
end

always @(*) begin//
  state_next = IDLE;
  case(state_reg)
    IDLE: begin//     //STATE0
      if(external_trigr) begin// 
        state_next = T_B;
      end   
      else begin//
        state_next = IDLE;
      end
    end
    T_B: begin//     //STATE0 
    if(e_end) begin// 
        state_next = IDLE;
      end        
      else begin//
        state_next = T_B;
      end
    end 
  endcase
end
reg  [31:0]   e_cnt;
wire          e_start;
wire          e_end;    
always @(posedge clk30 or posedge rst) begin //RST_C
  if (rst) begin
    e_cnt[31:0] <= 0; 
  end
  else if (e_start) begin
      if(e_end)begin
        e_cnt[31:0] <= 0;
      end
      else begin
        e_cnt[31:0] <= e_cnt[31:0] + 1;
      end
  end
end
assign e_start = state_reg==T_B;
assign e_end   = e_start&&(e_cnt[31:0]==32'd50000);//98304 12288 d6250
// assign external_trigx = (state_reg==IDLE)&&(state_next==T_B);
reg external_trigx;
always @(posedge clk30 or posedge rst) begin
            if (rst) begin
              external_trigx<= 1'b0;
            end           
            else if (e_start&&(e_cnt[31:0]==32'd0)) begin //d3780
              external_trigx<= 1'b1;            
            end            
            else if (e_start&&(e_cnt[31:0]==32'd2)) begin //d3780
              external_trigx<= 1'b0;            
            end  
            else begin
              external_trigx<= external_trigx; 
            end
end


// ila_MASK ila_MASK (
//   .clk(clk1M), // input wire clk


//   .probe0(state_reg), // input wire [0:0]  probe0  
//   .probe1(state_next), // input wire [0:0]  probe1 
//   .probe2(e_start), // input wire [0:0]  probe2 
//   .probe3(e_end), // input wire [0:0]  probe3 
//   .probe4(e_cnt) // input wire [31:0]  probe4
// );

reg   external_gate;
reg   external_gate_r;
reg   external_gate_rr;
always@(negedge clk30)
begin
        external_gate_r<=EXTERNAL_TRIG3;

end
always@(negedge clk30)
begin
        external_gate_rr<=external_gate_r;

end
always@(negedge clk30)
begin
        external_gate<=external_gate_rr;

end
// reg [31:0]   e_cnt;
// always @(posedge clk1M begin //RST_C
//   if (gate_inr) begin
//     e_cnt[31:0] <= e_cnt[31:0]+1'b1; 
//   end
//   else if (gate_inf) begin
//       if(e_end)begin
//         e_cnt[31:0] <= 0;
//       end
//       else begin
//         e_cnt[31:0] <= e_cnt[31:0] + 1;
//       end
//   end
//   else begin
    
//   end
// end


reg      gate_in_reg;
wire      gate_inr;
wire      gate_inf;

always @(posedge clk30) begin //RST_C
  gate_in_reg <= external_gate;
end

assign gate_inr = !gate_in_reg&&external_gate;
assign gate_inf = !external_gate&&gate_in_reg;

// assign trgx_in = trg_reg||external_trigx;
assign trg_in = trg_reg||external_trigx;

// reg      trg_in_reg;


// always @(posedge clk30) begin //RST_C
//   trg_in_reg <= trgx_in;
// end

// assign trg_in = !trg_in_reg&&trgx_in;

// assign trg_in = mode_en[0] ? trg_reg : external_trig;
wire       trg_en1;
wire       trg_en;
wire       frame_1;

wire [15:0] trg_cc;

wire [2:0] state_x;

trigger6_top trigger6_top(
  .RST            (~rstb_tcp),                  // in : Clock
  .CLK            (clk30),                  // in : System reset
  .trg_in         (trg_in),             // in : Number of event to be generated
  .exp_cnt        (frame_countall[31:0]),
  .mode_en        (mode_en[1:0]),
  // .trgtail_cnt    (trgtail_cnt[31:0]),
  .gate_in        (external_gate),
  // .trg_cnt        ({2'd0,trg_cnt[7:0]}),                  // in : System reset
  .trg_cnt        ({trg_cnt[7:0],trg1_cnt[7:0]}),                  // in : System reset
  .trg_out        (frame_1),             // in : Number of event to be generated
  .trg_mask       (),
  .trg_cc         (trg_cc),
  .trg_en         (trg_en1),
  .state_x        (state_x)  
);

wire framef;
wire trg_enf;
flyscan flyscan(
  .RST            (~rstb_tcp),                  // in : Clock
  .CLK            (clk30),                  // in : System reset
  .trg_in         (external_trig_r),
  .trg_cnt        ({trg_cnt[7:0],trg1_cnt[7:0]}),                  // in : System reset
  .trg_out        (framef),
  .mode_en        (mode_en[1:0]),
  .trg_en         (trg_enf)
     
);

assign frame = (mode_en[1:0]==2'd3)?framef:frame_1;

assign trg_en = (mode_en[1:0]==2'd3)?trg_enf:trg_en1;

// ila_trg ila_trg (
//   .clk(clk_read), // input wire clk


//   .probe0(phase0_ok), // input wire [0:0]  probe0  
//   .probe1(phase_ok), // input wire [0:0]  probe1 
//   .probe2(trg_en), // input wire [0:0]  probe2 
//   .probe3(chipread_flag), // input wire [0:0]  probe3 
//   .probe4(DATA1_EN), // input wire [0:0]  probe4 
//   .probe5(state_x[2:0])// input wire [0:0]  probe5 
// );
// ila_ZAC ila_ZAC (
//   .clk(clk125), // input wire clk


//   .probe0(read_start_matlab), // input wire [0:0]  probe0  
//   .probe1(frame_countall[31:0]) // input wire [31:0]  probe1
// );

//reg [11:0]rowWord_chain0;
//reg [11:0]rowWord_chain1;
//reg [11:0]rowWord_chain2;
//reg [11:0]rowWord_chain3;
//reg [11:0]rowWord_chain4;
//reg [11:0]rowWord_chain5;
//reg [11:0]rowWord_chain6;
//reg [11:0]rowWord_chain7;
//reg [11:0]rowWord_chain8;
//reg [11:0]rowWord_chain9;
//reg [11:0]rowWord_chain10;
//reg [11:0]rowWord_chain11;

//reg [11:0]rowWord_reg0;
//reg [11:0]rowWord_reg1;
//reg [11:0]rowWord_reg2;
//reg [11:0]rowWord_reg3;
//reg [11:0]rowWord_reg4;
//reg [11:0]rowWord_reg5;
//reg [11:0]rowWord_reg6;
//reg [11:0]rowWord_reg7;
//reg [11:0]rowWord_reg8;
//reg [11:0]rowWord_reg9;
//reg [11:0]rowWord_reg10;
//reg [11:0]rowWord_reg11;

reg [11:0]rowWord_chain;
reg [11:0]rowWord_reg;

reg [3:0]latch_pos;
always@(negedge clk360 or negedge rstb_tcp)
begin
    if(~rstb_tcp)
    begin
        sync_bit<=0;
    end
    else if(chip_clk_en)
    begin
        if(frame)
        begin
            sync_bit<=0;           
        end
        else
        begin
            if(sync_bit==4'd11)
            begin
                sync_bit<=0;
            end
            else
            begin
                sync_bit<=sync_bit+1'b1;                
            end
        end
    end
end

reg [3:0]data_mux;




//20230816
wire sync0_reg;

FD SYNC1 (.D(sync0), .C(clk360), .Q(sync0_reg));

wire  frame_sync;

assign frame_sync = ~sync0_reg&&sync0&&frame;

reg [3:0] test_sync;
always@(negedge clk360 or negedge rstb_tcp)
begin
    if(~rstb_tcp)
    begin
        test_sync<=0;
    end
    else if(chip_clk_en)
    begin
        if(frame_sync)
        begin
            test_sync<=0;           
        end
        else
        begin
            if(test_sync==4'd11)
            begin
                test_sync<=0;
            end
            else
            begin
                test_sync<=test_sync+1'b1;                
            end
        end
    end
end
//20230816

// always@(negedge clk360)
// begin
//     if(chip_clk_en)
//     begin
//         if(sync_bit == latch_pos)    
//         begin
//             rowWord_reg<=rowWord_chain;
//         end
 
//         case (data_mux)
//         4'd0: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip0};
//                end
//         4'd1: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip1};
//                end
//         4'd2: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip2};
//                end
//         4'd3: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip3};
//                end
//         4'd4: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip4};
//                end
//         4'd5: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip5};
//                end
//         4'd6: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip6};
//                end
//         4'd7: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip7};
//                end
//         4'd8: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip8};
//                end
//         4'd9: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip9};
//                end
//         4'd10: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip10};
//                end
//         4'd11: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip11};
//                end
//         default: begin
//                   rowWord_chain<=0;
//                end
//         endcase 
//    end
// end

// always@(negedge clk360 or negedge rstb_chip)
// begin
//     if(~rstb_chip)
//     begin
//         rowWord_reg<=0;
//     end
//     else if(chip_clk_en)
//           begin
//             if(sync_bit == latch_pos)    
//         begin
//             rowWord_reg<=rowWord_chain;
//         end
 
//         case (data_mux)
//         4'd0: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip0};
//                end
//         4'd1: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip1};
//                end
//         4'd2: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip2};
//                end
//         4'd3: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip3};
//                end
//         4'd4: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip4};
//                end
//         4'd5: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip5};
//                end
//         4'd6: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip6};
//                end
//         4'd7: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip7};
//                end
//         4'd8: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip8};
//                end
//         4'd9: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip9};
//                end
//         4'd10: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip10};
//                end
//         4'd11: begin
//                   rowWord_chain<={rowWord_chain[10:0],data_chip11};
//                end
//         default: begin
//                   rowWord_chain<=0;
//                end
//         endcase 
//    end
// end


wire fifo_tcp_wren;
wire fifo_empty_stream;
wire fifo_full;

wire wr_en;
assign wr_en=(frame_cnt==16'd4);

wire [7:0]data_fifo_out;

wire tcp_tx_full;
wire tcp_open;



wire [63:0] FIFO_DOUT;

wire        FIFO_VALID;





////////////////////////////////////////////////////////////////////////////////////
// SiTCP interface
wire            tim_1s;


wire            tcp_error;
wire            tcp_rst;
wire            tcp_close;

wire            tcp_rx_wr;
wire    [7 : 0] tcp_rx_data;
wire    [15: 0] tcp_rx_wc;

wire            tcp_tx_wr;
wire    [7 : 0] tcp_tx_data;

wire    [31: 0] rbcp_addr;
wire            rbcp_we;
wire    [7 : 0] rbcp_wd;
wire            rbcp_re;
wire            rbcp_act;
wire            rbcp_ack; //test 3
reg            rbcp_reg_ack;
wire    [7 : 0] rbcp_rd;



  // RBCP
  // input           rbcp_we,  // in
  // input           rbcp_re,  // in
  // input   [7 :0]  rbcp_wd,  // in
  // input   [15:0]  rbcp_addr,// in
  // input           rbcp_act,
  // output  [7 :0]  rbcp_rd,  // out
  // output          rbcp_ack, // out
  // Wishbone bus

// SITCP #(
//   .USE_CHIPSCOPE          (USE_CHIPSCOPE),
//   .BASE_IP_ADDR           (BASE_IP_ADDR),
//   .PHY_ADDRESS            (PHY_ADDRESS),
//   .MAC_IP_WIDTH           (8)
// )sitcp(
//   .RST                    (rst),
//   .USRCLK                 (usrclk),//125M
//   .CLKOUT                 (),
//   .MAC_SELECT             (DIPSW),
//   .IP_SELECT              (DIPSW),
//   .TIM_1US                (),            // out: 1 us interval
//   .TIM_10US               (),
//   .TIM_100US              (),
//   .TIM_1MS                (),            // out: 1 ms interval
//   .TIM_10MS               (),
//   .TIM_100MS              (),
//   .TIM_1S                 (tim_1s),      // out: 1 s interval
//   .TIM_1M                 (),            // out: 1 min interval
//   // TCP
//   .TCP_OPEN               (tcp_open),
//   .TCP_ERROR              (tcp_error),
//   .TCP_RST                (tcp_rst),
//   .TCP_CLOSE              (tcp_close),
//   .TCP_RX_WC              (TCP_RX_WC[15:0]),
//   .TCP_RX_WR              (TCP_RX_WR),      
//   .TCP_RX_DATA            (TCP_RX_DATA[7:0]),
//   .TCP_TX_FULL            (tcp_tx_full),
//   .TCP_TX_WR              (tcp_tx_wr),      //important
//   .TCP_TX_DATA            (data_fifo_out),    //important
//   // UDP
//   .RBCP_ADDR              (rbcp_addr),
//   .RBCP_WE                (rbcp_we),
//   .RBCP_WD                (rbcp_wd),
//   .RBCP_RE                (rbcp_re),
//   .RBCP_ACT               (rbcp_act),
//   .RBCP_ACK               (rbcp_ack),
//   .RBCP_RD                (rbcp_rd),
//   // PHY
//   .PHY_RSTn               (PHY_RST_B),
//   .RGMII_TXC              (PHY_TX_CLK),
//   .RGMII_TXD              (PHY_TX_D),
//   .RGMII_TX_CTL           (PHY_TX_CTRL),
//   .RGMII_RXC              (PHY_RX_CLK),
//   .RGMII_RXD              (PHY_RX_D),
//   .RGMII_RX_CTL           (PHY_RX_CTRL),
//   .MDC                    (PHY_MDC),
//   .MDIO                   (PHY_MDIO)
// );

SITCP #(
  .USE_CHIPSCOPE          (USE_CHIPSCOPE),
  .BASE_IP_ADDR           (BASE_IP_ADDR),
  .PHY_ADDRESS            (PHY_ADDRESS),
  .MAC_IP_WIDTH           (8)
)sitcp(
  .RST                    (rst),
  .USRCLK                 (usrclk),//125M
  .CLKOUT                 (),
  .MAC_SELECT             (DIPSW),
  .IP_SELECT              (DIPSW),
  .TIM_1US                (),            // out: 1 us interval
  .TIM_10US               (),
  .TIM_100US              (),
  .TIM_1MS                (),            // out: 1 ms interval
  .TIM_10MS               (),
  .TIM_100MS              (),
  .TIM_1S                 (tim_1s),      // out: 1 s interval
  .TIM_1M                 (),            // out: 1 min interval
  // TCP
  .TCP_OPEN               (tcp_open),
  .TCP_ERROR              (tcp_error),
  .TCP_RST                (tcp_rst),
  .TCP_CLOSE              (tcp_close),
  .TCP_RX_WC              (TCP_RX_WC[15:0]),
  .TCP_RX_WR              (TCP_RX_WR),      
  .TCP_RX_DATA            (TCP_RX_DATA[7:0]),
  .TCP_TX_FULL            (tcp_tx_full),
  .TCP_TX_WR              (tcp_tx_wr),      //important
  .TCP_TX_DATA            (data_fifo_out),    //important
  // UDP
  .RBCP_ADDR              (rbcp_addr),
  .RBCP_WE                (rbcp_we),
  .RBCP_WD                (rbcp_wd),
  .RBCP_RE                (rbcp_re),
  .RBCP_ACT               (rbcp_act),
  .RBCP_ACK               (rbcp_ack),
  .RBCP_RD                (rbcp_rd),
  // PHY
  .PHY_RSTn               (PHY_RST_B),
  .RGMII_TXC              (PHY_TX_CLK),
  .RGMII_TXD              (PHY_TX_D),
  .RGMII_TX_CTL           (PHY_TX_CTRL),
  .RGMII_RXC              (PHY_RX_CLK),
  .RGMII_RXD              (PHY_RX_D),
  .RGMII_RX_CTL           (PHY_RX_CTRL),
  .MDC                    (PHY_MDC),
  .MDIO                   (PHY_MDIO)
);
assign PHY_PWDN_B = 1'b1;
assign PHY_GPIO = 2'bzz;

//------------------------------------------------------------------------------
//  TCP loopback FIFO
wire sitcpFifoEmpty, sitcpFifoRe;
// assign tcp_rx_wc[15:11] = 5'b11111;


///////////////////////////////////////////////////////////////////////////////
// Debug
reg ledr;
reg config_load;
reg config_rst=1'b0;
reg rst_ddr;
always @(posedge usrclk)
 if(tim_1s) ledr <= ~ledr;

assign BLED_B = ledr;
assign GLED_B = ~tcp_open;
assign RLED_B = ~tcp_error;

reg config2_chip=1'b0;
reg config3_chip=1'b0;
reg config4_chip=1'b0;
reg config5_chip=1'b0;
reg config6_chip=1'b0;
reg config7_chip=1'b0;
reg config8_chip=1'b0;
reg config9_chip=1'b0;
reg config10_chip=1'b0;
reg config11_chip=1'b0;
reg config12_chip=1'b0;

reg [4:0] phase_count;
reg [4:0] phase1_count;
reg [7:0] chip0_s;
reg [7:0] chip1_s;

reg [7:0] frame_count1;
reg [7:0] frame_count2;
reg [7:0] frame_count3;
reg [7:0] frame_count4;

// reg [7:0] trig_tail0=8'h0;
// reg [7:0] trig_tail1=8'h1;
// reg [7:0] trig_tail2=8'h82;
// reg [7:0] trig_tail3=8'hB8;

reg [7:0] VTH1_REG_CNT;
reg [7:0] VTH2_REG_CNT;
reg [7:0] ARRAY_GAIN;


reg [3:0] config_en_count;

reg       config_done;
reg [7:0] trg_cnt;
reg [7:0] trg1_cnt;
reg       start_trg;
reg       hv_on_reg;
reg [7:0] tap_io;
reg [7:0] tap1_io;
reg [7:0] tap2_io;
reg [7:0] tap3_io;
reg [7:0] tap4_io;
reg [7:0] tap5_io;
reg [7:0] tap6_io;
reg [7:0] tap7_io;
reg [7:0] tap8_io;
reg [7:0] tap9_io;
reg [7:0] tap10_io;
reg [7:0] tap11_io;
reg       LD;

reg [1:0]      mode_en;

reg [4:0]      phase1_count0;
reg [4:0]      phase1_count1;
reg [4:0]      phase1_count2;
reg [4:0]      phase1_count3;
reg [4:0]      phase1_count4;
reg [4:0]      phase1_count5;
reg [4:0]      phase1_count6;
reg [4:0]      phase1_count7;
reg [4:0]      phase1_count8;
reg [4:0]      phase1_count9;
reg [4:0]      phase1_count10;
reg [4:0]      phase1_count11;



reg [4:0]      phase2_count0;
reg [4:0]      phase2_count1;
reg [4:0]      phase2_count2;
reg [4:0]      phase2_count3;
reg [4:0]      phase2_count4;
reg [4:0]      phase2_count5;
reg [4:0]      phase2_count6;
reg [4:0]      phase2_count7;
reg [4:0]      phase2_count8;
reg [4:0]      phase2_count9;
reg [4:0]      phase2_count10;
reg [4:0]      phase2_count11;

always@(posedge clk125)
begin
    if(rbcp_we)
    begin

      if(rbcp_addr==32'h00000001)
      begin
        if(rbcp_wd!=0)
        begin
          rstb_tcp<=1'b1;
        end
        else
        begin
          rstb_tcp<=0;
        end
      end
      if(rbcp_addr==32'h00000002 )
      begin
        if(rbcp_wd!=0)
        begin
          test_counter<=1'b1;
        end
        else
        begin
          test_counter<=0;
        end
      end
      // if(rbcp_addr==32'h00000003 )
      // begin
      //   if(rbcp_wd!=0)
      //   begin
      //     config_en<=1'b1;
      //   end
      //   else
      //   begin
      //     config_en<=0;
      //   end
      // end
      if(rbcp_addr==32'h00000003 )
      begin
          config_en_count<=rbcp_wd[3:0];
      end
      if(rbcp_addr==32'h00000004 )
      begin
        if(rbcp_wd!=0)
        begin
          clk_spi_tcp<=1'b1;
        end
        else
        begin
          clk_spi_tcp<=0;
        end
      end
      if(rbcp_addr==32'h00000005)
      begin
        if(rbcp_wd!=0)
        begin
          in_spi_tcp<=1'b1;
        end
        else
        begin
          in_spi_tcp<=0;
        end
      end
      if(rbcp_addr==32'h00000006)
      begin
        if(rbcp_wd!=0)
        begin
          load_gdac_tcp<=1'b1;
        end
        else
        begin
          load_gdac_tcp<=0;
        end
      end   
      if(rbcp_addr==32'h00000030)
      begin
        if(rbcp_wd!=0)
        begin
          load_gdac_tcp3<=1'b1;
        end
        else
        begin
          load_gdac_tcp3<=0;
        end
      end         
      if(rbcp_addr==32'h00000007)
      begin
        if(rbcp_wd!=0)
        begin
          spi_gdac_arrayb<=1'b1;
        end
        else
        begin
          spi_gdac_arrayb<=0;
        end
      end   
      if(rbcp_addr==32'h00000008)
      begin
        if(rbcp_wd!=0)
        begin
          read_start_matlab<=1'b1;
        end
        else
        begin
          read_start_matlab<=0;
        end
      end 
      if(rbcp_addr==32'h00000036)
      begin
        if(rbcp_wd!=0)
        begin
          start_trg<=1'b1;
        end
        else
        begin
          start_trg<=0;
        end
      end             
      if(rbcp_addr==32'h00000009)
      begin
          latch_pos<=rbcp_wd[3:0];
      end 
      // if(rbcp_addr==32'h00000022)
      // begin
      //     phase_count<=rbcp_wd[4:0];
      // end    
      // if(rbcp_addr==32'h0000002C)
      // begin
      //     phase1_count<=rbcp_wd[4:0];
      // end          
      // if(rbcp_addr==32'h0000002A)
      // begin
      //     chip0_s<=rbcp_wd[7:0];
      // end   
      // if(rbcp_addr==32'h0000002B)
      // begin
      //     chip1_s<=rbcp_wd[7:0];
      // end  

      if(rbcp_addr==32'h00000050)
      begin
          phase1_count0<=rbcp_wd[4:0];
      end    
      if(rbcp_addr==32'h00000051)
      begin
          phase1_count1<=rbcp_wd[4:0];
      end          
      if(rbcp_addr==32'h00000052)
      begin
          phase1_count2<=rbcp_wd[7:0];
      end   
      if(rbcp_addr==32'h00000053)
      begin
          phase1_count3<=rbcp_wd[7:0];
      end   
      if(rbcp_addr==32'h00000054)
      begin
          phase1_count4<=rbcp_wd[4:0];
      end    
      if(rbcp_addr==32'h00000055)
      begin
          phase1_count5<=rbcp_wd[4:0];
      end          
      if(rbcp_addr==32'h00000056)
      begin
          phase1_count6<=rbcp_wd[7:0];
      end   
      if(rbcp_addr==32'h00000057)
      begin
          phase1_count7<=rbcp_wd[7:0];
      end   
      if(rbcp_addr==32'h00000058)
      begin
          phase1_count8<=rbcp_wd[4:0];
      end    
      if(rbcp_addr==32'h00000059)
      begin
          phase1_count9<=rbcp_wd[4:0];
      end          
      if(rbcp_addr==32'h0000005A)
      begin
          phase1_count10<=rbcp_wd[7:0];
      end   
      if(rbcp_addr==32'h0000005B)
      begin
          phase1_count11<=rbcp_wd[7:0];
      end   
//
      if(rbcp_addr==32'h00000060)
      begin
          phase2_count0<=rbcp_wd[4:0];
      end    
      if(rbcp_addr==32'h00000061)
      begin
          phase2_count1<=rbcp_wd[4:0];
      end          
      if(rbcp_addr==32'h00000062)
      begin
          phase2_count2<=rbcp_wd[7:0];
      end   
      if(rbcp_addr==32'h00000063)
      begin
          phase2_count3<=rbcp_wd[7:0];
      end   
      if(rbcp_addr==32'h00000064)
      begin
          phase2_count4<=rbcp_wd[4:0];
      end    
      if(rbcp_addr==32'h00000065)
      begin
          phase2_count5<=rbcp_wd[4:0];
      end          
      if(rbcp_addr==32'h00000066)
      begin
          phase2_count6<=rbcp_wd[7:0];
      end   
      if(rbcp_addr==32'h00000067)
      begin
          phase2_count7<=rbcp_wd[7:0];
      end   
      if(rbcp_addr==32'h00000068)
      begin
          phase2_count8<=rbcp_wd[4:0];
      end    
      if(rbcp_addr==32'h00000069)
      begin
          phase2_count9<=rbcp_wd[4:0];
      end          
      if(rbcp_addr==32'h0000006A)
      begin
          phase2_count10<=rbcp_wd[7:0];
      end   
      if(rbcp_addr==32'h0000006B)
      begin
          phase2_count11<=rbcp_wd[7:0];
      end 

                 
      if(rbcp_addr==32'h00000023)
      begin
          frame_count4<=rbcp_wd[7:0];
      end  
      if(rbcp_addr==32'h00000024)
      begin
          frame_count3<=rbcp_wd[7:0];
      end  
      if(rbcp_addr==32'h00000025)
      begin
          frame_count2<=rbcp_wd[7:0];
      end  
      if(rbcp_addr==32'h00000026)
      begin
          frame_count1<=rbcp_wd[7:0];
      end 
      if(rbcp_addr==32'h0000002D)
      begin
          VTH1_REG_CNT[7:0]<=rbcp_wd[7:0];
      end 
      if(rbcp_addr==32'h0000002E)
      begin
          VTH2_REG_CNT[7:0]<=rbcp_wd[7:0];
      end 
      if(rbcp_addr==32'h0000002F)
      begin
          ARRAY_GAIN[7:0]<=rbcp_wd[7:0];
      end 
      if(rbcp_addr==32'h00000035)
      begin
          trg_cnt[7:0]<=rbcp_wd[7:0];
      end  
      if(rbcp_addr==32'h00000037)
      begin
          trg1_cnt[7:0]<=rbcp_wd[7:0];
      end            
      if(rbcp_addr==32'h00000027)
            begin
              if(rbcp_wd!=0)
              begin
                rst_ddr<=1'b1;
              end
              else
              begin
                rst_ddr<=0;
              end
            end   
      if(rbcp_addr==32'h0000000a)
            begin
              if(rbcp_wd!=0)
              begin
                config_load<=1'b1;
              end
              else
              begin
                config_load<=0;
              end
            end       
      if(rbcp_addr==32'h0000000b)
            begin
              if(rbcp_wd!=0)
              begin
                config_rst<=1'b1;
              end
              else
              begin
                config_rst<=0;
              end
            end
      if(rbcp_addr==32'h00000038)
      begin
          tap_io[7:0]<=rbcp_wd[7:0];
      end
      if(rbcp_addr==32'h00000039)
      begin
          tap1_io[7:0]<=rbcp_wd[7:0];
      end
      if(rbcp_addr==32'h00000040)
      begin
          tap2_io[7:0]<=rbcp_wd[7:0];
      end  
      if(rbcp_addr==32'h00000041)
      begin
          tap3_io[7:0]<=rbcp_wd[7:0];
      end
      if(rbcp_addr==32'h00000042)
      begin
          tap4_io[7:0]<=rbcp_wd[7:0];
      end
      if(rbcp_addr==32'h00000043)
      begin
          tap5_io[7:0]<=rbcp_wd[7:0];
      end  
      if(rbcp_addr==32'h00000044)
      begin
          tap6_io[7:0]<=rbcp_wd[7:0];
      end
      if(rbcp_addr==32'h00000045)
      begin
          tap7_io[7:0]<=rbcp_wd[7:0];
      end
      if(rbcp_addr==32'h00000046)
      begin
          tap8_io[7:0]<=rbcp_wd[7:0];
      end  
      if(rbcp_addr==32'h00000047)
      begin
          tap9_io[7:0]<=rbcp_wd[7:0];
      end
      if(rbcp_addr==32'h00000048)
      begin
          tap10_io[7:0]<=rbcp_wd[7:0];
      end
      if(rbcp_addr==32'h00000049)
      begin
          tap11_io[7:0]<=rbcp_wd[7:0];
      end                        
      if(rbcp_addr==32'h0000004A)
      begin
        if(rbcp_wd!=0)
        begin
          LD<=1'b1;
        end
        else
        begin
          LD<=0;
        end
      end     
      if(rbcp_addr==32'h0000004B)
      begin
          mode_en[1:0]<=rbcp_wd[1:0];
      end    
      // if(rbcp_addr==32'h00000070)
      // begin
      //     trig_tail0[7:0]<=rbcp_wd[7:0];
      // end    
      // if(rbcp_addr==32'h00000071)
      // begin
      //     trig_tail1[7:0]<=rbcp_wd[7:0];
      // end  
      // if(rbcp_addr==32'h00000072)
      // begin
      //     trig_tail2[7:0]<=rbcp_wd[7:0];
      // end    
      // if(rbcp_addr==32'h00000073)
      // begin
      //     trig_tail3[7:0]<=rbcp_wd[7:0];
      // end                      
      if(rbcp_addr==32'h0000000c)
      begin
          polpix<=rbcp_wd[1:0];
      end   
      if(rbcp_addr==32'h0000000d)
      begin
        if(rbcp_wd!=0)
        begin
          rstb_array_load<=1'b1;
        end
        else
        begin
          rstb_array_load<=0;
        end
      end 
      if(rbcp_addr==32'h0000000e)
      begin
          data_mux<=rbcp_wd[3:0];
      end                 
      if(rbcp_addr==32'h00000015)
      begin
        if(rbcp_wd!=0)
        begin
          chip_clk_en<=1'b1;
        end
        else
        begin
          chip_clk_en<=0;
        end
      end         
      if(rbcp_addr==32'h00000016)
      begin
        if(rbcp_wd!=0)
        begin
          rstb_chip<=1'b1;
        end
        else
        begin
          rstb_chip<=0;
        end
      end
      if(rbcp_addr==32'h00000017)
      begin
        if(rbcp_wd!=0)
        begin
          config2_chip<=1'b1;
        end
        else
        begin
          config2_chip<=0;
        end
      end 
      if(rbcp_addr==32'h00000018)
      begin
        if(rbcp_wd!=0)
        begin
          config3_chip<=1'b1;
        end
        else
        begin
          config3_chip<=0;
        end
      end   
      if(rbcp_addr==32'h00000019)
      begin
        if(rbcp_wd!=0)
        begin
          config4_chip<=1'b1;
        end
        else
        begin
          config4_chip<=0;
        end
      end 
      if(rbcp_addr==32'h0000001A)
      begin
        if(rbcp_wd!=0)
        begin
          config5_chip<=1'b1;
        end
        else
        begin
          config5_chip<=0;
        end
      end   
      if(rbcp_addr==32'h0000001B)
      begin
        if(rbcp_wd!=0)
        begin
          config6_chip<=1'b1;
        end
        else
        begin
          config6_chip<=0;
        end
      end 
      if(rbcp_addr==32'h0000001C)
      begin
        if(rbcp_wd!=0)
        begin
          config7_chip<=1'b1;
        end
        else
        begin
          config7_chip<=0;
        end
      end   
      if(rbcp_addr==32'h0000001D)
      begin
        if(rbcp_wd!=0)
        begin
          config8_chip<=1'b1;
        end
        else
        begin
          config8_chip<=0;
        end
      end 
      if(rbcp_addr==32'h0000001E)
      begin
        if(rbcp_wd!=0)
        begin
          config9_chip<=1'b1;
        end
        else
        begin
          config9_chip<=0;
        end
      end 
      if(rbcp_addr==32'h0000001F)
      begin
        if(rbcp_wd!=0)
        begin
          config10_chip<=1'b1;
        end
        else
        begin
          config10_chip<=0;
        end
      end   
      if(rbcp_addr==32'h00000020)
      begin
        if(rbcp_wd!=0)
        begin
          config11_chip<=1'b1;
        end
        else
        begin
          config11_chip<=0;
        end
      end 
      if(rbcp_addr==32'h00000021)
      begin
        if(rbcp_wd!=0)
        begin
          config12_chip<=1'b1;
        end
        else
        begin
          config12_chip<=0;
        end
      end  
      if(rbcp_addr==32'h00000033)
      begin
        if(rbcp_wd!=0)
        begin
          config_done<=1'b1;
        end
        else
        begin
          config_done<=0;
        end
      end  
      if(rbcp_addr==32'h00000034)
      begin
        if(rbcp_wd!=0)
        begin
          hv_on_reg<=1'b1;
        end
        else
        begin
          hv_on_reg<=0;
        end
      end                                       
      rbcp_reg_ack<=1;
      end  
      if(rbcp_reg_ack)
      begin
        rbcp_reg_ack<=0;
      end


end



assign HV_ON = hv_on_reg;
//cs_done
reg       csd_reg;
reg       csd_fre;
reg [4:0] csd_cnt;

always@(negedge clk1M or negedge config_done)
begin
    if(~config_done)
    begin
        csd_reg<=0; 
        csd_fre<=0;
        csd_cnt<=0;
    end
    else if(csd_cnt<5'd2)
    begin
        csd_reg<=1;
        csd_cnt<=csd_cnt+1'b1;
    end
    else if(csd_cnt==(5'd2))
    begin
        csd_reg<=0;
        csd_cnt<=csd_cnt+1'b1;
    end
    else if(csd_cnt==(5'd3))
    begin
        csd_reg<=0;
        csd_cnt<=csd_cnt+1'b1;
    end
    else
    begin
        csd_fre<=0;
    end
end
assign CSD_DONE = csd_reg;

//chip2
// reg       config2_reg;
// reg       config2_fre;
// reg [4:0] config2_cnt;

// always@(negedge clk1M or negedge config2_chip)
// begin
//     if(~config2_chip)
//     begin
//         config2_reg<=0; 
//         config2_fre<=0;
//         config2_cnt<=0;
//     end
//     else if(config2_cnt<5'd60)
//     begin
//         config2_reg<=1;
//         config2_cnt<=config2_cnt+1'b1;
//     end
//     else if(config2_cnt==(5'd60))
//     begin
//         config2_reg<=0;
//         config2_cnt<=config2_cnt+1'b1;
//     end
//     else if(config2_cnt==(5'd61))
//     begin
//         config2_reg<=0;
//         config2_cnt<=config2_cnt+1'b1;
//     end
//     else
//     begin
//         config2_fre<=0;
//     end
// end
reg config2_chip_r;
reg config2_chip_rr;
always@(posedge clk30)
begin
  config2_chip_r<=config2_chip; 
end
always@(posedge clk30)
begin
  config2_chip_rr<=config2_chip_r; 
end
assign CONFIG2_ST = ~config2_chip_rr&&config2_chip_r;
// assign CONFIG2_ST = config2_chip;
//chip2
//chip3
// reg       config3_reg;
// reg       config3_fre;
// reg [4:0] config3_cnt;

// always@(negedge clk1M or negedge config3_chip)
// begin
//     if(~config3_chip)
//     begin
//         config3_reg<=0; 
//         config3_fre<=0;
//         config3_cnt<=0;
//     end
//     else if(config3_cnt<5'd60)
//     begin
//         config3_reg<=1;
//         config3_cnt<=config3_cnt+1'b1;
//     end
//     else if(config3_cnt==(5'd60))
//     begin
//         config3_reg<=0;
//         config3_cnt<=config3_cnt+1'b1;
//     end
//     else if(config3_cnt==(5'd61))
//     begin
//         config3_reg<=0;
//         config3_cnt<=config3_cnt+1'b1;
//     end
//     else
//     begin
//         config3_fre<=0;
//     end
// end
reg config3_chip_r;
reg config3_chip_rr;
always@(posedge clk30)
begin
  config3_chip_r<=config3_chip; 
end
always@(posedge clk30)
begin
  config3_chip_rr<=config3_chip_r; 
end
assign CONFIG3_ST = ~config3_chip_rr&&config3_chip_r;
// assign CONFIG3_ST = config3_chip;
//chip3
//chip4
// reg       config4_reg;
// reg       config4_fre;
// reg [4:0] config4_cnt;

// always@(negedge clk1M or negedge config4_chip)
// begin
//     if(~config4_chip)
//     begin
//         config4_reg<=0; 
//         config4_fre<=0;
//         config4_cnt<=0;
//     end
//     else if(config4_cnt<5'd60)
//     begin
//         config4_reg<=1;
//         config4_cnt<=config4_cnt+1'b1;
//     end
//     else if(config4_cnt==(5'd60))
//     begin
//         config4_reg<=0;
//         config4_cnt<=config4_cnt+1'b1;
//     end
//     else if(config4_cnt==(5'd61))
//     begin
//         config4_reg<=0;
//         config4_cnt<=config4_cnt+1'b1;
//     end
//     else
//     begin
//         config4_fre<=0;
//     end
// end
reg config4_chip_r;
reg config4_chip_rr;
always@(posedge clk30)
begin
  config4_chip_r<=config4_chip; 
end
always@(posedge clk30)
begin
  config4_chip_rr<=config4_chip_r; 
end
assign CONFIG4_ST = ~config4_chip_rr&&config4_chip_r;
// assign CONFIG4_ST = config4_chip;
//chip4
//chip5
// reg       config5_reg;
// reg       config5_fre;
// reg [4:0] config5_cnt;

// always@(negedge clk1M or negedge config5_chip)
// begin
//     if(~config5_chip)
//     begin
//         config5_reg<=0; 
//         config5_fre<=0;
//         config5_cnt<=0;
//     end
//     else if(config5_cnt<5'd60)
//     begin
//         config5_reg<=1;
//         config5_cnt<=config5_cnt+1'b1;
//     end
//     else if(config5_cnt==(5'd60))
//     begin
//         config5_reg<=0;
//         config5_cnt<=config5_cnt+1'b1;
//     end
//     else if(config5_cnt==(5'd61))
//     begin
//         config5_reg<=0;
//         config5_cnt<=config5_cnt+1'b1;
//     end
//     else
//     begin
//         config5_fre<=0;
//     end
// end
reg config5_chip_r;
reg config5_chip_rr;
always@(posedge clk30)
begin
  config5_chip_r<=config5_chip; 
end
always@(posedge clk30)
begin
  config5_chip_rr<=config5_chip_r; 
end
assign CONFIG5_ST = ~config5_chip_rr&&config5_chip_r;
// assign CONFIG5_ST = config5_chip;
//chip5
//chip6
// reg       config6_reg;
// reg       config6_fre;
// reg [4:0] config6_cnt;

// always@(negedge clk1M or negedge config6_chip)
// begin
//     if(~config6_chip)
//     begin
//         config6_reg<=0; 
//         config6_fre<=0;
//         config6_cnt<=0;
//     end
//     else if(config6_cnt<5'd60)
//     begin
//         config6_reg<=1;
//         config6_cnt<=config6_cnt+1'b1;
//     end
//     else if(config6_cnt==(5'd60))
//     begin
//         config6_reg<=0;
//         config6_cnt<=config6_cnt+1'b1;
//     end
//     else if(config6_cnt==(5'd61))
//     begin
//         config6_reg<=0;
//         config6_cnt<=config6_cnt+1'b1;
//     end
//     else
//     begin
//         config6_fre<=0;
//     end
// end
reg config6_chip_r;
reg config6_chip_rr;
always@(posedge clk30)
begin
  config6_chip_r<=config6_chip; 
end
always@(posedge clk30)
begin
  config6_chip_rr<=config6_chip_r; 
end
assign CONFIG6_ST = ~config6_chip_rr&&config6_chip_r;
// assign CONFIG6_ST = config6_chip;
//chip6
//chip7
// reg       config7_reg;
// reg       config7_fre;
// reg [4:0] config7_cnt;

// always@(negedge clk1M or negedge config7_chip)
// begin
//     if(~config7_chip)
//     begin
//         config7_reg<=0; 
//         config7_fre<=0;
//         config7_cnt<=0;
//     end
//     else if(config7_cnt<5'd60)
//     begin
//         config7_reg<=1;
//         config7_cnt<=config7_cnt+1'b1;
//     end
//     else if(config7_cnt==(5'd60))
//     begin
//         config7_reg<=0;
//         config7_cnt<=config7_cnt+1'b1;
//     end
//     else if(config7_cnt==(5'd61))
//     begin
//         config7_reg<=0;
//         config7_cnt<=config7_cnt+1'b1;
//     end
//     else
//     begin
//         config7_fre<=0;
//     end
// end
reg config7_chip_r;
reg config7_chip_rr;
always@(posedge clk30)
begin
  config7_chip_r<=config7_chip; 
end
always@(posedge clk30)
begin
  config7_chip_rr<=config7_chip_r; 
end
assign CONFIG7_ST = ~config7_chip_rr&&config7_chip_r;
// assign CONFIG7_ST = config7_chip;
//chip7
//chip8
// reg       config8_reg;
// reg       config8_fre;
// reg [4:0] config8_cnt;

// always@(negedge clk1M or negedge config8_chip)
// begin
//     if(~config8_chip)
//     begin
//         config8_reg<=0; 
//         config8_fre<=0;
//         config8_cnt<=0;
//     end
//     else if(config8_cnt<5'd60)
//     begin
//         config8_reg<=1;
//         config8_cnt<=config8_cnt+1'b1;
//     end
//     else if(config8_cnt==(5'd60))
//     begin
//         config8_reg<=0;
//         config8_cnt<=config8_cnt+1'b1;
//     end
//     else if(config8_cnt==(5'd61))
//     begin
//         config8_reg<=0;
//         config8_cnt<=config8_cnt+1'b1;
//     end
//     else
//     begin
//         config8_fre<=0;
//     end
// end
reg config8_chip_r;
reg config8_chip_rr;
always@(posedge clk30)
begin
  config8_chip_r<=config8_chip; 
end
always@(posedge clk30)
begin
  config8_chip_rr<=config8_chip_r; 
end
assign CONFIG8_ST = ~config8_chip_rr&&config8_chip_r;
// assign CONFIG8_ST = config8_chip;
//chip8
//chip9
// reg       config9_reg;
// reg       config9_fre;
// reg [4:0] config9_cnt;

// always@(negedge clk1M or negedge config9_chip)
// begin
//     if(~config9_chip)
//     begin
//         config9_reg<=0; 
//         config9_fre<=0;
//         config9_cnt<=0;
//     end
//     else if(config9_cnt<5'd60)
//     begin
//         config9_reg<=1;
//         config9_cnt<=config9_cnt+1'b1;
//     end
//     else if(config9_cnt==(5'd60))
//     begin
//         config9_reg<=0;
//         config9_cnt<=config9_cnt+1'b1;
//     end
//     else if(config9_cnt==(5'd61))
//     begin
//         config9_reg<=0;
//         config9_cnt<=config9_cnt+1'b1;
//     end
//     else
//     begin
//         config9_fre<=0;
//     end
// end
reg config9_chip_r;
reg config9_chip_rr;
always@(posedge clk30)
begin
  config9_chip_r<=config9_chip; 
end
always@(posedge clk30)
begin
  config9_chip_rr<=config9_chip_r; 
end
assign CONFIG9_ST = ~config9_chip_rr&&config9_chip_r;
// assign CONFIG9_ST = config9_chip;
//chip9
//chip10
// reg       config10_reg;
// reg       config10_fre;
// reg [4:0] config10_cnt;

// always@(negedge clk1M or negedge config10_chip)
// begin
//     if(~config10_chip)
//     begin
//         config10_reg<=0; 
//         config10_fre<=0;
//         config10_cnt<=0;
//     end
//     else if(config10_cnt<5'd60)
//     begin
//         config10_reg<=1;
//         config10_cnt<=config10_cnt+1'b1;
//     end
//     else if(config10_cnt==(5'd60))
//     begin
//         config10_reg<=0;
//         config10_cnt<=config10_cnt+1'b1;
//     end
//     else if(config10_cnt==(5'd61))
//     begin
//         config10_reg<=0;
//         config10_cnt<=config10_cnt+1'b1;
//     end
//     else
//     begin
//         config10_fre<=0;
//     end
// end
reg config10_chip_r;
reg config10_chip_rr;
always@(posedge clk30)
begin
  config10_chip_r<=config10_chip; 
end
always@(posedge clk30)
begin
  config10_chip_rr<=config10_chip_r; 
end
assign CONFIG10_ST = ~config10_chip_rr&&config10_chip_r;
// assign CONFIG10_ST = config10_chip;
//chip10
//chip11
// reg       config11_reg;
// reg       config11_fre;
// reg [4:0] config11_cnt;

// always@(negedge clk1M or negedge config11_chip)
// begin
//     if(~config11_chip)
//     begin
//         config11_reg<=0; 
//         config11_fre<=0;
//         config11_cnt<=0;
//     end
//     else if(config11_cnt<5'd60)
//     begin
//         config11_reg<=1;
//         config11_cnt<=config11_cnt+1'b1;
//     end
//     else if(config11_cnt==(5'd60))
//     begin
//         config11_reg<=0;
//         config11_cnt<=config11_cnt+1'b1;
//     end
//     else if(config11_cnt==(5'd61))
//     begin
//         config11_reg<=0;
//         config11_cnt<=config11_cnt+1'b1;
//     end
//     else
//     begin
//         config11_fre<=0;
//     end
// end
reg config11_chip_r;
reg config11_chip_rr;
always@(posedge clk30)
begin
  config11_chip_r<=config11_chip; 
end
always@(posedge clk30)
begin
  config11_chip_rr<=config11_chip_r; 
end
assign CONFIG11_ST = ~config11_chip_rr&&config11_chip_r;
// assign CONFIG11_ST = config11_chip;
//chip11
//chip12
// reg       config12_reg;
// reg       config12_fre;
// reg [4:0] config12_cnt;

// always@(negedge clk1M or negedge config12_chip)
// begin
//     if(~config12_chip)
//     begin
//         config12_reg<=0; 
//         config12_fre<=0;
//         config12_cnt<=0;
//     end
//     else if(config12_cnt<5'd60)
//     begin
//         config12_reg<=1;
//         config12_cnt<=config12_cnt+1'b1;
//     end
//     else if(config12_cnt==(5'd60))
//     begin
//         config12_reg<=0;
//         config12_cnt<=config12_cnt+1'b1;
//     end
//     else if(config12_cnt==(5'd61))
//     begin
//         config12_reg<=0;
//         config12_cnt<=config12_cnt+1'b1;
//     end
//     else
//     begin
//         config12_fre<=0;
//     end
// end
reg config12_chip_r;
reg config12_chip_rr;
always@(posedge clk30)
begin
  config12_chip_r<=config12_chip; 
end
always@(posedge clk30)
begin
  config12_chip_rr<=config12_chip_r; 
end
assign CONFIG12_ST = ~config12_chip_rr&&config12_chip_r;
// assign CONFIG12_ST = config12_chip;
//chip12

// ila_0 ila_0 (
//     .clk(clk125),  
//     .probe0({clk30,wr_en,sync0,data_chip0, sync1,data_chip1,sync2,data_chip2,sync3,data_chip3,sync4,data_chip4,sync5,data_chip5,sync6,data_chip6,
//     sync7,sync8,sync9,sync10,sync11,data_chip7,data_chip8,data_chip9,data_chip10,data_chip11, data_mux,
//     frame,frame_cnt,rowWord_chain,rowWord_reg,data_fifo_out,sync_bit,fifo_empty_stream,fifo_full,fifo_tcp_wren})
// );


 
wire     cs_reg; //   
wire     ref_r;
wire     c_spi;
wire     l_gdac;
wire     a_in0;
wire     a_in1;
wire     a_in2;//
wire     a_in3; //
assign cs_reg=~config_en;
assign ref_r=refresh_reg;
assign c_spi=(spi_gdac_arrayb)?clk_spi_tcp:clk_spi_FPGA;
assign l_gdac=load_gdac_tcp;
assign a_in0=pixel_spi_word[27];
assign a_in1=(spi_gdac_arrayb)?in_spi_tcp:pixel_spi_word[27]; //shared by gdac_in_spi & array_in_spi
assign a_in2=pixel_spi_word[27];
assign a_in3=pixel_spi_word[27];

// ila_6 ila_6 (
//   .clk(clk3), // input wire clk


//   .probe0(cs_reg), // input wire [0:0]  probe0  
//   .probe1(ref_r), // input wire [0:0]  probe1 
//   .probe2(c_spi), // input wire [0:0]  probe2 
//   .probe3(l_gdac), // input wire [0:0]  probe3 
//   .probe4(a_in0), // input wire [0:0]  probe4 
//   .probe5(a_in1), // input wire [0:0]  probe5 
//   .probe6(a_in2), // input wire [0:0]  probe6 
//   .probe7(a_in3) // input wire [0:0]  probe7
// );

wire        SPIEE_PD;

wire        RD_ST;

wire        DATA0_EN;
wire        DATA1_EN;

wire [15:0] DATA0_OUT;
wire [15:0] DATA1_OUT;

wire        FRAME_OUT;
wire        phase0_ok;

wire        NEX_ST;


wire [7:0] A1_REG1;
wire [7:0] A1_REG2;
wire [7:0] A1_REG3;
wire [7:0] A1_REG4;
wire [7:0] A1_REG5;
wire [7:0] A1_REG6;
wire [7:0] A1_REG7;
wire [7:0] A1_REG8;
wire [7:0] A1_REG9;
wire [7:0] A1_REG10;
wire [7:0] A1_REG11;
wire [7:0] A1_REG12;

wire [7:0] A2_REG1;
wire [7:0] A2_REG2;
wire [7:0] A2_REG3;
wire [7:0] A2_REG4;
wire [7:0] A2_REG5;
wire [7:0] A2_REG6;
wire [7:0] A2_REG7;
wire [7:0] A2_REG8;
wire [7:0] A2_REG9;
wire [7:0] A2_REG10;
wire [7:0] A2_REG11;
wire [7:0] A2_REG12;

  bp0_top bp0_top (
      .CLK_120M         (clk360),
      .CLK_READ         (clk_read),
      .CLK_80M          (clk_80),
      .CLK_125M         (clk125),
      .CLK_20M          (clk30_270),
      .FNT_EN           (wr_en),
      .RST              (~rstb_tcp),//~rstb_tcp
      .FRAME_IN         (frame),
      .PHASE1_CNT0      (phase1_count0),
      .PHASE1_CNT1      (phase1_count1),
      .PHASE1_CNT2      (phase1_count2),
      .PHASE1_CNT3      (phase1_count3),
      .PHASE1_CNT4      (phase1_count4),
      .PHASE1_CNT5      (phase1_count5),
      .PHASE1_CNT6      (phase1_count6),
      .PHASE1_CNT7      (phase1_count7),
      .PHASE1_CNT8      (phase1_count8),
      .PHASE1_CNT9      (phase1_count9),
      .PHASE1_CNT10     (phase1_count10),
      .PHASE1_CNT11     (phase1_count11),            
      // .CHIP_S           (chip0_s),
      .FRAME_OUT        (FRAME_OUT),
      .P_OK             (phase0_ok),
      // .FRMAE_CNT        (frame_cnt[3:0]),
      .SYNC1            (sync0),
      .SYNC2            (sync1),
      .SYNC3            (sync2),
      .SYNC4            (sync3), 
      .SYNC5            (sync4),
      .SYNC6            (sync5),
      .SYNC7            (sync6),
      .SYNC8            (sync7),
      .SYNC9            (sync8),
      .SYNC10           (sync9),
      .SYNC11           (sync10),
      .SYNC12           (sync11),                             
      .A_REG1           (A1_REG1),
      .A_REG2           (A1_REG2),
      .A_REG3           (A1_REG3),
      .A_REG4           (A1_REG4),
      .A_REG5           (A1_REG5),
      .A_REG6           (A1_REG6),
      .A_REG7           (A1_REG7),
      .A_REG8           (A1_REG8),
      .A_REG9           (A1_REG9),
      .A_REG10          (A1_REG10),
      .A_REG11          (A1_REG11),
      .A_REG12          (A1_REG12),
      .chip1            (data_chip0),
      .chip2            (data_chip1),
      .chip3            (data_chip2),
      .chip4            (data_chip3),
      .chip5            (data_chip4),
      .chip6            (data_chip5),
      .chip7            (data_chip6),
      .chip8            (data_chip7),
      .chip9            (data_chip8),
      .chip10           (data_chip9),
      .chip11           (data_chip10),
      .chip12           (data_chip11),  
      .RD_ST_OUT        (RD_ST),  
      .NEX_ST           (NEX_ST),   
      .DATA_EN          (DATA0_EN),
      .DATA_OUT         (DATA0_OUT));


wire     phase_ok;
wire        FRAME1_OUT;

wire     chipread_flag;

  bp_top bp1_top (
      .CLK_120M         (clk360),
      .CLK_READ         (clk_read),
      .CLK_80M          (clk_80),
      .CLK_125M         (clk125),
      .CLK_20M          (clk30_270),
      .FNT_EN           (wr_en),
      .RST              (~rstb_tcp),//~rstb_tcp
      .FRAME_IN         (frame),
      .PHASE2_CNT0      (phase2_count0),
      .PHASE2_CNT1      (phase2_count1),
      .PHASE2_CNT2      (phase2_count2),
      .PHASE2_CNT3      (phase2_count3),
      .PHASE2_CNT4      (phase2_count4),
      .PHASE2_CNT5      (phase2_count5),
      .PHASE2_CNT6      (phase2_count6),
      .PHASE2_CNT7      (phase2_count7),
      .PHASE2_CNT8      (phase2_count8),
      .PHASE2_CNT9      (phase2_count9),
      .PHASE2_CNT10     (phase2_count10),
      .PHASE2_CNT11     (phase2_count11),  
      // .CHIP_S           (chip1_s),
      .RD_ST_IN         (RD_ST),
      .FRAME_OUT        (FRAME1_OUT),
      .P_OK             (phase_ok),
      // .FRMAE_CNT        (frame_cnt[3:0]),
      .SYNC1            (sync1_0),
      .SYNC2            (sync1_1),
      .SYNC3            (sync1_2),
      .SYNC4            (sync1_3), 
      .SYNC5            (sync1_4),
      .SYNC6            (sync1_5),
      .SYNC7            (sync1_6),
      .SYNC8            (sync1_7),
      .SYNC9            (sync1_8),
      .SYNC10           (sync1_9),
      .SYNC11           (sync1_10),
      .SYNC12           (sync1_11), 
      .A_REG1           (A2_REG1),
      .A_REG2           (A2_REG2),
      .A_REG3           (A2_REG3),
      .A_REG4           (A2_REG4),
      .A_REG5           (A2_REG5),
      .A_REG6           (A2_REG6),
      .A_REG7           (A2_REG7),
      .A_REG8           (A2_REG8),
      .A_REG9           (A2_REG9),
      .A_REG10          (A2_REG10),
      .A_REG11          (A2_REG11),
      .A_REG12          (A2_REG12),

      .chipread_flag    (chipread_flag),

      .chip1            (data1_chip0),
      .chip2            (data1_chip1),
      .chip3            (data1_chip2),
      .chip4            (data1_chip3),
      .chip5            (data1_chip4),
      .chip6            (data1_chip5),
      .chip7            (data1_chip6),
      .chip8            (data1_chip7),
      .chip9            (data1_chip8),
      .chip10           (data1_chip9),
      .chip11           (data1_chip10),
      .chip12           (data1_chip11),      
      .DATA_EN          (DATA1_EN),
      .DATA_OUT         (DATA1_OUT));

wire             data_empty;
wire             FIFO_EN;
reg [15:0]       FIFO_DATAIN;



  gate_gen gate_gen (
      .CLK              (clk30),
      .F_IN             (FRAME_OUT),
      .RST              (~rstb_tcp),//~rstb_tcp
      .F_CNT            ({2'd0,frame_countall[31:2]}),
      .F_OUT            ());

// assign FIFO_EN = DATA0_EN || DATA1_EN;
// assign FIFO_DATAIN[15:0]=(DATA0_EN)?DATA0_OUT[15:0]:DATA1_OUT[15:0];
FD zz (.D((DATA0_EN || DATA1_EN)&&trg_en&&read_start_matlab), .C(clk_read), .Q(FIFO_EN));


wire             read_rst;

assign read_rst = ~rstb_tcp;

always @(posedge clk_read or posedge read_rst) begin
            if (read_rst) begin
              FIFO_DATAIN[15:0] <= 16'd0;
            end
            else if (DATA0_EN) begin //spiee_r
              FIFO_DATAIN[15:0] <= DATA0_OUT[15:0];
            end 
            else begin
              FIFO_DATAIN[15:0] <= DATA1_OUT[15:0];
            end
end









// ila_WHY ila_WHY (
//   .clk(clk_read), // input wire clk


//   .probe0(FIFO_EN), // input wire [0:0]  probe0  
//   .probe1(DATA1_EN), // input wire [0:0]  probe1 
//   .probe2(DATA0_EN), // input wire [0:0]  probe2 
//   .probe3(FIFO_DATAIN[15:0]), // input wire [15:0]  probe3 
//   .probe4(DATA1_OUT[15:0]), // input wire [15:0]  probe4 
//   .probe5(DATA0_OUT[15:0]) // input wire [15:0]  probe5
// );


wire     f_full;

fifo_generator_1 fifo_generator_1(
    .rst(~rstb_tcp),
    .wr_clk(clk_read),
    .rd_clk(clk_80),
    .din(FIFO_DATAIN[15:0]),   
    .wr_en(FIFO_EN),
    .rd_en(~data_empty),
    .dout(FIFO_DOUT),
    .full(f_full),
    .empty(data_empty),
    .valid(FIFO_VALID),           
    .wr_rst_busy(),
    .rd_rst_busy()
  );




// ila_SIU ila_SIU (
//   .clk(clk_80), // input wire clk


//   .probe0(f_full), // input wire [0:0]  probe0  
//   .probe1(data_empty), // input wire [0:0]  probe1 
//   .probe2(FIFO_VALID), // input wire [0:0]  probe2 
//   .probe3(FIFO_DOUT[63:0]) // input wire [63:0]  probe3
// );

//=======================================================================================
wire DDRtoTCP_fifo_full;
wire DDRtoTCP_fifo_empty;
wire DDRtoTCP_fifo_re;


reg [31:0]  bp_top_cnt;

always @(posedge clk_80 or posedge data_rst) begin
            if (data_rst) begin
              bp_top_cnt <= 32'd0;
            end
            else if (FIFO_VALID) begin //spiee_r
              bp_top_cnt <= bp_top_cnt+1'b1;
            end 
            else begin
              bp_top_cnt <= bp_top_cnt;
            end
end
// wire [11:0] device_temp;
// padding top

// PADDING_TOP PADDING_TOP(
//   .CLK            (clk_80),                  // in : Clock
//   .RST            (data_rst),                  // in : System reset
//   .START          (SPIEE_PD),            //ILA
//   .DATAENI        (FIFO_VALID),            //ILA
//   .DATAIN         (FIFO_DOUT),             // in : Number of event to be generated
//   .DATAENO        (ddr3_fifo_wr_en),            // out: Trigger pulse
//   .DATAOUT        (ddr3_fifo_wr_data)
// );



assign fifo_tcp_wren=(~fifo_empty_stream)&&(~tcp_tx_full);

// fifo_generator_0 fifo_chip2tcp6(
//     .rst(data_rst),//~rstb_tcp
//     .wr_clk(clk_80),
//     .rd_clk(clk125),
//     .din(ddr3_fifo_rd_data),   
//     .wr_en(ddr3_fifo_rd_valid),
//     .rd_en(fifo_tcp_wren),
//     .dout(data_fifo_out),
//     .full(fifo_full),
//     .empty(fifo_empty_stream),
//     .wr_rst_busy(),
//     .rd_rst_busy()
//   );


fifo_generator_0 fifo_chip2tcp6 (
  .rst(data_rst),                  // input wire rst
  .wr_clk(clk_80),            // input wire wr_clk
  .rd_clk(clk125),            // input wire rd_clk
  .din(ddr3_fifo_rd_data),                  // input wire [63 : 0] din
  .wr_en(ddr3_fifo_rd_valid),              // input wire wr_en
  .rd_en(fifo_tcp_wren),              // input wire rd_en
  .dout(data_fifo_out),                // output wire [7 : 0] dout
  .full(),                // output wire full
  .almost_full(fifo_full),  // output wire almost_full
  .empty(fifo_empty_stream),              // output wire empty
  .valid(tcp_tx_wr),              // output wire valid
  .wr_rst_busy(),  // output wire wr_rst_busy
  .rd_rst_busy()  // output wire rd_rst_busy
);

//125m




reg [31:0]  tcp_top_cnt;

always @(posedge clk125 or posedge data_rst) begin
            if (data_rst) begin
              tcp_top_cnt <= 32'd0;
            end
            else if (ddr3_fifo_rd_valid) begin //spiee_r
              tcp_top_cnt <= tcp_top_cnt+1'b1;
            end 
            else begin
              tcp_top_cnt <= tcp_top_cnt;
            end
end




wire  data_rst;

// assign data_rst = ~tcp_open|~locked;
assign data_rst = ~locked||rst_ddr;
  
ddr3_fifo_wrapper ddr2fifo_wrapper(
  // Inouts
  .ddr3_dq(ddr3_dq),
  .ddr3_dqs_n(ddr3_dqs_n),
  .ddr3_dqs_p(ddr3_dqs_p),

  // Outputs
  .ddr3_addr(ddr3_addr),
  .ddr3_ba(ddr3_ba),
  .ddr3_ras_n(ddr3_ras_n),
  .ddr3_cas_n(ddr3_cas_n),
  .ddr3_we_n(ddr3_we_n),
  .ddr3_reset_n(ddr3_reset_n),
  .ddr3_ck_p(ddr3_ck_p),
  .ddr3_ck_n(ddr3_ck_n),
  .ddr3_cke(ddr3_cke),
  
  .ddr3_cs_n(ddr3_cs_n),
  
  .ddr3_dm(ddr3_dm),
  
  .ddr3_odt(ddr3_odt),

  // Single-ended system clock
  .sys_clk_i(clk200),
  .init_calib_complete(),
  .sys_rst(data_rst),  //&& clk_locked

  // User FIFO Interface
  .fifo_clk(clk_80),  // 80MHz
  .fifo_wr_en(FIFO_VALID),
  .fifo_wr_data(FIFO_DOUT),
  .fifo_rd_en(ddr3_fifo_rd_en),
  .fifo_rd_valid(ddr3_fifo_rd_valid),
  .fifo_rd_data(ddr3_fifo_rd_data),  
  .fifo_empty(ddr3_fifo_empty),
  .fifo_full(ddr3_fifo_full)

);

    
assign ddr3_fifo_rd_en = ~ddr3_fifo_empty && ~fifo_full;


// reg [31:0]  ddr_top_cnt;

// always @(posedge clk_80 or posedge data_rst) begin
//             if (data_rst) begin
//               ddr_top_cnt <= 32'd0;
//             end
//             else if (ddr3_fifo_rd_valid) begin //spiee_r
//               ddr_top_cnt <= ddr_top_cnt+1'b1;
//             end 
//             else begin
//               ddr_top_cnt <= ddr_top_cnt;
//             end
// end

assign RST_DDR = rst_ddr;




assign ARRAY_REG = {19'b0,VTH2_REG_CNT[4:0],VTH1_REG_CNT[4:0],ARRAY_GAIN[2:0]};

// ila_BP your_instance_name (
//   .clk(clk125), // input wire clk


//   .probe0(VTH2_REG_CNT[7:0]), // input wire [7:0]  probe0  
//   .probe1(VTH1_REG_CNT[7:0]), // input wire [7:0]  probe1 
//   .probe2(ARRAY_GAIN[7:0]) // input wire [7:0]  probe2
// );


//RBCP2WB

wire       ack;
wire [1:0] adr;

wire [7:0] dout;
wire       cyc;
wire       stb;
wire       sel;
wire       we;


wire       ack3;
wire [1:0] adr3;

wire [7:0] dout3;
wire       cyc3;
wire       stb3;



//  Input buffer
reg   [15:0]  irAddr;
reg   [7 :0]  irWd;
always@ (posedge clk125) begin
  if(rst) begin
    irAddr <= 0;
    irWd   <= 0;
  end
  else if(rbcp_we | rbcp_re) begin
    irAddr <= rbcp_addr[15:0];
    irWd   <= rbcp_wd;
  end
end

reg   irRe;
reg   regCs;

always@ (posedge clk125) begin
    irRe   <= rbcp_re;
    regCs  <= (rbcp_addr[31:24]==8'h1); // 0x0~0xF
end

reg           irWR;
// always @(posedge clk125)
//   if(rst) irWR <= 0;
//   else if((rbcp_we)&&(irAddr[15:8]==8'hFF)) irWR <= 1'b1;
//     else if(ack | ~rbcp_act) irWR <= 0;


reg           irCyc;
reg           ii2Cyc;
reg           ii3Cyc;

reg           irCyc3;


always @(posedge clk125)
  if(rst) irCyc <= 0;
  // else if((rbcp_we | rbcp_re)&&(irAddr[15:8]==8'hFF)) irCyc <= 1'b1;
  else if((rbcp_we | rbcp_re)&&(rbcp_addr[15:8]==8'hFF)) irCyc <= 1'b1;
    else if(ack | ~rbcp_act) irCyc <= 0;

always @(posedge clk125)
  if(rst) ii2Cyc <= 0;
  // else if((rbcp_we | rbcp_re)&&(irAddr[15:8]==8'hFF)) irCyc <= 1'b1;
  else if((rbcp_we | rbcp_re)&&(rbcp_addr[15:8]==8'hFE)) ii2Cyc <= 1'b1;
    else if(ii2cack | ~rbcp_act) ii2Cyc <= 0;

always @(posedge clk125)
  if(rst) ii3Cyc <= 0;
  // else if((rbcp_we | rbcp_re)&&(irAddr[15:8]==8'hFF)) irCyc <= 1'b1;
  else if((rbcp_we | rbcp_re)&&(rbcp_addr[15:8]==8'hFD)) ii3Cyc <= 1'b1;
    else if(ii3cack | ~rbcp_act) ii3Cyc <= 0;


always @(posedge clk125)
  if(rst) irCyc3 <= 0;
  // else if((rbcp_we | rbcp_re)&&(irAddr[15:8]==8'hFF)) irCyc <= 1'b1;
  else if((rbcp_we | rbcp_re)&&(rbcp_addr[15:8]==8'hFC)) irCyc3 <= 1'b1;
    else if(ack3 | ~rbcp_act) irCyc3 <= 0;

// always @(posedge clk125)
//   if(rst) begin
//     irCyc <= 0;
//     ii2Cyc <= 0;
//     ii3Cyc <= 0;
//   end
//   // else if((rbcp_we | rbcp_re)&&(irAddr[15:8]==8'hFF)) irCyc <= 1'b1;
//   else if((rbcp_we | rbcp_re)&&(rbcp_addr[15:8]==8'hFF)) begin
//     irCyc <= 1'b1;
//   end
//   else if((rbcp_we | rbcp_re)&&(rbcp_addr[15:8]==8'hFE)) begin
//     ii2Cyc <= 1'b1;
//   end 
//   else if((rbcp_we | rbcp_re)&&(rbcp_addr[15:8]==8'hFD)) begin
//     ii3Cyc <= 1'b1;
//   end
//   else if(ack | ~rbcp_act) begin
//     irCyc <= 0; 
//     ii2Cyc <= 0;
//     ii3Cyc <= 0;
//   end
//   else begin
//     irCyc <= irCyc; 
//     ii2Cyc <= ii2Cyc;   
//     ii3Cyc <= ii3Cyc;  
//   end
wire [2:0]   iicaddr;
wire [7:0]   iicadin;
   
wire         iic2cyc;
wire         iic2stb;
wire         iic2sel;
    
wire         iic3cyc;
wire         iic3stb;
wire         iic3sel;
// assign adr  = irAddr[1:0];
assign adr  = rbcp_addr[1:0];
// assign dout = irWd;
assign dout = rbcp_wd;
assign cyc  = irCyc;
assign stb  = irCyc;
assign sel  = irCyc;
assign we   = irWR;



assign adr3  = rbcp_addr[1:0];
// assign dout = irWd;
assign dout3 = rbcp_wd;
assign cyc3  = irCyc3;
assign stb3  = irCyc3;




assign iicaddr = rbcp_addr[2:0];
assign iicadin = rbcp_wd;

assign iic2cyc  = ii2Cyc;
assign iic2stb  = ii2Cyc;
assign iic2sel  = ii2Cyc;

assign iic3cyc  = ii3Cyc;
assign iic3stb  = ii3Cyc;
assign iic3sel  = ii3Cyc;

// assign rbcp_rd  = din;
// assign rbcp_ack = ack;

//RBCP2WB

wire sck_o;
wire mosi_o;


wire sck3_o;
wire mosi3_o;

simple_spi_top simple_spi_top(
  .clk_i   ( clk125   ),
  .rst_i   ( ~rst   ),
  .cyc_i   ( cyc   ),
  .stb_i   ( stb   ),
  .adr_i   ( adr   ),
  .we_i    ( 1'b1    ),
  .dat_i   ( dout   ),
  .dat_o   (    ),
  .ack_o   ( ack   ),
  .inta_o  (   ),
  .sck_o   ( sck_o   ),
  .mosi_o  ( mosi_o  ),
  .miso_i  (   )
  );


simple_spi_top simple_spi3_top(
  .clk_i   ( clk125   ),
  .rst_i   ( ~rst   ),
  .cyc_i   ( cyc3   ),
  .stb_i   ( stb3   ),
  .adr_i   ( adr3   ),
  .we_i    ( 1'b1    ),
  .dat_i   ( dout3   ),
  .dat_o   (    ),
  .ack_o   ( ack3   ),
  .inta_o  (   ),
  .sck_o   ( sck3_o   ),
  .mosi_o  ( mosi3_o  ),
  .miso_i  (   )
  );


i2c_master_top ii2c(
  // wishbone interface
  .wb_clk_i     (clk125),
  .wb_rst_i     (rst),
  .arst_i       (0),
  .wb_adr_i     (iicaddr[2:0]),
  .wb_dat_i     (iicadin[7:0]),
  .wb_dat_o     (),
  .wb_we_i      (1'b1),
  .wb_stb_i     (iic2stb),
  .wb_cyc_i     (iic2cyc),
  .wb_ack_o     (ii2cack),
  .wb_inta_o    (),
  // i2c signals
  .scl_pad_i    (S2CL),
  .scl_pad_o    (S2CL_O),
  .scl_padoen_o (S2CL_OEN),
  .sda_pad_i    (S2DA),
  .sda_pad_o    (S2DA_O),
  .sda_padoen_o (S2DA_OEN)
);

i2c_master_top ii3c(
  // wishbone interface
  .wb_clk_i     (clk125),
  .wb_rst_i     (rst),
  .arst_i       (0),
  .wb_adr_i     (iicaddr[2:0]),
  .wb_dat_i     (iicadin[7:0]),
  .wb_dat_o     (),
  .wb_we_i      (1'b1),
  .wb_stb_i     (iic3stb),
  .wb_cyc_i     (iic3cyc),
  .wb_ack_o     (ii3cack),
  .wb_inta_o    (),
  // i2c signals
  .scl_pad_i    (S3CL),
  .scl_pad_o    (S3CL_O),
  .scl_padoen_o (S3CL_OEN),
  .sda_pad_i    (S3DA),
  .sda_pad_o    (S3DA_O),
  .sda_padoen_o (S3DA_OEN)
);



reg           i2c_cs;


//  Input buffer

wire [15: 0]  arb_addr = rbcp_addr[31:16];

always@ (posedge clk125) begin
  if(rst) begin
    i2c_cs  <= 0;
  end
  else begin
    i2c_cs   <= (arb_addr==16'h2);
  end
end


////////////////////////////////////////////////////////////////////////////////
// RBCP and WishBone Bus bridge
wire  [7:0]   w2r_dat;
wire          w2r_ack;
wire  [15:0]  wb_adr;
reg   [7 :0]  wb_dat_slave;
wire  [7 :0]  wb_dat_master;
wire          wb_we;
wire          wb_stb;
wire          wb_cyc;
wire          wb_ack;

RBCP2WB RBCP_to_WishboneBus(
  // system
  .clk        (clk125),          // in
  .rst        (rst),          // in
  // RBCP
  .rbcp_we    (rbcp_we),      // in
  .rbcp_re    (rbcp_re),      // in
  .rbcp_wd    (rbcp_wd),      // in
  .rbcp_addr  (rbcp_addr[15:0]),// in
  .rbcp_act   (rbcp_act),     // in
  .rbcp_rd    (w2r_dat),       // out
  .rbcp_ack   (w2r_ack),      // out
  // WishBone bus
  .adr        (wb_adr),       // out
  .din        (wb_dat_slave), // in
  .dout       (wb_dat_master),// out
  .cyc        (wb_cyc),       // out
  .stb        (wb_stb),       // out
  .we         (wb_we),        // out
  .sel        (),             // out
  .ack        (wb_ack),       // in
  .err        (0),            // in
  .rty        (0)             // in
);

//------------------------------------------------------------------------------
reg   [7:0]   rdDataA     ;
reg           regRv;
reg           regAck;
always@ (posedge clk125) begin
  regRv  <= (irRe    ? regCs : 2'd0);
  regAck      <= regCs & irRe;
end

// always@ (posedge clk125) begin
//   case(irAddr[3:0])
//     4'h0:   rdDataA[7:0]    <= {7'h0,chip_tcp_done};
//     4'h1:   rdDataA[7:0]    <= {7'h0,phase_ok&&phase0_ok};//4'h1:   rdDataA[7:0]    <= 8'd11;
//     4'h2:   rdDataA[7:0]    <= 8'd11;
//     4'h3:   rdDataA[7:0]    <= 8'd11;
//     4'h4:   rdDataA[7:0]    <= 8'd11;
//     4'h5:   rdDataA[7:0]    <= 8'd11;
//     4'h6:   rdDataA[7:0]    <= 8'd11; // Window size [10:8]
//     4'h7:   rdDataA[7:0]    <= 8'd11;        // Window size [7:0]
//     4'h8:   rdDataA[7:0]    <= 8'd11;        // Kill chain load start
//     4'h9:   rdDataA[7:0]    <= 8'd11; // PMbus address
//     4'hA:   rdDataA[7:0]    <= 8'd11;     // PMbus control register, 1: PMBUS_CTRL high; 0: PMBUS_CTRL low
//     4'hB:   rdDataA[7:0]    <= 8'd11;     // PMbus alert register, 1: Alert
//     4'hC:   rdDataA[7:0]    <= 8'd13;     // Clock divide factor for BPIX
//     4'hD:   rdDataA[7:0]    <= 8'd14;     // BPIX chip select
//     4'hE:   rdDataA[7:0]    <= 8'd15;     // Test register, [2]: Read_test_b; [1]: bit_pattern; [0]: test_counter;
//     4'hF:   rdDataA[7:0]    <= 8'd16;//STATUS[7:0];
//   endcase
// end
wire   [7:0]  A1_REGX1;
wire   [7:0]  A1_REGX2;
wire   [7:0]  A1_REGX3;
wire   [7:0]  A1_REGX4;
wire   [7:0]  A1_REGX5;
wire   [7:0]  A1_REGX6;
wire   [7:0]  A1_REGX7;
wire   [7:0]  A1_REGX8;
wire   [7:0]  A1_REGX9;
wire   [7:0]  A1_REGX10;
wire   [7:0]  A1_REGX11;
wire   [7:0]  A1_REGX12;
wire   [7:0]  A2_REGX1;
wire   [7:0]  A2_REGX2;
wire   [7:0]  A2_REGX3;
wire   [7:0]  A2_REGX4;
wire   [7:0]  A2_REGX5;
wire   [7:0]  A2_REGX6;
wire   [7:0]  A2_REGX7;
wire   [7:0]  A2_REGX8;
wire   [7:0]  A2_REGX9;
wire   [7:0]  A2_REGX10;
wire   [7:0]  A2_REGX11;
wire   [7:0]  A2_REGX12;





REG_ALIGN REG_ALIGN1(
  .A_REG          (A1_REG1),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'h1),
  .clk125         (clk125),
  .A_REGX         (A1_REGX1));

REG_ALIGN REG_ALIGN2(
  .A_REG          (A1_REG2),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'h2),
  .clk125         (clk125),
  .A_REGX         (A1_REGX2));

REG_ALIGN REG_ALIGN3(
  .A_REG          (A1_REG3),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'h3),
  .clk125         (clk125),
  .A_REGX         (A1_REGX3));

REG_ALIGN REG_ALIGN4(
  .A_REG          (A1_REG4),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'h4),
  .clk125         (clk125),
  .A_REGX         (A1_REGX4));


REG_ALIGN REG_ALIGN5(
  .A_REG          (A1_REG5),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'h5),
  .clk125         (clk125),
  .A_REGX         (A1_REGX5));

REG_ALIGN REG_ALIGN6(
  .A_REG          (A1_REG6),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'h6),
  .clk125         (clk125),
  .A_REGX         (A1_REGX6));

REG_ALIGN REG_ALIGN7(
  .A_REG          (A1_REG7),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'h7),
  .clk125         (clk125),
  .A_REGX         (A1_REGX7));

REG_ALIGN REG_ALIGN8(
  .A_REG          (A1_REG8),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'h8),
  .clk125         (clk125),
  .A_REGX         (A1_REGX8));

REG_ALIGN REG_ALIGN9(
  .A_REG          (A1_REG9),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'h9),
  .clk125         (clk125),
  .A_REGX         (A1_REGX9));

REG_ALIGN REG_ALIGN10(
  .A_REG          (A1_REG10),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'hA),
  .clk125         (clk125),
  .A_REGX         (A1_REGX10));

REG_ALIGN REG_ALIGN11(
  .A_REG          (A1_REG11),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'hB),
  .clk125         (clk125),
  .A_REGX         (A1_REGX11));


REG_ALIGN REG_ALIGN12(
  .A_REG          (A1_REG12),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'hC),
  .clk125         (clk125),
  .A_REGX         (A1_REGX12));

REG_ALIGN REG_ALIGN13(
  .A_REG          (A2_REG1),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'h1),
  .clk125         (clk125),
  .A_REGX         (A2_REGX1));

REG_ALIGN REG_ALIGN14(
  .A_REG          (A2_REG2),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'h2),
  .clk125         (clk125),
  .A_REGX         (A2_REGX2));

REG_ALIGN REG_ALIGN15(
  .A_REG          (A2_REG3),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'h3),
  .clk125         (clk125),
  .A_REGX         (A2_REGX3));

REG_ALIGN REG_ALIGN16(
  .A_REG          (A2_REG4),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'h4),
  .clk125         (clk125),
  .A_REGX         (A2_REGX4));


REG_ALIGN REG_ALIGN17(
  .A_REG          (A2_REG5),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'h5),
  .clk125         (clk125),
  .A_REGX         (A2_REGX5));

REG_ALIGN REG_ALIGN18(
  .A_REG          (A2_REG6),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'h6),
  .clk125         (clk125),
  .A_REGX         (A2_REGX6));

REG_ALIGN REG_ALIGN19(
  .A_REG          (A2_REG7),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'h7),
  .clk125         (clk125),
  .A_REGX         (A2_REGX7));

REG_ALIGN REG_ALIGN20(
  .A_REG          (A2_REG8),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'h8),
  .clk125         (clk125),
  .A_REGX         (A2_REGX8));

REG_ALIGN REG_ALIGN21(
  .A_REG          (A2_REG9),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'h9),
  .clk125         (clk125),
  .A_REGX         (A2_REGX9));

REG_ALIGN REG_ALIGN22(
  .A_REG          (A2_REG10),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'hA),
  .clk125         (clk125),
  .A_REGX         (A2_REGX10));

REG_ALIGN REG_ALIGN23(
  .A_REG          (A2_REG11),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'hB),
  .clk125         (clk125),
  .A_REGX         (A2_REGX11));


REG_ALIGN REG_ALIGN24(
  .A_REG          (A2_REG12),                  // in : Clock
  .rst            (rst),                  // in : System reset
  .NUM            (4'hC),
  .clk125         (clk125),
  .A_REGX         (A2_REGX12));



always@ (posedge clk125) begin
  case(irAddr[4:0])
    5'd0:    rdDataA[7:0]    <= {7'h0,chip_tcp_done};
    5'd1:    rdDataA[7:0]    <= CS_COUNT[7:0];//4'h1:   rdDataA[7:0]    <= 8'd11;
    5'd2:    rdDataA[7:0]    <= A1_REGX1[7:0];
    5'd3:    rdDataA[7:0]    <= A1_REGX2[7:0];
    5'd4:    rdDataA[7:0]    <= A1_REGX3[7:0];
    5'd5:    rdDataA[7:0]    <= A1_REGX4[7:0];
    5'd6:    rdDataA[7:0]    <= A1_REGX5[7:0]; // Window size [10:8]
    5'd7:    rdDataA[7:0]    <= A1_REGX6[7:0];        // Window size [7:0]
    5'd8:    rdDataA[7:0]    <= A1_REGX7[7:0];        // Kill chain load start
    5'd9:    rdDataA[7:0]    <= A1_REGX8[7:0]; // PMbus address
    5'd10:   rdDataA[7:0]    <= A1_REGX9[7:0];     // PMbus control register, 1: PMBUS_CTRL high; 0: PMBUS_CTRL low
    5'd11:   rdDataA[7:0]    <= A1_REGX10[7:0];     // PMbus alert register, 1: Alert
    5'd12:   rdDataA[7:0]    <= A1_REGX11[7:0];     // Clock divide factor for BPIX
    5'd13:   rdDataA[7:0]    <= A1_REGX12[7:0];     // BPIX chip select
    5'd14:   rdDataA[7:0]    <= A2_REGX1[7:0];     // Test register, [2]: Read_test_b; [1]: bit_pattern; [0]: test_counter;
    5'd15:   rdDataA[7:0]    <= A2_REGX2[7:0];//STATUS[7:0];
    5'd16:   rdDataA[7:0]    <= A2_REGX3[7:0];
    5'd17:   rdDataA[7:0]    <= A2_REGX4[7:0];//4'h1:   rdDataA[7:0]    <= 8'd11;
    5'd18:   rdDataA[7:0]    <= A2_REGX5[7:0];
    5'd19:   rdDataA[7:0]    <= A2_REGX6[7:0];
    5'd20:   rdDataA[7:0]    <= A2_REGX7[7:0];
    5'd21:   rdDataA[7:0]    <= A2_REGX8[7:0];
    5'd22:   rdDataA[7:0]    <= A2_REGX9[7:0]; // Window size [10:8]
    5'd23:   rdDataA[7:0]    <= A2_REGX10[7:0];        // Window size [7:0]
    5'd24:   rdDataA[7:0]    <= A2_REGX11[7:0];        // Kill chain load start
    5'd25:   rdDataA[7:0]    <= A2_REGX12[7:0]; // PMbus address
    5'd26:   rdDataA[7:0]    <= {6'h0,mode_en[1:0]};     // PMbus control register, 1: PMBUS_CTRL high; 0: PMBUS_CTRL low
    5'd27:   rdDataA[7:0]    <= trg_cnt[7:0];     // PMbus alert register, 1: Alert
    5'd28:   rdDataA[7:0]    <= trg1_cnt[7:0];     // Clock divide factor for BPIX
    5'd29:   rdDataA[7:0]    <= 8'd13;     // BPIX chip select
    5'd30:   rdDataA[7:0]    <= 8'd14;     // Test register, [2]: Read_test_b; [1]: bit_pattern; [0]: test_counter;
    5'd31:   rdDataA[7:0]    <= 8'd15;//STATUS[7:0];   
  endcase
end
//  Output
reg           or_ack;
reg   [7 :0]  or_dat;
always@ (posedge clk125) begin
  or_ack <= regAck|w2r_ack;
  or_dat <=  (w2r_ack ? w2r_dat[7:0] : 8'd0)|
             (regRv ? rdDataA[7:0] : 8'd0);
end

assign  rbcp_ack  = or_ack||rbcp_reg_ack;
assign  rbcp_rd   = or_dat;

wire [7:0] wb_i2c_dat;
wire       wb_i2c_ack;
i2c_master_top iiPMUBSc(
  // wishbone interface
  .wb_clk_i     (clk125),
  .wb_rst_i     (rst),
  .arst_i       (0),
  .wb_adr_i     (wb_adr[2:0]),
  .wb_dat_i     (wb_dat_master),
  .wb_dat_o     (wb_i2c_dat[7:0]),
  .wb_we_i      (wb_we),
  .wb_stb_i     (wb_stb & i2c_cs & (sub_arb_addr==0)),
  .wb_cyc_i     (wb_cyc),
  .wb_ack_o     (wb_i2c_ack),
  .wb_inta_o    (),
  // i2c signals
  .scl_pad_i    (S4CL),
  .scl_pad_o    (S4CL_O),
  .scl_padoen_o (S4CL_OEN),
  .sda_pad_i    (S4DA),
  .sda_pad_o    (S4DA_O),
  .sda_padoen_o (S4DA_OEN)
);


//------------------------------------------------------------------------------
//  Output
assign  wb_ack = (|wb_i2c_ack);

integer index, jndex;
always @(*) begin
  wb_dat_slave = 8'b0;
  for(index = 0; index < 1; index = index+1) begin
    for(jndex = 0; jndex < 8; jndex = jndex+1)
      wb_dat_slave[jndex] = wb_dat_slave[jndex] | wb_i2c_ack & wb_i2c_dat[8*index+jndex];
  end
end


assign TESTPIN[3:0] = {EXTERNAL_TRIG1,frame,trg_en,trg_in};

endmodule
