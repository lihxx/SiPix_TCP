`timescale 1ps/1ps
/*******************************************************************************
*                                                                              *
* System      : uRTM GbE readout                                           *
* Version     : v 1.0 2022/05/30                                               *
*                                                                              *
* Description : Top Module                                                     *
*                                                                              *
* Designer    : zhj@ihep.ac.cn                                                 *
*                                                                              *
*                                                                              *
*******************************************************************************/

module top(
  input           RST_B,
  input           CLK_IN_200_P,
  input           CLK_IN_200_N,
  input   [7 : 0] DIPSW,
  output          RLED_B,
  output          GLED_B,
  output          BLED_B,
  output  [3 : 0] TESTPIN,        // Test Pin
  // inout           FPGA_SCL,
  // inout           FPGA_SDA,
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

  output          HV_EN,

  inout           FPGA2_SCL,
  inout           FPGA2_SDA,

  inout           FPGA3_SCL,
  inout           FPGA3_SDA,  
 
  inout           FPGA4_SCL,
  inout           FPGA4_SDA, 
  input           RTM_TRIG,  
  input           RTM_IO0,
  input           RTM_IO1,
  input           RTM_IO2,
  input           RTM_IO3,
  // output           RTM2AMC_P16,
  // output           RTM2AMC_N16,
  // input            AMC2RTM_P16,
  // input            AMC2RTM_N16,
  
  //  chip_pins
   //inout [33:0] FMC2_LA_P,
   //inout [33:0] FMC2_LA_N
    input  FMC2_LA_P27,
    input  FMC2_LA_P24,
    input  FMC2_LA_P18,
    input  FMC2_LA_P22,
    input  FMC2_LA_P17,
    input  FMC2_LA_P16,
    input  FMC2_LA_P13,
    input  FMC2_LA_P12,
    input  FMC2_LA_P9,
    input  FMC2_LA_P8,
    input  FMC2_LA_P6,
    input  FMC2_LA_P0,
    input  FMC2_HA_P19,
    input  FMC2_HA_P16,
    input  FMC2_HA_P8,
    input  FMC2_HA_P13,    
    input  FMC2_LA_N27,
    input  FMC2_LA_N24,
    input  FMC2_LA_N18,
    input  FMC2_LA_N22,
    input  FMC2_LA_N17,
    input  FMC2_LA_N16,
    input  FMC2_LA_N13,
    input  FMC2_LA_N12,
    input  FMC2_LA_N9,
    input  FMC2_LA_N8,
    input  FMC2_LA_N6,
    input  FMC2_LA_N0,
    input  FMC2_HA_N19,
    input  FMC2_HA_N16,
    input  FMC2_HA_N8,
    input  FMC2_HA_N13,      
    input  FMC2_LA_P26,
    input  FMC2_LA_P29,
    input  FMC2_LA_P23,
    input  FMC2_LA_P21,
    input  FMC2_LA_P14,
    input  FMC2_LA_P15,
    input  FMC2_LA_P10,
    input  FMC2_LA_P11,
    input  FMC2_LA_P5,
    input  FMC2_LA_P7,
    input  FMC2_LA_P1,
    input  FMC2_LA_P2,
    input  FMC2_HA_P20,
    input  FMC2_HA_P15,
    input  FMC2_HA_P9,
    input  FMC2_HA_P12,
    input  FMC2_LA_N26,
    input  FMC2_LA_N29,
    input  FMC2_LA_N23,
    input  FMC2_LA_N21,
    input  FMC2_LA_N14,
    input  FMC2_LA_N15,
    input  FMC2_LA_N10,
    input  FMC2_LA_N11,
    input  FMC2_LA_N5,
    input  FMC2_LA_N7,
    input  FMC2_LA_N1,
    input  FMC2_LA_N2,
    input  FMC2_HA_N20,
    input  FMC2_HA_N15,
    input  FMC2_HA_N9,
    input  FMC2_HA_N12, 
    output FMC2_LA_P19,
    output FMC2_LA_P3,
    output FMC2_LA_N19,
    output FMC2_LA_N3,        
    output FMC2_LA_P33,
    output FMC2_LA_P20,
    output FMC2_LA_N33,
    output FMC2_LA_N20,                 
    output FMC2_LA_P25,
    output FMC2_LA_P4,
    output FMC2_LA_N25,
    output FMC2_LA_N4,
 


    input  FMC3_LA_P27,
    input  FMC3_LA_P24,
    input  FMC3_LA_P18,
    input  FMC3_LA_P22,
    input  FMC3_LA_P17,
    input  FMC3_LA_P16,
    input  FMC3_LA_P13,
    input  FMC3_LA_P12,
    input  FMC3_LA_P9,
    input  FMC3_LA_P8,
    input  FMC3_LA_P6,
    input  FMC3_LA_P0,
    input  FMC3_HA_P19,
    input  FMC3_HA_P16,
    input  FMC3_HA_P8,
    input  FMC3_HA_P13,    
    input  FMC3_LA_N27,
    input  FMC3_LA_N24,
    input  FMC3_LA_N18,
    input  FMC3_LA_N22,
    input  FMC3_LA_N17,
    input  FMC3_LA_N16,
    input  FMC3_LA_N13,
    input  FMC3_LA_N12,
    input  FMC3_LA_N9,
    input  FMC3_LA_N8,
    input  FMC3_LA_N6,
    input  FMC3_LA_N0,
    input  FMC3_HA_N19,
    input  FMC3_HA_N16,
    input  FMC3_HA_N8,
    input  FMC3_HA_N13,      
    input  FMC3_LA_P26,
    input  FMC3_LA_P29,
    input  FMC3_LA_P23,
    input  FMC3_LA_P21,
    input  FMC3_LA_P14,
    input  FMC3_LA_P15,
    input  FMC3_LA_P10,
    input  FMC3_LA_P11,
    input  FMC3_LA_P5,
    input  FMC3_LA_P7,
    input  FMC3_LA_P1,
    input  FMC3_LA_P2,
    input  FMC3_HA_P20,
    input  FMC3_HA_P15,
    input  FMC3_HA_P9,
    input  FMC3_HA_P12,
    input  FMC3_LA_N26,
    input  FMC3_LA_N29,
    input  FMC3_LA_N23,
    input  FMC3_LA_N21,
    input  FMC3_LA_N14,
    input  FMC3_LA_N15,
    input  FMC3_LA_N10,
    input  FMC3_LA_N11,
    input  FMC3_LA_N5,
    input  FMC3_LA_N7,
    input  FMC3_LA_N1,
    input  FMC3_LA_N2,
    input  FMC3_HA_N20,
    input  FMC3_HA_N15,
    input  FMC3_HA_N9,
    input  FMC3_HA_N12, 
    output FMC3_LA_P19,
    output FMC3_LA_P3,
    output FMC3_LA_N19,
    output FMC3_LA_N3,        
    output FMC3_LA_P33,
    output FMC3_LA_P20,
    output FMC3_LA_N33,
    output FMC3_LA_N20,                 
    output FMC3_LA_P25,
    output FMC3_LA_P4,
    output FMC3_LA_N25,
    output FMC3_LA_N4,


    // output FMC2_HA_N23,
    // output FMC2_HA_P23,
    // output FMC2_HA_N21,
    // output FMC2_HA_P21,
    // output FMC2_HA_N17,
    // output FMC2_HA_P17,
    // output FMC2_HA_N10,
    // output FMC2_HA_P10,
    // output FMC2_HA_N6,
    // output FMC2_HA_P6,
    // output FMC2_HA_N2,
    // output FMC2_HA_P2,
    
    output FMC2_LA_P32,
    output FMC2_LA_N30,
    output FMC2_LA_N31,
    output FMC2_LA_N28, 
    output FMC2_LA_P30,
    output FMC2_LA_P28,
    output FMC2_LA_N32,
    output FMC2_LA_P31,



    output FMC3_LA_P32,
    output FMC3_LA_N30,
    output FMC3_LA_N31,
    output FMC3_LA_N28, 
    output FMC3_LA_P30,
    output FMC3_LA_P28,
    output FMC3_LA_N32,
    output FMC3_LA_P31,


// assign  FMC2_HA_N23      = cs0_Z;
// assign  FMC2_HA_P23      = cs1_Z;
// assign  FMC2_HA_N21      = cs2_Z;
// assign  FMC2_HA_P21      = cs3_Z;
// assign  FMC2_HA_N17      = cs4_Z;
// assign  FMC2_HA_P17      = cs5_Z;
// assign  FMC2_HA_N10      = cs6_Z;
// assign  FMC2_HA_P10      = cs7_Z;
// assign  FMC2_HA_N6       = cs8_Z;
// assign  FMC2_HA_P6       = cs9_Z;
// assign  FMC2_HA_N2       = cs10_Z;
// assign  FMC2_HA_P2       = cs11_Z;  
// DDR3 interface
  // Inouts
  inout  [63:0]          DDR3_DQ,
  inout  [7:0]           DDR3_DQS_N,
  inout  [7:0]           DDR3_DQS_P,
  // Outputs
  output [15:0]    DDR3_ADDR,
  output [2:0]     DDR3_BA,
  output           DDR3_RAS_N,
  output           DDR3_CAS_N,
  output           DDR3_WE_N,
  output           DDR3_RESET_N,
  output [1:0]     DDR3_CK_P,
  output [1:0]     DDR3_CK_N,
  output [1:0]     DDR3_CKE,
  
  output [1:0]     DDR3_CS_N,
  
  output [7:0]     DDR3_DM,
  
  output [1:0]     DDR3_ODT


);


// assign HV_EN = 1'b1;

wire            tcp_rx_wr;
wire    [7 : 0] tcp_rx_data;
wire    [15: 0] tcp_rx_wc;
wire            clk125;
wire            clk20;
wire            clk40;


wire            cs0_X;
wire            cs1_X;
wire            cs2_X;
wire            cs3_X;
wire            cs4_X;
wire            cs5_X;
wire            cs6_X;
wire            cs7_X;
wire            cs8_X;
wire            cs9_X;
wire            cs10_X;
wire            cs11_X;
    
wire            array_in0_X;
wire            array_in1_X;
wire            array_in2_X;
wire            clk_spi_X;
wire            array_in3_X;


wire            array_in4_X;
wire            array_in5_X;
wire            array_in6_X;
wire            clk3_spi_X;
wire            array_in7_X;

wire            refresh_X;
wire            rstb_X;


wire            CONFIG_ST;
// wire            CONFIG_ST;
wire            CONFIG2_ST;
wire            CONFIG3_ST;
wire            CONFIG4_ST;
wire            CONFIG5_ST;
wire            CONFIG6_ST;
wire            CONFIG7_ST;
wire            CONFIG8_ST;
wire            CONFIG9_ST;
wire            CONFIG10_ST;
wire            CONFIG11_ST;
wire            CONFIG12_ST;

wire            RST_CONFIG;

wire            chip_tcp_done;

wire            CS_DONE;

wire            RST_A;

wire [7:0]     CS_COUNT;

wire           RST_ST;


assign RST_A = (~RST_B);
readout_system readout_system(
    .RST_B(~RST_A),
    .CLK_IN_200_P(CLK_IN_200_P),
    .CLK_IN_200_N(CLK_IN_200_N),
    .DIPSW(DIPSW),
    .RLED_B(RLED_B),
    .GLED_B(GLED_B),
    .BLED_B(BLED_B),
    .TESTPIN(TESTPIN),        // Test Pin
    .FPGA_SCL(FPGA_SCL),
    .FPGA_SDA(FPGA_SDA),
    .RST_CONFIG(RST_CONFIG),
    .TCP_OPEN(TCP_OPEN),
    // GbE PHY - RGMII
    .PHY_CLK(PHY_CLK),
    .PHY_TX_CLK(PHY_TX_CLK),
    .PHY_TX_CTRL(PHY_TX_CTRL),
    .PHY_TX_D(PHY_TX_D),
    .PHY_RX_CLK(PHY_RX_CLK),
    .PHY_RX_CTRL(PHY_RX_CTRL),
    .PHY_RX_D(PHY_RX_D),
    .PHY_GPIO(PHY_GPIO),
    .PHY_PWDN_B(PHY_PWDN_B),
    .PHY_RST_B(PHY_RST_B),
    .PHY_MDC(PHY_MDC),
    .PHY_MDIO(PHY_MDIO),

    .chip_tcp_done(chip_tcp_done),

    .CSD_DONE(CS_DONE),
    .HV_ON(HV_EN),
    .GATE_IN(),

    // .RTM2AMC_P16(RTM2AMC_P16),
    // .RTM2AMC_N16(RTM2AMC_N16),
    // .AMC2RTM_P16(AMC2RTM_P16),
    // .AMC2RTM_N16(AMC2RTM_N16),

    .EXTERNAL_TRIG0(),
    .EXTERNAL_TRIG1(RTM_TRIG),
    .EXTERNAL_TRIG2(RTM_IO2),
    .EXTERNAL_TRIG3(RTM_IO3),



    .data_p0(FMC2_LA_P27),
    .data_p1(FMC2_LA_P24),
    .data_p2(FMC2_LA_P18),
    .data_p3(FMC2_LA_P22),
    .data_p4(FMC2_LA_P17),
    .data_p5(FMC2_LA_P16),
    .data_p6(FMC2_LA_P13),
    .data_p7(FMC2_LA_P12),
    .data_p8(FMC2_LA_P9),
    .data_p9(FMC2_LA_P8),
    .data_p10(FMC2_LA_P6),
    .data_p11(FMC2_LA_P0),


    .data1_p0(FMC3_LA_P27),
    .data1_p1(FMC3_LA_P24),
    .data1_p2(FMC3_LA_P18),
    .data1_p3(FMC3_LA_P22),
    .data1_p4(FMC3_LA_P17),
    .data1_p5(FMC3_LA_P16),
    .data1_p6(FMC3_LA_P13),
    .data1_p7(FMC3_LA_P12),
    .data1_p8(FMC3_LA_P9),
    .data1_p9(FMC3_LA_P8),
    .data1_p10(FMC3_LA_P6),
    .data1_p11(FMC3_LA_P0),

//    .data_p12(FMC2_HA_P19),
//    .data_p13(FMC2_HA_P16),
//    .data_p14(FMC2_HA_P8),
//    .data_p15(FMC2_HA_P13),

    .data_n0(FMC2_LA_N27),
    .data_n1(FMC2_LA_N24),
    .data_n2(FMC2_LA_N18),
    .data_n3(FMC2_LA_N22),
    .data_n4(FMC2_LA_N17),
    .data_n5(FMC2_LA_N16),
    .data_n6(FMC2_LA_N13),
    .data_n7(FMC2_LA_N12),
    .data_n8(FMC2_LA_N9),
    .data_n9(FMC2_LA_N8),
    .data_n10(FMC2_LA_N6),
    .data_n11(FMC2_LA_N0),

    .data1_n0(FMC3_LA_N27),
    .data1_n1(FMC3_LA_N24),
    .data1_n2(FMC3_LA_N18),
    .data1_n3(FMC3_LA_N22),
    .data1_n4(FMC3_LA_N17),
    .data1_n5(FMC3_LA_N16),
    .data1_n6(FMC3_LA_N13),
    .data1_n7(FMC3_LA_N12),
    .data1_n8(FMC3_LA_N9),
    .data1_n9(FMC3_LA_N8),
    .data1_n10(FMC3_LA_N6),
    .data1_n11(FMC3_LA_N0),

//    .data_n12(FMC2_HA_N19),
//    .data_n13(FMC2_HA_N16),
//    .data_n14(FMC2_HA_N8),
//    .data_n15(FMC2_HA_N13),   
    
    .sync_p0(FMC2_LA_P26),
    .sync_p1(FMC2_LA_P29),
    .sync_p2(FMC2_LA_P23),
    .sync_p3(FMC2_LA_P21),
    .sync_p4(FMC2_LA_P14),
    .sync_p5(FMC2_LA_P15),
    .sync_p6(FMC2_LA_P10),
    .sync_p7(FMC2_LA_P11),
    .sync_p8(FMC2_LA_P5),
    .sync_p9(FMC2_LA_P7),
    .sync_p10(FMC2_LA_P1),
    .sync_p11(FMC2_LA_P2),

    .sync1_p0(FMC3_LA_P26),
    .sync1_p1(FMC3_LA_P29),
    .sync1_p2(FMC3_LA_P23),
    .sync1_p3(FMC3_LA_P21),
    .sync1_p4(FMC3_LA_P14),
    .sync1_p5(FMC3_LA_P15),
    .sync1_p6(FMC3_LA_P10),
    .sync1_p7(FMC3_LA_P11),
    .sync1_p8(FMC3_LA_P5),
    .sync1_p9(FMC3_LA_P7),
    .sync1_p10(FMC3_LA_P1),
    .sync1_p11(FMC3_LA_P2),
//    .sync_p12(FMC2_HA_P20),
//    .sync_p13(FMC2_HA_P15),
//    .sync_p14(FMC2_HA_P9),
//    .sync_p15(FMC2_HA_P12),

    .sync_n0(FMC2_LA_N26),
    .sync_n1(FMC2_LA_N29),
    .sync_n2(FMC2_LA_N23),
    .sync_n3(FMC2_LA_N21),
    .sync_n4(FMC2_LA_N14),
    .sync_n5(FMC2_LA_N15),
    .sync_n6(FMC2_LA_N10),
    .sync_n7(FMC2_LA_N11),
    .sync_n8(FMC2_LA_N5),
    .sync_n9(FMC2_LA_N7),
    .sync_n10(FMC2_LA_N1),
    .sync_n11(FMC2_LA_N2),

    .sync1_n0(FMC3_LA_N26),
    .sync1_n1(FMC3_LA_N29),
    .sync1_n2(FMC3_LA_N23),
    .sync1_n3(FMC3_LA_N21),
    .sync1_n4(FMC3_LA_N14),
    .sync1_n5(FMC3_LA_N15),
    .sync1_n6(FMC3_LA_N10),
    .sync1_n7(FMC3_LA_N11),
    .sync1_n8(FMC3_LA_N5),
    .sync1_n9(FMC3_LA_N7),
    .sync1_n10(FMC3_LA_N1),
    .sync1_n11(FMC3_LA_N2),

//    .sync_n12(FMC2_HA_N20),
//    .sync_n13(FMC2_HA_N15),
//    .sync_n14(FMC2_HA_N9),
//    .sync_n15(FMC2_HA_N12),
 
    .gate_p0(FMC2_LA_P19),
    .gate_p1(FMC2_LA_P3),
    .gate_n0(FMC2_LA_N19),
    .gate_n1(FMC2_LA_N3),

    .gate1_p0(FMC3_LA_P19),
    .gate1_p1(FMC3_LA_P3),
    .gate1_n0(FMC3_LA_N19),
    .gate1_n1(FMC3_LA_N3),

         
    .clk_p0(FMC2_LA_P33),
    .clk_p1(FMC2_LA_P20),
    .clk_n0(FMC2_LA_N33),
    .clk_n1(FMC2_LA_N20),

    .clk1_p0(FMC3_LA_P33),
    .clk1_p1(FMC3_LA_P20),
    .clk1_n0(FMC3_LA_N33),
    .clk1_n1(FMC3_LA_N20),    
                  
    .frame_p0(FMC2_LA_P25),
    .frame_p1(FMC2_LA_P4),
    .frame_n0(FMC2_LA_N25),
    .frame_n1(FMC2_LA_N4),


    .frame1_p0(FMC3_LA_P25),
    .frame1_p1(FMC3_LA_P4),
    .frame1_n0(FMC3_LA_N25),
    .frame1_n1(FMC3_LA_N4),    
    
    .cs0(cs0_X),
    .cs1(cs1_X),
    .cs2(cs2_X),
    .cs3(cs3_X),
    .cs4(cs4_X),
    .cs5(cs5_X),
    .cs6(cs6_X),
    .cs7(cs7_X),
    .cs8(cs8_X),
    .cs9(cs9_X),
    .cs10(cs10_X),
    .cs11(cs11_X),
    
    .array_in0(array_in0_X),
    .array_in1(array_in1_X),
    .array_in2(array_in2_X),
    .clk_spi(clk_spi_X), //
    .array_in3(array_in3_X),


    .array_in4(array_in4_X),
    .array_in5(array_in5_X),
    .array_in6(array_in6_X),
    .clk3_spi(clk3_spi_X), //
    .array_in7(array_in7_X),

    .refresh(refresh_X),
    .load_gdac(FMC2_LA_N32),//
    .load_gdac3(FMC3_LA_N32),//
    .rstb(rstb_X), //
    .CLK_3(clk20), //
    .TCP_RX_WC(tcp_rx_wc[15:0]),
    .TCP_RX_WR(tcp_rx_wr),      
    .TCP_RX_DATA(tcp_rx_data[7:0]),
    .CLK_125(clk125),
    .CLK_7(clk40),
    .CONFIG_ST(CONFIG_ST),
    .CONFIG2_ST(CONFIG2_ST),
    .CONFIG3_ST(CONFIG3_ST),
    .CONFIG4_ST(CONFIG4_ST),
    .CONFIG5_ST(CONFIG5_ST),
    .CONFIG6_ST(CONFIG6_ST),
    .CONFIG7_ST(CONFIG7_ST),
    .CONFIG8_ST(CONFIG8_ST),
    .CONFIG9_ST(CONFIG9_ST),
    .CONFIG10_ST(CONFIG10_ST),
    .CONFIG11_ST(CONFIG11_ST),
    .CONFIG12_ST(CONFIG12_ST),
    .RST_ST(RST_ST),
    .RST_DDR(RST_DDR),

    .ARRAY_REG(ARRAY_REG),

    .CS_COUNT(CS_COUNT),

   .S2CL(S2CL),
   .S2CL_OEN(S2CL_OEN),
   .S2CL_O(S2CL_O),
   .S2DA(S2DA),
   .S2DA_OEN(S2DA_OEN),
   .S2DA_O(S2DA_O),
   .S3CL(S3CL),
   .S3CL_OEN(S3CL_OEN),
   .S3CL_O(S3CL_O),
   .S3DA(S3DA),
   .S3DA_OEN(S3DA_OEN),
   .S3DA_O(S3DA_O),

   .S4CL(S4CL),
   .S4CL_OEN(S4CL_OEN),
   .S4CL_O(S4CL_O),
   .S4DA(S4DA),
   .S4DA_OEN(S4DA_OEN),
   .S4DA_O(S4DA_O),
  // Inouts
  .ddr3_dq(DDR3_DQ),
  .ddr3_dqs_n(DDR3_DQS_N),
  .ddr3_dqs_p(DDR3_DQS_P),

  // Outputs
  .ddr3_addr(DDR3_ADDR),
  .ddr3_ba(DDR3_BA),
  .ddr3_ras_n(DDR3_RAS_N),
  .ddr3_cas_n(DDR3_CAS_N),
  .ddr3_we_n(DDR3_WE_N),
  .ddr3_reset_n(DDR3_RESET_N),
  .ddr3_ck_p(DDR3_CK_P),
  .ddr3_ck_n(DDR3_CK_N),
  .ddr3_cke(DDR3_CKE),
  
  .ddr3_cs_n(DDR3_CS_N),
  
  .ddr3_dm(DDR3_DM),
  
  .ddr3_odt(DDR3_ODT)
 
    );
  

assign FPGA2_SCL = S2CL_OEN ? 1'bz : S2CL_O;
assign FPGA2_SDA = S2DA_OEN ? 1'bz : S2DA_O;
assign S2CL = FPGA2_SCL;
assign S2DA = FPGA2_SDA;

assign FPGA3_SCL = S3CL_OEN ? 1'bz : S3CL_O;
assign FPGA3_SDA = S3DA_OEN ? 1'bz : S3DA_O;
assign S3CL = FPGA3_SCL;
assign S3DA = FPGA3_SDA;


assign FPGA4_SCL = S4CL_OEN ? 1'bz : S4CL_O;
assign FPGA4_SDA = S4DA_OEN ? 1'bz : S4DA_O;
assign S4CL = FPGA4_SCL;
assign S4DA = FPGA4_SDA;

//ADD
// assign tcp_rx_wc[15:0] = {4'b1111,data_cnt_reg[11:0]};
// assign tcp_rx_wc[15:0] = data_cnt_reg[15:0];

wire             t_rd_en;
wire [7:0]       t_dout;
wire             t_valid;
wire             t_empty;
wire [15:0]      data_count;
wire             rst;
wire             t_full;

assign rst = ~RST_B||RST_DDR;

wire rst_new;
assign rst_new = ~RST_B||RST_ST;


// fifo_generator_2 fifo_generator_2 (
//   .clk(clk125),                // input wire clk
//   .srst(rst_cc),              // input wire srst
//   .din(tcp_rx_data[7:0]),                // input wire [7 : 0] din
//   .wr_en(tcp_rx_wr),            // input wire wr_en
//   .rd_en(t_rd_en),            // input wire rd_en
//   .dout(t_dout[7:0]),              // output wire [7 : 0] dout
//   .full(t_full),              // output wire full
//   .empty(t_empty),            // output wire empty
//   .valid(t_valid),            // output wire valid
//   .data_count()  // output wire [11 : 0] data_count
// );

// reg [15:0]      data_cnt_reg;
reg [15:0]      data_cnt_reg;

wire    [11:0]  FIFO_DATA_COUNT;
    //FIFO
    fifo_generator_v11_0 fifo_generator_v11_0(
      .clk          (clk125               ),  //  in  :
      .rst          (rst_cc          ),  //  in  :
      .din          (tcp_rx_data[7:0]       ),  //  in  :
      .wr_en        (tcp_rx_wr              ),  //  in  :
      .full         (                       ),  //  out :
      .dout         (t_dout[7:0]       ),  //  out :
      .valid        (t_valid          ),  //  out :active H
      .rd_en        (t_rd_en           ),  //  in  :
      .empty        (t_empty                       ),  //  out :
      .data_count   (FIFO_DATA_COUNT[11:0]  )   //  out :[11:0]
    );

    assign  tcp_rx_wc[15:0]     = {4'b1111,FIFO_DATA_COUNT[11:0]};
// always @(posedge clk125 or posedge rst) begin
//             if (rst) begin
//               data_cnt_reg<= 16'b0;
//             end
//             else if (tcp_rx_wr) begin
//               data_cnt_reg<= data_cnt_reg+1'b1;             
//             end
//             else begin
//               data_cnt_reg<= data_cnt_reg;
//             end
// end

// assign t_rd_en = ~t_empty;
// always @(posedge clk125 or posedge rst) begin
//             if (rst) begin
//               data_cnt_reg<= 16'b0;
//             end
//             else if (tcp_rx_wr&&(data_cnt_reg==16'd32765)) begin
//               data_cnt_reg<= 16'd1;             
//             end
//             else if (tcp_rx_wr) begin
//               data_cnt_reg<= data_cnt_reg+1'b1;             
//             end
//             else begin
//               data_cnt_reg<= data_cnt_reg;
//             end
// end

assign rst_cc = rst||RST_CONFIG;

always @(posedge clk125 or posedge rst_cc) begin
            if (rst_cc) begin
              data_cnt_reg<= 16'b0;
            end
            else if (tcp_rx_wr&&(data_cnt_reg==16'd49151)) begin//32765
              data_cnt_reg<= 16'd1;             
            end
            else if (tcp_rx_wr) begin
              data_cnt_reg<= data_cnt_reg+1'b1;             
            end
            else begin
              data_cnt_reg<= data_cnt_reg;
            end
end

assign t_rd_en = ~t_empty;
//------------------------------------------------------------------------------
  wire           RSTB;
  wire           ARRAY_IN1;
  wire           ARRAY_IN2;
  wire           ARRAY_IN3;
  wire           ARRAY_IN4;
  wire           REFRESH;
  wire           CLK_SPI;


  wire           CS1;
  wire           CS2;
  wire           CS3;
  wire           CS4;

  // CONFIG_TOP CONFIG_TOP (
  //     .RST                (rst),
  //     .CLK                (clk125),
  //     .CLK_20M            (clk20),
  //     .TCP_RX_WR          (t_valid),
  //     .TCP_RX_DATA        (t_dout[7:0]),
  //     .RSTB               (),
  //     .ARRAY_IN1          (FMC2_LA_P32),
  //     .ARRAY_IN2          (FMC2_LA_N30),
  //     .ARRAY_IN3          (FMC2_LA_N31),
  //     .ARRAY_IN4          (FMC2_LA_P30),
  //     .REFRESH            (FMC2_LA_P28),
  //     .CLK_SPI            (FMC2_LA_N28),
  //     .CS1                (FMC2_HA_N23),
  //     .CS2                (FMC2_HA_P23),
  //     .CS3                (FMC2_HA_N21),
  //     .CS4                (FMC2_HA_P21),
  //     .CS5                (FMC2_HA_N17),
  //     .CS6                (FMC2_HA_P17),
  //     .CS7                (FMC2_HA_N10),
  //     .CS8                (FMC2_HA_P10),
  //     .CS9                (),
  //     .CS10               (),
  //     .CS11               (),       
  //     .CS12               ());
wire            cs0_Y;
wire            cs1_Y;
wire            cs2_Y;
wire            cs3_Y;
wire            cs4_Y;
wire            cs5_Y;
wire            cs6_Y;
wire            cs7_Y;
wire            cs8_Y;
wire            cs9_Y;
wire            cs10_Y;
wire            cs11_Y;
wire            clk_spi_Y;    
wire            array_in0_Y;
wire            array_in1_Y;
wire            array_in2_Y;
wire            array_in3_Y;


wire            array_in4_Y;
wire            array_in5_Y;
wire            array_in6_Y;
wire            array_in7_Y;

wire            refresh_Y;
wire            rstb_Y;

wire [31:0]     ARRAY_REG;


wire           chip1_tcp_done;
wire           chip2_tcp_done;
wire           chip3_tcp_done;
wire           chip4_tcp_done;
wire           chip5_tcp_done;
wire           chip6_tcp_done;
wire           chip7_tcp_done;
wire           chip8_tcp_done;
wire           chip9_tcp_done;
wire           chip10_tcp_done;
wire           chip11_tcp_done;
wire           chip12_tcp_done; 





  CONFIG_TOP CONFIG_TOP (
      .RST                (rst),
      .RST_ST             (rst_new),
      .CLK                (clk125),
      .CLK_20M            (clk20),
      .RST_CONFIG         (RST_CONFIG),
      .t_empty            (t_empty),
      .CONFIG_ST          (CONFIG_ST),
      .CONFIG2_ST         (CONFIG2_ST),
      .CONFIG3_ST         (CONFIG3_ST),
      .CONFIG4_ST         (CONFIG4_ST),
      .CONFIG5_ST         (CONFIG5_ST),
      .CONFIG6_ST         (CONFIG6_ST),
      .CONFIG7_ST         (CONFIG7_ST),
      .CONFIG8_ST         (CONFIG8_ST),
      .CONFIG9_ST         (CONFIG9_ST),
      .CONFIG10_ST        (CONFIG10_ST),
      .CONFIG11_ST        (CONFIG11_ST),
      .CONFIG12_ST        (CONFIG12_ST),
      .TCP_RX_WR          (t_valid),
      .TCP_RX_DATA        (t_dout[7:0]),
      .ARRAY1_IN          (array_in0_Y),
      .ARRAY2_IN          (array_in1_Y),
      .ARRAY3_IN          (array_in2_Y),
      .ARRAY4_IN          (array_in3_Y),

      .ARRAY5_IN          (array_in4_Y),
      .ARRAY6_IN          (array_in5_Y),
      .ARRAY7_IN          (array_in6_Y),
      .ARRAY8_IN          (array_in7_Y),


      .chip_tcp_done(chip_tcp_done),

      .CS_COUNT(CS_COUNT),


      .REFRESH_OUT        (refresh_Y),
      .CLK_SPI            (clk_spi_Y),
      .RSTB_OUT           (rstb_Y),
      .CS_OUT1            (cs0_Y),
      .CS_OUT2            (cs1_Y),
      .CS_OUT3            (cs2_Y),
      .CS_OUT4            (cs3_Y),
      .CS_OUT5            (cs4_Y),
      .CS_OUT6            (cs5_Y),
      .CS_OUT7            (cs6_Y),
      .CS_OUT8            (cs7_Y),
      .CS_OUT9            (cs8_Y),
      .CS_OUT10           (cs9_Y),
      .CS_OUT11           (cs10_Y),
      .CS_OUT12           (cs11_Y));





// assign  FMC2_HA_N23      = ~cs0_Y^cs0_X;
// assign  FMC2_HA_P23      = ~cs1_Y^cs1_X;
// assign  FMC2_HA_N21      = ~cs2_Y^cs2_X;
// assign  FMC2_HA_P21      = ~cs3_Y^cs3_X;
// assign  FMC2_HA_N17      = ~cs4_Y^cs4_X;
// assign  FMC2_HA_P17      = ~cs5_Y^cs5_X;
// assign  FMC2_HA_N10      = ~cs6_Y^cs6_X;
// assign  FMC2_HA_P10      = ~cs7_Y^cs7_X;
// assign  FMC2_HA_N6       = ~cs8_Y^cs8_X;
// assign  FMC2_HA_P6       = ~cs9_Y^cs9_X;
// assign  FMC2_HA_N2       = ~cs10_Y^cs10_X;
// assign  FMC2_HA_P2       = ~cs11_Y^cs11_X;  
// assign  FMC2_LA_P32      = array_in0_Y||array_in0_X;
// assign  FMC2_LA_N30      = array_in1_Y||array_in1_X;
// assign  FMC2_LA_N31      = array_in2_Y||array_in2_X;
// assign  FMC2_LA_P30      = array_in3_Y||array_in3_X;
// assign  FMC2_LA_N28      = clk_spi_Y||clk_spi_X;
// assign  FMC2_LA_P28      = refresh_Y||refresh_X;
// assign  FMC2_LA_P31      = rstb_X;
// assign  FMC2_LA_P31      = rstb_Y||rstb_X;


wire            cs0_Z;
wire            cs1_Z;
wire            cs2_Z;
wire            cs3_Z;
wire            cs4_Z;
wire            cs5_Z;
wire            cs6_Z;
wire            cs7_Z;
wire            cs8_Z;
wire            cs9_Z;
wire            cs10_Z;
wire            cs11_Z;
wire            clk_spi_Z;    
wire            array_in0_Z;
wire            array_in1_Z;
wire            array_in2_Z;
wire            array_in3_Z;


wire            array_in4_Z;
wire            array_in5_Z;
wire            array_in6_Z;
wire            array_in7_Z;

wire            refresh_Z;
wire            rstb_Z;


assign  cs0_Z            = ~cs0_Y^cs0_X;
assign  cs1_Z            = ~cs1_Y^cs1_X;
assign  cs2_Z            = ~cs2_Y^cs2_X;
assign  cs3_Z            = ~cs3_Y^cs3_X;
assign  cs4_Z            = ~cs4_Y^cs4_X;
assign  cs5_Z            = ~cs5_Y^cs5_X;
assign  cs6_Z            = ~cs6_Y^cs6_X;
assign  cs7_Z            = ~cs7_Y^cs7_X;
assign  cs8_Z            = ~cs8_Y^cs8_X;
assign  cs9_Z            = ~cs9_Y^cs9_X;
assign  cs10_Z           = ~cs10_Y^cs10_X;
assign  cs11_Z           = ~cs11_Y^cs11_X;  
assign  array_in0_Z      = array_in0_Y||array_in0_X;
assign  array_in1_Z      = array_in1_Y||array_in1_X;
assign  array_in2_Z      = array_in2_Y||array_in2_X;
assign  array_in3_Z      = array_in3_Y||array_in3_X;


assign  array_in4_Z      = array_in4_Y||array_in4_X;
assign  array_in5_Z      = array_in5_Y||array_in5_X;
assign  array_in6_Z      = array_in6_Y||array_in6_X;
assign  array_in7_Z      = array_in7_Y||array_in7_X;


assign  clk_spi_Z        = clk_spi_Y||clk_spi_X;
assign  clk3_spi_Z        = clk_spi_Y||clk3_spi_X;

assign  refresh_Z        = refresh_Y||refresh_X;
assign  rstb_Z           = rstb_X;

// assign  FMC2_HA_N23      = cs0_Z;
// assign  FMC2_HA_P23      = cs1_Z;
// assign  FMC2_HA_N21      = cs2_Z;
// assign  FMC2_HA_P21      = cs3_Z;
// assign  FMC2_HA_N17      = cs4_Z;
// assign  FMC2_HA_P17      = cs5_Z;
// assign  FMC2_HA_N10      = cs6_Z;
// assign  FMC2_HA_P10      = cs7_Z;
// assign  FMC2_HA_N6       = cs8_Z;
// assign  FMC2_HA_P6       = cs9_Z;
// assign  FMC2_HA_N2       = cs10_Z;
// assign  FMC2_HA_P2       = cs11_Z;  
assign  FMC2_LA_P32      = array_in0_Z;
assign  FMC2_LA_N30      = array_in1_Z;
assign  FMC2_LA_N31      = array_in2_Z;
assign  FMC2_LA_P30      = array_in3_Z;
assign  FMC2_LA_N28      = clk_spi_Z;
assign  FMC2_LA_P28      = refresh_Z;
assign  FMC2_LA_P31      = rstb_Z;


assign  FMC3_LA_P32      = array_in4_Z;
assign  FMC3_LA_N30      = array_in5_Z;
assign  FMC3_LA_N31      = array_in6_Z;
assign  FMC3_LA_P30      = array_in7_Z;
assign  FMC3_LA_N28      = clk3_spi_Z;
assign  FMC3_LA_P28      = refresh_Z;
assign  FMC3_LA_P31      = rstb_Z;



// ila_4 ila_config (
//   .clk(clk40), // input wire clk


//   .probe0(array_in0_Z), // input wire [0:0]  probe0  
//   .probe1(clk_spi_Z), // input wire [0:0]  probe1 
//   .probe2(refresh_Z), // input wire [0:0]  probe2 
//   .probe3(refresh_X), // input wire [0:0]  probe3 
//   .probe4(rstb_Z), // input wire [0:0]  probe4 
//   .probe5(cs0_Z), // input wire [0:0]  probe5 
//   .probe6(cs1_Z), // input wire [0:0]  probe6 
//   .probe7(cs2_Z),
//   .probe8(cs3_Z), // input wire [0:0]  probe8 
//   .probe9(cs4_Z), // input wire [0:0]  probe9 
//   .probe10(cs5_Z), // input wire [0:0]  probe10 
//   .probe11(cs6_Z), // input wire [0:0]  probe11 
//   .probe12(cs7_Z), // input wire [0:0]  probe12 
//   .probe13(cs8_Z), // input wire [0:0]  probe13 
//   .probe14(cs9_Z), // input wire [0:0]  probe14 
//   .probe15(cs10_Z), // input wire [0:0]  probe15 
//   .probe16(cs11_Z) // input wire [0:0]  probe16
// );

// assign FMC3_LA_N32 = FMC2_LA_N32;

// ila_rx ila_rx (
//   .clk(clk125), // input wire clk


//   .probe0(t_full)
// );


reg     red_reg;

always @(posedge clk20 or posedge rst) begin
            if (rst) begin
              red_reg <= 1'b0;
            end
            else if (refresh_Y) begin
              red_reg<= 1'b1;             
            end
            else begin
              red_reg<= red_reg;
            end
end



// ila_ZZK ila_ZZK (
//   .clk(clk125), // input wire clk


//   .probe0(clk_spi_Y), // input wire [0:0]  probe0  
//   .probe1(CS_DONE)
// );


endmodule