/*******************************************************************************
*                                                                              *
* System      : soft trigger and test signal module                            *
* Module      : TCNT_GEN                                                       *
* Version     : v 0.1.0 2020/7/26                                              *
*                                                                              *
* Description : Slow control; Test pulse generator                             *
*                                                                              *
* Designer    : lihx@ihep.ac.cn                                                *
*                                                                              *
*                                                                              *
*******************************************************************************/
module PADDING_TOP(
  input           CLK , // in : Clock
  input           RST , // in : System reset
  input           START ,
  input           DATAENI , // in : Start pulse to generate test pulses
  input [63:0]    DATAIN ,
  output          DATAENO ,
  output [63:0]   DATAOUT     
);




// State Machine
reg [1:0] state_reg, state_next;
localparam
  IDLE      = 0,
  DCNT      = 1,
  DELAY     = 2,
  PAD       = 3;


always @(posedge CLK or posedge RST) begin
  if (RST) state_reg <= IDLE;
  else state_reg <= state_next;
end


always @(*) begin
  state_next = IDLE;
  case(state_reg)
    IDLE: begin
      if(START) begin
        state_next = DCNT;
      end  
      else begin
        state_next = IDLE;
      end
    end
    DCNT: begin
      if(d_end) begin
        state_next = DELAY;
      end
      else begin
        state_next = DCNT;
      end
    end
    DELAY: begin
       state_next = PAD;
    end
    PAD: begin
      if(p_end) begin
       state_next = IDLE;
      end
      else begin
       state_next = PAD;
      end
    end
  endcase
end

// base timer
// after and before base timer // 1ms 1us can be chosen

reg  [19:0]  d_cnt;
wire         d_start;
wire         d_end;    

always @(posedge CLK or posedge RST) begin
  if (RST) begin
    d_cnt[19:0] <= 0; 
  end
  else if (d_start) begin
      if(d_end)
          d_cnt[19:0] <= 0;
      else
        d_cnt[19:0] <= d_cnt[19:0] + 1;
  end
end
assign d_start = (state_reg[1:0]==DCNT)&&DATAENI;
assign d_end   = d_start&&(d_cnt[19:0]==20'd73729-1);//14978


reg  [7:0]   p_cnt;
wire         p_start;
wire         p_end;    

always @(posedge CLK or posedge RST) begin
  if (RST) begin
    p_cnt[7:0] <= 0; 
  end
  else if (p_start) begin
      if(p_end)
        p_cnt[7:0] <= 0;
      else
        p_cnt[7:0] <= p_cnt[7:0] + 1;
  end
end
assign p_start = state_reg[1:0]==PAD;
assign p_end   = p_start&&(p_cnt[7:0]==8'd191-1);//62



reg [15:0]     pad_cnt;

always @(posedge CLK or posedge RST) begin
  if (RST) begin
        pad_cnt[15:0] <= 0; 
  end
  else if (p_end) begin
        pad_cnt[15:0] <= pad_cnt[15:0] + 1;
  end
  else begin
        pad_cnt[15:0] <= pad_cnt[15:0];
  end
end





reg           dataeno_reg;


always @(posedge CLK or posedge RST) begin
  if (RST) begin
    dataeno_reg <= 1'b0;
  end
  else if (DATAENI|p_start) begin
    dataeno_reg <= 1'b1;
  end
  else begin
    dataeno_reg <= 1'b0;
  end
end

reg [63:0]    dataout_reg;

always @(posedge CLK) begin
    dataout_reg[63:0] <= DATAIN[63:0];   
end


assign DATAOUT[63:0] = dataout_reg[63:0];
assign DATAENO       = dataeno_reg;


// PAD_ILA PAD_ILA (
//   .clk(CLK), // input wire clk
//   .probe0(d_start), // input wire [0:0]  probe0  
//   .probe1(d_end), // input wire [0:0]  probe1 
//   .probe2(p_start), // input wire [0:0]  probe2 
//   .probe3(p_end), // input wire [0:0]  probe3 
//   .probe4(dataeno_reg), // input wire [0:0]  probe4 
//   .probe5(state_reg[1:0]), // input wire [1:0]  probe5 
//   .probe6(p_cnt[7:0]), // input wire [7:0]  probe6 
//   .probe7(d_cnt[19:0]), // input wire [15:0]  probe7 
//   .probe8(dataout_reg[63:0]), // input wire [63:0]  probe8
//   .probe9(pad_cnt[15:0])
// );


endmodule






