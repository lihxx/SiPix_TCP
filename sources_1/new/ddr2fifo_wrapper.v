//*****************************************************************************
// (c) Copyright 2009 - 2013 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//*****************************************************************************
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor             : Xilinx
// \   \   \/     Version            : 4.0
//  \   \         Application        : MIG
//  /   /         Filename           : example_top.v
// /___/   /\     Date Last Modified : $Date: 2011/06/02 08:35:03 $
// \   \  /  \    Date Created       : Tue Sept 21 2010
//  \___\/\___\
//
// Device           : 7 Series
// Design Name      : DDR3 SDRAM
// Purpose          :
//   Top-level  module. This module serves as an example,
//   and allows the user to synthesize a self-contained design,
//   which they can be used to test their hardware.
//   In addition to the memory controller, the module instantiates:
//     1. Synthesizable testbench - used to model user's backend logic
//        and generate different traffic patterns
// Reference        :
// Revision History :
//*****************************************************************************

//`define SKIP_CALIB
`timescale 1ps/1ps

module ddr3_fifo_wrapper #
  (

   //***************************************************************************
   // The following parameters refer to width of various ports
   //***************************************************************************
   parameter CK_WIDTH              = 2,
                                     // # of CK/CK# outputs to memory.
   parameter nCS_PER_RANK          = 1,
                                     // # of unique CS outputs per rank for phy
   parameter CKE_WIDTH             = 2,
                                     // # of CKE outputs to memory.
   parameter DM_WIDTH              = 8,
                                     // # of DM (data mask)
   parameter ODT_WIDTH             = 2,
                                     // # of ODT outputs to memory.
   parameter BANK_WIDTH            = 3,
                                     // # of memory Bank Address bits.
   parameter COL_WIDTH             = 10,
                                     // # of memory Column Address bits.
   parameter CS_WIDTH              = 2,
                                     // # of unique CS outputs to memory.
   parameter DQ_WIDTH              = 64,
                                     // # of DQ (data)
   parameter DQS_WIDTH             = 8,
   parameter DQS_CNT_WIDTH         = 3,
                                     // = ceil(log2(DQS_WIDTH))
   parameter DRAM_WIDTH            = 8,
                                     // # of DQ per DQS
   parameter ECC                   = "OFF",
   parameter ECC_TEST              = "OFF",
   parameter nBANK_MACHS           = 4,
   parameter RANKS                 = 2,
                                     // # of Ranks.
   parameter ROW_WIDTH             = 16,
                                     // # of memory Row Address bits.
   parameter ADDR_WIDTH            = 30,
                                     // # = RANK_WIDTH + BANK_WIDTH
                                     //     + ROW_WIDTH + COL_WIDTH;
                                     // Chip Select is always tied to low for
                                     // single rank devices

   //***************************************************************************
   // The following parameters are mode register settings
   //***************************************************************************
   parameter BURST_MODE            = "8",
                                     // DDR3 SDRAM:
                                     // Burst Length (Mode Register 0).
                                     // # = "8", "4", "OTF".
                                     // DDR2 SDRAM:
                                     // Burst Length (Mode Register).
                                     // # = "8", "4".

   
   //***************************************************************************
   // The following parameters are multiplier and divisor factors for PLLE2.
   // Based on the selected design frequency these parameters vary.
   //***************************************************************************
   parameter CLKIN_PERIOD          = 5000,
                                     // Input Clock Period
   parameter CLKFBOUT_MULT         = 4,
                                     // write PLL VCO multiplier
   parameter DIVCLK_DIVIDE         = 1,
                                     // write PLL VCO divisor
   parameter CLKOUT0_PHASE         = 337.5,
                                     // Phase for PLL output clock (CLKOUT0)
   parameter CLKOUT0_DIVIDE        = 2,
                                     // VCO output divisor for PLL output clock (CLKOUT0)
   parameter CLKOUT1_DIVIDE        = 2,
                                     // VCO output divisor for PLL output clock (CLKOUT1)
   parameter CLKOUT2_DIVIDE        = 32,
                                     // VCO output divisor for PLL output clock (CLKOUT2)
   parameter CLKOUT3_DIVIDE        = 8,
                                     // VCO output divisor for PLL output clock (CLKOUT3)
   parameter MMCM_VCO              = 800,
                                     // Max Freq (MHz) of MMCM VCO
   parameter MMCM_MULT_F           = 8,
                                     // write MMCM VCO multiplier
   parameter MMCM_DIVCLK_DIVIDE    = 1,
                                     // write MMCM VCO divisor

   //***************************************************************************
   // Simulation parameters
   //***************************************************************************
   parameter SIMULATION            = "FALSE",
                                     // Should be TRUE during design simulations and
                                     // FALSE during implementations

   //***************************************************************************
   // IODELAY and PHY related parameters
   //***************************************************************************
   parameter TCQ                   = 100,
   
   parameter DRAM_TYPE             = "DDR3",

   
   //***************************************************************************
   // System clock frequency parameters
   //***************************************************************************
   parameter nCK_PER_CLK           = 4,
                                     // # of memory CKs per fabric CLK

   
   //***************************************************************************
   // AXI4 Shim parameters
   //***************************************************************************
   parameter C_S_AXI_ID_WIDTH              = 1,
                                             // Width of all master and slave ID signals.
                                             // # = >= 1.
   parameter C_S_AXI_ADDR_WIDTH            = 33,
                                             // Width of S_AXI_AWADDR, S_AXI_ARADDR, M_AXI_AWADDR and
                                             // M_AXI_ARADDR for all SI/MI slots.
                                             // # = 32.
   parameter C_S_AXI_DATA_WIDTH            = 64,
                                             // Width of WDATA and RDATA on SI slot.
                                             // Must be <= APP_DATA_WIDTH.
                                             // # = 32, 64, 128, 256.
   parameter C_S_AXI_SUPPORTS_NARROW_BURST = 0,
                                             // Indicates whether to instatiate upsizer
                                             // Range: 0, 1
      

   //***************************************************************************
   // Debug parameters
   //***************************************************************************
   parameter DEBUG_PORT            = "OFF",
                                     // # = "ON" Enable debug signals/controls.
                                     //   = "OFF" Disable debug signals/controls.
      
   parameter RST_ACT_LOW           = 0,
                                     // =1 for active low reset,
                                     // =0 for active high.
   parameter WINDOWS_CNT           = 32,
   parameter MEMORY                = 33'h1_FFFF_FFFF,
   // parameter MEMORY                = 4096,
   parameter USE_MIG               = 1

   )
  (

   // Inouts
   inout [63:0]                       ddr3_dq,
   inout [7:0]                        ddr3_dqs_n,
   inout [7:0]                        ddr3_dqs_p,

   // Outputs
   output [15:0]                      ddr3_addr,
   output [2:0]                       ddr3_ba,
   output                             ddr3_ras_n,
   output                             ddr3_cas_n,
   output                             ddr3_we_n,
   output                             ddr3_reset_n,
   output [1:0]                       ddr3_ck_p,
   output [1:0]                       ddr3_ck_n,
   output [1:0]                       ddr3_cke,
   
   output [1:0]                       ddr3_cs_n,
   
   output [7:0]                       ddr3_dm,
   
   output [1:0]                       ddr3_odt,
   

   // Inputs
   
   // Single-ended system clock
   input                              sys_clk_i,
   output                             init_calib_complete,
   output [11:0]                      device_temp,
      

   // System reset - Default polarity of sys_rst pin is Active High.
   // System reset polarity will change based on the option 
   // selected in GUI.
   input                              sys_rst,

   // User FIFO Interface
   input                              fifo_clk,  // 80MHz
   input                              fifo_wr_en,
   input  [63:0]                      fifo_wr_data,
   input                              fifo_rd_en,
   output                             fifo_rd_valid,
   output [63:0]                      fifo_rd_data,  
   output                             fifo_empty,
   output                             fifo_full
   );

function integer clogb2 (input integer size);
    begin
      size = size - 1;
      for (clogb2=1; size>1; clogb2=clogb2+1)
        size = size >> 1;
    end
  endfunction // clogb2

  function integer STR_TO_INT;
    input [7:0] in;
    begin
      if(in == "8")
        STR_TO_INT = 8;
      else if(in == "4")
        STR_TO_INT = 4;
      else
        STR_TO_INT = 0;
    end
  endfunction


  localparam DATA_WIDTH            = 64;
  localparam RANK_WIDTH = clogb2(RANKS);
  localparam PAYLOAD_WIDTH         = (ECC_TEST == "OFF") ? DATA_WIDTH : DQ_WIDTH;
  localparam BURST_LENGTH          = STR_TO_INT(BURST_MODE);
  localparam APP_DATA_WIDTH        = 2 * nCK_PER_CLK * PAYLOAD_WIDTH;
  localparam APP_MASK_WIDTH        = APP_DATA_WIDTH / 8;

  //***************************************************************************
  // Traffic Gen related parameters (derived)
  //***************************************************************************
  localparam  TG_ADDR_WIDTH = ((CS_WIDTH == 1) ? 0 : RANK_WIDTH)
                                 + BANK_WIDTH + ROW_WIDTH + COL_WIDTH;
  localparam MASK_SIZE             = DATA_WIDTH/8;
  localparam DBG_WR_STS_WIDTH      = 40;
  localparam DBG_RD_STS_WIDTH      = 40;
      

  // Wire declarations
      
  wire                              clk;
  (* mark_debug = "true" *) wire                              rst;
  (* mark_debug = "true" *) wire                              mmcm_locked;
  (* mark_debug = "true" *) reg                               aresetn;
  (* mark_debug = "true" *) wire                              ddr_user_reset_i;

  wire                              app_sr_active;
  wire                              app_ref_ack;
  wire                              app_zq_ack;
  wire                              app_rd_data_valid;
  wire [APP_DATA_WIDTH-1:0]         app_rd_data;

  wire                              mem_pattern_init_done;


  wire                              test_cmptd;
  wire                              write_cmptd;
  wire                              read_cmptd;
  wire                              cmptd_one_wr_rd;

  // Slave Interface Write Address Ports
  wire [C_S_AXI_ID_WIDTH-1:0]       s_axi_awid;
  wire [C_S_AXI_ADDR_WIDTH-1:0]     s_axi_awaddr;
  wire [7:0]                        s_axi_awlen;
  wire [2:0]                        s_axi_awsize;
  wire [1:0]                        s_axi_awburst;
  wire [0:0]                        s_axi_awlock;
  wire [3:0]                        s_axi_awcache;
  wire [3:0]                        s_axi_awuser;
  wire [2:0]                        s_axi_awprot;
  wire                              s_axi_awvalid;
  wire                              s_axi_awready;
   // Slave Interface Write Data Ports
  wire [C_S_AXI_DATA_WIDTH-1:0]     s_axi_wdata;
  wire [(C_S_AXI_DATA_WIDTH/8)-1:0]   s_axi_wstrb;
  wire                              s_axi_wlast;
  wire                              s_axi_wvalid;
  wire                              s_axi_wready;
   // Slave Interface Write Response Ports
  wire                              s_axi_bready;
  wire [C_S_AXI_ID_WIDTH-1:0]       s_axi_bid;
  wire [1:0]                        s_axi_bresp;
  wire                              s_axi_bvalid;
   // Slave Interface Read Address Ports
  wire [C_S_AXI_ID_WIDTH-1:0]       s_axi_arid;
  wire [C_S_AXI_ADDR_WIDTH-1:0]     s_axi_araddr;
  wire [7:0]                        s_axi_arlen;
  wire [2:0]                        s_axi_arsize;
  wire [1:0]                        s_axi_arburst;
  wire [0:0]                        s_axi_arlock;
  wire [3:0]                        s_axi_arcache;
  wire [3:0]                        s_axi_aruser;
  wire [2:0]                        s_axi_arprot;
  wire                              s_axi_arvalid;
  wire                              s_axi_arready;
   // Slave Interface Read Data Ports
  wire                              s_axi_rready;
  wire [C_S_AXI_ID_WIDTH-1:0]       s_axi_rid;
  wire [C_S_AXI_DATA_WIDTH-1:0]     s_axi_rdata;
  wire [1:0]                        s_axi_rresp;
  wire                              s_axi_rlast;
  wire                              s_axi_rvalid;

  wire                              cmp_data_valid;
  wire [C_S_AXI_DATA_WIDTH-1:0]     cmp_data;     // Compare data
  wire [C_S_AXI_DATA_WIDTH-1:0]     rdata_cmp;      // Read data

  wire                              dbg_wr_sts_vld;
  wire [DBG_WR_STS_WIDTH-1:0]       dbg_wr_sts;
  wire                              dbg_rd_sts_vld;
  wire [DBG_RD_STS_WIDTH-1:0]       dbg_rd_sts;
  wire [11:0]                       device_temp;


  // mm2s : read from ddr, memory to stream
  // s2mm : write to  ddr, stream to memory
  (* mark_debug = "true" *) wire                             s_axis_mm2s_cmd_tvalid;
  (* mark_debug = "true" *) wire                             s_axis_mm2s_cmd_tready;
  (* mark_debug = "true" *) wire  [79:0]                     s_axis_mm2s_cmd_tdata;

  (* mark_debug = "true" *) wire  [63:0]                     m_axis_mm2s_tdata;
  (* mark_debug = "true" *) wire  [7:0]                      m_axis_mm2s_tkeep;
  (* mark_debug = "true" *) wire                             m_axis_mm2s_tlast;
  (* mark_debug = "true" *) wire                             m_axis_mm2s_tvalid;
  (* mark_debug = "true" *) wire                             m_axis_mm2s_tready;

  (* mark_debug = "true" *) wire                             s_axis_s2mm_cmd_tvalid;
  (* mark_debug = "true" *) wire                             s_axis_s2mm_cmd_tready;
  (* mark_debug = "true" *) wire  [79:0]                     s_axis_s2mm_cmd_tdata;

  (* mark_debug = "true" *) wire  [63:0]                     s_axis_s2mm_tdata;
  (* mark_debug = "true" *) wire  [7:0]                      s_axis_s2mm_tkeep;
  (* mark_debug = "true" *) wire                             s_axis_s2mm_tlast;
  (* mark_debug = "true" *) wire                             s_axis_s2mm_tvalid;
  (* mark_debug = "true" *) wire                             s_axis_s2mm_tready;

  //sts
  (* mark_debug = "true" *) wire                             m_axis_mm2s_sts_tvalid;
  (* mark_debug = "true" *) wire  [7:0]                      m_axis_mm2s_sts_tdata;
  (* mark_debug = "true" *) wire                             m_axis_mm2s_sts_tlast;

  (* mark_debug = "true" *) wire                             m_axis_s2mm_sts_tvalid;
  (* mark_debug = "true" *) wire  [7:0]                      m_axis_s2mm_sts_tdata;
  (* mark_debug = "true" *) wire                             m_axis_s2mm_sts_tlast;
  
  assign ddr3_user_clk = clk;
  assign ddr3_user_rst = ddr_user_reset_i;
  
  always @(posedge clk) begin
    aresetn <= ~rst;
  end
  

//**************************************************************************
      
// Start of User Design top instance
//***************************************************************************
// The User design is instantiated below. The memory interface ports are
// connected to the top-level and the application interface ports are
// connected to the traffic generator module. This provides a reference
// for connecting the memory controller to system.
//***************************************************************************

 // generate if (USE_MIG == 1) begin: MIG_ENABLE

      // wire   init_calib_complete;

      assign ddr_user_reset_i = rst || ~init_calib_complete;

      mig_7series_0 mig_7series_0(
           
           
      // Memory interface ports
         .ddr3_addr                      (ddr3_addr),
         .ddr3_ba                        (ddr3_ba),
         .ddr3_cas_n                     (ddr3_cas_n),
         .ddr3_ck_n                      (ddr3_ck_n),
         .ddr3_ck_p                      (ddr3_ck_p),
         .ddr3_cke                       (ddr3_cke),
         .ddr3_ras_n                     (ddr3_ras_n),
         .ddr3_we_n                      (ddr3_we_n),
         .ddr3_dq                        (ddr3_dq),
         .ddr3_dqs_n                     (ddr3_dqs_n),
         .ddr3_dqs_p                     (ddr3_dqs_p),
         .ddr3_reset_n                   (ddr3_reset_n),
         .init_calib_complete            (init_calib_complete),
        
         .ddr3_cs_n                      (ddr3_cs_n),
         .ddr3_dm                        (ddr3_dm),
         .ddr3_odt                       (ddr3_odt),
      // Application interface ports
         .ui_clk                         (clk),
         .ui_clk_sync_rst                (rst),

         .mmcm_locked                    (mmcm_locked),
         .aresetn                        (aresetn),
         .app_sr_req                     (1'b0),
         .app_ref_req                    (1'b0),
         .app_zq_req                     (1'b0),
         .app_sr_active                  (),
         .app_ref_ack                    (),
         .app_zq_ack                     (),

      // Slave Interface Write Address Ports
         .s_axi_awid                     (s_axi_awid),
         .s_axi_awaddr                   (s_axi_awaddr),
         .s_axi_awlen                    (s_axi_awlen),
         .s_axi_awsize                   (s_axi_awsize),
         .s_axi_awburst                  (s_axi_awburst),
         .s_axi_awlock                   (s_axi_awlock),
         .s_axi_awcache                  (s_axi_awcache),
         .s_axi_awprot                   (s_axi_awprot),
         .s_axi_awqos                    (4'h0),
         .s_axi_awvalid                  (s_axi_awvalid),
         .s_axi_awready                  (s_axi_awready),
      // Slave Interface Write Data Ports
         .s_axi_wdata                    (s_axi_wdata),
         .s_axi_wstrb                    (s_axi_wstrb),
         .s_axi_wlast                    (s_axi_wlast),
         .s_axi_wvalid                   (s_axi_wvalid),
         .s_axi_wready                   (s_axi_wready),
      // Slave Interface Write Response Ports
         .s_axi_bid                      (s_axi_bid),
         .s_axi_bresp                    (s_axi_bresp),
         .s_axi_bvalid                   (s_axi_bvalid),
         .s_axi_bready                   (s_axi_bready),
      // Slave Interface Read Address Ports
         .s_axi_arid                     (s_axi_arid),
         .s_axi_araddr                   (s_axi_araddr),
         .s_axi_arlen                    (s_axi_arlen),
         .s_axi_arsize                   (s_axi_arsize),
         .s_axi_arburst                  (s_axi_arburst),
         .s_axi_arlock                   (s_axi_arlock),
         .s_axi_arcache                  (s_axi_arcache),
         .s_axi_arprot                   (s_axi_arprot),
         .s_axi_arqos                    (4'h0),
         .s_axi_arvalid                  (s_axi_arvalid),
         .s_axi_arready                  (s_axi_arready),
      // Slave Interface Read Data Ports
         .s_axi_rid                      (s_axi_rid),
         .s_axi_rdata                    (s_axi_rdata),
         .s_axi_rresp                    (s_axi_rresp),
         .s_axi_rlast                    (s_axi_rlast),
         .s_axi_rvalid                   (s_axi_rvalid),
         .s_axi_rready                   (s_axi_rready),

        
         
      // System Clock Ports
         .sys_clk_i                      (sys_clk_i),
         .device_temp                    (device_temp),
         .sys_rst                        (~sys_rst)
         );
      // End of User Design top instance

  // end
  // else begin: BRAM_ENABLE

  //     //////////////////////////////////////////////////////////////
  //     //----------- Sim DDR3 with Block RAM ----------------------//
  //     //////////////////////////////////////////////////////////////

  //     assign clk = sys_clk_i;
  //     assign rst = sys_rst;
  //     assign ddr_user_reset_i = rst;


  //     //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
  //     axi4_blk_mem u_sim_ddr3 (
  //       .s_aclk(clk),                   // input wire s_aclk
  //       .s_aresetn(aresetn),            // input wire s_aresetn

  //       .s_axi_awid(s_axi_awid),        // input wire [0 : 0] s_axi_awid
  //       .s_axi_awaddr(s_axi_awaddr[31:0]),// input wire [31 : 0] s_axi_awaddr
  //       .s_axi_awlen(s_axi_awlen),      // input wire [7 : 0] s_axi_awlen
  //       .s_axi_awsize(s_axi_awsize),    // input wire [2 : 0] s_axi_awsize
  //       .s_axi_awburst(s_axi_awburst),  // input wire [1 : 0] s_axi_awburst
  //       .s_axi_awvalid(s_axi_awvalid),  // input wire s_axi_awvalid
  //       .s_axi_awready(s_axi_awready),  // output wire s_axi_awready

  //       .s_axi_wdata(s_axi_wdata),      // input wire [63 : 0] s_axi_wdata
  //       .s_axi_wstrb(s_axi_wstrb),      // input wire [7 : 0] s_axi_wstrb
  //       .s_axi_wlast(s_axi_wlast),      // input wire s_axi_wlast
  //       .s_axi_wvalid(s_axi_wvalid),    // input wire s_axi_wvalid
  //       .s_axi_wready(s_axi_wready),    // output wire s_axi_wready

  //       .s_axi_bid(s_axi_bid),          // output wire [0 : 0] s_axi_bid
  //       .s_axi_bresp(s_axi_bresp),      // output wire [1 : 0] s_axi_bresp
  //       .s_axi_bvalid(s_axi_bvalid),    // output wire s_axi_bvalid
  //       .s_axi_bready(s_axi_bready),    // input wire s_axi_bready

  //       .s_axi_arid(s_axi_arid),        // input wire [0 : 0] s_axi_arid
  //       .s_axi_araddr(s_axi_araddr[31:0]),// input wire [31 : 0] s_axi_araddr
  //       .s_axi_arlen(s_axi_arlen),      // input wire [7 : 0] s_axi_arlen
  //       .s_axi_arsize(s_axi_arsize),    // input wire [2 : 0] s_axi_arsize
  //       .s_axi_arburst(s_axi_arburst),  // input wire [1 : 0] s_axi_arburst
  //       .s_axi_arvalid(s_axi_arvalid),  // input wire s_axi_arvalid
  //       .s_axi_arready(s_axi_arready),  // output wire s_axi_arready

  //       .s_axi_rid(s_axi_rid),          // output wire [0 : 0] s_axi_rid
  //       .s_axi_rdata(s_axi_rdata),      // output wire [63 : 0] s_axi_rdata
  //       .s_axi_rresp(s_axi_rresp),      // output wire [1 : 0] s_axi_rresp
  //       .s_axi_rlast(s_axi_rlast),      // output wire s_axi_rlast
  //       .s_axi_rvalid(s_axi_rvalid),    // output wire s_axi_rvalid
  //       .s_axi_rready(s_axi_rready)    // input wire s_axi_rready
  //     );
  //     // INST_TAG_END ------ End INSTANTIATION Template ---------

  // end
  // endgenerate


//***************************************************************************
// The traffic generation module instantiated below drives traffic (patterns)
// on the application interface of the memory controller
//***************************************************************************

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
ddr_axi_datamover u_ddr_axi_datamover (
  .m_axi_mm2s_aclk(clk),                                    // input wire m_axi_mm2s_aclk
  .m_axi_mm2s_aresetn(aresetn),                             // input wire m_axi_mm2s_aresetn
  .mm2s_halt(1'b0),                                         // input wire mm2s_halt
  .mm2s_halt_cmplt(),                                       // output wire mm2s_halt_cmplt
  .mm2s_err(),                                              // output wire mm2s_err

  .m_axis_mm2s_cmdsts_aclk(clk),                            // input wire m_axis_mm2s_cmdsts_aclk
  .m_axis_mm2s_cmdsts_aresetn(aresetn),                     // input wire m_axis_mm2s_cmdsts_aresetn
  .s_axis_mm2s_cmd_tvalid(s_axis_mm2s_cmd_tvalid),          // input wire s_axis_mm2s_cmd_tvalid
  .s_axis_mm2s_cmd_tready(s_axis_mm2s_cmd_tready),          // output wire s_axis_mm2s_cmd_tready
  .s_axis_mm2s_cmd_tdata(s_axis_mm2s_cmd_tdata),            // input wire [79 : 0] s_axis_mm2s_cmd_tdata
  .m_axis_mm2s_sts_tvalid(m_axis_mm2s_sts_tvalid),          // output wire m_axis_mm2s_sts_tvalid
  .m_axis_mm2s_sts_tready(1'b1),                            // input wire m_axis_mm2s_sts_tready
  .m_axis_mm2s_sts_tdata(m_axis_mm2s_sts_tdata),            // output wire [7 : 0] m_axis_mm2s_sts_tdata
  .m_axis_mm2s_sts_tkeep(),                                 // output wire [0 : 0] m_axis_mm2s_sts_tkeep
  .m_axis_mm2s_sts_tlast(m_axis_mm2s_sts_tlast),            // output wire m_axis_mm2s_sts_tlast
  .mm2s_allow_addr_req(1'b1),                               // input wire mm2s_allow_addr_req
  .mm2s_addr_req_posted(mm2s_addr_req_posted),              // output wire mm2s_addr_req_posted
  .mm2s_rd_xfer_cmplt(mm2s_rd_xfer_cmplt),                  // output wire mm2s_rd_xfer_cmplt

  .m_axi_mm2s_arid(s_axi_arid),                             // output wire [0 : 0] m_axi_mm2s_arid
  .m_axi_mm2s_araddr(s_axi_araddr),                         // output wire [32 : 0] m_axi_mm2s_araddr
  .m_axi_mm2s_arlen(s_axi_arlen),                           // output wire [7 : 0] m_axi_mm2s_arlen
  .m_axi_mm2s_arsize(s_axi_arsize),                         // output wire [2 : 0] m_axi_mm2s_arsize
  .m_axi_mm2s_arburst(s_axi_arburst),                       // output wire [1 : 0] m_axi_mm2s_arburst
  .m_axi_mm2s_arprot(s_axi_arprot),                         // output wire [2 : 0] m_axi_mm2s_arprot
  .m_axi_mm2s_arcache(s_axi_arcache),                       // output wire [3 : 0] m_axi_mm2s_arcache
  .m_axi_mm2s_aruser(s_axi_aruser),                         // output wire [3 : 0] m_axi_mm2s_aruser
  .m_axi_mm2s_arvalid(s_axi_arvalid),                       // output wire m_axi_mm2s_arvalid
  .m_axi_mm2s_arready(s_axi_arready),                       // input wire m_axi_mm2s_arready
  .m_axi_mm2s_rdata(s_axi_rdata),                           // input wire [63 : 0] m_axi_mm2s_rdata
  .m_axi_mm2s_rresp(s_axi_rresp),                           // input wire [1 : 0] m_axi_mm2s_rresp
  .m_axi_mm2s_rlast(s_axi_rlast),                           // input wire m_axi_mm2s_rlast
  .m_axi_mm2s_rvalid(s_axi_rvalid),                         // input wire m_axi_mm2s_rvalid
  .m_axi_mm2s_rready(s_axi_rready),                         // output wire m_axi_mm2s_rready

  .m_axis_mm2s_tdata(m_axis_mm2s_tdata),                    // output wire [63 : 0] m_axis_mm2s_tdata
  .m_axis_mm2s_tkeep(m_axis_mm2s_tkeep),                    // output wire [7 : 0] m_axis_mm2s_tkeep
  .m_axis_mm2s_tlast(m_axis_mm2s_tlast),                    // output wire m_axis_mm2s_tlast
  .m_axis_mm2s_tvalid(m_axis_mm2s_tvalid),                  // output wire m_axis_mm2s_tvalid
  .m_axis_mm2s_tready(m_axis_mm2s_tready),                  // input wire m_axis_mm2s_tready
  .mm2s_dbg_sel(),                                          // input wire [3 : 0] mm2s_dbg_sel
  .mm2s_dbg_data(),                                         // output wire [31 : 0] mm2s_dbg_data


  .m_axi_s2mm_aclk(clk),                                    // input wire m_axi_s2mm_aclk
  .m_axi_s2mm_aresetn(aresetn),                             // input wire m_axi_s2mm_aresetn
  .s2mm_halt(1'b0),                                         // input wire s2mm_halt
  .s2mm_halt_cmplt(),                                       // output wire s2mm_halt_cmplt
  .s2mm_err(),                                              // output wire s2mm_err

  .m_axis_s2mm_cmdsts_awclk(clk),                           // input wire m_axis_s2mm_cmdsts_awclk
  .m_axis_s2mm_cmdsts_aresetn(aresetn),                     // input wire m_axis_s2mm_cmdsts_aresetn
  .s_axis_s2mm_cmd_tvalid(s_axis_s2mm_cmd_tvalid),          // input wire s_axis_s2mm_cmd_tvalid
  .s_axis_s2mm_cmd_tready(s_axis_s2mm_cmd_tready),          // output wire s_axis_s2mm_cmd_tready
  .s_axis_s2mm_cmd_tdata(s_axis_s2mm_cmd_tdata),            // input wire [79 : 0] s_axis_s2mm_cmd_tdata
  .m_axis_s2mm_sts_tvalid(m_axis_s2mm_sts_tvalid),          // output wire m_axis_s2mm_sts_tvalid
  .m_axis_s2mm_sts_tready(1'b1),                            // input wire m_axis_s2mm_sts_tready
  .m_axis_s2mm_sts_tdata(m_axis_s2mm_sts_tdata),            // output wire [7 : 0] m_axis_s2mm_sts_tdata
  .m_axis_s2mm_sts_tkeep(),                                 // output wire [0 : 0] m_axis_s2mm_sts_tkeep
  .m_axis_s2mm_sts_tlast(m_axis_s2mm_sts_tlast),            // output wire m_axis_s2mm_sts_tlast
  .s2mm_allow_addr_req(1'b1),                               // input wire s2mm_allow_addr_req
  .s2mm_addr_req_posted(),                                  // output wire s2mm_addr_req_posted
  .s2mm_wr_xfer_cmplt(s2mm_wr_xfer_cmplt),                  // output wire s2mm_wr_xfer_cmplt
  .s2mm_ld_nxt_len(),                                       // output wire s2mm_ld_nxt_len
  .s2mm_wr_len(),                                           // output wire [7 : 0] s2mm_wr_len

  .m_axi_s2mm_awid(s_axi_awid),                             // output wire [0 : 0] m_axi_s2mm_awid
  .m_axi_s2mm_awaddr(s_axi_awaddr),                         // output wire [32 : 0] m_axi_s2mm_awaddr
  .m_axi_s2mm_awlen(s_axi_awlen),                           // output wire [7 : 0] m_axi_s2mm_awlen
  .m_axi_s2mm_awsize(s_axi_awsize),                         // output wire [2 : 0] m_axi_s2mm_awsize
  .m_axi_s2mm_awburst(s_axi_awburst),                       // output wire [1 : 0] m_axi_s2mm_awburst
  .m_axi_s2mm_awprot(s_axi_awprot),                         // output wire [2 : 0] m_axi_s2mm_awprot
  .m_axi_s2mm_awcache(s_axi_awcache),                       // output wire [3 : 0] m_axi_s2mm_awcache
  .m_axi_s2mm_awuser(s_axi_awuser),                         // output wire [3 : 0] m_axi_s2mm_awuser
  .m_axi_s2mm_awvalid(s_axi_awvalid),                       // output wire m_axi_s2mm_awvalid
  .m_axi_s2mm_awready(s_axi_awready),                       // input wire m_axi_s2mm_awready
  .m_axi_s2mm_wdata(s_axi_wdata),                           // output wire [63 : 0] m_axi_s2mm_wdata
  .m_axi_s2mm_wstrb(s_axi_wstrb),                           // output wire [7 : 0] m_axi_s2mm_wstrb
  .m_axi_s2mm_wlast(s_axi_wlast),                           // output wire m_axi_s2mm_wlast
  .m_axi_s2mm_wvalid(s_axi_wvalid),                         // output wire m_axi_s2mm_wvalid
  .m_axi_s2mm_wready(s_axi_wready),                         // input wire m_axi_s2mm_wready
  .m_axi_s2mm_bresp(s_axi_bresp),                           // input wire [1 : 0] m_axi_s2mm_bresp
  .m_axi_s2mm_bvalid(s_axi_bvalid),                         // input wire m_axi_s2mm_bvalid
  .m_axi_s2mm_bready(s_axi_bready),                         // output wire m_axi_s2mm_bready

  .s_axis_s2mm_tdata(s_axis_s2mm_tdata),                    // input wire [63 : 0] s_axis_s2mm_tdata
  .s_axis_s2mm_tkeep(s_axis_s2mm_tkeep),                    // input wire [7 : 0] s_axis_s2mm_tkeep
  .s_axis_s2mm_tlast(s_axis_s2mm_tlast),                    // input wire s_axis_s2mm_tlast
  .s_axis_s2mm_tvalid(s_axis_s2mm_tvalid),                  // input wire s_axis_s2mm_tvalid
  .s_axis_s2mm_tready(s_axis_s2mm_tready),                  // output wire s_axis_s2mm_tready
  .s2mm_dbg_sel(),                                          // input wire [3 : 0] s2mm_dbg_sel
  .s2mm_dbg_data()                                          // output wire [31 : 0] s2mm_dbg_data
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

(* mark_debug = "true" *) reg   ddr3_full_flag;
(* mark_debug = "true" *) reg   clear_fifo;

(* mark_debug = "true" *) reg [32:0] wraddr, rdaddr;
(* mark_debug = "true" *) wire       ddr3_full, ddr3_empty;

always @(posedge clk) begin
  if(ddr_user_reset_i) begin
    wraddr <= 33'h0;
  end
  else if(s_axis_s2mm_cmd_tvalid && s_axis_s2mm_cmd_tready) begin
    wraddr <= wraddr + WINDOWS_CNT*8;
  end
end

always @(posedge clk) begin
  if(ddr_user_reset_i) begin
    rdaddr <= 33'h0;
  end
  else if(s_axis_mm2s_cmd_tvalid && s_axis_mm2s_cmd_tready) begin
    rdaddr <= rdaddr + WINDOWS_CNT*8;
  end
end

assign ddr3_empty = ((wraddr - rdaddr) <= 1*(WINDOWS_CNT*8));
assign ddr3_full  = ((wraddr - rdaddr) >= (MEMORY - 5*(WINDOWS_CNT*8)));


// Write

(* mark_debug = "true" *) wire            wrfifo_rden;
(* mark_debug = "true" *) wire  [63:0]    wrfifo_dout;
(* mark_debug = "true" *) wire            wrfifo_pgempty;
(* mark_debug = "true" *) wire            wrfifo_alempty;

(* mark_debug = "true" *) reg   [127:0]   wr_data_cnt;



//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
ddr_wrfifo u_ddr_wrfifo (
  .rst(ddr_user_reset_i),       // input wire rst
  .wr_clk(fifo_clk),            // input wire wr_clk
  .rd_clk(clk),                 // input wire rd_clk
  .din(fifo_wr_data),           // input wire [63 : 0] din
  .wr_en(fifo_wr_en),           // input wire wr_en
  .rd_en(wrfifo_rden),          // input wire rd_en
  .dout(wrfifo_dout),           // output wire [63 : 0] dout
  .full(),                      // output wire full
  .almost_full(fifo_full),      // output wire almost_full
  .empty(),                     // output wire empty
  .almost_empty(wrfifo_alempty),  // output wire almost_empty
  .valid(),                     // output wire valid
  .prog_empty(wrfifo_pgempty)    // output wire prog_empty
);
// INST_TAG_END ------ End INSTANTIATION Template ---------


reg   s_axis_s2mm_cmd_tvalid_i;
reg   s_axis_s2mm_tvalid_i;
reg   s_axis_mm2s_cmd_tvalid_i;


// S2MM (write) state machine

(* mark_debug = "true" *) reg [1:0]   S2MM_CS, S2MM_NS;

localparam  S2MM_IDLE =   2'd0;
localparam  S2MM_CMD  =   2'd1;
localparam  S2MM_DATA =   2'd2;
localparam  DDR_FULL  =   2'd3;

always @(posedge clk) begin
  if(ddr_user_reset_i) S2MM_CS <= S2MM_IDLE;
  else S2MM_CS <= S2MM_NS;
end

always @(*) begin
  S2MM_NS = S2MM_IDLE;

  case(S2MM_CS)
    S2MM_IDLE: begin
      if(ddr3_full)
        S2MM_NS = DDR_FULL;
      else if(~wrfifo_pgempty  && s_axis_s2mm_cmd_tready) 
        S2MM_NS = S2MM_CMD;
      else S2MM_NS = S2MM_IDLE;
    end

    S2MM_CMD: begin
      if(s_axis_s2mm_cmd_tready) begin
        S2MM_NS = S2MM_DATA;
      end
      else begin
        S2MM_NS = S2MM_IDLE;
      end
    end

    S2MM_DATA: begin
      if(wr_data_cnt == WINDOWS_CNT - 1'b1) begin
        if(ddr3_full) S2MM_NS = DDR_FULL;
        else S2MM_NS = S2MM_IDLE;
      end
      else S2MM_NS = S2MM_DATA;
    end

    DDR_FULL: begin
      if(ddr3_empty) begin
        S2MM_NS = S2MM_IDLE;
      end
      else begin
        S2MM_NS = DDR_FULL;
      end 
    end

    default: S2MM_NS = S2MM_IDLE;
  endcase
end


always @(posedge clk) begin
  if(ddr_user_reset_i) begin
    s_axis_s2mm_cmd_tvalid_i <= 1'b0;
    s_axis_s2mm_tvalid_i <= 1'b0;
    ddr3_full_flag <= 1'b0;
    clear_fifo <= 1'b0;
  end
  else begin
    case(S2MM_NS)
      S2MM_IDLE: begin
        s_axis_s2mm_cmd_tvalid_i <= 1'b0;
        s_axis_s2mm_tvalid_i <= 1'b0;
        ddr3_full_flag <= 1'b0;
        clear_fifo <= 1'b0;
      end

      S2MM_CMD: begin
        s_axis_s2mm_cmd_tvalid_i <= 1'b1;
        s_axis_s2mm_tvalid_i <= 1'b0;
        ddr3_full_flag <= 1'b0;
        clear_fifo <= 1'b0;
      end

      S2MM_DATA: begin
        s_axis_s2mm_cmd_tvalid_i <= 1'b0;
        s_axis_s2mm_tvalid_i <= s_axis_s2mm_tready;
        ddr3_full_flag <= 1'b0;
        clear_fifo <= 1'b0;
      end

      DDR_FULL: begin
        s_axis_s2mm_cmd_tvalid_i <= 1'b0;
        s_axis_s2mm_tvalid_i <= 1'b0;
        ddr3_full_flag <= 1'b1;
        clear_fifo <= ddr3_empty;
      end

      default: begin
        s_axis_s2mm_cmd_tvalid_i <= 1'b0;
        s_axis_s2mm_tvalid_i <= 1'b0;
        ddr3_full_flag <= 1'b0;
        clear_fifo <= 1'b0;
      end
    endcase
  end
end


always @(posedge clk) begin
  if(ddr_user_reset_i) begin
    wr_data_cnt <= 128'h0;
  end
  else if(s_axis_s2mm_tvalid && s_axis_s2mm_tready) begin
    if(wr_data_cnt == WINDOWS_CNT - 1'b1) begin
      wr_data_cnt <= 128'h0;
    end
    else wr_data_cnt <= wr_data_cnt + 1;
  end
  else wr_data_cnt <= wr_data_cnt;
end

assign s_axis_s2mm_cmd_tdata[22:0] = WINDOWS_CNT*8;
assign s_axis_s2mm_cmd_tdata[29:23] = 7'h01;
assign s_axis_s2mm_cmd_tdata[31:30] = 2'b01;
assign s_axis_s2mm_cmd_tdata[71:32] = {7'h0,wraddr[32:0]};
assign s_axis_s2mm_cmd_tdata[79:72] = 8'b0;
assign s_axis_s2mm_cmd_tvalid = s_axis_s2mm_cmd_tvalid_i;
assign s_axis_s2mm_tdata = wrfifo_dout;
assign s_axis_s2mm_tkeep = 16'hffff;
assign s_axis_s2mm_tvalid = s_axis_s2mm_tvalid_i;
assign s_axis_s2mm_tlast = (wr_data_cnt == (WINDOWS_CNT - 1'b1));
assign wrfifo_rden = s_axis_s2mm_tvalid && s_axis_s2mm_tready;



(* mark_debug = "true" *) wire            rdfifo_empty;
(* mark_debug = "true" *) wire            rdfifo_alfull;
(* mark_debug = "true" *) wire            rdfifo_wren;

wire       rd_valid;

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
// ddr_rdfifo u_ddr_rdfifo (
//   .rst(ddr_user_reset_i),             // input wire rst
//   .wr_clk(clk),                       // input wire wr_clk
//   .rd_clk(fifo_clk),                  // input wire rd_clk
//   .din(m_axis_mm2s_tdata),            // input wire [63 : 0] din
//   .wr_en(rdfifo_wren),                // input wire wr_en
//   .rd_en(fifo_rd_en),                 // input wire rd_en
//   .dout(fifo_rd_data),                // output wire [63 : 0] dout
//   .full(),                            // output wire full
//   .almost_full(rdfifo_alfull),        // output wire almost_full
//   .empty(rdfifo_empty),               // output wire empty
//   .valid(rd_valid)               // output wire valid
// );



ddr_rdfifo u_ddr_rdfifo (
  .rst(ddr_user_reset_i),             // input wire rst
  .wr_clk(clk),                       // input wire wr_clk
  .rd_clk(fifo_clk),                  // input wire rd_clk
  .din(m_axis_mm2s_tdata),            // input wire [63 : 0] din
  .wr_en(rdfifo_wren),                // input wire wr_en
  .rd_en(fifo_rd_en),                 // input wire rd_en
  .dout(fifo_rd_data),                // output wire [63 : 0] dout
  .full(),                            // output wire full
  .almost_full(),        // output wire almost_full
  .empty(rdfifo_empty),               // output wire empty
  .valid(rd_valid),               // output wire valid
  .prog_full(rdfifo_alfull)      // output wire prog_full
);

reg [19:0] rd_cnt;
wire       rd_start;
wire       rd_end;

always @(posedge fifo_clk or posedge ddr_user_reset_i) begin
  if (ddr_user_reset_i) begin
    rd_cnt[19:0] <= 0; 
  end
  else if (rd_start) begin
      if(rd_end)begin
        rd_cnt[19:0] <= 0;
      end
      else begin
        rd_cnt[19:0] <= rd_cnt[19:0] + 1;
      end
  end
end
assign rd_start = rd_valid;
assign rd_end   = rd_start&&(rd_cnt[19:0]==20'd147487);//12288

//0809

reg [19:0] rd1_cnt;
wire       rd1_start;
wire       rd1_end;

  

always @(posedge clk or posedge ddr_user_reset_i) begin
  if (ddr_user_reset_i) begin
    rd1_cnt[19:0] <= 0; 
  end
  else if (rd1_start) begin
      if(rd1_end)begin
        rd1_cnt[19:0] <= 0;
      end
      else begin
        rd1_cnt[19:0] <= rd1_cnt[19:0] + 1;
      end
  end
end
assign rd1_start = rdfifo_wren;
assign rd1_end   = rd1_start&&(rd1_cnt[19:0]==20'd147487);//12288
//0809

reg     rd_mask;

always @(posedge fifo_clk or posedge ddr_user_reset_i) begin
  if (ddr_user_reset_i) begin
    rd_mask <= 1'b0; 
  end
  else if (rd_start&&(rd_cnt[19:0]==20'd147457)) begin
    rd_mask <= 1'b1;
  end
  else if (rd_start&&(rd_cnt[19:0]==20'd147487)) begin
    rd_mask <= 1'b0;
  end  
  else begin
    rd_mask <= rd_mask;
  end
end

assign fifo_rd_valid = rd_valid&&(~rd_mask);
// INST_TAG_END ------ End INSTANTIATION Template ---------

assign fifo_empty = rdfifo_empty;
assign rdfifo_wren = m_axis_mm2s_tvalid && ~rdfifo_alfull;

// MM2S (read) state machine
(* mark_debug = "true" *) reg [1:0]   MM2S_CS, MM2S_NS;

localparam  MM2S_IDLE =   2'd0;
localparam  MM2S_CMD  =   2'd1;
localparam  MM2S_DATA =   2'd2;


always @(posedge clk) begin
  if(ddr_user_reset_i) MM2S_CS <= MM2S_IDLE;
  else MM2S_CS <= MM2S_NS;
end

always @(*) begin
  MM2S_NS = MM2S_IDLE;

  case(MM2S_CS)
    MM2S_IDLE: begin
      // if((~ddr3_empty && s_axis_mm2s_cmd_tready && ~rdfifo_alfull)||((rd_cnt==20'd147439)&&rd_start)) begin
      // if(((~ddr3_empty && s_axis_mm2s_cmd_tready)||((rd_cnt==20'd147439)&&rd_start))&& ~rdfifo_alfull) begin
      if((~ddr3_empty && s_axis_mm2s_cmd_tready && ~rdfifo_alfull)||((rd1_cnt==20'd147456)&& ~rdfifo_alfull)) begin
        MM2S_NS = MM2S_CMD;
      end
      else MM2S_NS = MM2S_IDLE;
    end

    MM2S_CMD: begin
      if(s_axis_mm2s_cmd_tready) begin
        MM2S_NS = MM2S_DATA;
      end
      else begin
        MM2S_NS = MM2S_IDLE;
      end
    end

    MM2S_DATA: begin
      if(m_axis_mm2s_tlast) begin
        MM2S_NS = MM2S_IDLE;
      end
      else MM2S_NS = MM2S_DATA;
    end

    default: MM2S_NS = MM2S_IDLE;
  endcase
end

always @(posedge clk) begin
  if(ddr_user_reset_i) begin
    s_axis_mm2s_cmd_tvalid_i <= 1'b0;
  end
  else begin
    case(MM2S_NS)
      MM2S_IDLE: begin
        s_axis_mm2s_cmd_tvalid_i <= 1'b0;
      end

      MM2S_CMD: begin
        s_axis_mm2s_cmd_tvalid_i <= 1'b1;

      end

      MM2S_DATA: begin
        s_axis_mm2s_cmd_tvalid_i <= 1'b0;
      end

      default: begin
        s_axis_mm2s_cmd_tvalid_i <= 1'b0;
      end
    endcase
  end
end

assign s_axis_mm2s_cmd_tdata[22:0] = WINDOWS_CNT*8;
assign s_axis_mm2s_cmd_tdata[29:23] = 7'h01;
assign s_axis_mm2s_cmd_tdata[31:30] = 2'b01;
assign s_axis_mm2s_cmd_tdata[71:32] = {7'h0,rdaddr[32:0]};
assign s_axis_mm2s_cmd_tdata[79:72] = 8'b0;
assign s_axis_mm2s_cmd_tvalid = s_axis_mm2s_cmd_tvalid_i;
assign m_axis_mm2s_tready = ~rdfifo_alfull;




// ila_DDR ila_DDR (
//   .clk(clk), // input wire clk


//   .probe0(ddr3_full), // input wire [0:0]  probe0  
//   .probe1(ddr3_empty), // input wire [0:0]  probe1 
//   .probe2(wraddr[32:0]), // input wire [0:0]  probe2 
//   .probe3(rdaddr[32:0])
// );
endmodule
