`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/25 16:03:39
// Design Name: 
// Module Name: CONF_CODE
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


module CONF_CODEY(
  input            START,
  input            RST,        // Reset
  input            CLK,
  output           CLK_SPI,
  output           ARRAY_ENB,
  output  [11:0]   ARRAY_ADDRB,
  input   [31:0]   ARRAY_DATA,
  output           RSTB,
  output           ARRAY_IN,
  output           REFRESH,
  output           CS,
  output           CHIP_SW,
  output           CS_SW
    );


// State Machine
reg [1:0] state_reg, state_next;
localparam
  IDLE      = 0,
  STATE_ST  = 1,
  STATE_B   = 2,
  STATE_C   = 3;

always @(posedge CLK or posedge RST) begin
  if (RST) state_reg <= IDLE;
  else state_reg <= state_next;
end

// reg [15:0] IP;
// reg        hash_enable;
// reg [15:0] ip_addr;



always @(*) begin
  state_next = IDLE;
  case(state_reg)
    IDLE: begin     //STATE0
      if(START) begin 
        state_next = STATE_ST;
      end  
      else begin
        state_next = IDLE;
      end
    end
    STATE_ST: begin    //STATE1
      if(spi_end) begin
        state_next = STATE_B;
      end  
      else begin
        state_next = STATE_ST;
      end
    end
    STATE_B: begin    //STATE2
      if(array_end_end) begin
        state_next = IDLE;
      end 
      else begin        
        state_next = STATE_C;
      end
    end
    STATE_C: begin     //STATE3
      if(spi_end) begin
        state_next = STATE_B;
      end 
      else begin        
        state_next = STATE_C;
      end
    end
  endcase
end

// SPI counter

reg  [7:0]    spi_cnt;
wire          spi_start;
wire          spi_end;    

always @(posedge CLK or posedge RST) begin
  if (RST) begin
    spi_cnt[7:0] <= 0; 
  end
  else if (spi_start) begin
      if(spi_end)begin
        spi_cnt[7:0] <= 0;
      end
      else begin
        spi_cnt[7:0] <= spi_cnt[7:0] + 1;
      end
  end
end
assign spi_start = (state_reg==STATE_ST)||(state_reg==STATE_C);
// assign spi_end   = spi_start&&(spi_cnt[7:0]==8'd114);
assign spi_end   = spi_start&&(spi_cnt[7:0]==8'd117);


// array counter

reg  [11:0]   array_cnt;
wire          array_start;
wire          array_end;    

always @(posedge CLK or posedge RST) begin
  if (RST) begin
    array_cnt[11:0] <= 0; 
  end
  else if (array_start) begin
      if(array_end)begin
        array_cnt[11:0] <= 0;
      end
      else begin
        array_cnt[11:0] <= array_cnt[11:0] + 1;
      end
  end
end
assign array_start = spi_end;
assign array_end   = array_start&&(array_cnt[11:0]==12'd3071);// 2688(2687) 3072

wire array_end_end;

FD UNCOM5 (.D(array_end), .C(CLK), .Q(array_end_end));

wire array_end_end_end;

FD UNCOM6 (.D(array_end_end), .C(CLK), .Q(array_end_end_end));

reg            chip_switch_reg; 

reg [3:0]      chip_cnt;


always @(posedge CLK or posedge RST) begin
            if (RST) begin
              chip_switch_reg <= 1'b0;
            end
            else if (chip_cnt==4'd5) begin
              chip_switch_reg <= 1'b0;
              chip_cnt <= 4'd0;
            end
            else if (array_end_end_end) begin
              chip_switch_reg <= 1'b1;
              chip_cnt <= chip_cnt+1'd1;
            end
            else begin
              chip_switch_reg <= chip_switch_reg;
            end
end

assign CHIP_SW = chip_switch_reg;

// RAM READ

// RAM EN
reg       ram_en_reg; 

always @(posedge CLK or posedge RST) begin
            if (RST) begin
              ram_en_reg <= 1'b0;
            end
            else if ((state_reg==IDLE)&&(state_next==STATE_ST)) begin
              ram_en_reg <= 1'b1;
            end
            else if ((state_reg==STATE_B)&&(state_next==IDLE)) begin
              ram_en_reg <= 1'b0;
            end
            else if ((state_reg==STATE_B)&&(state_next==STATE_C)) begin
              ram_en_reg <= 1'b1;
            end
            // else if (state_reg==STATE_B) begin
            //   ram_en_reg <= 1'b1;
            // end
            else begin
              ram_en_reg <= 1'b0;
            end
end
assign ARRAY_ENB = ram_en_reg;

// RAM ADDR
reg [11:0] ram_addr; 

// always @(posedge CLK or posedge RST) begin
//             if (RST) begin
//               ram_addr[11:0] <= 12'b0;
//             end
//             else if ((state_reg==IDLE)&&(state_next==STATE_ST)) begin
//               ram_addr[11:0] <= ram_addr[11:0] + 1'b1;
//             end
//             else if (state_reg==STATE_B) begin
//               ram_addr[11:0] <= ram_addr[11:0] + 1'b1;
//             end
//             else begin
//               ram_addr[11:0] <= ram_addr[11:0];
//             end
// end

always @(posedge CLK or posedge RST) begin
            if (RST) begin
              ram_addr[11:0] <= 12'b0;
            end
            else if (ram_en_reg&&(array_cnt[11:0]==12'd3071)) begin
              ram_addr[11:0] <= 12'd0;
            end
            else if (ram_en_reg) begin
              ram_addr[11:0] <= ram_addr[11:0] + 1'b1;
            end
            else begin
              ram_addr[11:0] <= ram_addr[11:0];
            end
end

assign ARRAY_ADDRB[11:0] = ram_addr[11:0];

// RAM DATA
reg [31:0] ram_dat;

wire       ram_en_reg_reg;

FD UNCOM2 (.D(ram_en_reg), .C(CLK), .Q(ram_en_reg_reg));

wire       ram_en_reg_reg_reg;

FD UNCOM3 (.D(ram_en_reg_reg), .C(CLK), .Q(ram_en_reg_reg_reg));

always @(posedge CLK or posedge RST) begin
            if (RST) begin
              ram_dat[31:0] <= 32'b0;
            end
            else if (ram_en_reg_reg_reg) begin
              ram_dat[31:0] <= ARRAY_DATA[31:0];
            end
            else begin
              ram_dat[31:0] <= ram_dat[31:0];
            end
end



// SPI CLK
reg       spi_clk_reg; 

// always @(posedge CLK or posedge RST) begin
//             if (RST) begin
//               spi_clk_reg <= 1'b0;
//             end
//             else if ((spi_cnt[7:0]==8'd2)||(spi_cnt[7:0]==8'd3)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd6)||(spi_cnt[7:0]==8'd7)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd10)||(spi_cnt[7:0]==8'd11)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd14)||(spi_cnt[7:0]==8'd15)) begin
//               spi_clk_reg <= 1'b1;
//             end 
//             else if ((spi_cnt[7:0]==8'd18)||(spi_cnt[7:0]==8'd19)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd22)||(spi_cnt[7:0]==8'd23)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd26)||(spi_cnt[7:0]==8'd27)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd30)||(spi_cnt[7:0]==8'd31)) begin
//               spi_clk_reg <= 1'b1;
//             end 
//             else if ((spi_cnt[7:0]==8'd34)||(spi_cnt[7:0]==8'd35)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd38)||(spi_cnt[7:0]==8'd39)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd42)||(spi_cnt[7:0]==8'd43)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd46)||(spi_cnt[7:0]==8'd47)) begin
//               spi_clk_reg <= 1'b1;
//             end 
//             else if ((spi_cnt[7:0]==8'd50)||(spi_cnt[7:0]==8'd51)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd54)||(spi_cnt[7:0]==8'd55)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd58)||(spi_cnt[7:0]==8'd59)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd62)||(spi_cnt[7:0]==8'd63)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd66)||(spi_cnt[7:0]==8'd67)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd70)||(spi_cnt[7:0]==8'd71)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd74)||(spi_cnt[7:0]==8'd75)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd78)||(spi_cnt[7:0]==8'd79)) begin
//               spi_clk_reg <= 1'b1;
//             end 
//             else if ((spi_cnt[7:0]==8'd82)||(spi_cnt[7:0]==8'd83)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd86)||(spi_cnt[7:0]==8'd87)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd90)||(spi_cnt[7:0]==8'd91)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd94)||(spi_cnt[7:0]==8'd95)) begin
//               spi_clk_reg <= 1'b1;
//             end 
//             else if ((spi_cnt[7:0]==8'd98)||(spi_cnt[7:0]==8'd99)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd102)||(spi_cnt[7:0]==8'd103)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd106)||(spi_cnt[7:0]==8'd107)) begin
//               spi_clk_reg <= 1'b1;
//             end
//             else if ((spi_cnt[7:0]==8'd110)||(spi_cnt[7:0]==8'd111)) begin
//               spi_clk_reg <= 1'b1;
//             end     
//             else begin
//               spi_clk_reg <= 1'b0;
//             end
// end

always @(posedge CLK or posedge RST) begin
            if (RST) begin
              spi_clk_reg <= 1'b0;
            end
            else if ((spi_cnt[7:0]==8'd5)||(spi_cnt[7:0]==8'd6)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd9)||(spi_cnt[7:0]==8'd10)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd13)||(spi_cnt[7:0]==8'd14)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd17)||(spi_cnt[7:0]==8'd18)) begin
              spi_clk_reg <= 1'b1;
            end 
            else if ((spi_cnt[7:0]==8'd21)||(spi_cnt[7:0]==8'd22)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd25)||(spi_cnt[7:0]==8'd26)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd29)||(spi_cnt[7:0]==8'd30)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd33)||(spi_cnt[7:0]==8'd34)) begin
              spi_clk_reg <= 1'b1;
            end 
            else if ((spi_cnt[7:0]==8'd37)||(spi_cnt[7:0]==8'd38)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd41)||(spi_cnt[7:0]==8'd42)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd45)||(spi_cnt[7:0]==8'd46)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd49)||(spi_cnt[7:0]==8'd50)) begin
              spi_clk_reg <= 1'b1;
            end 
            else if ((spi_cnt[7:0]==8'd53)||(spi_cnt[7:0]==8'd54)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd57)||(spi_cnt[7:0]==8'd58)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd61)||(spi_cnt[7:0]==8'd62)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd65)||(spi_cnt[7:0]==8'd66)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd69)||(spi_cnt[7:0]==8'd70)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd73)||(spi_cnt[7:0]==8'd74)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd77)||(spi_cnt[7:0]==8'd78)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd81)||(spi_cnt[7:0]==8'd82)) begin
              spi_clk_reg <= 1'b1;
            end 
            else if ((spi_cnt[7:0]==8'd85)||(spi_cnt[7:0]==8'd86)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd89)||(spi_cnt[7:0]==8'd90)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd93)||(spi_cnt[7:0]==8'd94)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd97)||(spi_cnt[7:0]==8'd98)) begin
              spi_clk_reg <= 1'b1;
            end 
            else if ((spi_cnt[7:0]==8'd101)||(spi_cnt[7:0]==8'd102)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd105)||(spi_cnt[7:0]==8'd106)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd109)||(spi_cnt[7:0]==8'd110)) begin
              spi_clk_reg <= 1'b1;
            end
            else if ((spi_cnt[7:0]==8'd113)||(spi_cnt[7:0]==8'd114)) begin
              spi_clk_reg <= 1'b1;
            end     
            else begin
              spi_clk_reg <= 1'b0;
            end
end

assign CLK_SPI = spi_clk_reg;

// SPI DATA
reg       spi_dat_reg; 

// always @(posedge CLK or posedge RST) begin
//             if (RST) begin
//               spi_dat_reg <= 1'b0;
//             end
//             else if ((spi_cnt[7:0]==8'd2)||(spi_cnt[7:0]==8'd3)) begin
//               spi_dat_reg <= ram_dat[27];
//             end
//             else if ((spi_cnt[7:0]==8'd6)||(spi_cnt[7:0]==8'd7)) begin
//               spi_dat_reg <= ram_dat[26];
//             end
//             else if ((spi_cnt[7:0]==8'd10)||(spi_cnt[7:0]==8'd11)) begin
//               spi_dat_reg <= ram_dat[25];
//             end
//             else if ((spi_cnt[7:0]==8'd14)||(spi_cnt[7:0]==8'd15)) begin
//               spi_dat_reg <= ram_dat[24];
//             end 
//             else if ((spi_cnt[7:0]==8'd18)||(spi_cnt[7:0]==8'd19)) begin
//               spi_dat_reg <= ram_dat[23];
//             end
//             else if ((spi_cnt[7:0]==8'd22)||(spi_cnt[7:0]==8'd23)) begin
//               spi_dat_reg <= ram_dat[22];
//             end
//             else if ((spi_cnt[7:0]==8'd26)||(spi_cnt[7:0]==8'd27)) begin
//               spi_dat_reg <= ram_dat[21];
//             end
//             else if ((spi_cnt[7:0]==8'd30)||(spi_cnt[7:0]==8'd31)) begin
//               spi_dat_reg <= ram_dat[20];
//             end 
//             else if ((spi_cnt[7:0]==8'd34)||(spi_cnt[7:0]==8'd35)) begin
//               spi_dat_reg <= ram_dat[19];
//             end
//             else if ((spi_cnt[7:0]==8'd38)||(spi_cnt[7:0]==8'd39)) begin
//               spi_dat_reg <= ram_dat[18];
//             end
//             else if ((spi_cnt[7:0]==8'd42)||(spi_cnt[7:0]==8'd43)) begin
//               spi_dat_reg <= ram_dat[17];
//             end
//             else if ((spi_cnt[7:0]==8'd46)||(spi_cnt[7:0]==8'd47)) begin
//               spi_dat_reg <= ram_dat[16];
//             end 
//             else if ((spi_cnt[7:0]==8'd50)||(spi_cnt[7:0]==8'd51)) begin
//               spi_dat_reg <= ram_dat[15];
//             end
//             else if ((spi_cnt[7:0]==8'd54)||(spi_cnt[7:0]==8'd55)) begin
//               spi_dat_reg <= ram_dat[14];
//             end
//             else if ((spi_cnt[7:0]==8'd58)||(spi_cnt[7:0]==8'd59)) begin
//               spi_dat_reg <= ram_dat[13];
//             end
//             else if ((spi_cnt[7:0]==8'd62)||(spi_cnt[7:0]==8'd63)) begin
//               spi_dat_reg <= ram_dat[12];
//             end
//             else if ((spi_cnt[7:0]==8'd66)||(spi_cnt[7:0]==8'd67)) begin
//               spi_dat_reg <= ram_dat[11];
//             end
//             else if ((spi_cnt[7:0]==8'd70)||(spi_cnt[7:0]==8'd71)) begin
//               spi_dat_reg <= ram_dat[10];
//             end
//             else if ((spi_cnt[7:0]==8'd74)||(spi_cnt[7:0]==8'd75)) begin
//               spi_dat_reg <= ram_dat[9];
//             end
//             else if ((spi_cnt[7:0]==8'd78)||(spi_cnt[7:0]==8'd79)) begin
//               spi_dat_reg <= ram_dat[8];
//             end 
//             else if ((spi_cnt[7:0]==8'd82)||(spi_cnt[7:0]==8'd83)) begin
//               spi_dat_reg <= ram_dat[7];
//             end
//             else if ((spi_cnt[7:0]==8'd86)||(spi_cnt[7:0]==8'd87)) begin
//               spi_dat_reg <= ram_dat[6];
//             end
//             else if ((spi_cnt[7:0]==8'd90)||(spi_cnt[7:0]==8'd91)) begin
//               spi_dat_reg <= ram_dat[5];
//             end
//             else if ((spi_cnt[7:0]==8'd94)||(spi_cnt[7:0]==8'd95)) begin
//               spi_dat_reg <= ram_dat[4];
//             end 
//             else if ((spi_cnt[7:0]==8'd98)||(spi_cnt[7:0]==8'd99)) begin
//               spi_dat_reg <= ram_dat[3];
//             end
//             else if ((spi_cnt[7:0]==8'd102)||(spi_cnt[7:0]==8'd103)) begin
//               spi_dat_reg <= ram_dat[2];
//             end
//             else if ((spi_cnt[7:0]==8'd106)||(spi_cnt[7:0]==8'd107)) begin
//               spi_dat_reg <= ram_dat[1];
//             end
//             else if ((spi_cnt[7:0]==8'd110)||(spi_cnt[7:0]==8'd111)) begin
//               spi_dat_reg <= ram_dat[0];
//             end     
//             else begin
//               spi_dat_reg <= 1'b0;
//             end
// end

// always @(posedge CLK or posedge RST) begin
//             if (RST) begin
//               spi_dat_reg <= 1'b0;
//             end
//             else if ((ram_en_reg)||(spi_cnt[7:0]==8'd1)||(spi_cnt[7:0]==8'd2)||(spi_cnt[7:0]==8'd3)) begin
//               spi_dat_reg <= ram_dat[27];
//             end
//             else if ((spi_cnt[7:0]==8'd4)||(spi_cnt[7:0]==8'd5)||(spi_cnt[7:0]==8'd6)||(spi_cnt[7:0]==8'd7)) begin
//               spi_dat_reg <= ram_dat[26];
//             end
//             else if ((spi_cnt[7:0]==8'd8)||(spi_cnt[7:0]==8'd9)||(spi_cnt[7:0]==8'd10)||(spi_cnt[7:0]==8'd11)) begin
//               spi_dat_reg <= ram_dat[25];
//             end
//             else if ((spi_cnt[7:0]==8'd12)||(spi_cnt[7:0]==8'd13)||(spi_cnt[7:0]==8'd14)||(spi_cnt[7:0]==8'd15)) begin
//               spi_dat_reg <= ram_dat[24];
//             end 
//             else if ((spi_cnt[7:0]==8'd16)||(spi_cnt[7:0]==8'd17)||(spi_cnt[7:0]==8'd18)||(spi_cnt[7:0]==8'd19)) begin
//               spi_dat_reg <= ram_dat[23];
//             end
//             else if ((spi_cnt[7:0]==8'd20)||(spi_cnt[7:0]==8'd21)||(spi_cnt[7:0]==8'd22)||(spi_cnt[7:0]==8'd23)) begin
//               spi_dat_reg <= ram_dat[22];
//             end
//             else if ((spi_cnt[7:0]==8'd24)||(spi_cnt[7:0]==8'd25)||(spi_cnt[7:0]==8'd26)||(spi_cnt[7:0]==8'd27)) begin
//               spi_dat_reg <= ram_dat[21];
//             end
//             else if ((spi_cnt[7:0]==8'd28)||(spi_cnt[7:0]==8'd29)||(spi_cnt[7:0]==8'd30)||(spi_cnt[7:0]==8'd31)) begin
//               spi_dat_reg <= ram_dat[20];
//             end 
//             else if ((spi_cnt[7:0]==8'd32)||(spi_cnt[7:0]==8'd33)||(spi_cnt[7:0]==8'd34)||(spi_cnt[7:0]==8'd35)) begin
//               spi_dat_reg <= ram_dat[19];
//             end
//             else if ((spi_cnt[7:0]==8'd36)||(spi_cnt[7:0]==8'd37)||(spi_cnt[7:0]==8'd38)||(spi_cnt[7:0]==8'd39)) begin
//               spi_dat_reg <= ram_dat[18];
//             end
//             else if ((spi_cnt[7:0]==8'd40)||(spi_cnt[7:0]==8'd41)||(spi_cnt[7:0]==8'd42)||(spi_cnt[7:0]==8'd43)) begin
//               spi_dat_reg <= ram_dat[17];
//             end
//             else if ((spi_cnt[7:0]==8'd44)||(spi_cnt[7:0]==8'd45)||(spi_cnt[7:0]==8'd46)||(spi_cnt[7:0]==8'd47)) begin
//               spi_dat_reg <= ram_dat[16];
//             end 
//             else if ((spi_cnt[7:0]==8'd48)||(spi_cnt[7:0]==8'd49)||(spi_cnt[7:0]==8'd50)||(spi_cnt[7:0]==8'd51)) begin
//               spi_dat_reg <= ram_dat[15];
//             end
//             else if ((spi_cnt[7:0]==8'd52)||(spi_cnt[7:0]==8'd53)||(spi_cnt[7:0]==8'd54)||(spi_cnt[7:0]==8'd55)) begin
//               spi_dat_reg <= ram_dat[14];
//             end
//             else if ((spi_cnt[7:0]==8'd56)||(spi_cnt[7:0]==8'd57)||(spi_cnt[7:0]==8'd58)||(spi_cnt[7:0]==8'd59)) begin
//               spi_dat_reg <= ram_dat[13];
//             end
//             else if ((spi_cnt[7:0]==8'd60)||(spi_cnt[7:0]==8'd61)||(spi_cnt[7:0]==8'd62)||(spi_cnt[7:0]==8'd63)) begin
//               spi_dat_reg <= ram_dat[12];
//             end
//             else if ((spi_cnt[7:0]==8'd64)||(spi_cnt[7:0]==8'd65)||(spi_cnt[7:0]==8'd66)||(spi_cnt[7:0]==8'd67)) begin
//               spi_dat_reg <= ram_dat[11];
//             end
//             else if ((spi_cnt[7:0]==8'd68)||(spi_cnt[7:0]==8'd69)||(spi_cnt[7:0]==8'd70)||(spi_cnt[7:0]==8'd71)) begin
//               spi_dat_reg <= ram_dat[10];
//             end
//             else if ((spi_cnt[7:0]==8'd72)||(spi_cnt[7:0]==8'd73)||(spi_cnt[7:0]==8'd74)||(spi_cnt[7:0]==8'd75)) begin
//               spi_dat_reg <= ram_dat[9];
//             end
//             else if ((spi_cnt[7:0]==8'd76)||(spi_cnt[7:0]==8'd77)||(spi_cnt[7:0]==8'd78)||(spi_cnt[7:0]==8'd79)) begin
//               spi_dat_reg <= ram_dat[8];
//             end 
//             else if ((spi_cnt[7:0]==8'd80)||(spi_cnt[7:0]==8'd81)||(spi_cnt[7:0]==8'd82)||(spi_cnt[7:0]==8'd83)) begin
//               spi_dat_reg <= ram_dat[7];
//             end
//             else if ((spi_cnt[7:0]==8'd84)||(spi_cnt[7:0]==8'd85)||(spi_cnt[7:0]==8'd86)||(spi_cnt[7:0]==8'd87)) begin
//               spi_dat_reg <= ram_dat[6];
//             end
//             else if ((spi_cnt[7:0]==8'd88)||(spi_cnt[7:0]==8'd89)||(spi_cnt[7:0]==8'd90)||(spi_cnt[7:0]==8'd91)) begin
//               spi_dat_reg <= ram_dat[5];
//             end
//             else if ((spi_cnt[7:0]==8'd92)||(spi_cnt[7:0]==8'd93)||(spi_cnt[7:0]==8'd94)||(spi_cnt[7:0]==8'd95)) begin
//               spi_dat_reg <= ram_dat[4];
//             end 
//             else if ((spi_cnt[7:0]==8'd96)||(spi_cnt[7:0]==8'd97)||(spi_cnt[7:0]==8'd98)||(spi_cnt[7:0]==8'd99)) begin
//               spi_dat_reg <= ram_dat[3];
//             end
//             else if ((spi_cnt[7:0]==8'd100)||(spi_cnt[7:0]==8'd101)||(spi_cnt[7:0]==8'd102)||(spi_cnt[7:0]==8'd103)) begin
//               spi_dat_reg <= ram_dat[2];
//             end
//             else if ((spi_cnt[7:0]==8'd104)||(spi_cnt[7:0]==8'd105)||(spi_cnt[7:0]==8'd106)||(spi_cnt[7:0]==8'd107)) begin
//               spi_dat_reg <= ram_dat[1];
//             end
//             else if ((spi_cnt[7:0]==8'd108)||(spi_cnt[7:0]==8'd109)||(spi_cnt[7:0]==8'd110)||(spi_cnt[7:0]==8'd111)) begin
//               spi_dat_reg <= ram_dat[0];
//             end     
//             else begin
//               spi_dat_reg <= 1'b0;
//             end
// end

always @(posedge CLK or posedge RST) begin
            if (RST) begin
              spi_dat_reg <= 1'b0;
            end
            else if ((spi_cnt[7:0]==8'd3)||(spi_cnt[7:0]==8'd4)||(spi_cnt[7:0]==8'd5)||(spi_cnt[7:0]==8'd6)) begin
              spi_dat_reg <= ram_dat[27];
            end
            else if ((spi_cnt[7:0]==8'd7)||(spi_cnt[7:0]==8'd8)||(spi_cnt[7:0]==8'd9)||(spi_cnt[7:0]==8'd10)) begin
              spi_dat_reg <= ram_dat[26];
            end
            else if ((spi_cnt[7:0]==8'd11)||(spi_cnt[7:0]==8'd12)||(spi_cnt[7:0]==8'd13)||(spi_cnt[7:0]==8'd14)) begin
              spi_dat_reg <= ram_dat[25];
            end
            else if ((spi_cnt[7:0]==8'd15)||(spi_cnt[7:0]==8'd16)||(spi_cnt[7:0]==8'd17)||(spi_cnt[7:0]==8'd18)) begin
              spi_dat_reg <= ram_dat[24];
            end 
            else if ((spi_cnt[7:0]==8'd19)||(spi_cnt[7:0]==8'd20)||(spi_cnt[7:0]==8'd21)||(spi_cnt[7:0]==8'd22)) begin
              spi_dat_reg <= ram_dat[23];
            end
            else if ((spi_cnt[7:0]==8'd23)||(spi_cnt[7:0]==8'd24)||(spi_cnt[7:0]==8'd25)||(spi_cnt[7:0]==8'd26)) begin
              spi_dat_reg <= ram_dat[22];
            end
            else if ((spi_cnt[7:0]==8'd27)||(spi_cnt[7:0]==8'd28)||(spi_cnt[7:0]==8'd29)||(spi_cnt[7:0]==8'd30)) begin
              spi_dat_reg <= ram_dat[21];
            end
            else if ((spi_cnt[7:0]==8'd31)||(spi_cnt[7:0]==8'd32)||(spi_cnt[7:0]==8'd33)||(spi_cnt[7:0]==8'd34)) begin
              spi_dat_reg <= ram_dat[20];
            end 
            else if ((spi_cnt[7:0]==8'd35)||(spi_cnt[7:0]==8'd36)||(spi_cnt[7:0]==8'd37)||(spi_cnt[7:0]==8'd38)) begin
              spi_dat_reg <= ram_dat[19];
            end
            else if ((spi_cnt[7:0]==8'd39)||(spi_cnt[7:0]==8'd40)||(spi_cnt[7:0]==8'd41)||(spi_cnt[7:0]==8'd42)) begin
              spi_dat_reg <= ram_dat[18];
            end
            else if ((spi_cnt[7:0]==8'd43)||(spi_cnt[7:0]==8'd44)||(spi_cnt[7:0]==8'd45)||(spi_cnt[7:0]==8'd46)) begin
              spi_dat_reg <= ram_dat[17];
            end
            else if ((spi_cnt[7:0]==8'd47)||(spi_cnt[7:0]==8'd48)||(spi_cnt[7:0]==8'd49)||(spi_cnt[7:0]==8'd50)) begin
              spi_dat_reg <= ram_dat[16];
            end 
            else if ((spi_cnt[7:0]==8'd51)||(spi_cnt[7:0]==8'd52)||(spi_cnt[7:0]==8'd53)||(spi_cnt[7:0]==8'd54)) begin
              spi_dat_reg <= ram_dat[15];
            end
            else if ((spi_cnt[7:0]==8'd55)||(spi_cnt[7:0]==8'd56)||(spi_cnt[7:0]==8'd57)||(spi_cnt[7:0]==8'd58)) begin
              spi_dat_reg <= ram_dat[14];
            end
            else if ((spi_cnt[7:0]==8'd59)||(spi_cnt[7:0]==8'd60)||(spi_cnt[7:0]==8'd61)||(spi_cnt[7:0]==8'd62)) begin
              spi_dat_reg <= ram_dat[13];
            end
            else if ((spi_cnt[7:0]==8'd63)||(spi_cnt[7:0]==8'd64)||(spi_cnt[7:0]==8'd65)||(spi_cnt[7:0]==8'd66)) begin
              spi_dat_reg <= ram_dat[12];
            end
            else if ((spi_cnt[7:0]==8'd67)||(spi_cnt[7:0]==8'd68)||(spi_cnt[7:0]==8'd69)||(spi_cnt[7:0]==8'd70)) begin
              spi_dat_reg <= ram_dat[11];
            end
            else if ((spi_cnt[7:0]==8'd71)||(spi_cnt[7:0]==8'd72)||(spi_cnt[7:0]==8'd73)||(spi_cnt[7:0]==8'd74)) begin
              spi_dat_reg <= ram_dat[10];
            end
            else if ((spi_cnt[7:0]==8'd75)||(spi_cnt[7:0]==8'd76)||(spi_cnt[7:0]==8'd77)||(spi_cnt[7:0]==8'd78)) begin
              spi_dat_reg <= ram_dat[9];
            end
            else if ((spi_cnt[7:0]==8'd79)||(spi_cnt[7:0]==8'd80)||(spi_cnt[7:0]==8'd81)||(spi_cnt[7:0]==8'd82)) begin
              spi_dat_reg <= ram_dat[8];
            end 
            else if ((spi_cnt[7:0]==8'd83)||(spi_cnt[7:0]==8'd84)||(spi_cnt[7:0]==8'd85)||(spi_cnt[7:0]==8'd86)) begin
              spi_dat_reg <= ram_dat[7];
            end
            else if ((spi_cnt[7:0]==8'd87)||(spi_cnt[7:0]==8'd88)||(spi_cnt[7:0]==8'd89)||(spi_cnt[7:0]==8'd90)) begin
              spi_dat_reg <= ram_dat[6];
            end
            else if ((spi_cnt[7:0]==8'd91)||(spi_cnt[7:0]==8'd92)||(spi_cnt[7:0]==8'd93)||(spi_cnt[7:0]==8'd94)) begin
              spi_dat_reg <= ram_dat[5];
            end
            else if ((spi_cnt[7:0]==8'd95)||(spi_cnt[7:0]==8'd96)||(spi_cnt[7:0]==8'd97)||(spi_cnt[7:0]==8'd98)) begin
              spi_dat_reg <= ram_dat[4];
            end 
            else if ((spi_cnt[7:0]==8'd99)||(spi_cnt[7:0]==8'd100)||(spi_cnt[7:0]==8'd101)||(spi_cnt[7:0]==8'd102)) begin
              spi_dat_reg <= ram_dat[3];
            end
            else if ((spi_cnt[7:0]==8'd103)||(spi_cnt[7:0]==8'd104)||(spi_cnt[7:0]==8'd105)||(spi_cnt[7:0]==8'd106)) begin
              spi_dat_reg <= ram_dat[2];
            end
            else if ((spi_cnt[7:0]==8'd107)||(spi_cnt[7:0]==8'd108)||(spi_cnt[7:0]==8'd109)||(spi_cnt[7:0]==8'd110)) begin
              spi_dat_reg <= ram_dat[1];
            end
            else if ((spi_cnt[7:0]==8'd111)||(spi_cnt[7:0]==8'd112)||(spi_cnt[7:0]==8'd113)||(spi_cnt[7:0]==8'd114)) begin
              spi_dat_reg <= ram_dat[0];
            end     
            else begin
              spi_dat_reg <= 1'b0;
            end
end

assign ARRAY_IN = spi_dat_reg;

//  output           RSTB
reg       rst_reg; 

always @(posedge CLK or posedge RST) begin
            if (RST) begin
              rst_reg <= 1'b0;
            end
            else if ((state_reg==IDLE)&&(state_next==STATE_ST)) begin
              rst_reg <= 1'b1;
            end
            // else if (array_end) begin
            //   rst_reg <= 1'b0;
            // end
            else begin
              rst_reg <= rst_reg;
            end
end
assign RSTB = rst_reg;

//  output           REFRESH
reg       ref_reg; 

always @(posedge CLK or posedge RST) begin
            if (RST) begin
              ref_reg <= 1'b0;
            end
            else if (array_end) begin
              ref_reg <= 1'b1;
            end
            else begin
              ref_reg <= 1'b0;
            end
end

wire       ref_x;

FD XNCOM1 (.D(ref_reg), .C(CLK), .Q(ref_x));

wire       ref_x1;

FD XNCOM2 (.D(ref_x), .C(CLK), .Q(ref_x1));

wire       ref_x2;

FD XNCOM3 (.D(ref_x1), .C(CLK), .Q(ref_x2));

wire       ref_x3;

FD XNCOM4 (.D(ref_x2), .C(CLK), .Q(ref_x3));

wire       ref_x4;

FD XNCOM5 (.D(ref_x3), .C(CLK), .Q(ref_x4));

wire       ref_x5;

FD XNCOM6 (.D(ref_x4), .C(CLK), .Q(ref_x5));

wire       ref_x6;

FD XNCOM7 (.D(ref_x5), .C(CLK), .Q(ref_x6));

wire       ref_x7;

FD XNCOM8 (.D(ref_x6), .C(CLK), .Q(ref_x7));

wire       ref_x8;

FD XNCOM9 (.D(ref_x7), .C(CLK), .Q(ref_x8));

// assign REFRESH = ref_reg||ref_x||ref_x1||ref_x2;
// assign REFRESH = ref_x1||ref_x2||ref_x3||ref_x4;
assign REFRESH = ref_x3||ref_x4||ref_x5||ref_x6||ref_x7||ref_x8;
//  output           CS
reg       cs_reg; 

wire       ref_x9;

FD XNCOM10 (.D(ref_x8), .C(CLK), .Q(ref_x9));

wire       ref_x10;

FD XNCOM11 (.D(ref_x9), .C(CLK), .Q(ref_x10));

wire       ref_x11;

FD XNCOM12 (.D(ref_x10), .C(CLK), .Q(ref_x11));

wire       ref_x12;

FD XNCOM13 (.D(ref_x11), .C(CLK), .Q(ref_x12));

always @(posedge CLK or posedge RST) begin
            if (RST) begin
              cs_reg <= 1'b1;
            end
            else if (START) begin
              cs_reg <= 1'b0;
            end
            else if (ref_x12) begin
              cs_reg <= 1'b1;
            end
            else begin
              cs_reg <= cs_reg;
            end
end
assign CS = cs_reg;

wire       ref_x13;

FD XNCOM14 (.D(ref_x12), .C(CLK), .Q(ref_x13));

wire       ref_x14;

FD XNCOM15 (.D(ref_x13), .C(CLK), .Q(ref_x14));
// assign CS_SW = array_end_end;
assign CS_SW = ref_x14;
endmodule
