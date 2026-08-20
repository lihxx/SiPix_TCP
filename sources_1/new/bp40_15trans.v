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




module bp40_15trans(
  input           CLK,
  input           CLK_80M,
  input           CLK_125M,
  // input [15:0]    FRAME_COUNT,
  // input [3:0]     FRMAE_CNT,
  // input           FRAME_X,
  // input           FRAME_IN,
  // input           START_END,
  input           FRAME_INX,//in
  // input           FRMAE_OUTX,
  input           RST,     // 200MHz
  input           SYNC,
  output          RD_OUTEN,
  input [4:0]     PHASE_CNT,
  // input           START,
  // input           RE_START,
  // input           FNT_EN,
  input           chip,

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
  input           VTH2_EN12,

  output          FRAME_O
    );


wire          sync_neg;
wire          sync_reg;


FD sync (.D(SYNC), .C(CLK), .Q(sync_reg));

assign sync_neg = (~SYNC)&&sync_reg;


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

// State Machine
reg  state_reg, state_next;
localparam 
  STATE_F        = 0,
  STATE_E        = 1;

always @(posedge CLK or posedge RST) begin
  if (RST) state_reg <= STATE_F;
  else state_reg <= state_next;
end

always @(*) begin
  state_next = STATE_F;
  case(state_reg)
    STATE_F: begin    //STATE1
      if(FRAME_INX) begin
        state_next = STATE_E;
      end  
      else begin
        state_next = STATE_F;
      end
    end
    STATE_E: begin    //STATE1
      if(s_end) begin
        state_next = STATE_F;
      end  
      else begin
        state_next = STATE_E;
      end
    end
  endcase
end




// reg  [4:0]   fout_cnt;
// wire         fout_start;
// wire         fout_end;    

// always @(posedge CLK or posedge RST) begin
//   if (RST) begin
//     fout_cnt[4:0] <= 0; 
//   end
//   else if (fout_start) begin
//       if(fout_end)begin
//         fout_cnt[4:0] <= 0;
//       end
//       else begin
//         fout_cnt[4:0] <= fout_cnt[4:0] + 1;
//       end
//   end
// end
// assign fout_start = (state_reg==F2_OUT);
// assign fout_end   = fout_start&&(fout_cnt[4:0]==5'd19);//12288 //4/16



// reg  [4:0]   frame_cnt;
// wire         frame_start;
// wire         frame_end;    

// always @(posedge CLK or posedge RST) begin
//   if (RST) begin
//     frame_cnt[4:0] <= 0; 
//   end
//   else if (frame_start) begin
//       if(frame_end)begin
//         frame_cnt[4:0] <= 0;
//       end
//       else begin
//         frame_cnt[4:0] <= frame_cnt[4:0] + 1;
//       end
//   end
// end
// assign frame_start = (state_reg==STATE_F);
// assign frame_end   = frame_start&&(frame_cnt[4:0]==PHASE_CNT);//12288 //4/16/28

// wire [3:0]   fnt_count;

// wire         fnt_enable;

// assign fnt_enable = FNT_EN;
// assign fnt_count[3:0] = FRMAE_CNT[3:0];

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


reg  read_outen;

  // Flag_CrossDomain Flag_CrossDomain (
  //     .clkA           (CLK),
  //     .FlagIn_clkA    (spiee_r),
  //     .clkB           (CLK_80M),
  //     .FlagOut_clkB   (read_outen));
reg  [2:0]   rd_cnt;
wire         rd_start;
wire         rd_end;   
always @(posedge CLK or posedge RST) begin
  if (RST) begin
    rd_cnt[2:0] <= 0; 
    read_outen <= 1'b0;
  end
  else if (s_end) begin
    rd_cnt[2:0] <= 3'd1;
    read_outen <= 1'b1;
  end
  else if (rd_cnt[2:0] == 3'd1) begin
    rd_cnt[2:0] <= 3'd2;
    read_outen <= 1'b1;
  end
  else if (rd_cnt[2:0] == 3'd2) begin
    rd_cnt[2:0] <= 3'd3;
    read_outen <= 1'b1;
  end
  else if (rd_cnt[2:0] == 3'd3) begin
    rd_cnt[2:0] <= 3'd0;
    read_outen <= 1'b0;
  end
  else begin
    rd_cnt[2:0] <= rd_cnt[2:0];
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


// always @(posedge CLK or posedge RST) begin
//             if (RST) begin
//               addr1 <= 0;
//               addr2 <= 0;
//               addr3 <= 0;
//               addr4 <= 0;
//               addr5 <= 0;
//               addr6 <= 0;
//               addr7 <= 0;
//               addr8 <= 0;
//               addr9 <= 0;
//               addr10 <= 0;
//               addr11 <= 0;
//               addr12 <= 0;
//               dat1 <= 16'h0;
//               dat2 <= 16'h0;
//               dat3 <= 16'h0;
//               dat4 <= 16'h0;
//               dat5 <= 16'h0;
//               dat6 <= 16'h0;
//               dat7 <= 16'h0;
//               dat8 <= 16'h0;
//               dat9 <= 16'h0;
//               dat10 <= 16'h0;
//               dat11 <= 16'h0;
//               dat12 <= 16'h0;
//               dat2_1 <= 16'h0;
//               dat2_2 <= 16'h0;
//               dat2_3 <= 16'h0;
//               dat2_4 <= 16'h0;
//               dat2_5 <= 16'h0;
//               dat2_6 <= 16'h0;
//               dat2_7 <= 16'h0;
//               dat2_8 <= 16'h0;
//               dat2_9 <= 16'h0;
//               dat2_10 <= 16'h0;
//               dat2_11 <= 16'h0;
//               dat2_12 <= 16'h0;
//             end
//             else if (spiee_r) begin //spiee_r
//               addr12 <= addr12+1'b1;
//               dat12 <= {2'b0,spi12_clk_reg[13:0]};
//               dat2_12 <= {2'b0,spi12_clk_reg[27:14]};
//             end 
//             else if (spi_cnt[9:0]==10'd325) begin //spi_cnt[9:0]==10'd325
//               addr1 <= addr1+1'b1;
//               dat1 <= {2'b0,spi1_clk_reg[13:0]};
//               dat2_1 <= {2'b0,spi1_clk_reg[27:14]};
//             end
//             else if (spi_cnt[9:0]==10'd326) begin //spi_cnt[9:0]==10'd326
//               addr2 <= addr2+1'b1;
//               dat2 <= {2'b0,spi2_clk_reg[13:0]};
//               dat2_2 <= {2'b0,spi2_clk_reg[27:14]};
//             end
//             else if (spi_cnt[9:0]==10'd327) begin //spi_cnt[9:0]==10'd327
//               addr3 <= addr3+1'b1;
//               dat3 <= {2'b0,spi3_clk_reg[13:0]};
//               dat2_3 <= {2'b0,spi3_clk_reg[27:14]};
//             end
//             else if (spi_cnt[9:0]==10'd328) begin //spi_cnt[9:0]==10'd328
//               addr4 <= addr4+1'b1;
//               dat4 <= {2'b0,spi4_clk_reg[13:0]};
//               dat2_4 <= {2'b0,spi4_clk_reg[27:14]};
//             end 
//             else if (spi_cnt[9:0]==10'd329) begin //spi_cnt[9:0]==10'd329
//               addr5 <= addr5+1'b1;
//               dat5 <= {2'b0,spi5_clk_reg[13:0]};
//               dat2_5 <= {2'b0,spi5_clk_reg[27:14]};
//             end
//             else if (spi_cnt[9:0]==10'd330) begin //spi_cnt[9:0]==10'd330
//               addr6 <= addr6+1'b1;
//               dat6 <= {2'b0,spi6_clk_reg[13:0]};
//               dat2_6 <= {2'b0,spi6_clk_reg[27:14]};
//             end
//             else if (spi_cnt[9:0]==10'd331) begin //spi_cnt[9:0]==10'd331
//               addr7 <= addr7+1'b1;
//               dat7 <= {2'b0,spi7_clk_reg[13:0]};
//               dat2_7 <= {2'b0,spi7_clk_reg[27:14]};
//             end
//             else if (spi_cnt[9:0]==10'd332) begin //spi_cnt[9:0]==10'd332
//               addr8 <= addr8+1'b1;
//               dat8 <= {2'b0,spi8_clk_reg[13:0]};
//               dat2_8 <= {2'b0,spi8_clk_reg[27:14]};
//             end 
//             else if (spi_cnt[9:0]==10'd333) begin //spi_cnt[9:0]==10'd333
//               addr9 <= addr9+1'b1;
//               dat9 <= {2'b0,spi9_clk_reg[13:0]};
//               dat2_9 <= {2'b0,spi9_clk_reg[27:14]};
//             end
//             else if (spi_cnt[9:0]==10'd334) begin //spi_cnt[9:0]==10'd334
//               addr10 <= addr10+1'b1;
//               dat10 <= {2'b0,spi10_clk_reg[13:0]};
//               dat2_10 <= {2'b0,spi10_clk_reg[27:14]};
//             end
//             else if (spi_cnt[9:0]==10'd335) begin //spi_cnt[9:0]==10'd335
//               addr11 <= addr11+1'b1;
//               dat11 <= {2'b0,spi11_clk_reg[13:0]};
//               dat2_11 <= {2'b0,spi11_clk_reg[27:14]};
//             end  
 
//             else begin
//               addr1 <= addr1;
//               addr2 <= addr2;
//               addr3 <= addr3;
//               addr4 <= addr4;
//               addr5 <= addr5;
//               addr6 <= addr6;
//               addr7 <= addr7;
//               addr8 <= addr8;
//               addr9 <= addr9;
//               addr10 <= addr10;
//               addr11 <= addr11;
//               addr12 <= addr12;
//               dat1 <= dat1;
//               dat2 <= dat2;
//               dat3 <= dat3;
//               dat4 <= dat4;
//               dat5 <= dat5;
//               dat6 <= dat6;
//               dat7 <= dat7;
//               dat8 <= dat8;
//               dat9 <= dat9;
//               dat10 <= dat10;
//               dat11 <= dat11;
//               dat12 <= dat12;
//               dat2_1 <= dat2_1;
//               dat2_2 <= dat2_2;
//               dat2_3 <= dat2_3;
//               dat2_4 <= dat2_4;
//               dat2_5 <= dat2_5;
//               dat2_6 <= dat2_6;
//               dat2_7 <= dat2_7;
//               dat2_8 <= dat2_8;
//               dat2_9 <= dat2_9;
//               dat2_10 <= dat2_10;
//               dat2_11 <= dat2_11;
//               dat2_12 <= dat2_12;
//             end
// end

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








// reg  [31:0]   read_cnt;
// reg           read1_en;
// reg           read2_en;
// reg           read3_en;
// reg           read4_en;
// reg           read5_en;
// reg           read6_en;
// reg           read7_en;
// reg           read8_en;
// reg           read9_en;
// reg           read10_en;
// reg           read11_en;
// reg           read12_en;

// reg           read13_en;
// reg           read14_en;
// reg           read15_en;
// reg           read16_en;
// reg           read17_en;
// reg           read18_en;
// reg           read19_en;
// reg           read20_en;
// reg           read21_en;
// reg           read22_en;
// reg           read23_en;
// reg           read24_en;

// reg           readx_end;


// always @(posedge CLK_80M or posedge RST) begin
//             if (RST) begin
//               read_cnt <= 32'b0;
//               read1_en <= 1'b0;
//               read2_en <= 1'b0;
//               read3_en <= 1'b0;
//               read4_en <= 1'b0;
//               read5_en <= 1'b0;
//               read6_en <= 1'b0;
//               read7_en <= 1'b0;
//               read8_en <= 1'b0;
//               read9_en <= 1'b0;
//               read10_en <= 1'b0;
//               read11_en <= 1'b0;
//               read12_en <= 1'b0;
//               read13_en <= 1'b0;
//               read14_en <= 1'b0;
//               read15_en <= 1'b0;
//               read16_en <= 1'b0;
//               read17_en <= 1'b0;
//               read18_en <= 1'b0;
//               read19_en <= 1'b0;
//               read20_en <= 1'b0;
//               read21_en <= 1'b0;
//               read22_en <= 1'b0;
//               read23_en <= 1'b0;
//               read24_en <= 1'b0;
//               readx_end <= 1'b0;
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd0) begin
//               read1_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;             
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd294911) begin
//               read24_en <= 1'b0;
//               readx_end <= 1'b1;
//               read_cnt[31:0]<= 32'd0;    
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd282623) begin
//               read23_en <= 1'b0;
//               read24_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd270335) begin
//               read22_en <= 1'b0;
//               read23_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd258047) begin
//               read21_en <= 1'b0;
//               read22_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd245759) begin
//               read20_en <= 1'b0;
//               read21_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd233471) begin
//               read19_en <= 1'b0;
//               read20_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd221183) begin
//               read18_en <= 1'b0;
//               read19_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd208895) begin
//               read17_en <= 1'b0;
//               read18_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd196607) begin
//               read16_en <= 1'b0;
//               read17_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd184319) begin
//               read15_en <= 1'b0;
//               read16_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd172031) begin
//               read14_en <= 1'b0;
//               read15_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd159743) begin
//               read13_en <= 1'b0;
//               read14_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd147455) begin
//               read12_en <= 1'b0;
//               read13_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd135167) begin
//               read11_en <= 1'b0;
//               read12_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;      
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd122879) begin
//               read10_en <= 1'b0;
//               read11_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd110591) begin
//               read9_en <= 1'b0;
//               read10_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd98303) begin
//               read8_en <= 1'b0;
//               read9_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd86015) begin
//               read7_en <= 1'b0;
//               read8_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd73727) begin
//               read6_en <= 1'b0;
//               read7_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd61439) begin
//               read5_en <= 1'b0;
//               read6_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;      
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd49151) begin
//               read4_en <= 1'b0;
//               read5_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd36863) begin
//               read3_en <= 1'b0;
//               read4_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd24575) begin
//               read2_en <= 1'b0;
//               read3_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START&&read_cnt[31:0]==32'd12287) begin
//               read1_en <= 1'b0;
//               read2_en <= 1'b1;
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end
//             else if (RE_START) begin
//               read_cnt[31:0]<= read_cnt[31:0]+1'b1;     
//             end           
//             else begin
//               readx_end <= 1'b0;
//               read1_en <= read1_en;
//               read2_en <= read2_en;
//               read3_en <= read3_en;
//               read4_en <= read4_en;
//               read5_en <= read5_en;
//               read6_en <= read6_en;
//               read7_en <= read7_en;
//               read8_en <= read8_en;
//               read9_en <= read9_en;
//               read10_en <= read10_en;
//               read11_en <= read11_en;
//               read12_en <= read12_en;
//               read13_en <= read13_en;
//               read14_en <= read14_en;
//               read15_en <= read15_en;
//               read16_en <= read16_en;
//               read17_en <= read17_en;
//               read18_en <= read18_en;
//               read19_en <= read19_en;
//               read20_en <= read20_en;
//               read21_en <= read21_en;
//               read22_en <= read22_en;
//               read23_en <= read23_en;
//               read24_en <= read24_en;
//               read_cnt[31:0]<= 32'b0;  
//             end
// end

// wire  [15:0]   DAT_1;
// wire  [15:0]   DAT_2;
// wire  [15:0]   DAT_3;
// wire  [15:0]   DAT_4;
// wire  [15:0]   DAT_5;
// wire  [15:0]   DAT_6;
// wire  [15:0]   DAT_7;
// wire  [15:0]   DAT_8;
// wire  [15:0]   DAT_9;
// wire  [15:0]   DAT_10;
// wire  [15:0]   DAT_11;
// wire  [15:0]   DAT_12;


// wire  [15:0]   DAT_13;
// wire  [15:0]   DAT_14;
// wire  [15:0]   DAT_15;
// wire  [15:0]   DAT_16;
// wire  [15:0]   DAT_17;
// wire  [15:0]   DAT_18;
// wire  [15:0]   DAT_19;
// wire  [15:0]   DAT_20;
// wire  [15:0]   DAT_21;
// wire  [15:0]   DAT_22;
// wire  [15:0]   DAT_23;
// wire  [15:0]   DAT_24;





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

// wire          FIFO_EN;
// reg  [15:0]   RAM2FIFO;
// reg  [15:0]   ADDR_1;
// reg  [15:0]   ADDR_2;
// reg  [15:0]   ADDR_3;
// reg  [15:0]   ADDR_4;
// reg  [15:0]   ADDR_5;
// reg  [15:0]   ADDR_6;
// reg  [15:0]   ADDR_7;
// reg  [15:0]   ADDR_8;
// reg  [15:0]   ADDR_9;
// reg  [15:0]   ADDR_10;
// reg  [15:0]   ADDR_11;
// reg  [15:0]   ADDR_12;

// reg  [15:0]   ADDR_13;
// reg  [15:0]   ADDR_14;
// reg  [15:0]   ADDR_15;
// reg  [15:0]   ADDR_16;
// reg  [15:0]   ADDR_17;
// reg  [15:0]   ADDR_18;
// reg  [15:0]   ADDR_19;
// reg  [15:0]   ADDR_20;
// reg  [15:0]   ADDR_21;
// reg  [15:0]   ADDR_22;
// reg  [15:0]   ADDR_23;
// reg  [15:0]   ADDR_24;
// always @(posedge CLK_80M or posedge RST) begin
//             if (RST) begin
//               RAM2FIFO <= 32'b0;
//               ADDR_1 <= 16'b0;
//               ADDR_2 <= 16'b0;
//               ADDR_3 <= 16'b0;
//               ADDR_4 <= 16'b0;
//               ADDR_5 <= 16'b0;
//               ADDR_6 <= 16'b0;
//               ADDR_7 <= 16'b0;
//               ADDR_8 <= 16'b0;
//               ADDR_9 <= 16'b0;
//               ADDR_10 <= 16'b0;
//               ADDR_11 <= 16'b0;
//               ADDR_12 <= 16'b0;
//               ADDR_13 <= 16'b0;
//               ADDR_14 <= 16'b0;
//               ADDR_15 <= 16'b0;
//               ADDR_16 <= 16'b0;
//               ADDR_17 <= 16'b0;
//               ADDR_18 <= 16'b0;
//               ADDR_19 <= 16'b0;
//               ADDR_20 <= 16'b0;
//               ADDR_21 <= 16'b0;
//               ADDR_22 <= 16'b0;
//               ADDR_23 <= 16'b0;
//               ADDR_24 <= 16'b0;
//             end
//             else if (FRAME_X) begin
//               RAM2FIFO[15:0]<= 16'h55AA;  
 
//             end
//             else if (FRAME_IN) begin
//               RAM2FIFO[15:0]<= FRAME_COUNT[15:0];  
 
//             end
//             else if (read1_en) begin
//               ADDR_1 <= ADDR_1+1'b1;
//               RAM2FIFO[15:0]<= DAT_1[15:0];  
 
//             end
//             else if (read2_en) begin
//               ADDR_1 <= 16'd0;
//               ADDR_2 <= ADDR_2+1'b1;
//               RAM2FIFO[15:0]<= DAT_2[15:0];   
   
//             end
//             else if (read3_en) begin
//               ADDR_2 <= 16'd0;
//               ADDR_3 <= ADDR_3+1'b1;
//               RAM2FIFO[15:0]<= DAT_3[15:0];    

//             end
//             else if (read4_en) begin
//               ADDR_3 <= 16'd0;
//               ADDR_4 <= ADDR_4+1'b1;
//               RAM2FIFO[15:0]<= DAT_4[15:0];    

//             end
//             else if (read5_en) begin
//               ADDR_4 <= 16'd0;
//               ADDR_5 <= ADDR_5+1'b1;
//               RAM2FIFO[15:0]<= DAT_5[15:0];    

//             end
//             else if (read6_en) begin
//               ADDR_5 <= 16'd0;
//               ADDR_6 <= ADDR_6+1'b1;
//               RAM2FIFO[15:0]<= DAT_6[15:0];    

//             end
//             else if (read7_en) begin
//               ADDR_6 <= 16'd0;
//               ADDR_7 <= ADDR_7+1'b1;
//               RAM2FIFO[15:0]<= DAT_7[15:0];    

//             end
//             else if (read8_en) begin
//               ADDR_7 <= 16'd0;
//               ADDR_8 <= ADDR_8+1'b1;
//               RAM2FIFO[15:0]<= DAT_8[15:0];    

//             end
//             else if (read9_en) begin
//               ADDR_8 <= 16'd0;
//               ADDR_9 <= ADDR_9+1'b1;
//               RAM2FIFO[15:0]<= DAT_9[15:0];    

//             end
//             else if (read10_en) begin
//               ADDR_9 <= 16'd0;
//               ADDR_10 <= ADDR_10+1'b1;
//               RAM2FIFO[15:0]<= DAT_10[15:0];    

//             end
//             else if (read11_en) begin
//               ADDR_10 <= 16'd0;
//               ADDR_11 <= ADDR_11+1'b1;
//               RAM2FIFO[15:0]<= DAT_11[15:0];  
 
//             end
//             else if (read12_en) begin
//               ADDR_11 <= 16'd0;
//               ADDR_12 <= ADDR_12+1'b1;
//               RAM2FIFO[15:0]<= DAT_12[15:0];    

//             end
//             else if (read13_en) begin
//               ADDR_12 <= 16'd0;
//               ADDR_13 <= ADDR_13+1'b1;
//               RAM2FIFO[15:0]<= DAT_13[15:0];    

//             end
//             else if (read14_en) begin
//               ADDR_13 <= 16'd0;
//               ADDR_14 <= ADDR_14+1'b1;
//               RAM2FIFO[15:0]<= DAT_14[15:0];    

//             end
//             else if (read15_en) begin
//               ADDR_14 <= 16'd0;
//               ADDR_15 <= ADDR_15+1'b1;
//               RAM2FIFO[15:0]<= DAT_15[15:0];    

//             end
//             else if (read16_en) begin
//               ADDR_15 <= 16'd0;
//               ADDR_16 <= ADDR_16+1'b1;
//               RAM2FIFO[15:0]<= DAT_16[15:0];    

//             end
//             else if (read17_en) begin
//               ADDR_16 <= 16'd0;
//               ADDR_17 <= ADDR_17+1'b1;
//               RAM2FIFO[15:0]<= DAT_17[15:0];    

//             end
//             else if (read18_en) begin
//               ADDR_17 <= 16'd0;
//               ADDR_18 <= ADDR_18+1'b1;
//               RAM2FIFO[15:0]<= DAT_18[15:0];    

//             end
//             else if (read19_en) begin
//               ADDR_18 <= 16'd0;
//               ADDR_19 <= ADDR_19+1'b1;
//               RAM2FIFO[15:0]<= DAT_19[15:0];    

//             end
//             else if (read20_en) begin
//               ADDR_19 <= 16'd0;
//               ADDR_20 <= ADDR_20+1'b1;
//               RAM2FIFO[15:0]<= DAT_20[15:0];    

//             end
//             else if (read21_en) begin
//               ADDR_20 <= 16'd0;
//               ADDR_21 <= ADDR_21+1'b1;
//               RAM2FIFO[15:0]<= DAT_21[15:0];    

//             end
//             else if (read22_en) begin
//               ADDR_21 <= 16'd0;
//               ADDR_22 <= ADDR_22+1'b1;
//               RAM2FIFO[15:0]<= DAT_22[15:0];    

//             end
//             else if (read23_en) begin
//               ADDR_22 <= 16'd0;
//               ADDR_23 <= ADDR_23+1'b1;
//               RAM2FIFO[15:0]<= DAT_23[15:0];    

//             end
//             else if (read24_en) begin
//               ADDR_23 <= 16'd0;
//               ADDR_24 <= ADDR_24+1'b1;
//               RAM2FIFO[15:0]<= DAT_24[15:0];    

//             end
//             else if (readx_end) begin
//               ADDR_1 <= 16'd0;
//               ADDR_2 <= 16'd0;
//               ADDR_3 <= 16'd0;
//               ADDR_4 <= 16'd0;
//               ADDR_5 <= 16'd0;
//               ADDR_6 <= 16'd0;
//               ADDR_7 <= 16'd0;
//               ADDR_8 <= 16'd0;
//               ADDR_9 <= 16'd0;
//               ADDR_10 <= 16'd0;
//               ADDR_11 <= 16'd0;
//               ADDR_12 <= 16'd0;
//               ADDR_13 <= 16'b0;
//               ADDR_14 <= 16'b0;
//               ADDR_15 <= 16'b0;
//               ADDR_16 <= 16'b0;
//               ADDR_17 <= 16'b0;
//               ADDR_18 <= 16'b0;
//               ADDR_19 <= 16'b0;
//               ADDR_20 <= 16'b0;
//               ADDR_21 <= 16'b0;
//               ADDR_22 <= 16'b0;
//               ADDR_23 <= 16'b0;
//               ADDR_24 <= 16'b0;  
//               RAM2FIFO[15:0]<= RAM2FIFO[15:0];  

//             end
//             else begin
//               ADDR_1 <= ADDR_1;
//               ADDR_2 <= ADDR_2;
//               ADDR_3 <= ADDR_3;
//               ADDR_4 <= ADDR_4;
//               ADDR_5 <= ADDR_5;
//               ADDR_6 <= ADDR_6;
//               ADDR_7 <= ADDR_7;
//               ADDR_8 <= ADDR_8;
//               ADDR_9 <= ADDR_9;
//               ADDR_10 <= ADDR_10;
//               ADDR_11 <= ADDR_11;
//               ADDR_12 <= ADDR_12;
//               ADDR_13 <= ADDR_13;
//               ADDR_14 <= ADDR_14;
//               ADDR_15 <= ADDR_15;
//               ADDR_16 <= ADDR_16;
//               ADDR_17 <= ADDR_17;
//               ADDR_18 <= ADDR_18;
//               ADDR_19 <= ADDR_19;
//               ADDR_20 <= ADDR_20;
//               ADDR_21 <= ADDR_21;
//               ADDR_22 <= ADDR_22;
//               ADDR_23 <= ADDR_23;
//               ADDR_24 <= ADDR_24;
//               RAM2FIFO[15:0]<= RAM2FIFO[15:0];  

//             end
// end

// wire  rd1_en;
// wire  rd2_en;
// wire  rd3_en;
// wire  rd4_en;
// wire  rd5_en;
// wire  rd6_en;
// wire  rd7_en;
// wire  rd8_en;
// wire  rd9_en;
// wire  rd10_en;
// wire  rd11_en;
// wire  rd12_en;

// wire  rd13_en;
// wire  rd14_en;
// wire  rd15_en;
// wire  rd16_en;
// wire  rd17_en;
// wire  rd18_en;
// wire  rd19_en;
// wire  rd20_en;
// wire  rd21_en;
// wire  rd22_en;
// wire  rd23_en;
// wire  rd24_en;

// FD RD1 (.D(read1_en), .C(CLK_80M), .Q(rd1_en));
// FD RD2 (.D(read2_en), .C(CLK_80M), .Q(rd2_en));
// FD RD3 (.D(read3_en), .C(CLK_80M), .Q(rd3_en));
// FD RD4 (.D(read4_en), .C(CLK_80M), .Q(rd4_en));
// FD RD5 (.D(read5_en), .C(CLK_80M), .Q(rd5_en));
// FD RD6 (.D(read6_en), .C(CLK_80M), .Q(rd6_en));
// FD RD7 (.D(read7_en), .C(CLK_80M), .Q(rd7_en));
// FD RD8 (.D(read8_en), .C(CLK_80M), .Q(rd8_en));
// FD RD9 (.D(read9_en), .C(CLK_80M), .Q(rd9_en));
// FD RD10 (.D(read10_en), .C(CLK_80M), .Q(rd10_en));
// FD RD11 (.D(read11_en), .C(CLK_80M), .Q(rd11_en));
// FD RD12 (.D(read12_en), .C(CLK_80M), .Q(rd12_en));

// FD RD13 (.D(read13_en), .C(CLK_80M), .Q(rd13_en));
// FD RD14 (.D(read14_en), .C(CLK_80M), .Q(rd14_en));
// FD RD15 (.D(read15_en), .C(CLK_80M), .Q(rd15_en));
// FD RD16 (.D(read16_en), .C(CLK_80M), .Q(rd16_en));
// FD RD17 (.D(read17_en), .C(CLK_80M), .Q(rd17_en));
// FD RD18 (.D(read18_en), .C(CLK_80M), .Q(rd18_en));
// FD RD19 (.D(read19_en), .C(CLK_80M), .Q(rd19_en));
// FD RD20 (.D(read20_en), .C(CLK_80M), .Q(rd20_en));
// FD RD21 (.D(read21_en), .C(CLK_80M), .Q(rd21_en));
// FD RD22 (.D(read22_en), .C(CLK_80M), .Q(rd22_en));
// FD RD23 (.D(read23_en), .C(CLK_80M), .Q(rd23_en));
// FD RD24 (.D(read24_en), .C(CLK_80M), .Q(rd24_en));

// wire  rdd1_en;
// wire  rdd2_en;
// wire  rdd3_en;
// wire  rdd4_en;
// wire  rdd5_en;
// wire  rdd6_en;
// wire  rdd7_en;
// wire  rdd8_en;
// wire  rdd9_en;
// wire  rdd10_en;
// wire  rdd11_en;
// wire  rdd12_en;

// wire  rdd13_en;
// wire  rdd14_en;
// wire  rdd15_en;
// wire  rdd16_en;
// wire  rdd17_en;
// wire  rdd18_en;
// wire  rdd19_en;
// wire  rdd20_en;
// wire  rdd21_en;
// wire  rdd22_en;
// wire  rdd23_en;
// wire  rdd24_en;

// FD RDD1 (.D(rd1_en), .C(CLK_80M), .Q(rdd1_en));
// FD RDD2 (.D(rd2_en), .C(CLK_80M), .Q(rdd2_en));
// FD RDD3 (.D(rd3_en), .C(CLK_80M), .Q(rdd3_en));
// FD RDD4 (.D(rd4_en), .C(CLK_80M), .Q(rdd4_en));
// FD RDD5 (.D(rd5_en), .C(CLK_80M), .Q(rdd5_en));
// FD RDD6 (.D(rd6_en), .C(CLK_80M), .Q(rdd6_en));
// FD RDD7 (.D(rd7_en), .C(CLK_80M), .Q(rdd7_en));
// FD RDD8 (.D(rd8_en), .C(CLK_80M), .Q(rdd8_en));
// FD RDD9 (.D(rd9_en), .C(CLK_80M), .Q(rdd9_en));
// FD RDD10 (.D(rd10_en), .C(CLK_80M), .Q(rdd10_en));
// FD RDD11 (.D(rd11_en), .C(CLK_80M), .Q(rdd11_en));
// FD RDD12 (.D(rd12_en), .C(CLK_80M), .Q(rdd12_en));

// FD RDD13 (.D(rd13_en), .C(CLK_80M), .Q(rdd13_en));
// FD RDD14 (.D(rd14_en), .C(CLK_80M), .Q(rdd14_en));
// FD RDD15 (.D(rd15_en), .C(CLK_80M), .Q(rdd15_en));
// FD RDD16 (.D(rd16_en), .C(CLK_80M), .Q(rdd16_en));
// FD RDD17 (.D(rd17_en), .C(CLK_80M), .Q(rdd17_en));
// FD RDD18 (.D(rd18_en), .C(CLK_80M), .Q(rdd18_en));
// FD RDD19 (.D(rd19_en), .C(CLK_80M), .Q(rdd19_en));
// FD RDD20 (.D(rd20_en), .C(CLK_80M), .Q(rdd20_en));
// FD RDD21 (.D(rd21_en), .C(CLK_80M), .Q(rdd21_en));
// FD RDD22 (.D(rd22_en), .C(CLK_80M), .Q(rdd22_en));
// FD RDD23 (.D(rd23_en), .C(CLK_80M), .Q(rdd23_en));
// FD RDD24 (.D(rd24_en), .C(CLK_80M), .Q(rdd24_en));



// wire  FRAME_IN_reg;

// FD XDD1 (.D(FRAME_IN), .C(CLK_80M), .Q(FRAME_IN_reg));

// wire  FRAME_X_reg;

// FD XDD2 (.D(FRAME_X), .C(CLK_80M), .Q(FRAME_X_reg));

// assign FIFO_EN = FRAME_X_reg||FRAME_IN_reg||(rd1_en&&rdd1_en)||(rd2_en&&rdd2_en)||(rd3_en&&rdd3_en)||(rd4_en&&rdd4_en)||(rd5_en&&rdd5_en)||(rd6_en&&rdd6_en)||(rd7_en&&rdd7_en)||(rd8_en&&rdd8_en)||(rd9_en&&rdd9_en)||(rd10_en&&rdd10_en)||(rd11_en&&rdd11_en)||(rd12_en&&rdd12_en)||(rd13_en&&rdd13_en)||(rd14_en&&rdd14_en)||(rd15_en&&rdd15_en)||(rd16_en&&rdd16_en)||(rd17_en&&rdd17_en)||(rd18_en&&rdd18_en)||(rd19_en&&rdd19_en)||(rd20_en&&rdd20_en)||(rd21_en&&rdd21_en)||(rd22_en&&rdd22_en)||(rd23_en&&rdd23_en)||(rd24_en&&rdd24_en);



// // assign fifo_tcp_wren=(~fifo_empty_stream) & tcp_open &(~tcp_tx_full);
// wire   fifo_tcp_wren;

// wire   empty;
// wire   valid;

// wire [15:0]  data_fifo_out;

// assign fifo_tcp_wren=(~empty)&(~TX_FULL);



// fifo_generator_1 fifo_generator_1(
//     .rst(RST),
//     .wr_clk(CLK_80M),
//     .rd_clk(CLK_125M),
//     .din(RAM2FIFO[15:0]),   
//     .wr_en(FIFO_EN),
//     .rd_en(fifo_tcp_wren),
//     .dout(FIFO_DOUT),
//     .full(),
//     .empty(empty),
//     .valid(FIFO_VALID),           
//     .wr_rst_busy(),
//     .rd_rst_busy()
//   );

// reg       fout_reg;

// always @(posedge CLK or posedge RST) begin
//             if (RST) begin
//               fout_reg <= 1'b0;
//             end
//             else if ((state_reg==F2_OUT)&&(fout_cnt[4:0]==5'd4)) begin
//               fout_reg <= 1'b1;
//             end
//             else if ((state_reg==F2_OUT)&&(fout_cnt[4:0]==5'd16)) begin//15 //F2_OUT
//               fout_reg <= 1'b0;
//             end
//             else begin
//               fout_reg <= fout_reg;
//             end
// end

assign FRAME_O = FRAME_INX;



// ila_clk ila_clk (
//   .clk(CLK), // input wire clk


//   .probe0(FRAME_INX), // input wire [0:0]  probe0  
//   .probe1(SYNC),
//   .probe2(sync_neg),
//   .probe3(fout_start), //1to2
//   .probe4(fout_end),
//   .probe5(state_reg[2:0]),
//   .probe6(fout_cnt[4:0])
// );



// ila_80clk ila_80clk (
//   .clk(CLK_80M), // input wire clk


//   .probe0(read1_en), // input wire [0:0]  probe0  
//   .probe1(read2_en), // input wire [0:0]  probe1 
//   .probe2(read13_en), // input wire [0:0]  probe2 
//   .probe3(read14_en), // input wire [0:0]  probe3 
//   .probe4(FIFO_EN), // input wire [0:0]  probe4 
//   .probe5(rdd1_en), // input wire [0:0]  probe5 
//   .probe6(rdd2_en), // input wire [0:0]  probe6 
//   .probe7(rdd13_en), // input wire [0:0]  probe7 
//   .probe8(rdd14_en), // input wire [0:0]  probe8 
//   .probe9(DAT_1[15:0]), // input wire [15:0]  probe9 
//   .probe10(DAT_2[15:0]), // input wire [15:0]  probe10 
//   .probe11(DAT_13[15:0]), // input wire [15:0]  probe11 
//   .probe12(DAT_14[15:0]), // input wire [15:0]  probe12 
//   .probe13(RAM2FIFO[15:0]), // input wire [15:0]  probe13 
//   .probe14(ADDR_1[15:0]), // input wire [15:0]  probe14 
//   .probe15(ADDR_2[15:0]), // input wire [15:0]  probe15 
//   .probe16(ADDR_13[15:0]), // input wire [15:0]  probe16 
//   .probe17(ADDR_14[15:0]), // input wire [15:0]  probe17 
//   .probe18(read_cnt[31:0]), // input wire [31:0]  probe18
//   .probe19(fnt_enable),
//   .probe20(fnt_count[3:0])
// );


// ila_125clk ila_125clk (
//   .clk(CLK_125M), // input wire clk


//   .probe0(FIFO_VALID), // input wire [0:0]  probe0  
//   .probe1(FIFO_DOUT[15:0]), // input wire [15:0]  probe1
//   .probe2(fnt_enable),
//   .probe3(fnt_count[3:0])
// );

endmodule
