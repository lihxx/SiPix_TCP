`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/30 21:15:19
// Design Name: 
// Module Name: bp40trans
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




module bp40_xtrans(
  input           CLK,
  input           CLK_80M,
  input           CLK_125M,
  // output [15:0]   FRAME_COUNT,
  input [15:0]   FRAME_COUNT,
  input           frame_end,//in
  // input           FRMAE_OUTX,
  input           RST,     // 200MHz
  input           SYNC,
  output          RD_OUTEN,
  output          next_start,

  output [11:0]   A_REG,

  input           sync_start,

  output          SPIEE_PD,
  input           chip,
  input [4:0]     PHASE_CNT,
  output [15:0]   VTH1_D1,
  output [15:0]   VTH1_D2,
  output [15:0]   VTH1_D3,
  output [15:0]   VTH1_D4,
  output [15:0]   VTH1_D5,
  output [15:0]   VTH1_D6,
  output [15:0]   VTH1_D7,
  output [15:0]   VTH1_D8,
  output [15:0]   VTH1_D9,
  output [15:0]   VTH1_D10,
  output [15:0]   VTH1_D11,
  output [15:0]   VTH1_D12,
  output [15:0]   VTH2_D1,
  output [15:0]   VTH2_D2,
  output [15:0]   VTH2_D3,
  output [15:0]   VTH2_D4,
  output [15:0]   VTH2_D5,
  output [15:0]   VTH2_D6,
  output [15:0]   VTH2_D7,
  output [15:0]   VTH2_D8,
  output [15:0]   VTH2_D9,
  output [15:0]   VTH2_D10,
  output [15:0]   VTH2_D11,
  output [15:0]   VTH2_D12,
  input [9:0]     VTH1_A1,
  input [9:0]     VTH1_A2,
  input [9:0]     VTH1_A3,
  input [9:0]     VTH1_A4,
  input [9:0]     VTH1_A5,
  input [9:0]     VTH1_A6,
  input [9:0]     VTH1_A7,
  input [9:0]     VTH1_A8,
  input [9:0]     VTH1_A9,
  input [9:0]     VTH1_A10,
  input [9:0]     VTH1_A11,
  input [9:0]     VTH1_A12,
  input [9:0]     VTH2_A1,
  input [9:0]     VTH2_A2,
  input [9:0]     VTH2_A3,
  input [9:0]     VTH2_A4,
  input [9:0]     VTH2_A5,
  input [9:0]     VTH2_A6,
  input [9:0]     VTH2_A7,
  input [9:0]     VTH2_A8,
  input [9:0]     VTH2_A9,
  input [9:0]     VTH2_A10,
  input [9:0]     VTH2_A11,
  input [9:0]     VTH2_A12,

  input           VTH1_EN1,
  input           VTH1_EN2,
  input           VTH1_EN3,
  input           VTH1_EN4,
  input           VTH1_EN5,
  input           VTH1_EN6,
  input           VTH1_EN7,
  input           VTH1_EN8,
  input           VTH1_EN9,
  input           VTH1_EN10,
  input           VTH1_EN11,
  input           VTH1_EN12,
  input           VTH2_EN1,
  input           VTH2_EN2,
  input           VTH2_EN3,
  input           VTH2_EN4,
  input           VTH2_EN5,
  input           VTH2_EN6,
  input           VTH2_EN7,
  input           VTH2_EN8,
  input           VTH2_EN9,
  input           VTH2_EN10,
  input           VTH2_EN11,
  input           VTH2_EN12
    );





reg  [19:0]   s_cnt;
wire          s_start;
wire          s_end;    

always @(posedge CLK or posedge RST) begin
  if (RST) begin
    s_cnt[19:0] <= 0; 
  end
  else if (s_start) begin
      if(s_end)begin
        s_cnt[19:0] <= 0;
      end
      else begin
        s_cnt[19:0] <= s_cnt[19:0] + 1;
      end
  end
end
assign s_start = (state_reg==STATE_E);
assign s_end   = s_start&&(s_cnt[19:0]==20'd344063);//12288


reg [11:0] auto_reg;
// wire       chip_reg;

// wire       chip_reg1;

// wire       chip_reg2;

// wire       chip_reg3;
// FD chip_r (.D(chip), .C(CLK), .Q(chip_reg));
// FD chip_r1 (.D(chip_reg), .C(CLK), .Q(chip_reg1));
// FD chip_r2 (.D(chip_reg1), .C(CLK), .Q(chip_reg2));
// FD chip_r3 (.D(chip_reg2), .C(CLK), .Q(chip_reg3));
// always @(posedge CLK or posedge RST) begin
//             if (RST) begin
//               auto_reg[11:0] <= 12'd0;
//             end
//             else if (s_start&&(FRAME_COUNT[15:0]==16'd4)) begin
//               auto_reg <= {auto_reg[11:0],chip_reg3};
//             end            
//             else if (s_start&&(FRAME_COUNT[15:0]==16'd4)) begin
//               auto_reg <= {auto_reg[11:0],chip_reg3};
//             end  
//             else begin
//               auto_reg[11:0] <= auto_reg[11:0];
//             end
// end
wire          sync_neg;
wire          sync_reg;

FD sync (.D(SYNC), .C(CLK), .Q(sync_reg));

assign sync_neg = (~SYNC)&&sync_reg;


reg SYNC_EN;

always @(posedge CLK or posedge RST) begin
  if (RST) begin
    SYNC_EN <= 0; 
  end
  else if (sync_start&&(FRAME_COUNT[15:0]==16'd4)) begin
        SYNC_EN <= 1'b1;
  end
  else if (sync_neg) begin
        SYNC_EN <= 1'b0;
  end  
  else begin
        SYNC_EN <= SYNC_EN;
  end
end
always @(posedge CLK or posedge RST) begin
  if (RST) begin
    auto_reg <= 12'd0; 
  end
  // else if (SYNC_EN&&(FRAME_COUNT[15:0]==16'd5)) begin
  else if (SYNC_EN) begin
        auto_reg <= auto_reg+1'b1;
  end  
  else begin
        auto_reg <= auto_reg;
  end
end







// ila_isync ila_isync (
//   .clk(CLK), // input wire clk


//   .probe0(SYNC_EN), // input wire [0:0]  probe0  
//   .probe1(sync_neg), // input wire [0:0]  probe1 
//   .probe2(sync_start), // input wire [0:0]  probe2 
//   .probe3(auto_reg) // input wire [11:0]  probe3
// );
assign A_REG[11:0] = auto_reg[11:0];

// State Machine
reg [1:0] state_reg, state_next;
localparam
  IDLE           = 0,
  STATE_F        = 1,
  STATE_E        = 2;

always @(posedge CLK or posedge RST) begin
  if (RST) state_reg <= IDLE;
  else state_reg <= state_next;
end

always @(*) begin
  state_next = IDLE;
  case(state_reg)
    IDLE: begin    //STATE1
      if(frame_end) begin
        state_next = STATE_F;
      end  
      else begin
        state_next = IDLE;
      end
    end
    STATE_F: begin    //STATE1
      if(phase_end) begin
        state_next = STATE_E;
      end  
      else begin
        state_next = STATE_F;
      end
    end    
    STATE_E: begin    //STATE1
      if(s_end) begin
        state_next = IDLE;
      end  
      else begin
        state_next = STATE_E;
      end
    end
  endcase
end


reg  [4:0]   frame_cnt;
wire         frame_start;
wire         phase_end;    

always @(posedge CLK or posedge RST) begin
  if (RST) begin
    frame_cnt[4:0] <= 0; 
  end
  else if (frame_start) begin
      if(phase_end)begin
        frame_cnt[4:0] <= 0;
      end
      else begin
        frame_cnt[4:0] <= frame_cnt[4:0] + 1;
      end
  end
end
assign frame_start = (state_reg==STATE_F);
assign phase_end   = frame_start&&(frame_cnt[4:0]==PHASE_CNT);//12288 //4/16/28


reg  [9:0]   spi_cnt;
wire         spi_start;
wire         spi_end;    

always @(posedge CLK or posedge RST) begin
  if (RST) begin
    spi_cnt[9:0] <= 0; 
  end
  else if (spi_start) begin
      if(spi_end)begin
        spi_cnt[9:0] <= 0;
      end
      else begin
        spi_cnt[9:0] <= spi_cnt[9:0] + 1;
      end
  end
end
assign spi_start = (state_reg==STATE_E);
assign spi_end   = spi_start&&(spi_cnt[9:0]==10'd335);//12288

wire  spiee_r;

FD spiee (.D(spi_end), .C(CLK), .Q(spiee_r));

wire  spiee_rr;

FD spieee (.D(spiee_r), .C(CLK), .Q(spiee_rr));


assign SPIEE_PD = s_end;


reg  read_outen;

  // Flag_CrossDomain Flag_CrossDomain (
  //     .clkA           (CLK),
  //     .FlagIn_clkA    (spiee_r),
  //     .clkB           (CLK_80M),
  //     .FlagOut_clkB   (read_outen));
reg  [4:0]   rd_cnt;
wire         rd_start;
wire         rd_end;   
always @(posedge CLK or posedge RST) begin
  if (RST) begin
    rd_cnt[4:0] <= 0; 
    read_outen <= 1'b0;
  end
  else if (s_end) begin
    rd_cnt[4:0] <= 5'd1;
    read_outen <= 1'b0;
  end
  else if (rd_cnt[4:0] == 5'd1) begin
    rd_cnt[4:0] <= 5'd2;
    read_outen <= 1'b0;
  end
  else if (rd_cnt[4:0] == 5'd2) begin
    rd_cnt[4:0] <= 5'd3;
    read_outen <= 1'b0;
  end
  else if (rd_cnt[4:0] == 5'd3) begin
    rd_cnt[4:0] <= 5'd4;
    read_outen <= 1'b0;
  end
  else if (rd_cnt[4:0] == 5'd4) begin
    rd_cnt[4:0] <= 5'd5;
    read_outen <= 1'b1;
  end
  else if (rd_cnt[4:0] == 5'd5) begin
    rd_cnt[4:0] <= 5'd6;
    read_outen <= 1'b1;
  end
  else if (rd_cnt[4:0] == 5'd6) begin
    rd_cnt[4:0] <= 5'd7;
    read_outen <= 1'b1;
  end
  else if (rd_cnt[4:0] == 5'd7) begin
    rd_cnt[4:0] <= 5'd8;
    read_outen <= 1'b1;
  end
  else if (rd_cnt[4:0] == 5'd8) begin
    rd_cnt[4:0] <= 5'd9;
    read_outen <= 1'b1;
  end
  else if (rd_cnt[4:0] == 5'd9) begin
    rd_cnt[4:0] <= 5'd10;
    read_outen <= 1'b1;
  end
  else if (rd_cnt[4:0] == 5'd10) begin
    rd_cnt[4:0] <= 5'd11;
    read_outen <= 1'b1;
  end
  else if (rd_cnt[4:0] == 5'd11) begin
    rd_cnt[4:0] <= 5'd12;
    read_outen <= 1'b1;
  end
  else if (rd_cnt[4:0] == 5'd12) begin
    rd_cnt[4:0] <= 5'd0;
    read_outen <= 1'b0;
  end
  else begin
    rd_cnt[4:0] <= rd_cnt[4:0];
    read_outen <= read_outen;   
  end
end




assign RD_OUTEN = read_outen;

reg  [31:0]   spi1_clk_reg;
reg  [31:0]   spi2_clk_reg;
reg  [31:0]   spi3_clk_reg;
reg  [31:0]   spi4_clk_reg;
reg  [31:0]   spi5_clk_reg;
reg  [31:0]   spi6_clk_reg;
reg  [31:0]   spi7_clk_reg;
reg  [31:0]   spi8_clk_reg;
reg  [31:0]   spi9_clk_reg;
reg  [31:0]   spi10_clk_reg;
reg  [31:0]   spi11_clk_reg;
reg  [31:0]   spi12_clk_reg;


always @(posedge CLK or posedge RST) begin
            if (RST) begin
              spi1_clk_reg <= 32'b0;
              spi2_clk_reg <= 32'b0;
              spi3_clk_reg <= 32'b0;
              spi4_clk_reg <= 32'b0;
              spi5_clk_reg <= 32'b0;
              spi6_clk_reg <= 32'b0;
              spi7_clk_reg <= 32'b0;
              spi8_clk_reg <= 32'b0;
              spi9_clk_reg <= 32'b0;
              spi10_clk_reg <= 32'b0;
              spi11_clk_reg <= 32'b0;
              spi12_clk_reg <= 32'b0;
            end
            else if (s_start&&((spi_cnt[9:0]==10'd0)||(spi_cnt[9:0]==10'd12)||(spi_cnt[9:0]==10'd24)||(spi_cnt[9:0]==10'd36)||(spi_cnt[9:0]==10'd48)||(spi_cnt[9:0]==10'd60)||(spi_cnt[9:0]==10'd72)||(spi_cnt[9:0]==10'd84)||(spi_cnt[9:0]==10'd96)||(spi_cnt[9:0]==10'd108)||(spi_cnt[9:0]==10'd120)||(spi_cnt[9:0]==10'd132)||(spi_cnt[9:0]==10'd144)||(spi_cnt[9:0]==10'd156)||(spi_cnt[9:0]==10'd168)||(spi_cnt[9:0]==10'd180)||(spi_cnt[9:0]==10'd192)||(spi_cnt[9:0]==10'd204)||(spi_cnt[9:0]==10'd216)||(spi_cnt[9:0]==10'd228)||(spi_cnt[9:0]==10'd240)||(spi_cnt[9:0]==10'd252)||(spi_cnt[9:0]==10'd264)||(spi_cnt[9:0]==10'd276)||(spi_cnt[9:0]==10'd288)||(spi_cnt[9:0]==10'd300)||(spi_cnt[9:0]==10'd312)||(spi_cnt[9:0]==10'd324))) begin
              spi1_clk_reg <= {spi1_clk_reg[30:0],chip};
            end
            else if ((spi_cnt[9:0]==10'd1)||(spi_cnt[9:0]==10'd13)||(spi_cnt[9:0]==10'd25)||(spi_cnt[9:0]==10'd37)||(spi_cnt[9:0]==10'd49)||(spi_cnt[9:0]==10'd61)||(spi_cnt[9:0]==10'd73)||(spi_cnt[9:0]==10'd85)||(spi_cnt[9:0]==10'd97)||(spi_cnt[9:0]==10'd109)||(spi_cnt[9:0]==10'd121)||(spi_cnt[9:0]==10'd133)||(spi_cnt[9:0]==10'd145)||(spi_cnt[9:0]==10'd157)||(spi_cnt[9:0]==10'd169)||(spi_cnt[9:0]==10'd181)||(spi_cnt[9:0]==10'd193)||(spi_cnt[9:0]==10'd205)||(spi_cnt[9:0]==10'd217)||(spi_cnt[9:0]==10'd229)||(spi_cnt[9:0]==10'd241)||(spi_cnt[9:0]==10'd253)||(spi_cnt[9:0]==10'd265)||(spi_cnt[9:0]==10'd277)||(spi_cnt[9:0]==10'd289)||(spi_cnt[9:0]==10'd301)||(spi_cnt[9:0]==10'd313)||(spi_cnt[9:0]==10'd325)) begin
              spi2_clk_reg <= {spi2_clk_reg[30:0],chip};
            end
            else if ((spi_cnt[9:0]==10'd2)||(spi_cnt[9:0]==10'd14)||(spi_cnt[9:0]==10'd26)||(spi_cnt[9:0]==10'd38)||(spi_cnt[9:0]==10'd50)||(spi_cnt[9:0]==10'd62)||(spi_cnt[9:0]==10'd74)||(spi_cnt[9:0]==10'd86)||(spi_cnt[9:0]==10'd98)||(spi_cnt[9:0]==10'd110)||(spi_cnt[9:0]==10'd122)||(spi_cnt[9:0]==10'd134)||(spi_cnt[9:0]==10'd146)||(spi_cnt[9:0]==10'd158)||(spi_cnt[9:0]==10'd170)||(spi_cnt[9:0]==10'd182)||(spi_cnt[9:0]==10'd194)||(spi_cnt[9:0]==10'd206)||(spi_cnt[9:0]==10'd218)||(spi_cnt[9:0]==10'd230)||(spi_cnt[9:0]==10'd242)||(spi_cnt[9:0]==10'd254)||(spi_cnt[9:0]==10'd266)||(spi_cnt[9:0]==10'd278)||(spi_cnt[9:0]==10'd290)||(spi_cnt[9:0]==10'd302)||(spi_cnt[9:0]==10'd314)||(spi_cnt[9:0]==10'd326)) begin
              spi3_clk_reg <= {spi3_clk_reg[30:0],chip};
            end
            else if ((spi_cnt[9:0]==10'd3)||(spi_cnt[9:0]==10'd15)||(spi_cnt[9:0]==10'd27)||(spi_cnt[9:0]==10'd39)||(spi_cnt[9:0]==10'd51)||(spi_cnt[9:0]==10'd63)||(spi_cnt[9:0]==10'd75)||(spi_cnt[9:0]==10'd87)||(spi_cnt[9:0]==10'd99)||(spi_cnt[9:0]==10'd111)||(spi_cnt[9:0]==10'd123)||(spi_cnt[9:0]==10'd135)||(spi_cnt[9:0]==10'd147)||(spi_cnt[9:0]==10'd159)||(spi_cnt[9:0]==10'd171)||(spi_cnt[9:0]==10'd183)||(spi_cnt[9:0]==10'd195)||(spi_cnt[9:0]==10'd207)||(spi_cnt[9:0]==10'd219)||(spi_cnt[9:0]==10'd231)||(spi_cnt[9:0]==10'd243)||(spi_cnt[9:0]==10'd255)||(spi_cnt[9:0]==10'd267)||(spi_cnt[9:0]==10'd279)||(spi_cnt[9:0]==10'd291)||(spi_cnt[9:0]==10'd303)||(spi_cnt[9:0]==10'd315)||(spi_cnt[9:0]==10'd327)) begin
              spi4_clk_reg <= {spi4_clk_reg[30:0],chip};
            end 
            else if ((spi_cnt[9:0]==10'd4)||(spi_cnt[9:0]==10'd16)||(spi_cnt[9:0]==10'd28)||(spi_cnt[9:0]==10'd40)||(spi_cnt[9:0]==10'd52)||(spi_cnt[9:0]==10'd64)||(spi_cnt[9:0]==10'd76)||(spi_cnt[9:0]==10'd88)||(spi_cnt[9:0]==10'd100)||(spi_cnt[9:0]==10'd112)||(spi_cnt[9:0]==10'd124)||(spi_cnt[9:0]==10'd136)||(spi_cnt[9:0]==10'd148)||(spi_cnt[9:0]==10'd160)||(spi_cnt[9:0]==10'd172)||(spi_cnt[9:0]==10'd184)||(spi_cnt[9:0]==10'd196)||(spi_cnt[9:0]==10'd208)||(spi_cnt[9:0]==10'd220)||(spi_cnt[9:0]==10'd232)||(spi_cnt[9:0]==10'd244)||(spi_cnt[9:0]==10'd256)||(spi_cnt[9:0]==10'd268)||(spi_cnt[9:0]==10'd280)||(spi_cnt[9:0]==10'd292)||(spi_cnt[9:0]==10'd304)||(spi_cnt[9:0]==10'd316)||(spi_cnt[9:0]==10'd328)) begin
              spi5_clk_reg <= {spi5_clk_reg[30:0],chip};
            end
            else if ((spi_cnt[9:0]==10'd5)||(spi_cnt[9:0]==10'd17)||(spi_cnt[9:0]==10'd29)||(spi_cnt[9:0]==10'd41)||(spi_cnt[9:0]==10'd53)||(spi_cnt[9:0]==10'd65)||(spi_cnt[9:0]==10'd77)||(spi_cnt[9:0]==10'd89)||(spi_cnt[9:0]==10'd101)||(spi_cnt[9:0]==10'd113)||(spi_cnt[9:0]==10'd125)||(spi_cnt[9:0]==10'd137)||(spi_cnt[9:0]==10'd149)||(spi_cnt[9:0]==10'd161)||(spi_cnt[9:0]==10'd173)||(spi_cnt[9:0]==10'd185)||(spi_cnt[9:0]==10'd197)||(spi_cnt[9:0]==10'd209)||(spi_cnt[9:0]==10'd221)||(spi_cnt[9:0]==10'd233)||(spi_cnt[9:0]==10'd245)||(spi_cnt[9:0]==10'd257)||(spi_cnt[9:0]==10'd269)||(spi_cnt[9:0]==10'd281)||(spi_cnt[9:0]==10'd293)||(spi_cnt[9:0]==10'd305)||(spi_cnt[9:0]==10'd317)||(spi_cnt[9:0]==10'd329)) begin
              spi6_clk_reg <= {spi6_clk_reg[30:0],chip};
            end
            else if ((spi_cnt[9:0]==10'd6)||(spi_cnt[9:0]==10'd18)||(spi_cnt[9:0]==10'd30)||(spi_cnt[9:0]==10'd42)||(spi_cnt[9:0]==10'd54)||(spi_cnt[9:0]==10'd66)||(spi_cnt[9:0]==10'd78)||(spi_cnt[9:0]==10'd90)||(spi_cnt[9:0]==10'd102)||(spi_cnt[9:0]==10'd114)||(spi_cnt[9:0]==10'd126)||(spi_cnt[9:0]==10'd138)||(spi_cnt[9:0]==10'd150)||(spi_cnt[9:0]==10'd162)||(spi_cnt[9:0]==10'd174)||(spi_cnt[9:0]==10'd186)||(spi_cnt[9:0]==10'd198)||(spi_cnt[9:0]==10'd210)||(spi_cnt[9:0]==10'd222)||(spi_cnt[9:0]==10'd234)||(spi_cnt[9:0]==10'd246)||(spi_cnt[9:0]==10'd258)||(spi_cnt[9:0]==10'd270)||(spi_cnt[9:0]==10'd282)||(spi_cnt[9:0]==10'd294)||(spi_cnt[9:0]==10'd306)||(spi_cnt[9:0]==10'd318)||(spi_cnt[9:0]==10'd330)) begin
              spi7_clk_reg <= {spi7_clk_reg[30:0],chip};
            end
            else if ((spi_cnt[9:0]==10'd7)||(spi_cnt[9:0]==10'd19)||(spi_cnt[9:0]==10'd31)||(spi_cnt[9:0]==10'd43)||(spi_cnt[9:0]==10'd55)||(spi_cnt[9:0]==10'd67)||(spi_cnt[9:0]==10'd79)||(spi_cnt[9:0]==10'd91)||(spi_cnt[9:0]==10'd103)||(spi_cnt[9:0]==10'd115)||(spi_cnt[9:0]==10'd127)||(spi_cnt[9:0]==10'd139)||(spi_cnt[9:0]==10'd151)||(spi_cnt[9:0]==10'd163)||(spi_cnt[9:0]==10'd175)||(spi_cnt[9:0]==10'd187)||(spi_cnt[9:0]==10'd199)||(spi_cnt[9:0]==10'd211)||(spi_cnt[9:0]==10'd223)||(spi_cnt[9:0]==10'd235)||(spi_cnt[9:0]==10'd247)||(spi_cnt[9:0]==10'd259)||(spi_cnt[9:0]==10'd271)||(spi_cnt[9:0]==10'd283)||(spi_cnt[9:0]==10'd295)||(spi_cnt[9:0]==10'd307)||(spi_cnt[9:0]==10'd319)||(spi_cnt[9:0]==10'd331)) begin
              spi8_clk_reg <= {spi8_clk_reg[30:0],chip};
            end 
            else if ((spi_cnt[9:0]==10'd8)||(spi_cnt[9:0]==10'd20)||(spi_cnt[9:0]==10'd32)||(spi_cnt[9:0]==10'd44)||(spi_cnt[9:0]==10'd56)||(spi_cnt[9:0]==10'd68)||(spi_cnt[9:0]==10'd80)||(spi_cnt[9:0]==10'd92)||(spi_cnt[9:0]==10'd104)||(spi_cnt[9:0]==10'd116)||(spi_cnt[9:0]==10'd128)||(spi_cnt[9:0]==10'd140)||(spi_cnt[9:0]==10'd152)||(spi_cnt[9:0]==10'd164)||(spi_cnt[9:0]==10'd176)||(spi_cnt[9:0]==10'd188)||(spi_cnt[9:0]==10'd200)||(spi_cnt[9:0]==10'd212)||(spi_cnt[9:0]==10'd224)||(spi_cnt[9:0]==10'd236)||(spi_cnt[9:0]==10'd248)||(spi_cnt[9:0]==10'd260)||(spi_cnt[9:0]==10'd272)||(spi_cnt[9:0]==10'd284)||(spi_cnt[9:0]==10'd296)||(spi_cnt[9:0]==10'd308)||(spi_cnt[9:0]==10'd320)||(spi_cnt[9:0]==10'd332)) begin
              spi9_clk_reg <= {spi9_clk_reg[30:0],chip};
            end
            else if ((spi_cnt[9:0]==10'd9)||(spi_cnt[9:0]==10'd21)||(spi_cnt[9:0]==10'd33)||(spi_cnt[9:0]==10'd45)||(spi_cnt[9:0]==10'd57)||(spi_cnt[9:0]==10'd69)||(spi_cnt[9:0]==10'd81)||(spi_cnt[9:0]==10'd93)||(spi_cnt[9:0]==10'd105)||(spi_cnt[9:0]==10'd117)||(spi_cnt[9:0]==10'd129)||(spi_cnt[9:0]==10'd141)||(spi_cnt[9:0]==10'd153)||(spi_cnt[9:0]==10'd165)||(spi_cnt[9:0]==10'd177)||(spi_cnt[9:0]==10'd189)||(spi_cnt[9:0]==10'd201)||(spi_cnt[9:0]==10'd213)||(spi_cnt[9:0]==10'd225)||(spi_cnt[9:0]==10'd237)||(spi_cnt[9:0]==10'd249)||(spi_cnt[9:0]==10'd261)||(spi_cnt[9:0]==10'd273)||(spi_cnt[9:0]==10'd285)||(spi_cnt[9:0]==10'd297)||(spi_cnt[9:0]==10'd309)||(spi_cnt[9:0]==10'd321)||(spi_cnt[9:0]==10'd333)) begin
              spi10_clk_reg <= {spi10_clk_reg[30:0],chip};
            end
            else if ((spi_cnt[9:0]==10'd10)||(spi_cnt[9:0]==10'd22)||(spi_cnt[9:0]==10'd34)||(spi_cnt[9:0]==10'd46)||(spi_cnt[9:0]==10'd58)||(spi_cnt[9:0]==10'd70)||(spi_cnt[9:0]==10'd82)||(spi_cnt[9:0]==10'd94)||(spi_cnt[9:0]==10'd106)||(spi_cnt[9:0]==10'd118)||(spi_cnt[9:0]==10'd130)||(spi_cnt[9:0]==10'd142)||(spi_cnt[9:0]==10'd154)||(spi_cnt[9:0]==10'd166)||(spi_cnt[9:0]==10'd178)||(spi_cnt[9:0]==10'd190)||(spi_cnt[9:0]==10'd202)||(spi_cnt[9:0]==10'd214)||(spi_cnt[9:0]==10'd226)||(spi_cnt[9:0]==10'd238)||(spi_cnt[9:0]==10'd250)||(spi_cnt[9:0]==10'd262)||(spi_cnt[9:0]==10'd274)||(spi_cnt[9:0]==10'd286)||(spi_cnt[9:0]==10'd298)||(spi_cnt[9:0]==10'd310)||(spi_cnt[9:0]==10'd322)||(spi_cnt[9:0]==10'd334)) begin
              spi11_clk_reg <= {spi11_clk_reg[30:0],chip};
            end
            else if ((spi_cnt[9:0]==10'd11)||(spi_cnt[9:0]==10'd23)||(spi_cnt[9:0]==10'd35)||(spi_cnt[9:0]==10'd47)||(spi_cnt[9:0]==10'd59)||(spi_cnt[9:0]==10'd71)||(spi_cnt[9:0]==10'd83)||(spi_cnt[9:0]==10'd95)||(spi_cnt[9:0]==10'd107)||(spi_cnt[9:0]==10'd119)||(spi_cnt[9:0]==10'd131)||(spi_cnt[9:0]==10'd143)||(spi_cnt[9:0]==10'd155)||(spi_cnt[9:0]==10'd167)||(spi_cnt[9:0]==10'd179)||(spi_cnt[9:0]==10'd191)||(spi_cnt[9:0]==10'd203)||(spi_cnt[9:0]==10'd215)||(spi_cnt[9:0]==10'd227)||(spi_cnt[9:0]==10'd239)||(spi_cnt[9:0]==10'd251)||(spi_cnt[9:0]==10'd263)||(spi_cnt[9:0]==10'd275)||(spi_cnt[9:0]==10'd287)||(spi_cnt[9:0]==10'd299)||(spi_cnt[9:0]==10'd311)||(spi_cnt[9:0]==10'd323)||(spi_cnt[9:0]==10'd335)) begin
              spi12_clk_reg <= {spi12_clk_reg[30:0],chip};
            end
            else begin
              spi1_clk_reg <= spi1_clk_reg;
              spi2_clk_reg <= spi2_clk_reg;
              spi3_clk_reg <= spi3_clk_reg;
              spi4_clk_reg <= spi4_clk_reg;
              spi5_clk_reg <= spi5_clk_reg;
              spi6_clk_reg <= spi6_clk_reg;
              spi7_clk_reg <= spi7_clk_reg;
              spi8_clk_reg <= spi8_clk_reg;
              spi9_clk_reg <= spi9_clk_reg;
              spi10_clk_reg <= spi10_clk_reg;
              spi11_clk_reg <= spi11_clk_reg;
              spi12_clk_reg <= spi12_clk_reg;
            end
end



reg  [15:0]   dat1;
reg  [15:0]   dat2;
reg  [15:0]   dat3;
reg  [15:0]   dat4;
reg  [15:0]   dat5;
reg  [15:0]   dat6;
reg  [15:0]   dat7;
reg  [15:0]   dat8;
reg  [15:0]   dat9;
reg  [15:0]   dat10;
reg  [15:0]   dat11;
reg  [15:0]   dat12;

reg  [15:0]   dat2_1;
reg  [15:0]   dat2_2;
reg  [15:0]   dat2_3;
reg  [15:0]   dat2_4;
reg  [15:0]   dat2_5;
reg  [15:0]   dat2_6;
reg  [15:0]   dat2_7;
reg  [15:0]   dat2_8;
reg  [15:0]   dat2_9;
reg  [15:0]   dat2_10;
reg  [15:0]   dat2_11;
reg  [15:0]   dat2_12;

reg  [9:0]   addr1;
reg  [9:0]   addr2;
reg  [9:0]   addr3;
reg  [9:0]   addr4;
reg  [9:0]   addr5;
reg  [9:0]   addr6;
reg  [9:0]   addr7;
reg  [9:0]   addr8;
reg  [9:0]   addr9;
reg  [9:0]   addr10;
reg  [9:0]   addr11;
reg  [9:0]   addr12;


//20230917


always @(posedge CLK or posedge RST) begin
            if (RST) begin
              dat1 <= 16'h0;
              dat2 <= 16'h0;
              dat3 <= 16'h0;
              dat4 <= 16'h0;
              dat5 <= 16'h0;
              dat6 <= 16'h0;
              dat7 <= 16'h0;
              dat8 <= 16'h0;
              dat9 <= 16'h0;
              dat10 <= 16'h0;
              dat11 <= 16'h0;
              dat12 <= 16'h0;
              dat2_1 <= 16'h0;
              dat2_2 <= 16'h0;
              dat2_3 <= 16'h0;
              dat2_4 <= 16'h0;
              dat2_5 <= 16'h0;
              dat2_6 <= 16'h0;
              dat2_7 <= 16'h0;
              dat2_8 <= 16'h0;
              dat2_9 <= 16'h0;
              dat2_10 <= 16'h0;
              dat2_11 <= 16'h0;
              dat2_12 <= 16'h0;
            end
            else if (spiee_r) begin //spiee_r
              dat12 <= {2'b0,spi12_clk_reg[13:0]};
              dat2_12 <= {2'b0,spi12_clk_reg[27:14]};
            end 
            else if (spi_cnt[9:0]==10'd325) begin //spi_cnt[9:0]==10'd325
              dat1 <= {2'b0,spi1_clk_reg[13:0]};
              dat2_1 <= {2'b0,spi1_clk_reg[27:14]};
            end
            else if (spi_cnt[9:0]==10'd326) begin //spi_cnt[9:0]==10'd326
              dat2 <= {2'b0,spi2_clk_reg[13:0]};
              dat2_2 <= {2'b0,spi2_clk_reg[27:14]};
            end
            else if (spi_cnt[9:0]==10'd327) begin //spi_cnt[9:0]==10'd327
              dat3 <= {2'b0,spi3_clk_reg[13:0]};
              dat2_3 <= {2'b0,spi3_clk_reg[27:14]};
            end
            else if (spi_cnt[9:0]==10'd328) begin //spi_cnt[9:0]==10'd328
              dat4 <= {2'b0,spi4_clk_reg[13:0]};
              dat2_4 <= {2'b0,spi4_clk_reg[27:14]};
            end 
            else if (spi_cnt[9:0]==10'd329) begin //spi_cnt[9:0]==10'd329
              dat5 <= {2'b0,spi5_clk_reg[13:0]};
              dat2_5 <= {2'b0,spi5_clk_reg[27:14]};
            end
            else if (spi_cnt[9:0]==10'd330) begin //spi_cnt[9:0]==10'd330
              dat6 <= {2'b0,spi6_clk_reg[13:0]};
              dat2_6 <= {2'b0,spi6_clk_reg[27:14]};
            end
            else if (spi_cnt[9:0]==10'd331) begin //spi_cnt[9:0]==10'd331
              dat7 <= {2'b0,spi7_clk_reg[13:0]};
              dat2_7 <= {2'b0,spi7_clk_reg[27:14]};
            end
            else if (spi_cnt[9:0]==10'd332) begin //spi_cnt[9:0]==10'd332
              dat8 <= {2'b0,spi8_clk_reg[13:0]};
              dat2_8 <= {2'b0,spi8_clk_reg[27:14]};
            end 
            else if (spi_cnt[9:0]==10'd333) begin //spi_cnt[9:0]==10'd333
              dat9 <= {2'b0,spi9_clk_reg[13:0]};
              dat2_9 <= {2'b0,spi9_clk_reg[27:14]};
            end
            else if (spi_cnt[9:0]==10'd334) begin //spi_cnt[9:0]==10'd334
              dat10 <= {2'b0,spi10_clk_reg[13:0]};
              dat2_10 <= {2'b0,spi10_clk_reg[27:14]};
            end
            else if (spi_cnt[9:0]==10'd335) begin //spi_cnt[9:0]==10'd335
              dat11 <= {2'b0,spi11_clk_reg[13:0]};
              dat2_11 <= {2'b0,spi11_clk_reg[27:14]};
            end  
 
            else begin
              dat1 <= dat1;
              dat2 <= dat2;
              dat3 <= dat3;
              dat4 <= dat4;
              dat5 <= dat5;
              dat6 <= dat6;
              dat7 <= dat7;
              dat8 <= dat8;
              dat9 <= dat9;
              dat10 <= dat10;
              dat11 <= dat11;
              dat12 <= dat12;
              dat2_1 <= dat2_1;
              dat2_2 <= dat2_2;
              dat2_3 <= dat2_3;
              dat2_4 <= dat2_4;
              dat2_5 <= dat2_5;
              dat2_6 <= dat2_6;
              dat2_7 <= dat2_7;
              dat2_8 <= dat2_8;
              dat2_9 <= dat2_9;
              dat2_10 <= dat2_10;
              dat2_11 <= dat2_11;
              dat2_12 <= dat2_12;
            end
end



always @(posedge CLK or posedge RST) begin
            if (RST) begin
              addr1 <= 0;
              addr2 <= 0;
              addr3 <= 0;
              addr4 <= 0;
              addr5 <= 0;
              addr6 <= 0;
              addr7 <= 0;
              addr8 <= 0;
              addr9 <= 0;
              addr10 <= 0;
              addr11 <= 0;
              addr12 <= 0;
            end
            else if (spiee_rr) begin //spiee_r
              addr12 <= addr12+1'b1;
            end 
            else if (spi_cnt[9:0]==10'd326) begin //spi_cnt[9:0]==10'd325
              addr1 <= addr1+1'b1;
            end
            else if (spi_cnt[9:0]==10'd327) begin //spi_cnt[9:0]==10'd326
              addr2 <= addr2+1'b1;
            end
            else if (spi_cnt[9:0]==10'd328) begin //spi_cnt[9:0]==10'd327
              addr3 <= addr3+1'b1;
            end
            else if (spi_cnt[9:0]==10'd329) begin //spi_cnt[9:0]==10'd328
              addr4 <= addr4+1'b1;
            end 
            else if (spi_cnt[9:0]==10'd330) begin //spi_cnt[9:0]==10'd329
              addr5 <= addr5+1'b1;
            end
            else if (spi_cnt[9:0]==10'd331) begin //spi_cnt[9:0]==10'd330
              addr6 <= addr6+1'b1;
            end
            else if (spi_cnt[9:0]==10'd332) begin //spi_cnt[9:0]==10'd331
              addr7 <= addr7+1'b1;
            end
            else if (spi_cnt[9:0]==10'd333) begin //spi_cnt[9:0]==10'd332
              addr8 <= addr8+1'b1;
            end 
            else if (spi_cnt[9:0]==10'd334) begin //spi_cnt[9:0]==10'd333
              addr9 <= addr9+1'b1;
            end
            else if (spi_cnt[9:0]==10'd335) begin //spi_cnt[9:0]==10'd334
              addr10 <= addr10+1'b1;
            end
            else if (spiee_r) begin //spi_cnt[9:0]==10'd335
              addr11 <= addr11+1'b1;
            end  
 
            else begin
              addr1 <= addr1;
              addr2 <= addr2;
              addr3 <= addr3;
              addr4 <= addr4;
              addr5 <= addr5;
              addr6 <= addr6;
              addr7 <= addr7;
              addr8 <= addr8;
              addr9 <= addr9;
              addr10 <= addr10;
              addr11 <= addr11;
              addr12 <= addr12;
            end
end

  reg       w_1;
  reg       w_2;
  reg       w_3;
  reg       w_4;
  reg       w_5;
  reg       w_6;
  reg       w_7;
  reg       w_8;
  reg       w_9;
  reg       w_10;
  reg       w_11;
  // reg       w_12;
  wire      w_12;

always @(posedge CLK or posedge RST) begin
            if (RST) begin
              w_1 <= 1'b0;
              w_2 <= 1'b0;
              w_3 <= 1'b0;
              w_4 <= 1'b0;
              w_5 <= 1'b0;
              w_6 <= 1'b0;
              w_7 <= 1'b0;
              w_8 <= 1'b0;
              w_9 <= 1'b0;
              w_10 <= 1'b0;
              w_11 <= 1'b0;
              // w_12 <= 1'b0;
            end
            else if (spiee_r) begin //spiee_r
              // w_12 <= 1'b1;
              w_11 <= 1'b0;
            end 
            else if (spi_cnt[9:0]==10'd325) begin //spi_cnt[9:0]==10'd325
              w_1 <= 1'b1;
              // w_12 <= 1'b0;
            end
            else if (spi_cnt[9:0]==10'd326) begin //spi_cnt[9:0]==10'd326
              w_2 <= 1'b1;
              w_1 <= 1'b0;
            end
            else if (spi_cnt[9:0]==10'd327) begin //spi_cnt[9:0]==10'd327
              w_3 <= 1'b1;
              w_2 <= 1'b0;
            end
            else if (spi_cnt[9:0]==10'd328) begin //spi_cnt[9:0]==10'd328
              w_4 <= 1'b1;
              w_3 <= 1'b0;
            end 
            else if (spi_cnt[9:0]==10'd329) begin //spi_cnt[9:0]==10'd329
              w_5 <= 1'b1;
              w_4 <= 1'b0;
            end
            else if (spi_cnt[9:0]==10'd330) begin //spi_cnt[9:0]==10'd330
              w_6 <= 1'b1;
              w_5 <= 1'b0;
            end
            else if (spi_cnt[9:0]==10'd331) begin //spi_cnt[9:0]==10'd331
              w_7 <= 1'b1;
              w_6 <= 1'b0;
            end
            else if (spi_cnt[9:0]==10'd332) begin //spi_cnt[9:0]==10'd332
              w_8 <= 1'b1;
              w_7 <= 1'b0;
            end 
            else if (spi_cnt[9:0]==10'd333) begin //spi_cnt[9:0]==10'd333
              w_9 <= 1'b1;
              w_8 <= 1'b0;
            end
            else if (spi_cnt[9:0]==10'd334) begin //spi_cnt[9:0]==10'd334
              w_10 <= 1'b1;
              w_9 <= 1'b0;
            end
            else if (spi_cnt[9:0]==10'd335) begin //spi_cnt[9:0]==10'd335
              w_11 <= 1'b1;
              w_10 <= 1'b0;
            end  
 
            else begin
              w_1 <= w_1;
              w_2 <= w_2;
              w_3 <= w_3;
              w_4 <= w_4;
              w_5 <= w_5;
              w_6 <= w_6;
              w_7 <= w_7;
              w_8 <= w_8;
              w_9 <= w_9;
              w_10 <= w_10;
              w_11 <= w_11;
              // w_12 <= w_12;
            end
end

// assign w_12 = spiee_rr;
FD W12 (.D(w_11), .C(CLK), .Q(w_12));

//20230917


CHIP1_VTH1 CHIP1_VTH1 (
  .clka(CLK),    // input wire clka
  .wea(w_1),      // input wire [0 : 0] wea
  .addra(addr1[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat1),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH1_EN1),      // input wire enb
  .addrb(VTH1_A1),  // input wire [13 : 0] addrb
  .doutb(VTH1_D1)  // output wire [31 : 0] doutb
);

CHIP1_VTH2 CHIP1_VTH2 (
  .clka(CLK),    // input wire clka
  .wea(w_1),      // input wire [0 : 0] wea
  .addra(addr1[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat2_1),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH2_EN1),      // input wire enb
  .addrb(VTH2_A1),  // input wire [13 : 0] addrb
  .doutb(VTH2_D1)  // output wire [31 : 0] doutb
);

CHIP2_VTH1 CHIP2_VTH1 (
  .clka(CLK),    // input wire clka
  .wea(w_2),      // input wire [0 : 0] wea
  .addra(addr2[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat2),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH1_EN2),      // input wire enb
  .addrb(VTH1_A2),  // input wire [13 : 0] addrb
  .doutb(VTH1_D2)  // output wire [31 : 0] doutb
);

CHIP2_VTH2 CHIP2_VTH2 (
  .clka(CLK),    // input wire clka
  .wea(w_2),      // input wire [0 : 0] wea
  .addra(addr2[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat2_2),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH2_EN2),      // input wire enb
  .addrb(VTH2_A2),  // input wire [13 : 0] addrb
  .doutb(VTH2_D2)  // output wire [31 : 0] doutb
);

CHIP3_VTH1 CHIP3_VTH1 (
  .clka(CLK),    // input wire clka
  .wea(w_3),      // input wire [0 : 0] wea
  .addra(addr3[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat3),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH1_EN3),      // input wire enb
  .addrb(VTH1_A3),  // input wire [13 : 0] addrb
  .doutb(VTH1_D3)  // output wire [31 : 0] doutb
);

CHIP3_VTH2 CHIP3_VTH2 (
  .clka(CLK),    // input wire clka
  .wea(w_3),      // input wire [0 : 0] wea
  .addra(addr3[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat2_3),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH2_EN3),      // input wire enb
  .addrb(VTH2_A3),  // input wire [13 : 0] addrb
  .doutb(VTH2_D3)  // output wire [31 : 0] doutb
);

CHIP4_VTH1 CHIP4_VTH1 (
  .clka(CLK),    // input wire clka
  .wea(w_4),      // input wire [0 : 0] wea
  .addra(addr4[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat4),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH1_EN4),      // input wire enb
  .addrb(VTH1_A4),  // input wire [13 : 0] addrb
  .doutb(VTH1_D4)  // output wire [31 : 0] doutb
);

CHIP4_VTH2 CHIP4_VTH2 (
  .clka(CLK),    // input wire clka
  .wea(w_4),      // input wire [0 : 0] wea
  .addra(addr4[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat2_4),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH2_EN4),      // input wire enb
  .addrb(VTH2_A4),  // input wire [13 : 0] addrb
  .doutb(VTH2_D4)  // output wire [31 : 0] doutb
);

CHIP5_VTH1 CHIP5_VTH1 (
  .clka(CLK),    // input wire clka
  .wea(w_5),      // input wire [0 : 0] wea
  .addra(addr5[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat5),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH1_EN5),      // input wire enb
  .addrb(VTH1_A5),  // input wire [13 : 0] addrb
  .doutb(VTH1_D5)  // output wire [31 : 0] doutb
);

CHIP5_VTH2 CHIP5_VTH2 (
  .clka(CLK),    // input wire clka
  .wea(w_5),      // input wire [0 : 0] wea
  .addra(addr5[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat2_5),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH2_EN5),      // input wire enb
  .addrb(VTH2_A5),  // input wire [13 : 0] addrb
  .doutb(VTH2_D5)  // output wire [31 : 0] doutb
);


CHIP6_VTH1 CHIP6_VTH1 (
  .clka(CLK),    // input wire clka
  .wea(w_6),      // input wire [0 : 0] wea
  .addra(addr6[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat6),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH1_EN6),      // input wire enb
  .addrb(VTH1_A6),  // input wire [13 : 0] addrb
  .doutb(VTH1_D6)  // output wire [31 : 0] doutb
);

CHIP6_VTH2 CHIP6_VTH2 (
  .clka(CLK),    // input wire clka
  .wea(w_6),      // input wire [0 : 0] wea
  .addra(addr6[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat2_6),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH2_EN6),      // input wire enb
  .addrb(VTH2_A6),  // input wire [13 : 0] addrb
  .doutb(VTH2_D6)  // output wire [31 : 0] doutb
);


CHIP7_VTH1 CHIP7_VTH1 (
  .clka(CLK),    // input wire clka
  .wea(w_7),      // input wire [0 : 0] wea
  .addra(addr7[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat7),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH1_EN7),      // input wire enb
  .addrb(VTH1_A7),  // input wire [13 : 0] addrb
  .doutb(VTH1_D7)  // output wire [31 : 0] doutb
);

CHIP7_VTH2 CHIP7_VTH2 (
  .clka(CLK),    // input wire clka
  .wea(w_7),      // input wire [0 : 0] wea
  .addra(addr7[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat2_7),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH2_EN7),      // input wire enb
  .addrb(VTH2_A7),  // input wire [13 : 0] addrb
  .doutb(VTH2_D7)  // output wire [31 : 0] doutb
);

CHIP8_VTH1 CHIP8_VTH1 (
  .clka(CLK),    // input wire clka
  .wea(w_8),      // input wire [0 : 0] wea
  .addra(addr8[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat8),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH1_EN8),      // input wire enb
  .addrb(VTH1_A8),  // input wire [13 : 0] addrb
  .doutb(VTH1_D8)  // output wire [31 : 0] doutb
);

CHIP8_VTH2 CHIP8_VTH2 (
  .clka(CLK),    // input wire clka
  .wea(w_8),      // input wire [0 : 0] wea
  .addra(addr8[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat2_8),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH2_EN8),      // input wire enb
  .addrb(VTH2_A8),  // input wire [13 : 0] addrb
  .doutb(VTH2_D8)  // output wire [31 : 0] doutb
);

CHIP9_VTH1 CHIP9_VTH1 (
  .clka(CLK),    // input wire clka
  .wea(w_9),      // input wire [0 : 0] wea
  .addra(addr9[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat9),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH1_EN9),      // input wire enb
  .addrb(VTH1_A9),  // input wire [13 : 0] addrb
  .doutb(VTH1_D9)  // output wire [31 : 0] doutb
);

CHIP9_VTH2 CHIP9_VTH2 (
  .clka(CLK),    // input wire clka
  .wea(w_9),      // input wire [0 : 0] wea
  .addra(addr9[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat2_9),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH2_EN9),      // input wire enb
  .addrb(VTH2_A9),  // input wire [13 : 0] addrb
  .doutb(VTH2_D9)  // output wire [31 : 0] doutb
);

CHIP10_VTH1 CHIP10_VTH1 (
  .clka(CLK),    // input wire clka
  .wea(w_10),      // input wire [0 : 0] wea
  .addra(addr10[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat10),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH1_EN10),      // input wire enb
  .addrb(VTH1_A10),  // input wire [13 : 0] addrb
  .doutb(VTH1_D10)  // output wire [31 : 0] doutb
);

CHIP10_VTH2 CHIP10_VTH2 (
  .clka(CLK),    // input wire clka
  .wea(w_10),      // input wire [0 : 0] wea
  .addra(addr10[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat2_10),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH2_EN10),      // input wire enb
  .addrb(VTH2_A10),  // input wire [13 : 0] addrb
  .doutb(VTH2_D10)  // output wire [31 : 0] doutb
);

CHIP11_VTH1 CHIP11_VTH1 (
  .clka(CLK),    // input wire clka
  .wea(w_11),      // input wire [0 : 0] wea
  .addra(addr11[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat11),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH1_EN11),      // input wire enb
  .addrb(VTH1_A11),  // input wire [13 : 0] addrb
  .doutb(VTH1_D11)  // output wire [31 : 0] doutb
);

CHIP11_VTH2 CHIP11_VTH2 (
  .clka(CLK),    // input wire clka
  .wea(w_11),      // input wire [0 : 0] wea
  .addra(addr11[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat2_11),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH2_EN11),      // input wire enb
  .addrb(VTH2_A11),  // input wire [13 : 0] addrb
  .doutb(VTH2_D11)  // output wire [31 : 0] doutb
);

CHIP12_VTH1 CHIP12_VTH1 (
  .clka(CLK),    // input wire clka
  .wea(w_12),      // input wire [0 : 0] wea
  .addra(addr12[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat12),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH1_EN12),      // input wire enb
  .addrb(VTH1_A12),  // input wire [13 : 0] addrb
  .doutb(VTH1_D12)  // output wire [31 : 0] doutb
);

CHIP12_VTH2 CHIP12_VTH2 (
  .clka(CLK),    // input wire clka
  .wea(w_12),      // input wire [0 : 0] wea
  .addra(addr12[9 : 0]),  // input wire [13 : 0] addra
  .dina(dat2_12),    // input wire [31 : 0] dina
  .clkb(CLK_80M),    // input wire clkb
  .enb(VTH2_EN12),      // input wire enb
  .addrb(VTH2_A12),  // input wire [13 : 0] addrb
  .doutb(VTH2_D12)  // output wire [31 : 0] doutb
);





endmodule
