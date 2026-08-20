`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/25 15:41:15
// Design Name: 
// Module Name: CONFIG_TOP
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


module CONFIG_TOP(
  input            RST,        // Reset
  input            CLK,
  input            CLK_20M,
  input            TCP_RX_WR,
  input  [7:0]     TCP_RX_DATA,
  input            CONFIG_ST,
  input            CONFIG2_ST,
  input            CONFIG3_ST,
  input            CONFIG4_ST,
  input            CONFIG5_ST,
  input            CONFIG6_ST,
  input            CONFIG7_ST,
  input            CONFIG8_ST,
  input            CONFIG9_ST,
  input            CONFIG10_ST,
  input            CONFIG11_ST,
  input            CONFIG12_ST,

  input            t_empty,

  input            RST_ST,

  input            RST_CONFIG,

  output  [7:0]    CS_COUNT,

  output           chip_tcp_done,



  // input            RST_ST,
  output           ARRAY1_IN,
  output           ARRAY2_IN,
  output           ARRAY3_IN,
  output           ARRAY4_IN,

  output           ARRAY5_IN,
  output           ARRAY6_IN,
  output           ARRAY7_IN,
  output           ARRAY8_IN,

  output           CLK_SPI,
  output           CS_OUT1,
  output           CS_OUT2,
  output           CS_OUT3,
  output           CS_OUT4,
  output           CS_OUT5,
  output           CS_OUT6,
  output           CS_OUT7,
  output           CS_OUT8,
  output           CS_OUT9,
  output           CS_OUT10,
  output           CS_OUT11,
  output           CS_OUT12,
  output           REFRESH_OUT,
  output           RSTB_OUT
    );



wire            ARRAY1_ENB;
wire   [11:0]   ARRAY1_ADDRB;
wire   [31:0]   ARRAY1_DATA;
wire            ARRAY2_ENB;
wire   [11:0]   ARRAY2_ADDRB;
wire   [31:0]   ARRAY2_DATA;
wire            ARRAY3_ENB;
wire   [11:0]   ARRAY3_ADDRB;
wire   [31:0]   ARRAY3_DATA;
wire            ARRAY4_ENB;
wire   [11:0]   ARRAY4_ADDRB;
wire   [31:0]   ARRAY4_DATA;
wire            ARRAY5_ENB;
wire [11:0]     ARRAY5_ADDRB;
wire [31:0]     ARRAY5_DATA;
wire            ARRAY6_ENB;
wire [11:0]     ARRAY6_ADDRB;
wire [31:0]     ARRAY6_DATA;
wire            ARRAY7_ENB;
wire [11:0]     ARRAY7_ADDRB;
wire [31:0]     ARRAY7_DATA;
wire            ARRAY8_ENB;
wire [11:0]     ARRAY8_ADDRB;
wire [31:0]     ARRAY8_DATA;

wire            RC_END;





wire            ARRAY_IN1;
wire            ARRAY_IN2;
wire            ARRAY_IN3;
wire            ARRAY_IN4;
wire            ARRAY_IN5;
wire            ARRAY_IN6;
wire            ARRAY_IN7;
wire            ARRAY_IN8;

wire [3:0]     LDAC_CNT;

// ENB ADDRB DATA
ARRAY_RC ARRAY_RC (
  .RST(RST_ST),    // input wire clka
  .CLK(CLK),      // input wire ena
  .RST_CONFIG(RST_CONFIG),
  .t_empty(t_empty),
  .CLK_20M(CLK_20M),      // input wire [0 : 0] wea
  .TCP_RX_WR(TCP_RX_WR),  // input wire [13 : 0] addra
  .TCP_RX_DATA(TCP_RX_DATA),    // input wire [7 : 0] dina
  .ARRAY1_ENB(ARRAY1_ENB),    // input wire clkb
  .ARRAY1_ADDRB(ARRAY1_ADDRB),      // input wire enb
  .ARRAY1_DATA(ARRAY1_DATA),  // input wire [11 : 0] addrb
  .ARRAY2_ENB(ARRAY2_ENB),    // input wire clkb
  .ARRAY2_ADDRB(ARRAY2_ADDRB),      // input wire enb
  .ARRAY2_DATA(ARRAY2_DATA),  // input wire [11 : 0] addrb
  .ARRAY3_ENB(ARRAY3_ENB),    // input wire clkb
  .ARRAY3_ADDRB(ARRAY3_ADDRB),      // input wire enb
  .ARRAY3_DATA(ARRAY3_DATA),  // input wire [11 : 0] addrb
  .ARRAY4_ENB(ARRAY4_ENB),    // input wire clkb
  .ARRAY4_ADDRB(ARRAY4_ADDRB),      // input wire enb
  .ARRAY4_DATA(ARRAY4_DATA),  // input wire [11 : 0] addrb
  .ARRAY5_ENB(ARRAY5_ENB),
  .ARRAY5_ADDRB(ARRAY5_ADDRB),
  .ARRAY5_DATA(ARRAY5_DATA),
  .ARRAY6_ENB(ARRAY6_ENB),
  .ARRAY6_ADDRB(ARRAY6_ADDRB),
  .ARRAY6_DATA(ARRAY6_DATA),
  .ARRAY7_ENB(ARRAY7_ENB),
  .ARRAY7_ADDRB(ARRAY7_ADDRB),
  .ARRAY7_DATA(ARRAY7_DATA),
  .ARRAY8_ENB(ARRAY8_ENB),
  .ARRAY8_ADDRB(ARRAY8_ADDRB),
  .ARRAY8_DATA(ARRAY8_DATA),
  .chip_tcp_done(chip_tcp_done),
  .LDAC_CNT(LDAC_CNT),
  .RC_END(RC_END)
);


wire      CHIP_SW;
wire      CS_SW;
wire      CS;





wire      CHIP_SW1;
wire      CLK1_SPI;
wire      CS1;
wire      REFRESH1;
wire      RSTB1;

// CONFIG ARRAY1
CONF_CODEY CONF1_CODE (
  .START(RC_END&&(CONFIG_ST||CONFIG2_ST||CONFIG3_ST||CONFIG4_ST||CONFIG5_ST||CONFIG6_ST||CONFIG7_ST||CONFIG8_ST||CONFIG9_ST||CONFIG10_ST||CONFIG11_ST||CONFIG12_ST)),
  .RST(RST),    // input wire clka
  .CLK(CLK_20M),      // input wire [0 : 0] wea
  .CLK_SPI(CLK1_SPI),
  .ARRAY_ENB(ARRAY1_ENB),    // input wire clkb
  .ARRAY_ADDRB(ARRAY1_ADDRB),
  .ARRAY_DATA(ARRAY1_DATA),  // input wire [11 : 0] addrb
  .RSTB(RSTB1),
  .ARRAY_IN(ARRAY_IN1),
  .REFRESH(REFRESH1),
  .CS(CS1),
  .CHIP_SW(CHIP_SW1),
  .CS_SW(CS_SW)
);














// CONFIG ARRAY1
CONF_CODEY CONF2_CODE (
  .START(RC_END&&(CONFIG_ST||CONFIG2_ST||CONFIG3_ST||CONFIG4_ST||CONFIG5_ST||CONFIG6_ST||CONFIG7_ST||CONFIG8_ST||CONFIG9_ST||CONFIG10_ST||CONFIG11_ST||CONFIG12_ST)),
  .RST(RST),    // input wire clka
  .CLK(CLK_20M),      // input wire [0 : 0] wea
  .CLK_SPI(),
  .ARRAY_ENB(ARRAY2_ENB),    // input wire clkb
  .ARRAY_ADDRB(ARRAY2_ADDRB),
  .ARRAY_DATA(ARRAY2_DATA),  // input wire [11 : 0] addrb
  .RSTB(),
  .ARRAY_IN(ARRAY_IN2),
  .REFRESH(),
  .CS(),
  .CHIP_SW(),
  .CS_SW()
);


// CONFIG ARRAY1
CONF_CODEY CONF3_CODE (
  .START(RC_END&&(CONFIG_ST||CONFIG2_ST||CONFIG3_ST||CONFIG4_ST||CONFIG5_ST||CONFIG6_ST||CONFIG7_ST||CONFIG8_ST||CONFIG9_ST||CONFIG10_ST||CONFIG11_ST||CONFIG12_ST)),
  .RST(RST),    // input wire clka
  .CLK(CLK_20M),      // input wire [0 : 0] wea
  .CLK_SPI(),
  .ARRAY_ENB(ARRAY3_ENB),    // input wire clkb
  .ARRAY_ADDRB(ARRAY3_ADDRB),
  .ARRAY_DATA(ARRAY3_DATA),  // input wire [11 : 0] addrb
  .RSTB(),
  .ARRAY_IN(ARRAY_IN3),
  .REFRESH(),
  .CS(),
  .CHIP_SW(),
  .CS_SW()
);

// CONFIG ARRAY1
CONF_CODEY CONF4_CODE (
  .START(RC_END&&(CONFIG_ST||CONFIG2_ST||CONFIG3_ST||CONFIG4_ST||CONFIG5_ST||CONFIG6_ST||CONFIG7_ST||CONFIG8_ST||CONFIG9_ST||CONFIG10_ST||CONFIG11_ST||CONFIG12_ST)),
  .RST(RST),    // input wire clka
  .CLK(CLK_20M),      // input wire [0 : 0] wea
  .CLK_SPI(),
  .ARRAY_ENB(ARRAY4_ENB),    // input wire clkb
  .ARRAY_ADDRB(ARRAY4_ADDRB),
  .ARRAY_DATA(ARRAY4_DATA),  // input wire [11 : 0] addrb
  .RSTB(),
  .ARRAY_IN(ARRAY_IN4),
  .REFRESH(),
  .CS(),
  .CHIP_SW(),
  .CS_SW()
);

// CONFIG ARRAY2
CONF_CODEY CONF5_CODE (
  .START(RC_END&&(CONFIG_ST||CONFIG2_ST||CONFIG3_ST||CONFIG4_ST||CONFIG5_ST||CONFIG6_ST||CONFIG7_ST||CONFIG8_ST||CONFIG9_ST||CONFIG10_ST||CONFIG11_ST||CONFIG12_ST)),
  .RST(RST),    // input wire clka
  .CLK(CLK_20M),      // input wire [0 : 0] wea
  .CLK_SPI(),
  .ARRAY_ENB(ARRAY5_ENB),    // input wire clkb
  .ARRAY_ADDRB(ARRAY5_ADDRB),
  .ARRAY_DATA(ARRAY5_DATA),  // input wire [11 : 0] addrb
  .RSTB(RSTB1),
  .ARRAY_IN(ARRAY_IN5),
  .REFRESH(),
  .CS(),
  .CHIP_SW(),
  .CS_SW()
);


// CONFIG ARRAY2
CONF_CODEY CONF6_CODE (
  .START(RC_END&&(CONFIG_ST||CONFIG2_ST||CONFIG3_ST||CONFIG4_ST||CONFIG5_ST||CONFIG6_ST||CONFIG7_ST||CONFIG8_ST||CONFIG9_ST||CONFIG10_ST||CONFIG11_ST||CONFIG12_ST)),
  .RST(RST),    // input wire clka
  .CLK(CLK_20M),      // input wire [0 : 0] wea
  .CLK_SPI(),
  .ARRAY_ENB(ARRAY6_ENB),    // input wire clkb
  .ARRAY_ADDRB(ARRAY6_ADDRB),
  .ARRAY_DATA(ARRAY6_DATA),  // input wire [11 : 0] addrb
  .RSTB(),
  .ARRAY_IN(ARRAY_IN6),
  .REFRESH(),
  .CS(),
  .CHIP_SW(),
  .CS_SW()
);


// CONFIG ARRAY2
CONF_CODEY CONF7_CODE (
  .START(RC_END&&(CONFIG_ST||CONFIG2_ST||CONFIG3_ST||CONFIG4_ST||CONFIG5_ST||CONFIG6_ST||CONFIG7_ST||CONFIG8_ST||CONFIG9_ST||CONFIG10_ST||CONFIG11_ST||CONFIG12_ST)),
  .RST(RST),    // input wire clka
  .CLK(CLK_20M),      // input wire [0 : 0] wea
  .CLK_SPI(),
  .ARRAY_ENB(ARRAY7_ENB),    // input wire clkb
  .ARRAY_ADDRB(ARRAY7_ADDRB),
  .ARRAY_DATA(ARRAY7_DATA),  // input wire [11 : 0] addrb
  .RSTB(),
  .ARRAY_IN(ARRAY_IN7),
  .REFRESH(),
  .CS(),
  .CHIP_SW(),
  .CS_SW()
);

// CONFIG ARRAY2
CONF_CODEY CONF8_CODE (
  .START(RC_END&&(CONFIG_ST||CONFIG2_ST||CONFIG3_ST||CONFIG4_ST||CONFIG5_ST||CONFIG6_ST||CONFIG7_ST||CONFIG8_ST||CONFIG9_ST||CONFIG10_ST||CONFIG11_ST||CONFIG12_ST)),
  .RST(RST),    // input wire clka
  .CLK(CLK_20M),      // input wire [0 : 0] wea
  .CLK_SPI(),
  .ARRAY_ENB(ARRAY8_ENB),    // input wire clkb
  .ARRAY_ADDRB(ARRAY8_ADDRB),
  .ARRAY_DATA(ARRAY8_DATA),  // input wire [11 : 0] addrb
  .RSTB(),
  .ARRAY_IN(ARRAY_IN8),
  .REFRESH(),
  .CS(),
  .CHIP_SW(),
  .CS_SW()
);



reg [3:0]     cs_cnt;

always @(posedge CLK_20M or posedge RST_ST) begin
            if (RST_ST) begin
              cs_cnt[3:0] <= 4'b0;
            end
            else if (CS_SW) begin
              cs_cnt[3:0] <= cs_cnt[3:0]+1'b1;
            end
            else begin
              cs_cnt[3:0] <= cs_cnt[3:0];
            end
end

assign CS_COUNT = {cs_cnt[3:0],LDAC_CNT[3:0]};

// assign ST_REG = CONFIG_ST||CONFIG2_ST||CONFIG3_ST||CONFIG4_ST||CONFIG5_ST||CONFIG6_ST||CONFIG7_ST||CONFIG8_ST||CONFIG9_ST||CONFIG;
// assign CLK_SPI = CLK1_SPI||CLK2_SPI||CLK3_SPI||CLK4_SPI||CLK5_SPI||CLK6_SPI||CLK7_SPI||CLK8_SPI||CLK9_SPI||CLK10_SPI||CLK11_SPI||CLK12_SPI;
assign CLK_SPI = CLK1_SPI;
//assign CLK_SPI = CLK1_SPI;

assign CS_OUT1 = ~A1_EN;
assign CS_OUT2 = ~A2_EN;
assign CS_OUT3 = ~A3_EN;
assign CS_OUT4 = ~A4_EN;
assign CS_OUT5 = ~A5_EN;
assign CS_OUT6 = ~A6_EN;
assign CS_OUT7 = ~A7_EN;
assign CS_OUT8 = ~A8_EN;
assign CS_OUT9 = ~A9_EN;
assign CS_OUT10 = ~A10_EN;
assign CS_OUT11 = ~A11_EN;
assign CS_OUT12 = ~A12_EN;
assign REFRESH_OUT = REFRESH1&&A12_EN;
// assign REFRESH_OUT = REFRESH1||REFRESH2||REFRESH3||REFRESH4||REFRESH5||REFRESH6||REFRESH7||REFRESH8||REFRESH9||REFRESH10||REFRESH11||REFRESH12;
// assign RSTB_OUT = RSTB1||RSTB2||RSTB3||RSTB4||RSTB5||RSTB6||RSTB7||RSTB8||RSTB9||RSTB10||RSTB11||RSTB12;
assign RSTB_OUT = RSTB1;
// assign ARRAY1_IN = ARRAY_IN1||ARRAY_IN5||ARRAY_IN9||ARRAY_IN13||ARRAY_IN17||ARRAY_IN21||ARRAY_IN25||ARRAY_IN29||ARRAY_IN33||ARRAY_IN37||ARRAY_IN41||ARRAY_IN45;
// assign ARRAY2_IN = ARRAY_IN2||ARRAY_IN6||ARRAY_IN10||ARRAY_IN14||ARRAY_IN18||ARRAY_IN22||ARRAY_IN26||ARRAY_IN30||ARRAY_IN34||ARRAY_IN38||ARRAY_IN42||ARRAY_IN46;
// assign ARRAY3_IN = ARRAY_IN3||ARRAY_IN7||ARRAY_IN11||ARRAY_IN15||ARRAY_IN19||ARRAY_IN23||ARRAY_IN27||ARRAY_IN31||ARRAY_IN35||ARRAY_IN39||ARRAY_IN43||ARRAY_IN47;
// assign ARRAY4_IN = ARRAY_IN4||ARRAY_IN8||ARRAY_IN12||ARRAY_IN16||ARRAY_IN20||ARRAY_IN24||ARRAY_IN28||ARRAY_IN32||ARRAY_IN36||ARRAY_IN40||ARRAY_IN44||ARRAY_IN48;

reg           A1_EN;
reg           A2_EN;
reg           A3_EN;
reg           A4_EN;
reg           A5_EN;
reg           A6_EN;
reg           A7_EN;
reg           A8_EN;
reg           A9_EN;
reg           A10_EN;
reg           A11_EN;
reg           A12_EN;

wire          RSTX;
assign RSTX = RST;
always @(posedge CLK_20M or posedge RSTX) begin
            if (RSTX) begin
              A1_EN <= 1'b0;
            end
            else if (RC_END&&CONFIG_ST) begin
              A1_EN<= 1'b1;             
            end
            else if (CS_SW) begin
              A1_EN<= 1'b0;  
            end
            else begin
              A1_EN<= A1_EN;
            end
end

always @(posedge CLK_20M or posedge RSTX) begin
            if (RSTX) begin
              A2_EN <= 1'b0;
            end
            else if (RC_END&&CONFIG2_ST) begin
              A2_EN<= 1'b1;             
            end
            else if (CS_SW) begin
              A2_EN<= 1'b0;  
            end
            else begin
              A2_EN<= A2_EN;
            end
end

always @(posedge CLK_20M or posedge RSTX) begin
            if (RSTX) begin
              A3_EN <= 1'b0;
            end
            else if (RC_END&&CONFIG3_ST) begin
              A3_EN<= 1'b1;             
            end
            else if (CS_SW) begin
              A3_EN<= 1'b0;  
            end
            else begin
              A3_EN<= A3_EN;
            end
end

always @(posedge CLK_20M or posedge RSTX) begin
            if (RSTX) begin
              A4_EN <= 1'b0;
            end
            else if (RC_END&&CONFIG4_ST) begin
              A4_EN<= 1'b1;             
            end
            else if (CS_SW) begin
              A4_EN<= 1'b0;  
            end
            else begin
              A4_EN<= A4_EN;
            end
end
always @(posedge CLK_20M or posedge RSTX) begin
            if (RSTX) begin
              A5_EN <= 1'b0;
            end
            else if (RC_END&&CONFIG5_ST) begin
              A5_EN<= 1'b1;             
            end
            else if (CS_SW) begin
              A5_EN<= 1'b0;  
            end
            else begin
              A5_EN<= A5_EN;
            end
end

always @(posedge CLK_20M or posedge RSTX) begin
            if (RSTX) begin
              A6_EN <= 1'b0;
            end
            else if (RC_END&&CONFIG6_ST) begin
              A6_EN<= 1'b1;             
            end
            else if (CS_SW) begin
              A6_EN<= 1'b0;  
            end
            else begin
              A6_EN<= A6_EN;
            end
end

always @(posedge CLK_20M or posedge RSTX) begin
            if (RSTX) begin
              A7_EN <= 1'b0;
            end
            else if (RC_END&&CONFIG7_ST) begin
              A7_EN<= 1'b1;             
            end
            else if (CS_SW) begin
              A7_EN<= 1'b0;  
            end
            else begin
              A7_EN<= A7_EN;
            end
end

always @(posedge CLK_20M or posedge RSTX) begin
            if (RSTX) begin
              A8_EN <= 1'b0;
            end
            else if (RC_END&&CONFIG8_ST) begin
              A8_EN<= 1'b1;             
            end
            else if (CS_SW) begin
              A8_EN<= 1'b0;  
            end
            else begin
              A8_EN<= A8_EN;
            end
end
always @(posedge CLK_20M or posedge RSTX) begin
            if (RSTX) begin
              A9_EN <= 1'b0;
            end
            else if (RC_END&&CONFIG9_ST) begin
              A9_EN<= 1'b1;             
            end
            else if (CS_SW) begin
              A9_EN<= 1'b0;  
            end
            else begin
              A9_EN<= A9_EN;
            end
end

always @(posedge CLK_20M or posedge RSTX) begin
            if (RSTX) begin
              A10_EN <= 1'b0;
            end
            else if (RC_END&&CONFIG10_ST) begin
              A10_EN<= 1'b1;             
            end
            else if (CS_SW) begin
              A10_EN<= 1'b0;  
            end
            else begin
              A10_EN<= A10_EN;
            end
end

always @(posedge CLK_20M or posedge RSTX) begin
            if (RSTX) begin
              A11_EN <= 1'b0;
            end
            else if (RC_END&&CONFIG11_ST) begin
              A11_EN<= 1'b1;             
            end
            else if (CS_SW) begin
              A11_EN<= 1'b0;  
            end
            else begin
              A11_EN<= A11_EN;
            end
end

always @(posedge CLK_20M or posedge RSTX) begin
            if (RSTX) begin
              A12_EN <= 1'b0;
            end
            else if (RC_END&&CONFIG12_ST) begin
              A12_EN<= 1'b1;             
            end
            else if (CS_SW) begin
              A12_EN<= 1'b0;  
            end
            else begin
              A12_EN<= A12_EN;
            end
end

wire [11:0]   A_EN;
assign A_EN = {A1_EN,A2_EN,A3_EN,A4_EN,A5_EN,A6_EN,A7_EN,A8_EN,A9_EN,A10_EN,A11_EN,A12_EN};
// assign ARRAY1_IN = ARRAY_IN1||ARRAY_IN5||ARRAY_IN9||ARRAY_IN13||ARRAY_IN17||ARRAY_IN21||ARRAY_IN25||ARRAY_IN29||ARRAY_IN33||ARRAY_IN37||ARRAY_IN41||ARRAY_IN45;
// assign ARRAY2_IN = ARRAY_IN2||ARRAY_IN6||ARRAY_IN10||ARRAY_IN14||ARRAY_IN18||ARRAY_IN22||ARRAY_IN26||ARRAY_IN30||ARRAY_IN34||ARRAY_IN38||ARRAY_IN42||ARRAY_IN46;
// assign ARRAY3_IN = ARRAY_IN3||ARRAY_IN7||ARRAY_IN11||ARRAY_IN15||ARRAY_IN19||ARRAY_IN23||ARRAY_IN27||ARRAY_IN31||ARRAY_IN35||ARRAY_IN39||ARRAY_IN43||ARRAY_IN47;
// assign ARRAY4_IN = ARRAY_IN4||ARRAY_IN8||ARRAY_IN12||ARRAY_IN16||ARRAY_IN20||ARRAY_IN24||ARRAY_IN28||ARRAY_IN32||ARRAY_IN36||ARRAY_IN40||ARRAY_IN44||ARRAY_IN48;
reg            ARRAY1_IN_reg;
reg            ARRAY2_IN_reg;
reg            ARRAY3_IN_reg;
reg            ARRAY4_IN_reg;

reg            ARRAY5_IN_reg;
reg            ARRAY6_IN_reg;
reg            ARRAY7_IN_reg;
reg            ARRAY8_IN_reg;

always@(*) begin
    case(A_EN)
      12'b100000000000:begin
        ARRAY1_IN_reg = ARRAY_IN1;
        ARRAY2_IN_reg = ARRAY_IN2;
        ARRAY3_IN_reg = ARRAY_IN3;
        ARRAY4_IN_reg = ARRAY_IN4;
        ARRAY5_IN_reg = ARRAY_IN5;
        ARRAY6_IN_reg = ARRAY_IN6;
        ARRAY7_IN_reg = ARRAY_IN7;
        ARRAY8_IN_reg = ARRAY_IN8;        
      end
      12'b010000000000:begin
        ARRAY1_IN_reg = ARRAY_IN1;
        ARRAY2_IN_reg = ARRAY_IN2;
        ARRAY3_IN_reg = ARRAY_IN3;
        ARRAY4_IN_reg = ARRAY_IN4;
        ARRAY5_IN_reg = ARRAY_IN5;
        ARRAY6_IN_reg = ARRAY_IN6;
        ARRAY7_IN_reg = ARRAY_IN7;
        ARRAY8_IN_reg = ARRAY_IN8; 
      end
      12'b001000000000:begin
        ARRAY1_IN_reg = ARRAY_IN1;
        ARRAY2_IN_reg = ARRAY_IN2;
        ARRAY3_IN_reg = ARRAY_IN3;
        ARRAY4_IN_reg = ARRAY_IN4;
        ARRAY5_IN_reg = ARRAY_IN5;
        ARRAY6_IN_reg = ARRAY_IN6;
        ARRAY7_IN_reg = ARRAY_IN7;
        ARRAY8_IN_reg = ARRAY_IN8; 
      end
      12'b000100000000:begin
        ARRAY1_IN_reg = ARRAY_IN1;
        ARRAY2_IN_reg = ARRAY_IN2;
        ARRAY3_IN_reg = ARRAY_IN3;
        ARRAY4_IN_reg = ARRAY_IN4;
        ARRAY5_IN_reg = ARRAY_IN5;
        ARRAY6_IN_reg = ARRAY_IN6;
        ARRAY7_IN_reg = ARRAY_IN7;
        ARRAY8_IN_reg = ARRAY_IN8; 
      end
      12'b000010000000:begin
        ARRAY1_IN_reg = ARRAY_IN1;
        ARRAY2_IN_reg = ARRAY_IN2;
        ARRAY3_IN_reg = ARRAY_IN3;
        ARRAY4_IN_reg = ARRAY_IN4;
        ARRAY5_IN_reg = ARRAY_IN5;
        ARRAY6_IN_reg = ARRAY_IN6;
        ARRAY7_IN_reg = ARRAY_IN7;
        ARRAY8_IN_reg = ARRAY_IN8; 
      end
      12'b000001000000:begin
        ARRAY1_IN_reg = ARRAY_IN1;
        ARRAY2_IN_reg = ARRAY_IN2;
        ARRAY3_IN_reg = ARRAY_IN3;
        ARRAY4_IN_reg = ARRAY_IN4;
        ARRAY5_IN_reg = ARRAY_IN5;
        ARRAY6_IN_reg = ARRAY_IN6;
        ARRAY7_IN_reg = ARRAY_IN7;
        ARRAY8_IN_reg = ARRAY_IN8; 
      end
      12'b000000100000:begin
        ARRAY1_IN_reg = ARRAY_IN1;
        ARRAY2_IN_reg = ARRAY_IN2;
        ARRAY3_IN_reg = ARRAY_IN3;
        ARRAY4_IN_reg = ARRAY_IN4;
        ARRAY5_IN_reg = ARRAY_IN5;
        ARRAY6_IN_reg = ARRAY_IN6;
        ARRAY7_IN_reg = ARRAY_IN7;
        ARRAY8_IN_reg = ARRAY_IN8; 
      end
      12'b000000010000:begin
        ARRAY1_IN_reg = ARRAY_IN1;
        ARRAY2_IN_reg = ARRAY_IN2;
        ARRAY3_IN_reg = ARRAY_IN3;
        ARRAY4_IN_reg = ARRAY_IN4;
        ARRAY5_IN_reg = ARRAY_IN5;
        ARRAY6_IN_reg = ARRAY_IN6;
        ARRAY7_IN_reg = ARRAY_IN7;
        ARRAY8_IN_reg = ARRAY_IN8; 
      end
      12'b000000001000:begin
        ARRAY1_IN_reg = ARRAY_IN1;
        ARRAY2_IN_reg = ARRAY_IN2;
        ARRAY3_IN_reg = ARRAY_IN3;
        ARRAY4_IN_reg = ARRAY_IN4;
        ARRAY5_IN_reg = ARRAY_IN5;
        ARRAY6_IN_reg = ARRAY_IN6;
        ARRAY7_IN_reg = ARRAY_IN7;
        ARRAY8_IN_reg = ARRAY_IN8; 
      end
      12'b000000000100:begin
        ARRAY1_IN_reg = ARRAY_IN1;
        ARRAY2_IN_reg = ARRAY_IN2;
        ARRAY3_IN_reg = ARRAY_IN3;
        ARRAY4_IN_reg = ARRAY_IN4;
        ARRAY5_IN_reg = ARRAY_IN5;
        ARRAY6_IN_reg = ARRAY_IN6;
        ARRAY7_IN_reg = ARRAY_IN7;
        ARRAY8_IN_reg = ARRAY_IN8; 
      end
      12'b000000000010:begin
        ARRAY1_IN_reg = ARRAY_IN1;
        ARRAY2_IN_reg = ARRAY_IN2;
        ARRAY3_IN_reg = ARRAY_IN3;
        ARRAY4_IN_reg = ARRAY_IN4;
        ARRAY5_IN_reg = ARRAY_IN5;
        ARRAY6_IN_reg = ARRAY_IN6;
        ARRAY7_IN_reg = ARRAY_IN7;
        ARRAY8_IN_reg = ARRAY_IN8; 
      end
      12'b000000000001:begin
        ARRAY1_IN_reg = ARRAY_IN1;
        ARRAY2_IN_reg = ARRAY_IN2;
        ARRAY3_IN_reg = ARRAY_IN3;
        ARRAY4_IN_reg = ARRAY_IN4;
        ARRAY5_IN_reg = ARRAY_IN5;
        ARRAY6_IN_reg = ARRAY_IN6;
        ARRAY7_IN_reg = ARRAY_IN7;
        ARRAY8_IN_reg = ARRAY_IN8; 
      end
      default:begin
        ARRAY1_IN_reg = 1'b0;
        ARRAY2_IN_reg = 1'b0;
        ARRAY3_IN_reg = 1'b0;
        ARRAY4_IN_reg = 1'b0;
        ARRAY5_IN_reg = 1'b0;
        ARRAY6_IN_reg = 1'b0;
        ARRAY7_IN_reg = 1'b0;
        ARRAY8_IN_reg = 1'b0;        
      end
    endcase
end





assign ARRAY1_IN = ARRAY1_IN_reg;
assign ARRAY2_IN = ARRAY2_IN_reg;
assign ARRAY3_IN = ARRAY3_IN_reg;
assign ARRAY4_IN = ARRAY4_IN_reg;

assign ARRAY5_IN = ARRAY5_IN_reg;
assign ARRAY6_IN = ARRAY6_IN_reg;
assign ARRAY7_IN = ARRAY7_IN_reg;
assign ARRAY8_IN = ARRAY8_IN_reg;

// assign ARRAY1_IN = ARRAY_IN1;
// assign ARRAY2_IN = ARRAY_IN2;
// assign ARRAY3_IN = ARRAY_IN3;
// assign ARRAY4_IN = ARRAY_IN4;

endmodule
