`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/09/05 14:30:20
// Design Name: 
// Module Name: sync_trans
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


module sync_trans(
  input           CLK_20M,
  input           CLK_120M,
  input           RST,     
  input           FRAME_IN,
  input           SYNC,
  output          FRAME_OUT,
  output          START,
  output          RE_START,
  output          START_END,
  output [15:0]   FRAME_COUNT
    );

// State Machine
reg [2:0] state_reg, state_next;
localparam
  IDLE           = 0,
  STATE_SYNC     = 1,
  STATE_FRAME    = 2,
  STATE_START    = 3,
  STATE_RE_START = 4;

always @(posedge CLK_20M or posedge RST) begin
  if (RST) state_reg <= IDLE;
  else state_reg <= state_next;
end

always @(*) begin
  state_next = IDLE;
  case(state_reg)
    IDLE: begin     //STATE0
      if(FRAME_IN) begin 
        state_next = STATE_SYNC;
      end  
      else begin
        state_next = IDLE;
      end
    end
    STATE_SYNC: begin    //STATE1
      if(SYNC) begin
        state_next = STATE_FRAME;
      end  
      else begin
        state_next = STATE_SYNC;
      end
    end
    STATE_FRAME: begin    //STATE1
      if(sync_start&&(sync_cnt[19:0]==20'd3)) begin
        state_next = STATE_START;
      end  
      else begin
        state_next = STATE_FRAME;
      end
    end
    STATE_START: begin    //STATE2
      if(sync_start&&(sync_cnt[19:0]==20'd28677)) begin
        state_next = STATE_RE_START;
      end 
      else begin        
        state_next = STATE_START;
      end
    end
    STATE_RE_START: begin     //STATE3
      if(sync_end) begin
        state_next = IDLE;
      end 
      else begin        
        state_next = STATE_RE_START;
      end
    end
  endcase
end



// the pointer of ip should be added to 4 at first time

reg  [19:0]   sync_cnt;
wire         sync_start;
wire         sync_end;    

always @(posedge CLK_20M or posedge RST) begin
  if (RST) begin
    sync_cnt[19:0] <= 0; 
  end
  else if (sync_start) begin
      if(sync_end)begin
        sync_cnt[19:0] <= 0;
      end
      else begin
        sync_cnt[19:0] <= sync_cnt[19:0] + 1;
      end
  end
end
assign sync_start = (state_reg==STATE_FRAME)||(state_reg==STATE_START)||(state_reg==STATE_RE_START);
// assign sync_end   = sync_start&&(sync_cnt[19:0]==20'd102406);// 5 / 128*8*28=28672 / 128*8*12%4*24=73728

assign sync_end   = sync_start&&(sync_cnt[19:0]==20'd131082);// 5 / 128*8*28=28672 / 128*8*12%4*24=73728 //57344

reg    FRAME_OUT_R;

always @(posedge CLK_20M or posedge RST) begin
            if (RST) begin
              FRAME_OUT_R <= 1'b0;
            end
            else if (sync_cnt[19:0]==20'd2) begin
              FRAME_OUT_R <= 1'b1;
            end
            else if (sync_cnt[19:0]==20'd4) begin
              FRAME_OUT_R <= 1'b0;
            end
            else begin
              FRAME_OUT_R <= FRAME_OUT_R;
            end
end
assign FRAME_OUT = FRAME_OUT_R;

reg    START_R;

always @(posedge CLK_20M or posedge RST) begin
            if (RST) begin
              START_R <= 1'b0;
            end
            else if (sync_cnt[19:0]==20'd5) begin //d8
              START_R <= 1'b1;
            end
            else if (sync_cnt[19:0]==20'd50000) begin// d57352
              START_R <= 1'b0;
            end
            else begin
              START_R <= START_R;
            end
end
assign START = START_R;

reg    RE_START_R;

always @(posedge CLK_20M or posedge RST) begin
            if (RST) begin
              RE_START_R <= 1'b0;
            end
            else if (sync_cnt[19:0]==20'd57353) begin
              RE_START_R <= 1'b1;
            end
            // else if (sync_cnt[19:0]==20'd77830) begin
            //   RE_START_R <= 1'b0;
            // end
            else if (sync_cnt[19:0]==20'd131081) begin
              RE_START_R <= 1'b0;
            end
            else begin
              RE_START_R <= RE_START_R;
            end
end
assign RE_START = RE_START_R;

reg    START_END_R;

always @(posedge CLK_20M or posedge RST) begin
            if (RST) begin
              START_END_R <= 1'b0;
            end
            else if (sync_cnt[19:0]==20'd57351) begin //d8
              START_END_R <= 1'b1;
            end
            else if (sync_cnt[19:0]==20'd57352) begin
              START_END_R <= 1'b0;
            end
            else begin
              START_END_R <= START_END_R;
            end
end
assign START_END = START_END_R;




reg [15:0]   frame_cnt;

always @(posedge CLK_20M or posedge RST) begin
            if (RST) begin
              frame_cnt <= 16'b0;
            end
            else if (FRAME_IN) begin
              frame_cnt <= frame_cnt+1'b1;
            end
            else begin
              frame_cnt <= frame_cnt;
            end
end
assign FRAME_COUNT = frame_cnt;






// ila_sync ila_sync (
//   .clk(CLK_20M), // input wire clk


//   .probe0(sync_start), // input wire [0:0]  probe0  
//   .probe1(START_R), // input wire [0:0]  probe1 
//   .probe2(SYNC), // input wire [0:0]  probe2 
//   .probe3(FRAME_IN), // input wire [0:0]  probe3 
//   .probe4(RE_START_R), // input wire [0:0]  probe4 
//   .probe5(FRAME_OUT_R), // input wire [0:0]  probe5 
//   .probe6(sync_cnt[19:0]) // input wire [19:0]  probe6
// );

endmodule
