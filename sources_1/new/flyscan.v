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


module flyscan(
  input            RST,        // Reset
  input            CLK,     // independent clock (20M)
  input            trg_in,
  input [15:0]      trg_cnt,
  output           trg_out,
  input [1:0]      mode_en,
  output           trg_en
    );


// reg       trg_reg;
// reg       trg_fre;
// reg [4:0] trgg_cnt;

// always@(negedge CLK or negedge start_trg)
// begin
//     if(~start_trg)
//     begin
//         trg_reg<=0; 
//         trg_fre<=0;
//         trgg_cnt<=0;
//     end
//     else if(trgg_cnt<5'd50)
//     begin
//         trg_reg<=1;
//         trgg_cnt<=trgg_cnt+1'b1;
//     end
//     else if(trgg_cnt==(5'd50))
//     begin
//         trg_reg<=0;
//         trgg_cnt<=trgg_cnt+1'b1;
//     end
//     else if(trgg_cnt==(5'd51))
//     begin
//         trg_reg<=0;
//         trgg_cnt<=trgg_cnt+1'b1;
//     end
//     else
//     begin
//         trg_fre<=0;
//     end
// end


reg trg_in_reg;
reg trg_in_reg_r;
// wire trg_in;

always @(posedge CLK) begin //RST_C
  trg_in_reg <= trg_in;//trg_in
end

always @(posedge CLK) begin //RST_C
  trg_in_reg_r <= trg_in_reg;
end

assign trg_inr = !trg_in_reg_r&&trg_in_reg;

assign trg_inf = !trg_in_reg&&trg_in_reg_r;





// State Machine
reg [2:0] state_reg, state_next;
localparam
  IDLE           = 0,
  T_A            = 1,
  T_B            = 2,
  T_B1           = 3,
  T_C            = 4;


always @(posedge CLK or posedge RST) begin//
  if (RST) state_reg <= IDLE;
  else state_reg <= state_next;
end

always @(*) begin//
  state_next = IDLE;
  case(state_reg)
    IDLE: begin//     //STATE0
      if(trg_inr&&(mode_en==2'h3)) begin// 
        state_next = T_A;
      end   
      else begin//
        state_next = IDLE;
      end
    end
    T_A: begin//     //STATE0
    
      if(trg_inr) begin// 
      // if(e_end) begin// 
        state_next = T_B;
      end 
            
      else begin//
        state_next = T_A;
      end
    end
    T_B: begin//     //STATE0 
    if(trg_inr&&cnt_end) begin// 
        state_next = T_B1;
      end        
      else begin//
        state_next = T_B;
      end
    end
    T_B1: begin//     //STATE0 
    if(r_end) begin// 
        state_next = T_C;
      end        
      else begin//
        state_next = T_B1;
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


wire trig_mask;
assign trig_mask = (state_reg==IDLE)&&(state_next==T_A);
wire trig_mask1;
assign trig_mask1 = (state_reg==T_B1)&&(state_next==T_C);


// ip timer
// the pointer of ip should be added to 4 at first time




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
assign cnt_start = trg_inr;
assign cnt_end   = cnt_start&&(cnt_cnt[15:0]==trg_cnt-1);//98304 12288


// assign trg_cc[15:0] = cnt_cnt[15:0];

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
assign r_start = (state_reg==T_B1)||(state_reg==T_C);
assign r_end   = r_start&&(r_cnt[16:0]==17'd90000);//98304 12288  d103777
//ip_flag



assign trg_out = trg_inr||trig_mask1;






reg    mask_r;

always @(posedge CLK or posedge RST) begin
            if (RST) begin
              mask_r<= 1'b0;
            end          
            else if ((state_reg==T_B)||(state_reg==T_B1)) begin //d3780
              mask_r<= 1'b1;            
            end            
            else if (r_end) begin
              mask_r<= 1'b0;          
            end
            else begin
              mask_r<= mask_r; 
            end
end

assign trg_en = mask_r;

endmodule
