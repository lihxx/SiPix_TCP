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


module trigger3_top(
  input            RST,        // Reset
  input            CLK,     // independent clock (20M)
  input            trg_in,
  input [31:0]     exp_cnt,
  input [15:0]      trg_cnt,
  output           trg_out,
  output           trg_mask,
  output           trg_en,
  output [15:0]     trg_cc,
  output [2:0]     state_x
    );




// State Machine
reg [2:0] state_reg, state_next;
localparam
  IDLE           = 0,
  T_A            = 1,
  T_B            = 2,
  T_C            = 3;

always @(posedge CLK or posedge RST) begin//
  if (RST) state_reg <= IDLE;
  else state_reg <= state_next;
end

always @(*) begin//
  state_next = IDLE;
  case(state_reg)
    IDLE: begin//     //STATE0
      if(trg_in) begin// 
        state_next = T_A;
      end  
      else begin//
        state_next = IDLE;
      end
    end
    T_A: begin//     //STATE0
      if(e_end&&(!(trg_cnt==16'd0))) begin// 
      // if(e_end) begin// 
        state_next = T_B;
      end 
      else if(e_end&&(trg_cnt==16'd0)) begin// 
        state_next = T_C;
      end             
      else begin//
        state_next = T_A;
      end
    end
    T_B: begin//     //STATE0 
    if(e_end&&cnt_end) begin// 
        state_next = T_C;
      end        
      else begin//
        state_next = T_B;
      end
    end
    T_C: begin//     //STATE0 
    if(r_end) begin// 
        state_next = IDLE;
      end        
      else begin//
        state_next = T_C;
      end
    end    
  endcase
end



assign state_x[2:0] = state_reg[2:0];
// ip timer
// the pointer of ip should be added to 4 at first time

reg  [31:0]   e_cnt;
wire          e_start;
wire          e_end;    


always @(posedge CLK or posedge RST) begin //RST_C
  if (RST) begin
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
assign e_start = (state_reg==T_B)||(state_reg==T_A);
assign e_end   = e_start&&(e_cnt[31:0]==exp_cnt);//98304 12288
//ip_flag


reg  [15:0]    cnt_cnt;
wire          cnt_start;
wire          cnt_end;    



always @(posedge CLK or posedge RST) begin //RST_C
  if (RST) begin
    cnt_cnt[15:0] <= 0; 
  end
  else if (cnt_start) begin
      if(cnt_end)begin
        cnt_cnt[15:0] <= 0;
      end
      else begin
        cnt_cnt[15:0] <= cnt_cnt[15:0] + 1;
      end
  end
end
assign cnt_start = e_end;
assign cnt_end   = cnt_start&&(cnt_cnt[15:0]==trg_cnt);//98304 12288


assign trg_cc[15:0] = cnt_cnt[15:0];

reg  [16:0]    r_cnt;
wire          r_start;
wire          r_end;    


always @(posedge CLK or posedge RST) begin //RST_C
  if (RST) begin
    r_cnt[16:0] <= 0; 
  end
  else if (r_start) begin
      if(r_end)begin
        r_cnt[16:0] <= 0;
      end
      else begin
        r_cnt[16:0] <= r_cnt[16:0] + 1;
      end
  end
end
assign r_start = state_reg==T_C;
assign r_end   = r_start&&(r_cnt[16:0]==17'd103791);//98304 12288  d103777
//ip_flag



assign trg_out = e_end;




assign trg_mask = (state_reg==T_A)||(mask_r);

// assign trg_mask = (state_reg==T_A)||((state_reg==T_B)&&(cnt_cnt[9:0]==trg_cnt));

// assign trg_en = ~trg_mask;

reg    mask_r;

always @(posedge CLK or posedge RST) begin
            if (RST) begin
              mask_r<= 1'b0;
            end
            else if ((cnt_cnt[15:0]==16'd1)&&(e_cnt[31:0]==32'd3794)) begin //d3780
              mask_r<= 1'b1;            
            end
            else if (r_end) begin
              mask_r<= 1'b0;          
            end
            else begin
              mask_r<= mask_r; 
            end
end
assign trg_en = mask_r||r_start;
// assign trg_en = (state_reg==T_B)||(state_reg==T_C);


// ila_trg ila_trg (
//  .clk(CLK), // input wire clk
//  .probe0(trg_in), // input wire [0:0]  probe0  
//  .probe1(r_start),
//  .probe2(r_end), // input wire [0:0]  probe0  
//  .probe3(e_start),
//  .probe4(e_end), // input wire [0:0]  probe0  
//  .probe5(cnt_start),
//  .probe6(r_end), // input wire [0:0]  probe0  
//  .probe7(cnt_end), 
//  .probe8(state_reg[2:0]), // input wire [0:0]  probe0  
//  .probe9(trg_cnt[15:0]),
//  .probe10(cnt_cnt[15:0]), // input wire [0:0]  probe0  
//  .probe11(r_cnt[16:0]), 
//  .probe12(e_cnt[31:0])
// );

endmodule
