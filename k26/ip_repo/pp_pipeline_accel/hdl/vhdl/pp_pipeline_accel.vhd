-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel is
generic (
    C_S_AXI_CONTROL_ADDR_WIDTH : INTEGER := 7;
    C_S_AXI_CONTROL_DATA_WIDTH : INTEGER := 32;
    C_M_AXI_GMEM1_ADDR_WIDTH : INTEGER := 64;
    C_M_AXI_GMEM1_ID_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM1_AWUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM1_DATA_WIDTH : INTEGER := 64;
    C_M_AXI_GMEM1_WUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM1_ARUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM1_RUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM1_BUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM2_ADDR_WIDTH : INTEGER := 64;
    C_M_AXI_GMEM2_ID_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM2_AWUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM2_DATA_WIDTH : INTEGER := 64;
    C_M_AXI_GMEM2_WUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM2_ARUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM2_RUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM2_BUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM3_ADDR_WIDTH : INTEGER := 64;
    C_M_AXI_GMEM3_ID_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM3_AWUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM3_DATA_WIDTH : INTEGER := 64;
    C_M_AXI_GMEM3_WUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM3_ARUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM3_RUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM3_BUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM4_ADDR_WIDTH : INTEGER := 64;
    C_M_AXI_GMEM4_ID_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM4_AWUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM4_DATA_WIDTH : INTEGER := 64;
    C_M_AXI_GMEM4_WUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM4_ARUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM4_RUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM4_BUSER_WIDTH : INTEGER := 1;
    C_M_AXI_GMEM1_USER_VALUE : INTEGER := 0;
    C_M_AXI_GMEM1_PROT_VALUE : INTEGER := 0;
    C_M_AXI_GMEM1_CACHE_VALUE : INTEGER := 3;
    C_M_AXI_GMEM2_USER_VALUE : INTEGER := 0;
    C_M_AXI_GMEM2_PROT_VALUE : INTEGER := 0;
    C_M_AXI_GMEM2_CACHE_VALUE : INTEGER := 3;
    C_M_AXI_GMEM3_USER_VALUE : INTEGER := 0;
    C_M_AXI_GMEM3_PROT_VALUE : INTEGER := 0;
    C_M_AXI_GMEM3_CACHE_VALUE : INTEGER := 3;
    C_M_AXI_GMEM4_USER_VALUE : INTEGER := 0;
    C_M_AXI_GMEM4_PROT_VALUE : INTEGER := 0;
    C_M_AXI_GMEM4_CACHE_VALUE : INTEGER := 3 );
port (
    s_axi_control_AWVALID : IN STD_LOGIC;
    s_axi_control_AWREADY : OUT STD_LOGIC;
    s_axi_control_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_WVALID : IN STD_LOGIC;
    s_axi_control_WREADY : OUT STD_LOGIC;
    s_axi_control_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH/8-1 downto 0);
    s_axi_control_ARVALID : IN STD_LOGIC;
    s_axi_control_ARREADY : OUT STD_LOGIC;
    s_axi_control_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_RVALID : OUT STD_LOGIC;
    s_axi_control_RREADY : IN STD_LOGIC;
    s_axi_control_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_control_BVALID : OUT STD_LOGIC;
    s_axi_control_BREADY : IN STD_LOGIC;
    s_axi_control_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    interrupt : OUT STD_LOGIC;
    m_axi_gmem1_AWVALID : OUT STD_LOGIC;
    m_axi_gmem1_AWREADY : IN STD_LOGIC;
    m_axi_gmem1_AWADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM1_ADDR_WIDTH-1 downto 0);
    m_axi_gmem1_AWID : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM1_ID_WIDTH-1 downto 0);
    m_axi_gmem1_AWLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_gmem1_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem1_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem1_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem1_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem1_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem1_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem1_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem1_AWUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM1_AWUSER_WIDTH-1 downto 0);
    m_axi_gmem1_WVALID : OUT STD_LOGIC;
    m_axi_gmem1_WREADY : IN STD_LOGIC;
    m_axi_gmem1_WDATA : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM1_DATA_WIDTH-1 downto 0);
    m_axi_gmem1_WSTRB : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM1_DATA_WIDTH/8-1 downto 0);
    m_axi_gmem1_WLAST : OUT STD_LOGIC;
    m_axi_gmem1_WID : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM1_ID_WIDTH-1 downto 0);
    m_axi_gmem1_WUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM1_WUSER_WIDTH-1 downto 0);
    m_axi_gmem1_ARVALID : OUT STD_LOGIC;
    m_axi_gmem1_ARREADY : IN STD_LOGIC;
    m_axi_gmem1_ARADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM1_ADDR_WIDTH-1 downto 0);
    m_axi_gmem1_ARID : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM1_ID_WIDTH-1 downto 0);
    m_axi_gmem1_ARLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_gmem1_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem1_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem1_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem1_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem1_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem1_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem1_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem1_ARUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM1_ARUSER_WIDTH-1 downto 0);
    m_axi_gmem1_RVALID : IN STD_LOGIC;
    m_axi_gmem1_RREADY : OUT STD_LOGIC;
    m_axi_gmem1_RDATA : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM1_DATA_WIDTH-1 downto 0);
    m_axi_gmem1_RLAST : IN STD_LOGIC;
    m_axi_gmem1_RID : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM1_ID_WIDTH-1 downto 0);
    m_axi_gmem1_RUSER : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM1_RUSER_WIDTH-1 downto 0);
    m_axi_gmem1_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem1_BVALID : IN STD_LOGIC;
    m_axi_gmem1_BREADY : OUT STD_LOGIC;
    m_axi_gmem1_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem1_BID : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM1_ID_WIDTH-1 downto 0);
    m_axi_gmem1_BUSER : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM1_BUSER_WIDTH-1 downto 0);
    m_axi_gmem2_AWVALID : OUT STD_LOGIC;
    m_axi_gmem2_AWREADY : IN STD_LOGIC;
    m_axi_gmem2_AWADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM2_ADDR_WIDTH-1 downto 0);
    m_axi_gmem2_AWID : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM2_ID_WIDTH-1 downto 0);
    m_axi_gmem2_AWLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_gmem2_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem2_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem2_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem2_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem2_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem2_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem2_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem2_AWUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM2_AWUSER_WIDTH-1 downto 0);
    m_axi_gmem2_WVALID : OUT STD_LOGIC;
    m_axi_gmem2_WREADY : IN STD_LOGIC;
    m_axi_gmem2_WDATA : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM2_DATA_WIDTH-1 downto 0);
    m_axi_gmem2_WSTRB : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM2_DATA_WIDTH/8-1 downto 0);
    m_axi_gmem2_WLAST : OUT STD_LOGIC;
    m_axi_gmem2_WID : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM2_ID_WIDTH-1 downto 0);
    m_axi_gmem2_WUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM2_WUSER_WIDTH-1 downto 0);
    m_axi_gmem2_ARVALID : OUT STD_LOGIC;
    m_axi_gmem2_ARREADY : IN STD_LOGIC;
    m_axi_gmem2_ARADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM2_ADDR_WIDTH-1 downto 0);
    m_axi_gmem2_ARID : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM2_ID_WIDTH-1 downto 0);
    m_axi_gmem2_ARLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_gmem2_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem2_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem2_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem2_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem2_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem2_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem2_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem2_ARUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM2_ARUSER_WIDTH-1 downto 0);
    m_axi_gmem2_RVALID : IN STD_LOGIC;
    m_axi_gmem2_RREADY : OUT STD_LOGIC;
    m_axi_gmem2_RDATA : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM2_DATA_WIDTH-1 downto 0);
    m_axi_gmem2_RLAST : IN STD_LOGIC;
    m_axi_gmem2_RID : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM2_ID_WIDTH-1 downto 0);
    m_axi_gmem2_RUSER : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM2_RUSER_WIDTH-1 downto 0);
    m_axi_gmem2_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem2_BVALID : IN STD_LOGIC;
    m_axi_gmem2_BREADY : OUT STD_LOGIC;
    m_axi_gmem2_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem2_BID : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM2_ID_WIDTH-1 downto 0);
    m_axi_gmem2_BUSER : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM2_BUSER_WIDTH-1 downto 0);
    m_axi_gmem3_AWVALID : OUT STD_LOGIC;
    m_axi_gmem3_AWREADY : IN STD_LOGIC;
    m_axi_gmem3_AWADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM3_ADDR_WIDTH-1 downto 0);
    m_axi_gmem3_AWID : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM3_ID_WIDTH-1 downto 0);
    m_axi_gmem3_AWLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_gmem3_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem3_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem3_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem3_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem3_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_AWUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM3_AWUSER_WIDTH-1 downto 0);
    m_axi_gmem3_WVALID : OUT STD_LOGIC;
    m_axi_gmem3_WREADY : IN STD_LOGIC;
    m_axi_gmem3_WDATA : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM3_DATA_WIDTH-1 downto 0);
    m_axi_gmem3_WSTRB : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM3_DATA_WIDTH/8-1 downto 0);
    m_axi_gmem3_WLAST : OUT STD_LOGIC;
    m_axi_gmem3_WID : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM3_ID_WIDTH-1 downto 0);
    m_axi_gmem3_WUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM3_WUSER_WIDTH-1 downto 0);
    m_axi_gmem3_ARVALID : OUT STD_LOGIC;
    m_axi_gmem3_ARREADY : IN STD_LOGIC;
    m_axi_gmem3_ARADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM3_ADDR_WIDTH-1 downto 0);
    m_axi_gmem3_ARID : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM3_ID_WIDTH-1 downto 0);
    m_axi_gmem3_ARLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_gmem3_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem3_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem3_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem3_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem3_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_ARUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM3_ARUSER_WIDTH-1 downto 0);
    m_axi_gmem3_RVALID : IN STD_LOGIC;
    m_axi_gmem3_RREADY : OUT STD_LOGIC;
    m_axi_gmem3_RDATA : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM3_DATA_WIDTH-1 downto 0);
    m_axi_gmem3_RLAST : IN STD_LOGIC;
    m_axi_gmem3_RID : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM3_ID_WIDTH-1 downto 0);
    m_axi_gmem3_RUSER : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM3_RUSER_WIDTH-1 downto 0);
    m_axi_gmem3_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem3_BVALID : IN STD_LOGIC;
    m_axi_gmem3_BREADY : OUT STD_LOGIC;
    m_axi_gmem3_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem3_BID : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM3_ID_WIDTH-1 downto 0);
    m_axi_gmem3_BUSER : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM3_BUSER_WIDTH-1 downto 0);
    m_axi_gmem4_AWVALID : OUT STD_LOGIC;
    m_axi_gmem4_AWREADY : IN STD_LOGIC;
    m_axi_gmem4_AWADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM4_ADDR_WIDTH-1 downto 0);
    m_axi_gmem4_AWID : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM4_ID_WIDTH-1 downto 0);
    m_axi_gmem4_AWLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_gmem4_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem4_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem4_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem4_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem4_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_AWUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM4_AWUSER_WIDTH-1 downto 0);
    m_axi_gmem4_WVALID : OUT STD_LOGIC;
    m_axi_gmem4_WREADY : IN STD_LOGIC;
    m_axi_gmem4_WDATA : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM4_DATA_WIDTH-1 downto 0);
    m_axi_gmem4_WSTRB : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM4_DATA_WIDTH/8-1 downto 0);
    m_axi_gmem4_WLAST : OUT STD_LOGIC;
    m_axi_gmem4_WID : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM4_ID_WIDTH-1 downto 0);
    m_axi_gmem4_WUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM4_WUSER_WIDTH-1 downto 0);
    m_axi_gmem4_ARVALID : OUT STD_LOGIC;
    m_axi_gmem4_ARREADY : IN STD_LOGIC;
    m_axi_gmem4_ARADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM4_ADDR_WIDTH-1 downto 0);
    m_axi_gmem4_ARID : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM4_ID_WIDTH-1 downto 0);
    m_axi_gmem4_ARLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_gmem4_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem4_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem4_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem4_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem4_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_ARUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_GMEM4_ARUSER_WIDTH-1 downto 0);
    m_axi_gmem4_RVALID : IN STD_LOGIC;
    m_axi_gmem4_RREADY : OUT STD_LOGIC;
    m_axi_gmem4_RDATA : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM4_DATA_WIDTH-1 downto 0);
    m_axi_gmem4_RLAST : IN STD_LOGIC;
    m_axi_gmem4_RID : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM4_ID_WIDTH-1 downto 0);
    m_axi_gmem4_RUSER : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM4_RUSER_WIDTH-1 downto 0);
    m_axi_gmem4_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem4_BVALID : IN STD_LOGIC;
    m_axi_gmem4_BREADY : OUT STD_LOGIC;
    m_axi_gmem4_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem4_BID : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM4_ID_WIDTH-1 downto 0);
    m_axi_gmem4_BUSER : IN STD_LOGIC_VECTOR (C_M_AXI_GMEM4_BUSER_WIDTH-1 downto 0) );
end;


architecture behav of pp_pipeline_accel is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "pp_pipeline_accel_pp_pipeline_accel,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xck26-sfvc784-2LV-c,HLS_INPUT_CLOCK=3.333000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=2.656545,HLS_SYN_LAT=8322254,HLS_SYN_TPT=8322246,HLS_SYN_MEM=22,HLS_SYN_DSP=0,HLS_SYN_FF=19877,HLS_SYN_LUT=28218,HLS_VERSION=2022_1}";
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant C_M_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal ap_rst_reg_2 : STD_LOGIC := '1';
attribute shreg_extract of ap_rst_reg_2 : signal is "no";
    signal ap_rst_reg_1 : STD_LOGIC := '1';
attribute shreg_extract of ap_rst_reg_1 : signal is "no";
    signal ap_rst_n_inv : STD_LOGIC := '1';
attribute shreg_extract of ap_rst_n_inv : signal is "no";
    signal img_inp_y : STD_LOGIC_VECTOR (63 downto 0);
    signal img_inp_uv : STD_LOGIC_VECTOR (63 downto 0);
    signal img_out : STD_LOGIC_VECTOR (63 downto 0);
    signal params : STD_LOGIC_VECTOR (63 downto 0);
    signal in_img_width : STD_LOGIC_VECTOR (31 downto 0);
    signal in_img_height : STD_LOGIC_VECTOR (31 downto 0);
    signal in_img_linestride : STD_LOGIC_VECTOR (31 downto 0);
    signal out_img_width : STD_LOGIC_VECTOR (31 downto 0);
    signal out_img_height : STD_LOGIC_VECTOR (31 downto 0);
    signal out_img_linestride : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_start : STD_LOGIC;
    signal ap_ready : STD_LOGIC;
    signal ap_done : STD_LOGIC;
    signal ap_continue : STD_LOGIC;
    signal ap_idle : STD_LOGIC;
    signal gmem1_AWREADY : STD_LOGIC;
    signal gmem1_WREADY : STD_LOGIC;
    signal gmem1_ARREADY : STD_LOGIC;
    signal gmem1_RVALID : STD_LOGIC;
    signal gmem1_RDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal gmem1_RLAST : STD_LOGIC;
    signal gmem1_RID : STD_LOGIC_VECTOR (0 downto 0);
    signal gmem1_RFIFONUM : STD_LOGIC_VECTOR (8 downto 0);
    signal gmem1_RUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal gmem1_RRESP : STD_LOGIC_VECTOR (1 downto 0);
    signal gmem1_BVALID : STD_LOGIC;
    signal gmem2_AWREADY : STD_LOGIC;
    signal gmem2_WREADY : STD_LOGIC;
    signal gmem2_ARREADY : STD_LOGIC;
    signal gmem2_RVALID : STD_LOGIC;
    signal gmem2_RDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal gmem2_RLAST : STD_LOGIC;
    signal gmem2_RID : STD_LOGIC_VECTOR (0 downto 0);
    signal gmem2_RFIFONUM : STD_LOGIC_VECTOR (8 downto 0);
    signal gmem2_RUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal gmem2_RRESP : STD_LOGIC_VECTOR (1 downto 0);
    signal gmem2_BVALID : STD_LOGIC;
    signal gmem3_AWREADY : STD_LOGIC;
    signal gmem3_WREADY : STD_LOGIC;
    signal gmem3_ARREADY : STD_LOGIC;
    signal gmem3_RVALID : STD_LOGIC;
    signal gmem3_RDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal gmem3_RFIFONUM : STD_LOGIC_VECTOR (8 downto 0);
    signal gmem3_BVALID : STD_LOGIC;
    signal gmem3_BRESP : STD_LOGIC_VECTOR (1 downto 0);
    signal gmem3_BID : STD_LOGIC_VECTOR (0 downto 0);
    signal gmem3_BUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal gmem4_AWREADY : STD_LOGIC;
    signal gmem4_WREADY : STD_LOGIC;
    signal gmem4_ARREADY : STD_LOGIC;
    signal gmem4_RVALID : STD_LOGIC;
    signal gmem4_RDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal gmem4_RLAST : STD_LOGIC;
    signal gmem4_RID : STD_LOGIC_VECTOR (0 downto 0);
    signal gmem4_RFIFONUM : STD_LOGIC_VECTOR (8 downto 0);
    signal gmem4_RUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal gmem4_RRESP : STD_LOGIC_VECTOR (1 downto 0);
    signal gmem4_BVALID : STD_LOGIC;
    signal entry_proc11_U0_ap_start : STD_LOGIC;
    signal entry_proc11_U0_ap_done : STD_LOGIC;
    signal entry_proc11_U0_ap_continue : STD_LOGIC;
    signal entry_proc11_U0_ap_idle : STD_LOGIC;
    signal entry_proc11_U0_ap_ready : STD_LOGIC;
    signal entry_proc11_U0_img_out_c_din : STD_LOGIC_VECTOR (63 downto 0);
    signal entry_proc11_U0_img_out_c_write : STD_LOGIC;
    signal entry_proc11_U0_out_img_linestride_c_din : STD_LOGIC_VECTOR (31 downto 0);
    signal entry_proc11_U0_out_img_linestride_c_write : STD_LOGIC;
    signal Block_entry20_proc_U0_ap_start : STD_LOGIC;
    signal Block_entry20_proc_U0_ap_done : STD_LOGIC;
    signal Block_entry20_proc_U0_ap_continue : STD_LOGIC;
    signal Block_entry20_proc_U0_ap_idle : STD_LOGIC;
    signal Block_entry20_proc_U0_ap_ready : STD_LOGIC;
    signal Block_entry20_proc_U0_ap_return_0 : STD_LOGIC_VECTOR (10 downto 0);
    signal Block_entry20_proc_U0_ap_return_1 : STD_LOGIC_VECTOR (10 downto 0);
    signal Block_entry20_proc_U0_ap_return_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal Block_entry20_proc_U0_ap_return_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal Block_entry20_proc_U0_ap_return_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal Block_entry20_proc_U0_ap_return_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal Block_entry20_proc_U0_ap_return_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal Block_entry20_proc_U0_ap_return_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal Block_entry20_proc_U0_ap_return_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal Block_entry20_proc_U0_ap_return_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_channel_done_resize_out_mat_cols_c39_channel : STD_LOGIC;
    signal resize_out_mat_cols_c39_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_resize_out_mat_cols_c39_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_resize_out_mat_cols_c39_channel : STD_LOGIC;
    signal ap_channel_done_resize_out_mat_rows_c38_channel : STD_LOGIC;
    signal resize_out_mat_rows_c38_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_resize_out_mat_rows_c38_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_resize_out_mat_rows_c38_channel : STD_LOGIC;
    signal ap_channel_done_imgInput_y_cols_c37_channel : STD_LOGIC;
    signal imgInput_y_cols_c37_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_imgInput_y_cols_c37_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_imgInput_y_cols_c37_channel : STD_LOGIC;
    signal ap_channel_done_imgInput_y_rows_c36_channel : STD_LOGIC;
    signal imgInput_y_rows_c36_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_imgInput_y_rows_c36_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_imgInput_y_rows_c36_channel : STD_LOGIC;
    signal ap_channel_done_out_mat_cols_channel : STD_LOGIC;
    signal out_mat_cols_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_out_mat_cols_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_out_mat_cols_channel : STD_LOGIC;
    signal ap_channel_done_out_mat_rows_channel : STD_LOGIC;
    signal out_mat_rows_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_out_mat_rows_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_out_mat_rows_channel : STD_LOGIC;
    signal ap_channel_done_rgb_mat_cols_channel : STD_LOGIC;
    signal rgb_mat_cols_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_rgb_mat_cols_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_rgb_mat_cols_channel : STD_LOGIC;
    signal ap_channel_done_rgb_mat_rows_channel : STD_LOGIC;
    signal rgb_mat_rows_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_rgb_mat_rows_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_rgb_mat_rows_channel : STD_LOGIC;
    signal ap_channel_done_imgInput_uv_cols_channel : STD_LOGIC;
    signal imgInput_uv_cols_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_imgInput_uv_cols_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_imgInput_uv_cols_channel : STD_LOGIC;
    signal ap_channel_done_imgInput_uv_rows_channel : STD_LOGIC;
    signal imgInput_uv_rows_channel_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_imgInput_uv_rows_channel : STD_LOGIC := '0';
    signal ap_sync_channel_write_imgInput_uv_rows_channel : STD_LOGIC;
    signal Array2xfMat_64_0_2160_3840_1_U0_ap_start : STD_LOGIC;
    signal Array2xfMat_64_0_2160_3840_1_U0_ap_done : STD_LOGIC;
    signal Array2xfMat_64_0_2160_3840_1_U0_ap_continue : STD_LOGIC;
    signal Array2xfMat_64_0_2160_3840_1_U0_ap_idle : STD_LOGIC;
    signal Array2xfMat_64_0_2160_3840_1_U0_ap_ready : STD_LOGIC;
    signal Array2xfMat_64_0_2160_3840_1_U0_start_out : STD_LOGIC;
    signal Array2xfMat_64_0_2160_3840_1_U0_start_write : STD_LOGIC;
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWVALID : STD_LOGIC;
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWID : STD_LOGIC_VECTOR (0 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WVALID : STD_LOGIC;
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WSTRB : STD_LOGIC_VECTOR (7 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WLAST : STD_LOGIC;
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WID : STD_LOGIC_VECTOR (0 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARVALID : STD_LOGIC;
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARID : STD_LOGIC_VECTOR (0 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_RREADY : STD_LOGIC;
    signal Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_BREADY : STD_LOGIC;
    signal Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_data81_din : STD_LOGIC_VECTOR (7 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_data81_write : STD_LOGIC;
    signal Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_rows_c_din : STD_LOGIC_VECTOR (31 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_rows_c_write : STD_LOGIC;
    signal Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_cols_c_din : STD_LOGIC_VECTOR (31 downto 0);
    signal Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_cols_c_write : STD_LOGIC;
    signal Block_entry2022_proc_U0_ap_start : STD_LOGIC;
    signal Block_entry2022_proc_U0_ap_done : STD_LOGIC;
    signal Block_entry2022_proc_U0_ap_continue : STD_LOGIC;
    signal Block_entry2022_proc_U0_ap_idle : STD_LOGIC;
    signal Block_entry2022_proc_U0_ap_ready : STD_LOGIC;
    signal Block_entry2022_proc_U0_ap_return : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln59_loc_channel_full_n : STD_LOGIC;
    signal Array2xfMat_64_6_1080_1920_1_U0_ap_start : STD_LOGIC;
    signal Array2xfMat_64_6_1080_1920_1_U0_ap_done : STD_LOGIC;
    signal Array2xfMat_64_6_1080_1920_1_U0_ap_continue : STD_LOGIC;
    signal Array2xfMat_64_6_1080_1920_1_U0_ap_idle : STD_LOGIC;
    signal Array2xfMat_64_6_1080_1920_1_U0_ap_ready : STD_LOGIC;
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWVALID : STD_LOGIC;
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWID : STD_LOGIC_VECTOR (0 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WVALID : STD_LOGIC;
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WSTRB : STD_LOGIC_VECTOR (7 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WLAST : STD_LOGIC;
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WID : STD_LOGIC_VECTOR (0 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARVALID : STD_LOGIC;
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARID : STD_LOGIC_VECTOR (0 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_RREADY : STD_LOGIC;
    signal Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_BREADY : STD_LOGIC;
    signal Array2xfMat_64_6_1080_1920_1_U0_imgInput_uv_data_din : STD_LOGIC_VECTOR (15 downto 0);
    signal Array2xfMat_64_6_1080_1920_1_U0_imgInput_uv_data_write : STD_LOGIC;
    signal nv122bgr_0_6_9_2160_3840_1_1_U0_ap_start : STD_LOGIC;
    signal nv122bgr_0_6_9_2160_3840_1_1_U0_ap_done : STD_LOGIC;
    signal nv122bgr_0_6_9_2160_3840_1_1_U0_ap_continue : STD_LOGIC;
    signal nv122bgr_0_6_9_2160_3840_1_1_U0_ap_idle : STD_LOGIC;
    signal nv122bgr_0_6_9_2160_3840_1_1_U0_ap_ready : STD_LOGIC;
    signal nv122bgr_0_6_9_2160_3840_1_1_U0_src_y_rows_read : STD_LOGIC;
    signal nv122bgr_0_6_9_2160_3840_1_1_U0_src_y_cols_read : STD_LOGIC;
    signal nv122bgr_0_6_9_2160_3840_1_1_U0_imgInput_y_data81_read : STD_LOGIC;
    signal nv122bgr_0_6_9_2160_3840_1_1_U0_imgInput_uv_data82_read : STD_LOGIC;
    signal nv122bgr_0_6_9_2160_3840_1_1_U0_rgb_mat_data83_din : STD_LOGIC_VECTOR (23 downto 0);
    signal nv122bgr_0_6_9_2160_3840_1_1_U0_rgb_mat_data83_write : STD_LOGIC;
    signal resize_1_9_2160_3840_720_720_1_9_U0_ap_start : STD_LOGIC;
    signal resize_1_9_2160_3840_720_720_1_9_U0_ap_done : STD_LOGIC;
    signal resize_1_9_2160_3840_720_720_1_9_U0_ap_continue : STD_LOGIC;
    signal resize_1_9_2160_3840_720_720_1_9_U0_ap_idle : STD_LOGIC;
    signal resize_1_9_2160_3840_720_720_1_9_U0_ap_ready : STD_LOGIC;
    signal resize_1_9_2160_3840_720_720_1_9_U0_rgb_mat_data83_read : STD_LOGIC;
    signal resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_data84_din : STD_LOGIC_VECTOR (23 downto 0);
    signal resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_data84_write : STD_LOGIC;
    signal resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_rows_c_din : STD_LOGIC_VECTOR (31 downto 0);
    signal resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_rows_c_write : STD_LOGIC;
    signal resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_cols_c_din : STD_LOGIC_VECTOR (31 downto 0);
    signal resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_cols_c_write : STD_LOGIC;
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_start : STD_LOGIC;
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_done : STD_LOGIC;
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_continue : STD_LOGIC;
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_idle : STD_LOGIC;
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready : STD_LOGIC;
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_in_mat_rows_read : STD_LOGIC;
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_in_mat_cols_read : STD_LOGIC;
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_resize_out_mat_data84_read : STD_LOGIC;
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_out_mat_data85_din : STD_LOGIC_VECTOR (23 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_out_mat_data85_write : STD_LOGIC;
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWVALID : STD_LOGIC;
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWID : STD_LOGIC_VECTOR (0 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WVALID : STD_LOGIC;
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WSTRB : STD_LOGIC_VECTOR (7 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WLAST : STD_LOGIC;
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WID : STD_LOGIC_VECTOR (0 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARVALID : STD_LOGIC;
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARID : STD_LOGIC_VECTOR (0 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_RREADY : STD_LOGIC;
    signal preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_BREADY : STD_LOGIC;
    signal xfMat2Array_64_9_720_720_1_1_U0_ap_start : STD_LOGIC;
    signal xfMat2Array_64_9_720_720_1_1_U0_ap_done : STD_LOGIC;
    signal xfMat2Array_64_9_720_720_1_1_U0_ap_continue : STD_LOGIC;
    signal xfMat2Array_64_9_720_720_1_1_U0_ap_idle : STD_LOGIC;
    signal xfMat2Array_64_9_720_720_1_1_U0_ap_ready : STD_LOGIC;
    signal xfMat2Array_64_9_720_720_1_1_U0_out_mat_data85_read : STD_LOGIC;
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWVALID : STD_LOGIC;
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWID : STD_LOGIC_VECTOR (0 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WVALID : STD_LOGIC;
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WSTRB : STD_LOGIC_VECTOR (7 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WLAST : STD_LOGIC;
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WID : STD_LOGIC_VECTOR (0 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARVALID : STD_LOGIC;
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARID : STD_LOGIC_VECTOR (0 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_RREADY : STD_LOGIC;
    signal xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_BREADY : STD_LOGIC;
    signal xfMat2Array_64_9_720_720_1_1_U0_dstPtr_read : STD_LOGIC;
    signal xfMat2Array_64_9_720_720_1_1_U0_stride_read : STD_LOGIC;
    signal img_out_c_full_n : STD_LOGIC;
    signal img_out_c_dout : STD_LOGIC_VECTOR (63 downto 0);
    signal img_out_c_num_data_valid : STD_LOGIC_VECTOR (3 downto 0);
    signal img_out_c_fifo_cap : STD_LOGIC_VECTOR (3 downto 0);
    signal img_out_c_empty_n : STD_LOGIC;
    signal out_img_linestride_c_full_n : STD_LOGIC;
    signal out_img_linestride_c_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal out_img_linestride_c_num_data_valid : STD_LOGIC_VECTOR (3 downto 0);
    signal out_img_linestride_c_fifo_cap : STD_LOGIC_VECTOR (3 downto 0);
    signal out_img_linestride_c_empty_n : STD_LOGIC;
    signal imgInput_uv_rows_channel_dout : STD_LOGIC_VECTOR (10 downto 0);
    signal imgInput_uv_rows_channel_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal imgInput_uv_rows_channel_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal imgInput_uv_rows_channel_empty_n : STD_LOGIC;
    signal imgInput_uv_cols_channel_dout : STD_LOGIC_VECTOR (10 downto 0);
    signal imgInput_uv_cols_channel_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal imgInput_uv_cols_channel_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal imgInput_uv_cols_channel_empty_n : STD_LOGIC;
    signal rgb_mat_rows_channel_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal rgb_mat_rows_channel_num_data_valid : STD_LOGIC_VECTOR (2 downto 0);
    signal rgb_mat_rows_channel_fifo_cap : STD_LOGIC_VECTOR (2 downto 0);
    signal rgb_mat_rows_channel_empty_n : STD_LOGIC;
    signal rgb_mat_cols_channel_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal rgb_mat_cols_channel_num_data_valid : STD_LOGIC_VECTOR (2 downto 0);
    signal rgb_mat_cols_channel_fifo_cap : STD_LOGIC_VECTOR (2 downto 0);
    signal rgb_mat_cols_channel_empty_n : STD_LOGIC;
    signal out_mat_rows_channel_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal out_mat_rows_channel_num_data_valid : STD_LOGIC_VECTOR (3 downto 0);
    signal out_mat_rows_channel_fifo_cap : STD_LOGIC_VECTOR (3 downto 0);
    signal out_mat_rows_channel_empty_n : STD_LOGIC;
    signal out_mat_cols_channel_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal out_mat_cols_channel_num_data_valid : STD_LOGIC_VECTOR (3 downto 0);
    signal out_mat_cols_channel_fifo_cap : STD_LOGIC_VECTOR (3 downto 0);
    signal out_mat_cols_channel_empty_n : STD_LOGIC;
    signal imgInput_y_rows_c36_channel_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal imgInput_y_rows_c36_channel_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal imgInput_y_rows_c36_channel_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal imgInput_y_rows_c36_channel_empty_n : STD_LOGIC;
    signal imgInput_y_cols_c37_channel_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal imgInput_y_cols_c37_channel_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal imgInput_y_cols_c37_channel_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal imgInput_y_cols_c37_channel_empty_n : STD_LOGIC;
    signal resize_out_mat_rows_c38_channel_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal resize_out_mat_rows_c38_channel_num_data_valid : STD_LOGIC_VECTOR (2 downto 0);
    signal resize_out_mat_rows_c38_channel_fifo_cap : STD_LOGIC_VECTOR (2 downto 0);
    signal resize_out_mat_rows_c38_channel_empty_n : STD_LOGIC;
    signal resize_out_mat_cols_c39_channel_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal resize_out_mat_cols_c39_channel_num_data_valid : STD_LOGIC_VECTOR (2 downto 0);
    signal resize_out_mat_cols_c39_channel_fifo_cap : STD_LOGIC_VECTOR (2 downto 0);
    signal resize_out_mat_cols_c39_channel_empty_n : STD_LOGIC;
    signal imgInput_y_data_full_n : STD_LOGIC;
    signal imgInput_y_data_dout : STD_LOGIC_VECTOR (7 downto 0);
    signal imgInput_y_data_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal imgInput_y_data_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal imgInput_y_data_empty_n : STD_LOGIC;
    signal imgInput_y_rows_c_full_n : STD_LOGIC;
    signal imgInput_y_rows_c_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal imgInput_y_rows_c_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal imgInput_y_rows_c_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal imgInput_y_rows_c_empty_n : STD_LOGIC;
    signal imgInput_y_cols_c_full_n : STD_LOGIC;
    signal imgInput_y_cols_c_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal imgInput_y_cols_c_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal imgInput_y_cols_c_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal imgInput_y_cols_c_empty_n : STD_LOGIC;
    signal select_ln59_loc_channel_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln59_loc_channel_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln59_loc_channel_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln59_loc_channel_empty_n : STD_LOGIC;
    signal imgInput_uv_data_full_n : STD_LOGIC;
    signal imgInput_uv_data_dout : STD_LOGIC_VECTOR (15 downto 0);
    signal imgInput_uv_data_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal imgInput_uv_data_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal imgInput_uv_data_empty_n : STD_LOGIC;
    signal rgb_mat_data_full_n : STD_LOGIC;
    signal rgb_mat_data_dout : STD_LOGIC_VECTOR (23 downto 0);
    signal rgb_mat_data_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal rgb_mat_data_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal rgb_mat_data_empty_n : STD_LOGIC;
    signal resize_out_mat_data_full_n : STD_LOGIC;
    signal resize_out_mat_data_dout : STD_LOGIC_VECTOR (23 downto 0);
    signal resize_out_mat_data_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal resize_out_mat_data_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal resize_out_mat_data_empty_n : STD_LOGIC;
    signal resize_out_mat_rows_c_full_n : STD_LOGIC;
    signal resize_out_mat_rows_c_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal resize_out_mat_rows_c_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal resize_out_mat_rows_c_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal resize_out_mat_rows_c_empty_n : STD_LOGIC;
    signal resize_out_mat_cols_c_full_n : STD_LOGIC;
    signal resize_out_mat_cols_c_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal resize_out_mat_cols_c_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal resize_out_mat_cols_c_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal resize_out_mat_cols_c_empty_n : STD_LOGIC;
    signal out_mat_data_full_n : STD_LOGIC;
    signal out_mat_data_dout : STD_LOGIC_VECTOR (23 downto 0);
    signal out_mat_data_num_data_valid : STD_LOGIC_VECTOR (1 downto 0);
    signal out_mat_data_fifo_cap : STD_LOGIC_VECTOR (1 downto 0);
    signal out_mat_data_empty_n : STD_LOGIC;
    signal ap_sync_ready : STD_LOGIC;
    signal ap_sync_reg_entry_proc11_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_entry_proc11_U0_ap_ready : STD_LOGIC;
    signal ap_sync_reg_Block_entry20_proc_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_Block_entry20_proc_U0_ap_ready : STD_LOGIC;
    signal ap_sync_reg_Array2xfMat_64_0_2160_3840_1_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_Array2xfMat_64_0_2160_3840_1_U0_ap_ready : STD_LOGIC;
    signal ap_sync_reg_Block_entry2022_proc_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_Block_entry2022_proc_U0_ap_ready : STD_LOGIC;
    signal ap_sync_reg_Array2xfMat_64_6_1080_1920_1_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_Array2xfMat_64_6_1080_1920_1_U0_ap_ready : STD_LOGIC;
    signal ap_sync_reg_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready : STD_LOGIC;
    signal start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_full_n : STD_LOGIC;
    signal start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_empty_n : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_entry_proc11 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        img_out : IN STD_LOGIC_VECTOR (63 downto 0);
        img_out_c_din : OUT STD_LOGIC_VECTOR (63 downto 0);
        img_out_c_num_data_valid : IN STD_LOGIC_VECTOR (3 downto 0);
        img_out_c_fifo_cap : IN STD_LOGIC_VECTOR (3 downto 0);
        img_out_c_full_n : IN STD_LOGIC;
        img_out_c_write : OUT STD_LOGIC;
        out_img_linestride : IN STD_LOGIC_VECTOR (31 downto 0);
        out_img_linestride_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        out_img_linestride_c_num_data_valid : IN STD_LOGIC_VECTOR (3 downto 0);
        out_img_linestride_c_fifo_cap : IN STD_LOGIC_VECTOR (3 downto 0);
        out_img_linestride_c_full_n : IN STD_LOGIC;
        out_img_linestride_c_write : OUT STD_LOGIC );
    end component;


    component pp_pipeline_accel_Block_entry20_proc IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        in_img_height : IN STD_LOGIC_VECTOR (31 downto 0);
        in_img_width : IN STD_LOGIC_VECTOR (31 downto 0);
        out_img_height : IN STD_LOGIC_VECTOR (31 downto 0);
        out_img_width : IN STD_LOGIC_VECTOR (31 downto 0);
        ap_return_0 : OUT STD_LOGIC_VECTOR (10 downto 0);
        ap_return_1 : OUT STD_LOGIC_VECTOR (10 downto 0);
        ap_return_2 : OUT STD_LOGIC_VECTOR (31 downto 0);
        ap_return_3 : OUT STD_LOGIC_VECTOR (31 downto 0);
        ap_return_4 : OUT STD_LOGIC_VECTOR (31 downto 0);
        ap_return_5 : OUT STD_LOGIC_VECTOR (31 downto 0);
        ap_return_6 : OUT STD_LOGIC_VECTOR (31 downto 0);
        ap_return_7 : OUT STD_LOGIC_VECTOR (31 downto 0);
        ap_return_8 : OUT STD_LOGIC_VECTOR (31 downto 0);
        ap_return_9 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component pp_pipeline_accel_Array2xfMat_64_0_2160_3840_1_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        m_axi_gmem1_AWVALID : OUT STD_LOGIC;
        m_axi_gmem1_AWREADY : IN STD_LOGIC;
        m_axi_gmem1_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem1_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem1_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem1_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem1_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem1_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem1_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem1_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem1_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem1_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem1_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem1_WVALID : OUT STD_LOGIC;
        m_axi_gmem1_WREADY : IN STD_LOGIC;
        m_axi_gmem1_WDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem1_WSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
        m_axi_gmem1_WLAST : OUT STD_LOGIC;
        m_axi_gmem1_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem1_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem1_ARVALID : OUT STD_LOGIC;
        m_axi_gmem1_ARREADY : IN STD_LOGIC;
        m_axi_gmem1_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem1_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem1_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem1_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem1_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem1_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem1_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem1_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem1_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem1_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem1_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem1_RVALID : IN STD_LOGIC;
        m_axi_gmem1_RREADY : OUT STD_LOGIC;
        m_axi_gmem1_RDATA : IN STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem1_RLAST : IN STD_LOGIC;
        m_axi_gmem1_RID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem1_RFIFONUM : IN STD_LOGIC_VECTOR (8 downto 0);
        m_axi_gmem1_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem1_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem1_BVALID : IN STD_LOGIC;
        m_axi_gmem1_BREADY : OUT STD_LOGIC;
        m_axi_gmem1_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem1_BID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem1_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        srcPtr : IN STD_LOGIC_VECTOR (63 downto 0);
        p_read : IN STD_LOGIC_VECTOR (31 downto 0);
        p_read1 : IN STD_LOGIC_VECTOR (31 downto 0);
        imgInput_y_data81_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        imgInput_y_data81_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        imgInput_y_data81_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        imgInput_y_data81_full_n : IN STD_LOGIC;
        imgInput_y_data81_write : OUT STD_LOGIC;
        stride : IN STD_LOGIC_VECTOR (31 downto 0);
        imgInput_y_rows_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        imgInput_y_rows_c_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        imgInput_y_rows_c_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        imgInput_y_rows_c_full_n : IN STD_LOGIC;
        imgInput_y_rows_c_write : OUT STD_LOGIC;
        imgInput_y_cols_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        imgInput_y_cols_c_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        imgInput_y_cols_c_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        imgInput_y_cols_c_full_n : IN STD_LOGIC;
        imgInput_y_cols_c_write : OUT STD_LOGIC );
    end component;


    component pp_pipeline_accel_Block_entry2022_proc IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        in_img_linestride : IN STD_LOGIC_VECTOR (31 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component pp_pipeline_accel_Array2xfMat_64_6_1080_1920_1_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        m_axi_gmem2_AWVALID : OUT STD_LOGIC;
        m_axi_gmem2_AWREADY : IN STD_LOGIC;
        m_axi_gmem2_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem2_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem2_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem2_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem2_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem2_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem2_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem2_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem2_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem2_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem2_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem2_WVALID : OUT STD_LOGIC;
        m_axi_gmem2_WREADY : IN STD_LOGIC;
        m_axi_gmem2_WDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem2_WSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
        m_axi_gmem2_WLAST : OUT STD_LOGIC;
        m_axi_gmem2_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem2_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem2_ARVALID : OUT STD_LOGIC;
        m_axi_gmem2_ARREADY : IN STD_LOGIC;
        m_axi_gmem2_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem2_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem2_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem2_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem2_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem2_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem2_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem2_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem2_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem2_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem2_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem2_RVALID : IN STD_LOGIC;
        m_axi_gmem2_RREADY : OUT STD_LOGIC;
        m_axi_gmem2_RDATA : IN STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem2_RLAST : IN STD_LOGIC;
        m_axi_gmem2_RID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem2_RFIFONUM : IN STD_LOGIC_VECTOR (8 downto 0);
        m_axi_gmem2_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem2_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem2_BVALID : IN STD_LOGIC;
        m_axi_gmem2_BREADY : OUT STD_LOGIC;
        m_axi_gmem2_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem2_BID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem2_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        img_inp_uv : IN STD_LOGIC_VECTOR (63 downto 0);
        p_read : IN STD_LOGIC_VECTOR (10 downto 0);
        p_read1 : IN STD_LOGIC_VECTOR (10 downto 0);
        imgInput_uv_data_din : OUT STD_LOGIC_VECTOR (15 downto 0);
        imgInput_uv_data_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        imgInput_uv_data_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        imgInput_uv_data_full_n : IN STD_LOGIC;
        imgInput_uv_data_write : OUT STD_LOGIC;
        p_read2 : IN STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component pp_pipeline_accel_nv122bgr_0_6_9_2160_3840_1_1_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        src_y_rows_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        src_y_rows_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        src_y_rows_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        src_y_rows_empty_n : IN STD_LOGIC;
        src_y_rows_read : OUT STD_LOGIC;
        src_y_cols_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        src_y_cols_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        src_y_cols_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        src_y_cols_empty_n : IN STD_LOGIC;
        src_y_cols_read : OUT STD_LOGIC;
        imgInput_y_data81_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        imgInput_y_data81_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        imgInput_y_data81_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        imgInput_y_data81_empty_n : IN STD_LOGIC;
        imgInput_y_data81_read : OUT STD_LOGIC;
        imgInput_uv_data82_dout : IN STD_LOGIC_VECTOR (15 downto 0);
        imgInput_uv_data82_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        imgInput_uv_data82_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        imgInput_uv_data82_empty_n : IN STD_LOGIC;
        imgInput_uv_data82_read : OUT STD_LOGIC;
        rgb_mat_data83_din : OUT STD_LOGIC_VECTOR (23 downto 0);
        rgb_mat_data83_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        rgb_mat_data83_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        rgb_mat_data83_full_n : IN STD_LOGIC;
        rgb_mat_data83_write : OUT STD_LOGIC );
    end component;


    component pp_pipeline_accel_resize_1_9_2160_3840_720_720_1_9_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        p_read : IN STD_LOGIC_VECTOR (31 downto 0);
        p_read1 : IN STD_LOGIC_VECTOR (31 downto 0);
        rgb_mat_data83_dout : IN STD_LOGIC_VECTOR (23 downto 0);
        rgb_mat_data83_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        rgb_mat_data83_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        rgb_mat_data83_empty_n : IN STD_LOGIC;
        rgb_mat_data83_read : OUT STD_LOGIC;
        p_read2 : IN STD_LOGIC_VECTOR (31 downto 0);
        p_read3 : IN STD_LOGIC_VECTOR (31 downto 0);
        resize_out_mat_data84_din : OUT STD_LOGIC_VECTOR (23 downto 0);
        resize_out_mat_data84_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        resize_out_mat_data84_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        resize_out_mat_data84_full_n : IN STD_LOGIC;
        resize_out_mat_data84_write : OUT STD_LOGIC;
        resize_out_mat_rows_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        resize_out_mat_rows_c_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        resize_out_mat_rows_c_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        resize_out_mat_rows_c_full_n : IN STD_LOGIC;
        resize_out_mat_rows_c_write : OUT STD_LOGIC;
        resize_out_mat_cols_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        resize_out_mat_cols_c_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        resize_out_mat_cols_c_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        resize_out_mat_cols_c_full_n : IN STD_LOGIC;
        resize_out_mat_cols_c_write : OUT STD_LOGIC );
    end component;


    component pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        in_mat_rows_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        in_mat_rows_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        in_mat_rows_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        in_mat_rows_empty_n : IN STD_LOGIC;
        in_mat_rows_read : OUT STD_LOGIC;
        in_mat_cols_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        in_mat_cols_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        in_mat_cols_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        in_mat_cols_empty_n : IN STD_LOGIC;
        in_mat_cols_read : OUT STD_LOGIC;
        resize_out_mat_data84_dout : IN STD_LOGIC_VECTOR (23 downto 0);
        resize_out_mat_data84_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        resize_out_mat_data84_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        resize_out_mat_data84_empty_n : IN STD_LOGIC;
        resize_out_mat_data84_read : OUT STD_LOGIC;
        out_mat_data85_din : OUT STD_LOGIC_VECTOR (23 downto 0);
        out_mat_data85_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        out_mat_data85_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        out_mat_data85_full_n : IN STD_LOGIC;
        out_mat_data85_write : OUT STD_LOGIC;
        m_axi_gmem4_AWVALID : OUT STD_LOGIC;
        m_axi_gmem4_AWREADY : IN STD_LOGIC;
        m_axi_gmem4_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem4_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem4_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem4_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem4_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem4_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem4_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem4_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem4_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem4_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem4_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem4_WVALID : OUT STD_LOGIC;
        m_axi_gmem4_WREADY : IN STD_LOGIC;
        m_axi_gmem4_WDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem4_WSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
        m_axi_gmem4_WLAST : OUT STD_LOGIC;
        m_axi_gmem4_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem4_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem4_ARVALID : OUT STD_LOGIC;
        m_axi_gmem4_ARREADY : IN STD_LOGIC;
        m_axi_gmem4_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem4_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem4_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem4_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem4_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem4_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem4_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem4_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem4_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem4_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem4_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem4_RVALID : IN STD_LOGIC;
        m_axi_gmem4_RREADY : OUT STD_LOGIC;
        m_axi_gmem4_RDATA : IN STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem4_RLAST : IN STD_LOGIC;
        m_axi_gmem4_RID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem4_RFIFONUM : IN STD_LOGIC_VECTOR (8 downto 0);
        m_axi_gmem4_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem4_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem4_BVALID : IN STD_LOGIC;
        m_axi_gmem4_BREADY : OUT STD_LOGIC;
        m_axi_gmem4_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem4_BID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem4_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        params : IN STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component pp_pipeline_accel_xfMat2Array_64_9_720_720_1_1_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        p_read : IN STD_LOGIC_VECTOR (31 downto 0);
        p_read1 : IN STD_LOGIC_VECTOR (31 downto 0);
        out_mat_data85_dout : IN STD_LOGIC_VECTOR (23 downto 0);
        out_mat_data85_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        out_mat_data85_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        out_mat_data85_empty_n : IN STD_LOGIC;
        out_mat_data85_read : OUT STD_LOGIC;
        m_axi_gmem3_AWVALID : OUT STD_LOGIC;
        m_axi_gmem3_AWREADY : IN STD_LOGIC;
        m_axi_gmem3_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem3_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem3_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem3_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem3_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem3_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem3_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_WVALID : OUT STD_LOGIC;
        m_axi_gmem3_WREADY : IN STD_LOGIC;
        m_axi_gmem3_WDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem3_WSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
        m_axi_gmem3_WLAST : OUT STD_LOGIC;
        m_axi_gmem3_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_ARVALID : OUT STD_LOGIC;
        m_axi_gmem3_ARREADY : IN STD_LOGIC;
        m_axi_gmem3_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem3_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem3_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem3_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem3_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem3_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem3_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_RVALID : IN STD_LOGIC;
        m_axi_gmem3_RREADY : OUT STD_LOGIC;
        m_axi_gmem3_RDATA : IN STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem3_RLAST : IN STD_LOGIC;
        m_axi_gmem3_RID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_RFIFONUM : IN STD_LOGIC_VECTOR (8 downto 0);
        m_axi_gmem3_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem3_BVALID : IN STD_LOGIC;
        m_axi_gmem3_BREADY : OUT STD_LOGIC;
        m_axi_gmem3_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem3_BID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        dstPtr_dout : IN STD_LOGIC_VECTOR (63 downto 0);
        dstPtr_num_data_valid : IN STD_LOGIC_VECTOR (3 downto 0);
        dstPtr_fifo_cap : IN STD_LOGIC_VECTOR (3 downto 0);
        dstPtr_empty_n : IN STD_LOGIC;
        dstPtr_read : OUT STD_LOGIC;
        stride_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        stride_num_data_valid : IN STD_LOGIC_VECTOR (3 downto 0);
        stride_fifo_cap : IN STD_LOGIC_VECTOR (3 downto 0);
        stride_empty_n : IN STD_LOGIC;
        stride_read : OUT STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w64_d7_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (63 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (63 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (3 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (3 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w32_d7_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (31 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (31 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (3 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (3 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w11_d2_S_x IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (10 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (10 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w32_d4_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (31 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (31 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (2 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (2 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w32_d6_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (31 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (31 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (3 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (3 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w32_d2_S_x IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (31 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (31 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w8_d2_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (7 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (7 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w16_d2_S_x0 IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (15 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (15 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_fifo_w24_d2_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (23 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (23 downto 0);
        if_num_data_valid : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_fifo_cap : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_start_for_nv122bgr_0_6_9_2160_3840_1_1_U0 IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_control_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        img_inp_y : OUT STD_LOGIC_VECTOR (63 downto 0);
        img_inp_uv : OUT STD_LOGIC_VECTOR (63 downto 0);
        img_out : OUT STD_LOGIC_VECTOR (63 downto 0);
        params : OUT STD_LOGIC_VECTOR (63 downto 0);
        in_img_width : OUT STD_LOGIC_VECTOR (31 downto 0);
        in_img_height : OUT STD_LOGIC_VECTOR (31 downto 0);
        in_img_linestride : OUT STD_LOGIC_VECTOR (31 downto 0);
        out_img_width : OUT STD_LOGIC_VECTOR (31 downto 0);
        out_img_height : OUT STD_LOGIC_VECTOR (31 downto 0);
        out_img_linestride : OUT STD_LOGIC_VECTOR (31 downto 0);
        ap_start : OUT STD_LOGIC;
        interrupt : OUT STD_LOGIC;
        ap_ready : IN STD_LOGIC;
        ap_done : IN STD_LOGIC;
        ap_continue : OUT STD_LOGIC;
        ap_idle : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_gmem1_m_axi IS
    generic (
        CONSERVATIVE : INTEGER;
        USER_MAXREQS : INTEGER;
        NUM_READ_OUTSTANDING : INTEGER;
        NUM_WRITE_OUTSTANDING : INTEGER;
        MAX_READ_BURST_LENGTH : INTEGER;
        MAX_WRITE_BURST_LENGTH : INTEGER;
        USER_RFIFONUM_WIDTH : INTEGER;
        C_M_AXI_ID_WIDTH : INTEGER;
        C_M_AXI_ADDR_WIDTH : INTEGER;
        C_M_AXI_DATA_WIDTH : INTEGER;
        C_M_AXI_AWUSER_WIDTH : INTEGER;
        C_M_AXI_ARUSER_WIDTH : INTEGER;
        C_M_AXI_WUSER_WIDTH : INTEGER;
        C_M_AXI_RUSER_WIDTH : INTEGER;
        C_M_AXI_BUSER_WIDTH : INTEGER;
        C_USER_VALUE : INTEGER;
        C_PROT_VALUE : INTEGER;
        C_CACHE_VALUE : INTEGER;
        USER_DW : INTEGER;
        USER_AW : INTEGER );
    port (
        AWVALID : OUT STD_LOGIC;
        AWREADY : IN STD_LOGIC;
        AWADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_ADDR_WIDTH-1 downto 0);
        AWID : OUT STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        AWLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
        AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        AWUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_AWUSER_WIDTH-1 downto 0);
        WVALID : OUT STD_LOGIC;
        WREADY : IN STD_LOGIC;
        WDATA : OUT STD_LOGIC_VECTOR (C_M_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : OUT STD_LOGIC_VECTOR (C_M_AXI_DATA_WIDTH/8-1 downto 0);
        WLAST : OUT STD_LOGIC;
        WID : OUT STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        WUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_WUSER_WIDTH-1 downto 0);
        ARVALID : OUT STD_LOGIC;
        ARREADY : IN STD_LOGIC;
        ARADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_ADDR_WIDTH-1 downto 0);
        ARID : OUT STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        ARLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
        ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        ARUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_ARUSER_WIDTH-1 downto 0);
        RVALID : IN STD_LOGIC;
        RREADY : OUT STD_LOGIC;
        RDATA : IN STD_LOGIC_VECTOR (C_M_AXI_DATA_WIDTH-1 downto 0);
        RLAST : IN STD_LOGIC;
        RID : IN STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        RUSER : IN STD_LOGIC_VECTOR (C_M_AXI_RUSER_WIDTH-1 downto 0);
        RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        BVALID : IN STD_LOGIC;
        BREADY : OUT STD_LOGIC;
        BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        BID : IN STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        BUSER : IN STD_LOGIC_VECTOR (C_M_AXI_BUSER_WIDTH-1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        I_ARVALID : IN STD_LOGIC;
        I_ARREADY : OUT STD_LOGIC;
        I_ARADDR : IN STD_LOGIC_VECTOR (63 downto 0);
        I_ARLEN : IN STD_LOGIC_VECTOR (31 downto 0);
        I_RVALID : OUT STD_LOGIC;
        I_RREADY : IN STD_LOGIC;
        I_RDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
        I_RFIFONUM : OUT STD_LOGIC_VECTOR (8 downto 0);
        I_AWVALID : IN STD_LOGIC;
        I_AWREADY : OUT STD_LOGIC;
        I_AWADDR : IN STD_LOGIC_VECTOR (63 downto 0);
        I_AWLEN : IN STD_LOGIC_VECTOR (31 downto 0);
        I_WVALID : IN STD_LOGIC;
        I_WREADY : OUT STD_LOGIC;
        I_WDATA : IN STD_LOGIC_VECTOR (63 downto 0);
        I_WSTRB : IN STD_LOGIC_VECTOR (7 downto 0);
        I_BVALID : OUT STD_LOGIC;
        I_BREADY : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_gmem2_m_axi IS
    generic (
        CONSERVATIVE : INTEGER;
        USER_MAXREQS : INTEGER;
        NUM_READ_OUTSTANDING : INTEGER;
        NUM_WRITE_OUTSTANDING : INTEGER;
        MAX_READ_BURST_LENGTH : INTEGER;
        MAX_WRITE_BURST_LENGTH : INTEGER;
        USER_RFIFONUM_WIDTH : INTEGER;
        C_M_AXI_ID_WIDTH : INTEGER;
        C_M_AXI_ADDR_WIDTH : INTEGER;
        C_M_AXI_DATA_WIDTH : INTEGER;
        C_M_AXI_AWUSER_WIDTH : INTEGER;
        C_M_AXI_ARUSER_WIDTH : INTEGER;
        C_M_AXI_WUSER_WIDTH : INTEGER;
        C_M_AXI_RUSER_WIDTH : INTEGER;
        C_M_AXI_BUSER_WIDTH : INTEGER;
        C_USER_VALUE : INTEGER;
        C_PROT_VALUE : INTEGER;
        C_CACHE_VALUE : INTEGER;
        USER_DW : INTEGER;
        USER_AW : INTEGER );
    port (
        AWVALID : OUT STD_LOGIC;
        AWREADY : IN STD_LOGIC;
        AWADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_ADDR_WIDTH-1 downto 0);
        AWID : OUT STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        AWLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
        AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        AWUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_AWUSER_WIDTH-1 downto 0);
        WVALID : OUT STD_LOGIC;
        WREADY : IN STD_LOGIC;
        WDATA : OUT STD_LOGIC_VECTOR (C_M_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : OUT STD_LOGIC_VECTOR (C_M_AXI_DATA_WIDTH/8-1 downto 0);
        WLAST : OUT STD_LOGIC;
        WID : OUT STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        WUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_WUSER_WIDTH-1 downto 0);
        ARVALID : OUT STD_LOGIC;
        ARREADY : IN STD_LOGIC;
        ARADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_ADDR_WIDTH-1 downto 0);
        ARID : OUT STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        ARLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
        ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        ARUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_ARUSER_WIDTH-1 downto 0);
        RVALID : IN STD_LOGIC;
        RREADY : OUT STD_LOGIC;
        RDATA : IN STD_LOGIC_VECTOR (C_M_AXI_DATA_WIDTH-1 downto 0);
        RLAST : IN STD_LOGIC;
        RID : IN STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        RUSER : IN STD_LOGIC_VECTOR (C_M_AXI_RUSER_WIDTH-1 downto 0);
        RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        BVALID : IN STD_LOGIC;
        BREADY : OUT STD_LOGIC;
        BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        BID : IN STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        BUSER : IN STD_LOGIC_VECTOR (C_M_AXI_BUSER_WIDTH-1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        I_ARVALID : IN STD_LOGIC;
        I_ARREADY : OUT STD_LOGIC;
        I_ARADDR : IN STD_LOGIC_VECTOR (63 downto 0);
        I_ARLEN : IN STD_LOGIC_VECTOR (31 downto 0);
        I_RVALID : OUT STD_LOGIC;
        I_RREADY : IN STD_LOGIC;
        I_RDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
        I_RFIFONUM : OUT STD_LOGIC_VECTOR (8 downto 0);
        I_AWVALID : IN STD_LOGIC;
        I_AWREADY : OUT STD_LOGIC;
        I_AWADDR : IN STD_LOGIC_VECTOR (63 downto 0);
        I_AWLEN : IN STD_LOGIC_VECTOR (31 downto 0);
        I_WVALID : IN STD_LOGIC;
        I_WREADY : OUT STD_LOGIC;
        I_WDATA : IN STD_LOGIC_VECTOR (63 downto 0);
        I_WSTRB : IN STD_LOGIC_VECTOR (7 downto 0);
        I_BVALID : OUT STD_LOGIC;
        I_BREADY : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_gmem3_m_axi IS
    generic (
        CONSERVATIVE : INTEGER;
        USER_MAXREQS : INTEGER;
        NUM_READ_OUTSTANDING : INTEGER;
        NUM_WRITE_OUTSTANDING : INTEGER;
        MAX_READ_BURST_LENGTH : INTEGER;
        MAX_WRITE_BURST_LENGTH : INTEGER;
        USER_RFIFONUM_WIDTH : INTEGER;
        C_M_AXI_ID_WIDTH : INTEGER;
        C_M_AXI_ADDR_WIDTH : INTEGER;
        C_M_AXI_DATA_WIDTH : INTEGER;
        C_M_AXI_AWUSER_WIDTH : INTEGER;
        C_M_AXI_ARUSER_WIDTH : INTEGER;
        C_M_AXI_WUSER_WIDTH : INTEGER;
        C_M_AXI_RUSER_WIDTH : INTEGER;
        C_M_AXI_BUSER_WIDTH : INTEGER;
        C_USER_VALUE : INTEGER;
        C_PROT_VALUE : INTEGER;
        C_CACHE_VALUE : INTEGER;
        USER_DW : INTEGER;
        USER_AW : INTEGER );
    port (
        AWVALID : OUT STD_LOGIC;
        AWREADY : IN STD_LOGIC;
        AWADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_ADDR_WIDTH-1 downto 0);
        AWID : OUT STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        AWLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
        AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        AWUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_AWUSER_WIDTH-1 downto 0);
        WVALID : OUT STD_LOGIC;
        WREADY : IN STD_LOGIC;
        WDATA : OUT STD_LOGIC_VECTOR (C_M_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : OUT STD_LOGIC_VECTOR (C_M_AXI_DATA_WIDTH/8-1 downto 0);
        WLAST : OUT STD_LOGIC;
        WID : OUT STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        WUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_WUSER_WIDTH-1 downto 0);
        ARVALID : OUT STD_LOGIC;
        ARREADY : IN STD_LOGIC;
        ARADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_ADDR_WIDTH-1 downto 0);
        ARID : OUT STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        ARLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
        ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        ARUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_ARUSER_WIDTH-1 downto 0);
        RVALID : IN STD_LOGIC;
        RREADY : OUT STD_LOGIC;
        RDATA : IN STD_LOGIC_VECTOR (C_M_AXI_DATA_WIDTH-1 downto 0);
        RLAST : IN STD_LOGIC;
        RID : IN STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        RUSER : IN STD_LOGIC_VECTOR (C_M_AXI_RUSER_WIDTH-1 downto 0);
        RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        BVALID : IN STD_LOGIC;
        BREADY : OUT STD_LOGIC;
        BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        BID : IN STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        BUSER : IN STD_LOGIC_VECTOR (C_M_AXI_BUSER_WIDTH-1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        I_ARVALID : IN STD_LOGIC;
        I_ARREADY : OUT STD_LOGIC;
        I_ARADDR : IN STD_LOGIC_VECTOR (63 downto 0);
        I_ARLEN : IN STD_LOGIC_VECTOR (31 downto 0);
        I_RVALID : OUT STD_LOGIC;
        I_RREADY : IN STD_LOGIC;
        I_RDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
        I_RFIFONUM : OUT STD_LOGIC_VECTOR (8 downto 0);
        I_AWVALID : IN STD_LOGIC;
        I_AWREADY : OUT STD_LOGIC;
        I_AWADDR : IN STD_LOGIC_VECTOR (63 downto 0);
        I_AWLEN : IN STD_LOGIC_VECTOR (31 downto 0);
        I_WVALID : IN STD_LOGIC;
        I_WREADY : OUT STD_LOGIC;
        I_WDATA : IN STD_LOGIC_VECTOR (63 downto 0);
        I_WSTRB : IN STD_LOGIC_VECTOR (7 downto 0);
        I_BVALID : OUT STD_LOGIC;
        I_BREADY : IN STD_LOGIC );
    end component;


    component pp_pipeline_accel_gmem4_m_axi IS
    generic (
        CONSERVATIVE : INTEGER;
        USER_MAXREQS : INTEGER;
        NUM_READ_OUTSTANDING : INTEGER;
        NUM_WRITE_OUTSTANDING : INTEGER;
        MAX_READ_BURST_LENGTH : INTEGER;
        MAX_WRITE_BURST_LENGTH : INTEGER;
        USER_RFIFONUM_WIDTH : INTEGER;
        C_M_AXI_ID_WIDTH : INTEGER;
        C_M_AXI_ADDR_WIDTH : INTEGER;
        C_M_AXI_DATA_WIDTH : INTEGER;
        C_M_AXI_AWUSER_WIDTH : INTEGER;
        C_M_AXI_ARUSER_WIDTH : INTEGER;
        C_M_AXI_WUSER_WIDTH : INTEGER;
        C_M_AXI_RUSER_WIDTH : INTEGER;
        C_M_AXI_BUSER_WIDTH : INTEGER;
        C_USER_VALUE : INTEGER;
        C_PROT_VALUE : INTEGER;
        C_CACHE_VALUE : INTEGER;
        USER_DW : INTEGER;
        USER_AW : INTEGER );
    port (
        AWVALID : OUT STD_LOGIC;
        AWREADY : IN STD_LOGIC;
        AWADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_ADDR_WIDTH-1 downto 0);
        AWID : OUT STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        AWLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
        AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        AWUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_AWUSER_WIDTH-1 downto 0);
        WVALID : OUT STD_LOGIC;
        WREADY : IN STD_LOGIC;
        WDATA : OUT STD_LOGIC_VECTOR (C_M_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : OUT STD_LOGIC_VECTOR (C_M_AXI_DATA_WIDTH/8-1 downto 0);
        WLAST : OUT STD_LOGIC;
        WID : OUT STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        WUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_WUSER_WIDTH-1 downto 0);
        ARVALID : OUT STD_LOGIC;
        ARREADY : IN STD_LOGIC;
        ARADDR : OUT STD_LOGIC_VECTOR (C_M_AXI_ADDR_WIDTH-1 downto 0);
        ARID : OUT STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        ARLEN : OUT STD_LOGIC_VECTOR (7 downto 0);
        ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        ARUSER : OUT STD_LOGIC_VECTOR (C_M_AXI_ARUSER_WIDTH-1 downto 0);
        RVALID : IN STD_LOGIC;
        RREADY : OUT STD_LOGIC;
        RDATA : IN STD_LOGIC_VECTOR (C_M_AXI_DATA_WIDTH-1 downto 0);
        RLAST : IN STD_LOGIC;
        RID : IN STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        RUSER : IN STD_LOGIC_VECTOR (C_M_AXI_RUSER_WIDTH-1 downto 0);
        RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        BVALID : IN STD_LOGIC;
        BREADY : OUT STD_LOGIC;
        BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        BID : IN STD_LOGIC_VECTOR (C_M_AXI_ID_WIDTH-1 downto 0);
        BUSER : IN STD_LOGIC_VECTOR (C_M_AXI_BUSER_WIDTH-1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        I_ARVALID : IN STD_LOGIC;
        I_ARREADY : OUT STD_LOGIC;
        I_ARADDR : IN STD_LOGIC_VECTOR (63 downto 0);
        I_ARLEN : IN STD_LOGIC_VECTOR (31 downto 0);
        I_RVALID : OUT STD_LOGIC;
        I_RREADY : IN STD_LOGIC;
        I_RDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
        I_RFIFONUM : OUT STD_LOGIC_VECTOR (8 downto 0);
        I_AWVALID : IN STD_LOGIC;
        I_AWREADY : OUT STD_LOGIC;
        I_AWADDR : IN STD_LOGIC_VECTOR (63 downto 0);
        I_AWLEN : IN STD_LOGIC_VECTOR (31 downto 0);
        I_WVALID : IN STD_LOGIC;
        I_WREADY : OUT STD_LOGIC;
        I_WDATA : IN STD_LOGIC_VECTOR (63 downto 0);
        I_WSTRB : IN STD_LOGIC_VECTOR (7 downto 0);
        I_BVALID : OUT STD_LOGIC;
        I_BREADY : IN STD_LOGIC );
    end component;



begin
    control_s_axi_U : component pp_pipeline_accel_control_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_CONTROL_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_CONTROL_DATA_WIDTH)
    port map (
        AWVALID => s_axi_control_AWVALID,
        AWREADY => s_axi_control_AWREADY,
        AWADDR => s_axi_control_AWADDR,
        WVALID => s_axi_control_WVALID,
        WREADY => s_axi_control_WREADY,
        WDATA => s_axi_control_WDATA,
        WSTRB => s_axi_control_WSTRB,
        ARVALID => s_axi_control_ARVALID,
        ARREADY => s_axi_control_ARREADY,
        ARADDR => s_axi_control_ARADDR,
        RVALID => s_axi_control_RVALID,
        RREADY => s_axi_control_RREADY,
        RDATA => s_axi_control_RDATA,
        RRESP => s_axi_control_RRESP,
        BVALID => s_axi_control_BVALID,
        BREADY => s_axi_control_BREADY,
        BRESP => s_axi_control_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        img_inp_y => img_inp_y,
        img_inp_uv => img_inp_uv,
        img_out => img_out,
        params => params,
        in_img_width => in_img_width,
        in_img_height => in_img_height,
        in_img_linestride => in_img_linestride,
        out_img_width => out_img_width,
        out_img_height => out_img_height,
        out_img_linestride => out_img_linestride,
        ap_start => ap_start,
        interrupt => interrupt,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_continue => ap_continue,
        ap_idle => ap_idle);

    gmem1_m_axi_U : component pp_pipeline_accel_gmem1_m_axi
    generic map (
        CONSERVATIVE => 1,
        USER_MAXREQS => 69,
        NUM_READ_OUTSTANDING => 16,
        NUM_WRITE_OUTSTANDING => 16,
        MAX_READ_BURST_LENGTH => 16,
        MAX_WRITE_BURST_LENGTH => 16,
        USER_RFIFONUM_WIDTH => 9,
        C_M_AXI_ID_WIDTH => C_M_AXI_GMEM1_ID_WIDTH,
        C_M_AXI_ADDR_WIDTH => C_M_AXI_GMEM1_ADDR_WIDTH,
        C_M_AXI_DATA_WIDTH => C_M_AXI_GMEM1_DATA_WIDTH,
        C_M_AXI_AWUSER_WIDTH => C_M_AXI_GMEM1_AWUSER_WIDTH,
        C_M_AXI_ARUSER_WIDTH => C_M_AXI_GMEM1_ARUSER_WIDTH,
        C_M_AXI_WUSER_WIDTH => C_M_AXI_GMEM1_WUSER_WIDTH,
        C_M_AXI_RUSER_WIDTH => C_M_AXI_GMEM1_RUSER_WIDTH,
        C_M_AXI_BUSER_WIDTH => C_M_AXI_GMEM1_BUSER_WIDTH,
        C_USER_VALUE => C_M_AXI_GMEM1_USER_VALUE,
        C_PROT_VALUE => C_M_AXI_GMEM1_PROT_VALUE,
        C_CACHE_VALUE => C_M_AXI_GMEM1_CACHE_VALUE,
        USER_DW => 64,
        USER_AW => 64)
    port map (
        AWVALID => m_axi_gmem1_AWVALID,
        AWREADY => m_axi_gmem1_AWREADY,
        AWADDR => m_axi_gmem1_AWADDR,
        AWID => m_axi_gmem1_AWID,
        AWLEN => m_axi_gmem1_AWLEN,
        AWSIZE => m_axi_gmem1_AWSIZE,
        AWBURST => m_axi_gmem1_AWBURST,
        AWLOCK => m_axi_gmem1_AWLOCK,
        AWCACHE => m_axi_gmem1_AWCACHE,
        AWPROT => m_axi_gmem1_AWPROT,
        AWQOS => m_axi_gmem1_AWQOS,
        AWREGION => m_axi_gmem1_AWREGION,
        AWUSER => m_axi_gmem1_AWUSER,
        WVALID => m_axi_gmem1_WVALID,
        WREADY => m_axi_gmem1_WREADY,
        WDATA => m_axi_gmem1_WDATA,
        WSTRB => m_axi_gmem1_WSTRB,
        WLAST => m_axi_gmem1_WLAST,
        WID => m_axi_gmem1_WID,
        WUSER => m_axi_gmem1_WUSER,
        ARVALID => m_axi_gmem1_ARVALID,
        ARREADY => m_axi_gmem1_ARREADY,
        ARADDR => m_axi_gmem1_ARADDR,
        ARID => m_axi_gmem1_ARID,
        ARLEN => m_axi_gmem1_ARLEN,
        ARSIZE => m_axi_gmem1_ARSIZE,
        ARBURST => m_axi_gmem1_ARBURST,
        ARLOCK => m_axi_gmem1_ARLOCK,
        ARCACHE => m_axi_gmem1_ARCACHE,
        ARPROT => m_axi_gmem1_ARPROT,
        ARQOS => m_axi_gmem1_ARQOS,
        ARREGION => m_axi_gmem1_ARREGION,
        ARUSER => m_axi_gmem1_ARUSER,
        RVALID => m_axi_gmem1_RVALID,
        RREADY => m_axi_gmem1_RREADY,
        RDATA => m_axi_gmem1_RDATA,
        RLAST => m_axi_gmem1_RLAST,
        RID => m_axi_gmem1_RID,
        RUSER => m_axi_gmem1_RUSER,
        RRESP => m_axi_gmem1_RRESP,
        BVALID => m_axi_gmem1_BVALID,
        BREADY => m_axi_gmem1_BREADY,
        BRESP => m_axi_gmem1_BRESP,
        BID => m_axi_gmem1_BID,
        BUSER => m_axi_gmem1_BUSER,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        I_ARVALID => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARVALID,
        I_ARREADY => gmem1_ARREADY,
        I_ARADDR => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARADDR,
        I_ARLEN => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARLEN,
        I_RVALID => gmem1_RVALID,
        I_RREADY => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_RREADY,
        I_RDATA => gmem1_RDATA,
        I_RFIFONUM => gmem1_RFIFONUM,
        I_AWVALID => ap_const_logic_0,
        I_AWREADY => gmem1_AWREADY,
        I_AWADDR => ap_const_lv64_0,
        I_AWLEN => ap_const_lv32_0,
        I_WVALID => ap_const_logic_0,
        I_WREADY => gmem1_WREADY,
        I_WDATA => ap_const_lv64_0,
        I_WSTRB => ap_const_lv8_0,
        I_BVALID => gmem1_BVALID,
        I_BREADY => ap_const_logic_0);

    gmem2_m_axi_U : component pp_pipeline_accel_gmem2_m_axi
    generic map (
        CONSERVATIVE => 1,
        USER_MAXREQS => 69,
        NUM_READ_OUTSTANDING => 16,
        NUM_WRITE_OUTSTANDING => 16,
        MAX_READ_BURST_LENGTH => 16,
        MAX_WRITE_BURST_LENGTH => 16,
        USER_RFIFONUM_WIDTH => 9,
        C_M_AXI_ID_WIDTH => C_M_AXI_GMEM2_ID_WIDTH,
        C_M_AXI_ADDR_WIDTH => C_M_AXI_GMEM2_ADDR_WIDTH,
        C_M_AXI_DATA_WIDTH => C_M_AXI_GMEM2_DATA_WIDTH,
        C_M_AXI_AWUSER_WIDTH => C_M_AXI_GMEM2_AWUSER_WIDTH,
        C_M_AXI_ARUSER_WIDTH => C_M_AXI_GMEM2_ARUSER_WIDTH,
        C_M_AXI_WUSER_WIDTH => C_M_AXI_GMEM2_WUSER_WIDTH,
        C_M_AXI_RUSER_WIDTH => C_M_AXI_GMEM2_RUSER_WIDTH,
        C_M_AXI_BUSER_WIDTH => C_M_AXI_GMEM2_BUSER_WIDTH,
        C_USER_VALUE => C_M_AXI_GMEM2_USER_VALUE,
        C_PROT_VALUE => C_M_AXI_GMEM2_PROT_VALUE,
        C_CACHE_VALUE => C_M_AXI_GMEM2_CACHE_VALUE,
        USER_DW => 64,
        USER_AW => 64)
    port map (
        AWVALID => m_axi_gmem2_AWVALID,
        AWREADY => m_axi_gmem2_AWREADY,
        AWADDR => m_axi_gmem2_AWADDR,
        AWID => m_axi_gmem2_AWID,
        AWLEN => m_axi_gmem2_AWLEN,
        AWSIZE => m_axi_gmem2_AWSIZE,
        AWBURST => m_axi_gmem2_AWBURST,
        AWLOCK => m_axi_gmem2_AWLOCK,
        AWCACHE => m_axi_gmem2_AWCACHE,
        AWPROT => m_axi_gmem2_AWPROT,
        AWQOS => m_axi_gmem2_AWQOS,
        AWREGION => m_axi_gmem2_AWREGION,
        AWUSER => m_axi_gmem2_AWUSER,
        WVALID => m_axi_gmem2_WVALID,
        WREADY => m_axi_gmem2_WREADY,
        WDATA => m_axi_gmem2_WDATA,
        WSTRB => m_axi_gmem2_WSTRB,
        WLAST => m_axi_gmem2_WLAST,
        WID => m_axi_gmem2_WID,
        WUSER => m_axi_gmem2_WUSER,
        ARVALID => m_axi_gmem2_ARVALID,
        ARREADY => m_axi_gmem2_ARREADY,
        ARADDR => m_axi_gmem2_ARADDR,
        ARID => m_axi_gmem2_ARID,
        ARLEN => m_axi_gmem2_ARLEN,
        ARSIZE => m_axi_gmem2_ARSIZE,
        ARBURST => m_axi_gmem2_ARBURST,
        ARLOCK => m_axi_gmem2_ARLOCK,
        ARCACHE => m_axi_gmem2_ARCACHE,
        ARPROT => m_axi_gmem2_ARPROT,
        ARQOS => m_axi_gmem2_ARQOS,
        ARREGION => m_axi_gmem2_ARREGION,
        ARUSER => m_axi_gmem2_ARUSER,
        RVALID => m_axi_gmem2_RVALID,
        RREADY => m_axi_gmem2_RREADY,
        RDATA => m_axi_gmem2_RDATA,
        RLAST => m_axi_gmem2_RLAST,
        RID => m_axi_gmem2_RID,
        RUSER => m_axi_gmem2_RUSER,
        RRESP => m_axi_gmem2_RRESP,
        BVALID => m_axi_gmem2_BVALID,
        BREADY => m_axi_gmem2_BREADY,
        BRESP => m_axi_gmem2_BRESP,
        BID => m_axi_gmem2_BID,
        BUSER => m_axi_gmem2_BUSER,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        I_ARVALID => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARVALID,
        I_ARREADY => gmem2_ARREADY,
        I_ARADDR => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARADDR,
        I_ARLEN => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARLEN,
        I_RVALID => gmem2_RVALID,
        I_RREADY => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_RREADY,
        I_RDATA => gmem2_RDATA,
        I_RFIFONUM => gmem2_RFIFONUM,
        I_AWVALID => ap_const_logic_0,
        I_AWREADY => gmem2_AWREADY,
        I_AWADDR => ap_const_lv64_0,
        I_AWLEN => ap_const_lv32_0,
        I_WVALID => ap_const_logic_0,
        I_WREADY => gmem2_WREADY,
        I_WDATA => ap_const_lv64_0,
        I_WSTRB => ap_const_lv8_0,
        I_BVALID => gmem2_BVALID,
        I_BREADY => ap_const_logic_0);

    gmem3_m_axi_U : component pp_pipeline_accel_gmem3_m_axi
    generic map (
        CONSERVATIVE => 1,
        USER_MAXREQS => 69,
        NUM_READ_OUTSTANDING => 16,
        NUM_WRITE_OUTSTANDING => 16,
        MAX_READ_BURST_LENGTH => 16,
        MAX_WRITE_BURST_LENGTH => 16,
        USER_RFIFONUM_WIDTH => 9,
        C_M_AXI_ID_WIDTH => C_M_AXI_GMEM3_ID_WIDTH,
        C_M_AXI_ADDR_WIDTH => C_M_AXI_GMEM3_ADDR_WIDTH,
        C_M_AXI_DATA_WIDTH => C_M_AXI_GMEM3_DATA_WIDTH,
        C_M_AXI_AWUSER_WIDTH => C_M_AXI_GMEM3_AWUSER_WIDTH,
        C_M_AXI_ARUSER_WIDTH => C_M_AXI_GMEM3_ARUSER_WIDTH,
        C_M_AXI_WUSER_WIDTH => C_M_AXI_GMEM3_WUSER_WIDTH,
        C_M_AXI_RUSER_WIDTH => C_M_AXI_GMEM3_RUSER_WIDTH,
        C_M_AXI_BUSER_WIDTH => C_M_AXI_GMEM3_BUSER_WIDTH,
        C_USER_VALUE => C_M_AXI_GMEM3_USER_VALUE,
        C_PROT_VALUE => C_M_AXI_GMEM3_PROT_VALUE,
        C_CACHE_VALUE => C_M_AXI_GMEM3_CACHE_VALUE,
        USER_DW => 64,
        USER_AW => 64)
    port map (
        AWVALID => m_axi_gmem3_AWVALID,
        AWREADY => m_axi_gmem3_AWREADY,
        AWADDR => m_axi_gmem3_AWADDR,
        AWID => m_axi_gmem3_AWID,
        AWLEN => m_axi_gmem3_AWLEN,
        AWSIZE => m_axi_gmem3_AWSIZE,
        AWBURST => m_axi_gmem3_AWBURST,
        AWLOCK => m_axi_gmem3_AWLOCK,
        AWCACHE => m_axi_gmem3_AWCACHE,
        AWPROT => m_axi_gmem3_AWPROT,
        AWQOS => m_axi_gmem3_AWQOS,
        AWREGION => m_axi_gmem3_AWREGION,
        AWUSER => m_axi_gmem3_AWUSER,
        WVALID => m_axi_gmem3_WVALID,
        WREADY => m_axi_gmem3_WREADY,
        WDATA => m_axi_gmem3_WDATA,
        WSTRB => m_axi_gmem3_WSTRB,
        WLAST => m_axi_gmem3_WLAST,
        WID => m_axi_gmem3_WID,
        WUSER => m_axi_gmem3_WUSER,
        ARVALID => m_axi_gmem3_ARVALID,
        ARREADY => m_axi_gmem3_ARREADY,
        ARADDR => m_axi_gmem3_ARADDR,
        ARID => m_axi_gmem3_ARID,
        ARLEN => m_axi_gmem3_ARLEN,
        ARSIZE => m_axi_gmem3_ARSIZE,
        ARBURST => m_axi_gmem3_ARBURST,
        ARLOCK => m_axi_gmem3_ARLOCK,
        ARCACHE => m_axi_gmem3_ARCACHE,
        ARPROT => m_axi_gmem3_ARPROT,
        ARQOS => m_axi_gmem3_ARQOS,
        ARREGION => m_axi_gmem3_ARREGION,
        ARUSER => m_axi_gmem3_ARUSER,
        RVALID => m_axi_gmem3_RVALID,
        RREADY => m_axi_gmem3_RREADY,
        RDATA => m_axi_gmem3_RDATA,
        RLAST => m_axi_gmem3_RLAST,
        RID => m_axi_gmem3_RID,
        RUSER => m_axi_gmem3_RUSER,
        RRESP => m_axi_gmem3_RRESP,
        BVALID => m_axi_gmem3_BVALID,
        BREADY => m_axi_gmem3_BREADY,
        BRESP => m_axi_gmem3_BRESP,
        BID => m_axi_gmem3_BID,
        BUSER => m_axi_gmem3_BUSER,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        I_ARVALID => ap_const_logic_0,
        I_ARREADY => gmem3_ARREADY,
        I_ARADDR => ap_const_lv64_0,
        I_ARLEN => ap_const_lv32_0,
        I_RVALID => gmem3_RVALID,
        I_RREADY => ap_const_logic_0,
        I_RDATA => gmem3_RDATA,
        I_RFIFONUM => gmem3_RFIFONUM,
        I_AWVALID => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWVALID,
        I_AWREADY => gmem3_AWREADY,
        I_AWADDR => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWADDR,
        I_AWLEN => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWLEN,
        I_WVALID => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WVALID,
        I_WREADY => gmem3_WREADY,
        I_WDATA => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WDATA,
        I_WSTRB => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WSTRB,
        I_BVALID => gmem3_BVALID,
        I_BREADY => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_BREADY);

    gmem4_m_axi_U : component pp_pipeline_accel_gmem4_m_axi
    generic map (
        CONSERVATIVE => 1,
        USER_MAXREQS => 69,
        NUM_READ_OUTSTANDING => 16,
        NUM_WRITE_OUTSTANDING => 16,
        MAX_READ_BURST_LENGTH => 16,
        MAX_WRITE_BURST_LENGTH => 16,
        USER_RFIFONUM_WIDTH => 9,
        C_M_AXI_ID_WIDTH => C_M_AXI_GMEM4_ID_WIDTH,
        C_M_AXI_ADDR_WIDTH => C_M_AXI_GMEM4_ADDR_WIDTH,
        C_M_AXI_DATA_WIDTH => C_M_AXI_GMEM4_DATA_WIDTH,
        C_M_AXI_AWUSER_WIDTH => C_M_AXI_GMEM4_AWUSER_WIDTH,
        C_M_AXI_ARUSER_WIDTH => C_M_AXI_GMEM4_ARUSER_WIDTH,
        C_M_AXI_WUSER_WIDTH => C_M_AXI_GMEM4_WUSER_WIDTH,
        C_M_AXI_RUSER_WIDTH => C_M_AXI_GMEM4_RUSER_WIDTH,
        C_M_AXI_BUSER_WIDTH => C_M_AXI_GMEM4_BUSER_WIDTH,
        C_USER_VALUE => C_M_AXI_GMEM4_USER_VALUE,
        C_PROT_VALUE => C_M_AXI_GMEM4_PROT_VALUE,
        C_CACHE_VALUE => C_M_AXI_GMEM4_CACHE_VALUE,
        USER_DW => 64,
        USER_AW => 64)
    port map (
        AWVALID => m_axi_gmem4_AWVALID,
        AWREADY => m_axi_gmem4_AWREADY,
        AWADDR => m_axi_gmem4_AWADDR,
        AWID => m_axi_gmem4_AWID,
        AWLEN => m_axi_gmem4_AWLEN,
        AWSIZE => m_axi_gmem4_AWSIZE,
        AWBURST => m_axi_gmem4_AWBURST,
        AWLOCK => m_axi_gmem4_AWLOCK,
        AWCACHE => m_axi_gmem4_AWCACHE,
        AWPROT => m_axi_gmem4_AWPROT,
        AWQOS => m_axi_gmem4_AWQOS,
        AWREGION => m_axi_gmem4_AWREGION,
        AWUSER => m_axi_gmem4_AWUSER,
        WVALID => m_axi_gmem4_WVALID,
        WREADY => m_axi_gmem4_WREADY,
        WDATA => m_axi_gmem4_WDATA,
        WSTRB => m_axi_gmem4_WSTRB,
        WLAST => m_axi_gmem4_WLAST,
        WID => m_axi_gmem4_WID,
        WUSER => m_axi_gmem4_WUSER,
        ARVALID => m_axi_gmem4_ARVALID,
        ARREADY => m_axi_gmem4_ARREADY,
        ARADDR => m_axi_gmem4_ARADDR,
        ARID => m_axi_gmem4_ARID,
        ARLEN => m_axi_gmem4_ARLEN,
        ARSIZE => m_axi_gmem4_ARSIZE,
        ARBURST => m_axi_gmem4_ARBURST,
        ARLOCK => m_axi_gmem4_ARLOCK,
        ARCACHE => m_axi_gmem4_ARCACHE,
        ARPROT => m_axi_gmem4_ARPROT,
        ARQOS => m_axi_gmem4_ARQOS,
        ARREGION => m_axi_gmem4_ARREGION,
        ARUSER => m_axi_gmem4_ARUSER,
        RVALID => m_axi_gmem4_RVALID,
        RREADY => m_axi_gmem4_RREADY,
        RDATA => m_axi_gmem4_RDATA,
        RLAST => m_axi_gmem4_RLAST,
        RID => m_axi_gmem4_RID,
        RUSER => m_axi_gmem4_RUSER,
        RRESP => m_axi_gmem4_RRESP,
        BVALID => m_axi_gmem4_BVALID,
        BREADY => m_axi_gmem4_BREADY,
        BRESP => m_axi_gmem4_BRESP,
        BID => m_axi_gmem4_BID,
        BUSER => m_axi_gmem4_BUSER,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        I_ARVALID => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARVALID,
        I_ARREADY => gmem4_ARREADY,
        I_ARADDR => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARADDR,
        I_ARLEN => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARLEN,
        I_RVALID => gmem4_RVALID,
        I_RREADY => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_RREADY,
        I_RDATA => gmem4_RDATA,
        I_RFIFONUM => gmem4_RFIFONUM,
        I_AWVALID => ap_const_logic_0,
        I_AWREADY => gmem4_AWREADY,
        I_AWADDR => ap_const_lv64_0,
        I_AWLEN => ap_const_lv32_0,
        I_WVALID => ap_const_logic_0,
        I_WREADY => gmem4_WREADY,
        I_WDATA => ap_const_lv64_0,
        I_WSTRB => ap_const_lv8_0,
        I_BVALID => gmem4_BVALID,
        I_BREADY => ap_const_logic_0);

    entry_proc11_U0 : component pp_pipeline_accel_entry_proc11
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => entry_proc11_U0_ap_start,
        ap_done => entry_proc11_U0_ap_done,
        ap_continue => entry_proc11_U0_ap_continue,
        ap_idle => entry_proc11_U0_ap_idle,
        ap_ready => entry_proc11_U0_ap_ready,
        img_out => img_out,
        img_out_c_din => entry_proc11_U0_img_out_c_din,
        img_out_c_num_data_valid => img_out_c_num_data_valid,
        img_out_c_fifo_cap => img_out_c_fifo_cap,
        img_out_c_full_n => img_out_c_full_n,
        img_out_c_write => entry_proc11_U0_img_out_c_write,
        out_img_linestride => out_img_linestride,
        out_img_linestride_c_din => entry_proc11_U0_out_img_linestride_c_din,
        out_img_linestride_c_num_data_valid => out_img_linestride_c_num_data_valid,
        out_img_linestride_c_fifo_cap => out_img_linestride_c_fifo_cap,
        out_img_linestride_c_full_n => out_img_linestride_c_full_n,
        out_img_linestride_c_write => entry_proc11_U0_out_img_linestride_c_write);

    Block_entry20_proc_U0 : component pp_pipeline_accel_Block_entry20_proc
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => Block_entry20_proc_U0_ap_start,
        ap_done => Block_entry20_proc_U0_ap_done,
        ap_continue => Block_entry20_proc_U0_ap_continue,
        ap_idle => Block_entry20_proc_U0_ap_idle,
        ap_ready => Block_entry20_proc_U0_ap_ready,
        in_img_height => in_img_height,
        in_img_width => in_img_width,
        out_img_height => out_img_height,
        out_img_width => out_img_width,
        ap_return_0 => Block_entry20_proc_U0_ap_return_0,
        ap_return_1 => Block_entry20_proc_U0_ap_return_1,
        ap_return_2 => Block_entry20_proc_U0_ap_return_2,
        ap_return_3 => Block_entry20_proc_U0_ap_return_3,
        ap_return_4 => Block_entry20_proc_U0_ap_return_4,
        ap_return_5 => Block_entry20_proc_U0_ap_return_5,
        ap_return_6 => Block_entry20_proc_U0_ap_return_6,
        ap_return_7 => Block_entry20_proc_U0_ap_return_7,
        ap_return_8 => Block_entry20_proc_U0_ap_return_8,
        ap_return_9 => Block_entry20_proc_U0_ap_return_9);

    Array2xfMat_64_0_2160_3840_1_U0 : component pp_pipeline_accel_Array2xfMat_64_0_2160_3840_1_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => Array2xfMat_64_0_2160_3840_1_U0_ap_start,
        start_full_n => start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_full_n,
        ap_done => Array2xfMat_64_0_2160_3840_1_U0_ap_done,
        ap_continue => Array2xfMat_64_0_2160_3840_1_U0_ap_continue,
        ap_idle => Array2xfMat_64_0_2160_3840_1_U0_ap_idle,
        ap_ready => Array2xfMat_64_0_2160_3840_1_U0_ap_ready,
        start_out => Array2xfMat_64_0_2160_3840_1_U0_start_out,
        start_write => Array2xfMat_64_0_2160_3840_1_U0_start_write,
        m_axi_gmem1_AWVALID => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWVALID,
        m_axi_gmem1_AWREADY => ap_const_logic_0,
        m_axi_gmem1_AWADDR => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWADDR,
        m_axi_gmem1_AWID => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWID,
        m_axi_gmem1_AWLEN => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWLEN,
        m_axi_gmem1_AWSIZE => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWSIZE,
        m_axi_gmem1_AWBURST => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWBURST,
        m_axi_gmem1_AWLOCK => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWLOCK,
        m_axi_gmem1_AWCACHE => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWCACHE,
        m_axi_gmem1_AWPROT => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWPROT,
        m_axi_gmem1_AWQOS => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWQOS,
        m_axi_gmem1_AWREGION => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWREGION,
        m_axi_gmem1_AWUSER => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_AWUSER,
        m_axi_gmem1_WVALID => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WVALID,
        m_axi_gmem1_WREADY => ap_const_logic_0,
        m_axi_gmem1_WDATA => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WDATA,
        m_axi_gmem1_WSTRB => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WSTRB,
        m_axi_gmem1_WLAST => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WLAST,
        m_axi_gmem1_WID => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WID,
        m_axi_gmem1_WUSER => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_WUSER,
        m_axi_gmem1_ARVALID => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARVALID,
        m_axi_gmem1_ARREADY => gmem1_ARREADY,
        m_axi_gmem1_ARADDR => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARADDR,
        m_axi_gmem1_ARID => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARID,
        m_axi_gmem1_ARLEN => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARLEN,
        m_axi_gmem1_ARSIZE => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARSIZE,
        m_axi_gmem1_ARBURST => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARBURST,
        m_axi_gmem1_ARLOCK => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARLOCK,
        m_axi_gmem1_ARCACHE => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARCACHE,
        m_axi_gmem1_ARPROT => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARPROT,
        m_axi_gmem1_ARQOS => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARQOS,
        m_axi_gmem1_ARREGION => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARREGION,
        m_axi_gmem1_ARUSER => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_ARUSER,
        m_axi_gmem1_RVALID => gmem1_RVALID,
        m_axi_gmem1_RREADY => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_RREADY,
        m_axi_gmem1_RDATA => gmem1_RDATA,
        m_axi_gmem1_RLAST => gmem1_RLAST,
        m_axi_gmem1_RID => gmem1_RID,
        m_axi_gmem1_RFIFONUM => gmem1_RFIFONUM,
        m_axi_gmem1_RUSER => gmem1_RUSER,
        m_axi_gmem1_RRESP => gmem1_RRESP,
        m_axi_gmem1_BVALID => ap_const_logic_0,
        m_axi_gmem1_BREADY => Array2xfMat_64_0_2160_3840_1_U0_m_axi_gmem1_BREADY,
        m_axi_gmem1_BRESP => ap_const_lv2_0,
        m_axi_gmem1_BID => ap_const_lv1_0,
        m_axi_gmem1_BUSER => ap_const_lv1_0,
        srcPtr => img_inp_y,
        p_read => imgInput_y_rows_c36_channel_dout,
        p_read1 => imgInput_y_cols_c37_channel_dout,
        imgInput_y_data81_din => Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_data81_din,
        imgInput_y_data81_num_data_valid => imgInput_y_data_num_data_valid,
        imgInput_y_data81_fifo_cap => imgInput_y_data_fifo_cap,
        imgInput_y_data81_full_n => imgInput_y_data_full_n,
        imgInput_y_data81_write => Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_data81_write,
        stride => in_img_linestride,
        imgInput_y_rows_c_din => Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_rows_c_din,
        imgInput_y_rows_c_num_data_valid => imgInput_y_rows_c_num_data_valid,
        imgInput_y_rows_c_fifo_cap => imgInput_y_rows_c_fifo_cap,
        imgInput_y_rows_c_full_n => imgInput_y_rows_c_full_n,
        imgInput_y_rows_c_write => Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_rows_c_write,
        imgInput_y_cols_c_din => Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_cols_c_din,
        imgInput_y_cols_c_num_data_valid => imgInput_y_cols_c_num_data_valid,
        imgInput_y_cols_c_fifo_cap => imgInput_y_cols_c_fifo_cap,
        imgInput_y_cols_c_full_n => imgInput_y_cols_c_full_n,
        imgInput_y_cols_c_write => Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_cols_c_write);

    Block_entry2022_proc_U0 : component pp_pipeline_accel_Block_entry2022_proc
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => Block_entry2022_proc_U0_ap_start,
        ap_done => Block_entry2022_proc_U0_ap_done,
        ap_continue => Block_entry2022_proc_U0_ap_continue,
        ap_idle => Block_entry2022_proc_U0_ap_idle,
        ap_ready => Block_entry2022_proc_U0_ap_ready,
        in_img_linestride => in_img_linestride,
        ap_return => Block_entry2022_proc_U0_ap_return);

    Array2xfMat_64_6_1080_1920_1_U0 : component pp_pipeline_accel_Array2xfMat_64_6_1080_1920_1_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => Array2xfMat_64_6_1080_1920_1_U0_ap_start,
        ap_done => Array2xfMat_64_6_1080_1920_1_U0_ap_done,
        ap_continue => Array2xfMat_64_6_1080_1920_1_U0_ap_continue,
        ap_idle => Array2xfMat_64_6_1080_1920_1_U0_ap_idle,
        ap_ready => Array2xfMat_64_6_1080_1920_1_U0_ap_ready,
        m_axi_gmem2_AWVALID => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWVALID,
        m_axi_gmem2_AWREADY => ap_const_logic_0,
        m_axi_gmem2_AWADDR => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWADDR,
        m_axi_gmem2_AWID => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWID,
        m_axi_gmem2_AWLEN => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWLEN,
        m_axi_gmem2_AWSIZE => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWSIZE,
        m_axi_gmem2_AWBURST => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWBURST,
        m_axi_gmem2_AWLOCK => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWLOCK,
        m_axi_gmem2_AWCACHE => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWCACHE,
        m_axi_gmem2_AWPROT => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWPROT,
        m_axi_gmem2_AWQOS => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWQOS,
        m_axi_gmem2_AWREGION => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWREGION,
        m_axi_gmem2_AWUSER => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_AWUSER,
        m_axi_gmem2_WVALID => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WVALID,
        m_axi_gmem2_WREADY => ap_const_logic_0,
        m_axi_gmem2_WDATA => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WDATA,
        m_axi_gmem2_WSTRB => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WSTRB,
        m_axi_gmem2_WLAST => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WLAST,
        m_axi_gmem2_WID => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WID,
        m_axi_gmem2_WUSER => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_WUSER,
        m_axi_gmem2_ARVALID => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARVALID,
        m_axi_gmem2_ARREADY => gmem2_ARREADY,
        m_axi_gmem2_ARADDR => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARADDR,
        m_axi_gmem2_ARID => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARID,
        m_axi_gmem2_ARLEN => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARLEN,
        m_axi_gmem2_ARSIZE => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARSIZE,
        m_axi_gmem2_ARBURST => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARBURST,
        m_axi_gmem2_ARLOCK => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARLOCK,
        m_axi_gmem2_ARCACHE => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARCACHE,
        m_axi_gmem2_ARPROT => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARPROT,
        m_axi_gmem2_ARQOS => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARQOS,
        m_axi_gmem2_ARREGION => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARREGION,
        m_axi_gmem2_ARUSER => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_ARUSER,
        m_axi_gmem2_RVALID => gmem2_RVALID,
        m_axi_gmem2_RREADY => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_RREADY,
        m_axi_gmem2_RDATA => gmem2_RDATA,
        m_axi_gmem2_RLAST => gmem2_RLAST,
        m_axi_gmem2_RID => gmem2_RID,
        m_axi_gmem2_RFIFONUM => gmem2_RFIFONUM,
        m_axi_gmem2_RUSER => gmem2_RUSER,
        m_axi_gmem2_RRESP => gmem2_RRESP,
        m_axi_gmem2_BVALID => ap_const_logic_0,
        m_axi_gmem2_BREADY => Array2xfMat_64_6_1080_1920_1_U0_m_axi_gmem2_BREADY,
        m_axi_gmem2_BRESP => ap_const_lv2_0,
        m_axi_gmem2_BID => ap_const_lv1_0,
        m_axi_gmem2_BUSER => ap_const_lv1_0,
        img_inp_uv => img_inp_uv,
        p_read => imgInput_uv_rows_channel_dout,
        p_read1 => imgInput_uv_cols_channel_dout,
        imgInput_uv_data_din => Array2xfMat_64_6_1080_1920_1_U0_imgInput_uv_data_din,
        imgInput_uv_data_num_data_valid => imgInput_uv_data_num_data_valid,
        imgInput_uv_data_fifo_cap => imgInput_uv_data_fifo_cap,
        imgInput_uv_data_full_n => imgInput_uv_data_full_n,
        imgInput_uv_data_write => Array2xfMat_64_6_1080_1920_1_U0_imgInput_uv_data_write,
        p_read2 => select_ln59_loc_channel_dout);

    nv122bgr_0_6_9_2160_3840_1_1_U0 : component pp_pipeline_accel_nv122bgr_0_6_9_2160_3840_1_1_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => nv122bgr_0_6_9_2160_3840_1_1_U0_ap_start,
        ap_done => nv122bgr_0_6_9_2160_3840_1_1_U0_ap_done,
        ap_continue => nv122bgr_0_6_9_2160_3840_1_1_U0_ap_continue,
        ap_idle => nv122bgr_0_6_9_2160_3840_1_1_U0_ap_idle,
        ap_ready => nv122bgr_0_6_9_2160_3840_1_1_U0_ap_ready,
        src_y_rows_dout => imgInput_y_rows_c_dout,
        src_y_rows_num_data_valid => imgInput_y_rows_c_num_data_valid,
        src_y_rows_fifo_cap => imgInput_y_rows_c_fifo_cap,
        src_y_rows_empty_n => imgInput_y_rows_c_empty_n,
        src_y_rows_read => nv122bgr_0_6_9_2160_3840_1_1_U0_src_y_rows_read,
        src_y_cols_dout => imgInput_y_cols_c_dout,
        src_y_cols_num_data_valid => imgInput_y_cols_c_num_data_valid,
        src_y_cols_fifo_cap => imgInput_y_cols_c_fifo_cap,
        src_y_cols_empty_n => imgInput_y_cols_c_empty_n,
        src_y_cols_read => nv122bgr_0_6_9_2160_3840_1_1_U0_src_y_cols_read,
        imgInput_y_data81_dout => imgInput_y_data_dout,
        imgInput_y_data81_num_data_valid => imgInput_y_data_num_data_valid,
        imgInput_y_data81_fifo_cap => imgInput_y_data_fifo_cap,
        imgInput_y_data81_empty_n => imgInput_y_data_empty_n,
        imgInput_y_data81_read => nv122bgr_0_6_9_2160_3840_1_1_U0_imgInput_y_data81_read,
        imgInput_uv_data82_dout => imgInput_uv_data_dout,
        imgInput_uv_data82_num_data_valid => imgInput_uv_data_num_data_valid,
        imgInput_uv_data82_fifo_cap => imgInput_uv_data_fifo_cap,
        imgInput_uv_data82_empty_n => imgInput_uv_data_empty_n,
        imgInput_uv_data82_read => nv122bgr_0_6_9_2160_3840_1_1_U0_imgInput_uv_data82_read,
        rgb_mat_data83_din => nv122bgr_0_6_9_2160_3840_1_1_U0_rgb_mat_data83_din,
        rgb_mat_data83_num_data_valid => rgb_mat_data_num_data_valid,
        rgb_mat_data83_fifo_cap => rgb_mat_data_fifo_cap,
        rgb_mat_data83_full_n => rgb_mat_data_full_n,
        rgb_mat_data83_write => nv122bgr_0_6_9_2160_3840_1_1_U0_rgb_mat_data83_write);

    resize_1_9_2160_3840_720_720_1_9_U0 : component pp_pipeline_accel_resize_1_9_2160_3840_720_720_1_9_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => resize_1_9_2160_3840_720_720_1_9_U0_ap_start,
        ap_done => resize_1_9_2160_3840_720_720_1_9_U0_ap_done,
        ap_continue => resize_1_9_2160_3840_720_720_1_9_U0_ap_continue,
        ap_idle => resize_1_9_2160_3840_720_720_1_9_U0_ap_idle,
        ap_ready => resize_1_9_2160_3840_720_720_1_9_U0_ap_ready,
        p_read => rgb_mat_rows_channel_dout,
        p_read1 => rgb_mat_cols_channel_dout,
        rgb_mat_data83_dout => rgb_mat_data_dout,
        rgb_mat_data83_num_data_valid => rgb_mat_data_num_data_valid,
        rgb_mat_data83_fifo_cap => rgb_mat_data_fifo_cap,
        rgb_mat_data83_empty_n => rgb_mat_data_empty_n,
        rgb_mat_data83_read => resize_1_9_2160_3840_720_720_1_9_U0_rgb_mat_data83_read,
        p_read2 => resize_out_mat_rows_c38_channel_dout,
        p_read3 => resize_out_mat_cols_c39_channel_dout,
        resize_out_mat_data84_din => resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_data84_din,
        resize_out_mat_data84_num_data_valid => resize_out_mat_data_num_data_valid,
        resize_out_mat_data84_fifo_cap => resize_out_mat_data_fifo_cap,
        resize_out_mat_data84_full_n => resize_out_mat_data_full_n,
        resize_out_mat_data84_write => resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_data84_write,
        resize_out_mat_rows_c_din => resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_rows_c_din,
        resize_out_mat_rows_c_num_data_valid => resize_out_mat_rows_c_num_data_valid,
        resize_out_mat_rows_c_fifo_cap => resize_out_mat_rows_c_fifo_cap,
        resize_out_mat_rows_c_full_n => resize_out_mat_rows_c_full_n,
        resize_out_mat_rows_c_write => resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_rows_c_write,
        resize_out_mat_cols_c_din => resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_cols_c_din,
        resize_out_mat_cols_c_num_data_valid => resize_out_mat_cols_c_num_data_valid,
        resize_out_mat_cols_c_fifo_cap => resize_out_mat_cols_c_fifo_cap,
        resize_out_mat_cols_c_full_n => resize_out_mat_cols_c_full_n,
        resize_out_mat_cols_c_write => resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_cols_c_write);

    preProcess_9_9_720_720_1_8_8_8_4_8_8_U0 : component pp_pipeline_accel_preProcess_9_9_720_720_1_8_8_8_4_8_8_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_start,
        ap_done => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_done,
        ap_continue => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_continue,
        ap_idle => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_idle,
        ap_ready => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready,
        in_mat_rows_dout => resize_out_mat_rows_c_dout,
        in_mat_rows_num_data_valid => resize_out_mat_rows_c_num_data_valid,
        in_mat_rows_fifo_cap => resize_out_mat_rows_c_fifo_cap,
        in_mat_rows_empty_n => resize_out_mat_rows_c_empty_n,
        in_mat_rows_read => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_in_mat_rows_read,
        in_mat_cols_dout => resize_out_mat_cols_c_dout,
        in_mat_cols_num_data_valid => resize_out_mat_cols_c_num_data_valid,
        in_mat_cols_fifo_cap => resize_out_mat_cols_c_fifo_cap,
        in_mat_cols_empty_n => resize_out_mat_cols_c_empty_n,
        in_mat_cols_read => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_in_mat_cols_read,
        resize_out_mat_data84_dout => resize_out_mat_data_dout,
        resize_out_mat_data84_num_data_valid => resize_out_mat_data_num_data_valid,
        resize_out_mat_data84_fifo_cap => resize_out_mat_data_fifo_cap,
        resize_out_mat_data84_empty_n => resize_out_mat_data_empty_n,
        resize_out_mat_data84_read => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_resize_out_mat_data84_read,
        out_mat_data85_din => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_out_mat_data85_din,
        out_mat_data85_num_data_valid => out_mat_data_num_data_valid,
        out_mat_data85_fifo_cap => out_mat_data_fifo_cap,
        out_mat_data85_full_n => out_mat_data_full_n,
        out_mat_data85_write => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_out_mat_data85_write,
        m_axi_gmem4_AWVALID => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWVALID,
        m_axi_gmem4_AWREADY => ap_const_logic_0,
        m_axi_gmem4_AWADDR => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWADDR,
        m_axi_gmem4_AWID => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWID,
        m_axi_gmem4_AWLEN => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWLEN,
        m_axi_gmem4_AWSIZE => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWSIZE,
        m_axi_gmem4_AWBURST => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWBURST,
        m_axi_gmem4_AWLOCK => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWLOCK,
        m_axi_gmem4_AWCACHE => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWCACHE,
        m_axi_gmem4_AWPROT => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWPROT,
        m_axi_gmem4_AWQOS => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWQOS,
        m_axi_gmem4_AWREGION => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWREGION,
        m_axi_gmem4_AWUSER => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_AWUSER,
        m_axi_gmem4_WVALID => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WVALID,
        m_axi_gmem4_WREADY => ap_const_logic_0,
        m_axi_gmem4_WDATA => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WDATA,
        m_axi_gmem4_WSTRB => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WSTRB,
        m_axi_gmem4_WLAST => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WLAST,
        m_axi_gmem4_WID => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WID,
        m_axi_gmem4_WUSER => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_WUSER,
        m_axi_gmem4_ARVALID => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARVALID,
        m_axi_gmem4_ARREADY => gmem4_ARREADY,
        m_axi_gmem4_ARADDR => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARADDR,
        m_axi_gmem4_ARID => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARID,
        m_axi_gmem4_ARLEN => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARLEN,
        m_axi_gmem4_ARSIZE => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARSIZE,
        m_axi_gmem4_ARBURST => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARBURST,
        m_axi_gmem4_ARLOCK => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARLOCK,
        m_axi_gmem4_ARCACHE => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARCACHE,
        m_axi_gmem4_ARPROT => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARPROT,
        m_axi_gmem4_ARQOS => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARQOS,
        m_axi_gmem4_ARREGION => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARREGION,
        m_axi_gmem4_ARUSER => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_ARUSER,
        m_axi_gmem4_RVALID => gmem4_RVALID,
        m_axi_gmem4_RREADY => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_RREADY,
        m_axi_gmem4_RDATA => gmem4_RDATA,
        m_axi_gmem4_RLAST => gmem4_RLAST,
        m_axi_gmem4_RID => gmem4_RID,
        m_axi_gmem4_RFIFONUM => gmem4_RFIFONUM,
        m_axi_gmem4_RUSER => gmem4_RUSER,
        m_axi_gmem4_RRESP => gmem4_RRESP,
        m_axi_gmem4_BVALID => ap_const_logic_0,
        m_axi_gmem4_BREADY => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_m_axi_gmem4_BREADY,
        m_axi_gmem4_BRESP => ap_const_lv2_0,
        m_axi_gmem4_BID => ap_const_lv1_0,
        m_axi_gmem4_BUSER => ap_const_lv1_0,
        params => params);

    xfMat2Array_64_9_720_720_1_1_U0 : component pp_pipeline_accel_xfMat2Array_64_9_720_720_1_1_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => xfMat2Array_64_9_720_720_1_1_U0_ap_start,
        ap_done => xfMat2Array_64_9_720_720_1_1_U0_ap_done,
        ap_continue => xfMat2Array_64_9_720_720_1_1_U0_ap_continue,
        ap_idle => xfMat2Array_64_9_720_720_1_1_U0_ap_idle,
        ap_ready => xfMat2Array_64_9_720_720_1_1_U0_ap_ready,
        p_read => out_mat_rows_channel_dout,
        p_read1 => out_mat_cols_channel_dout,
        out_mat_data85_dout => out_mat_data_dout,
        out_mat_data85_num_data_valid => out_mat_data_num_data_valid,
        out_mat_data85_fifo_cap => out_mat_data_fifo_cap,
        out_mat_data85_empty_n => out_mat_data_empty_n,
        out_mat_data85_read => xfMat2Array_64_9_720_720_1_1_U0_out_mat_data85_read,
        m_axi_gmem3_AWVALID => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWVALID,
        m_axi_gmem3_AWREADY => gmem3_AWREADY,
        m_axi_gmem3_AWADDR => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWADDR,
        m_axi_gmem3_AWID => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWID,
        m_axi_gmem3_AWLEN => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWLEN,
        m_axi_gmem3_AWSIZE => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWSIZE,
        m_axi_gmem3_AWBURST => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWBURST,
        m_axi_gmem3_AWLOCK => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWLOCK,
        m_axi_gmem3_AWCACHE => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWCACHE,
        m_axi_gmem3_AWPROT => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWPROT,
        m_axi_gmem3_AWQOS => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWQOS,
        m_axi_gmem3_AWREGION => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWREGION,
        m_axi_gmem3_AWUSER => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_AWUSER,
        m_axi_gmem3_WVALID => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WVALID,
        m_axi_gmem3_WREADY => gmem3_WREADY,
        m_axi_gmem3_WDATA => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WDATA,
        m_axi_gmem3_WSTRB => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WSTRB,
        m_axi_gmem3_WLAST => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WLAST,
        m_axi_gmem3_WID => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WID,
        m_axi_gmem3_WUSER => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_WUSER,
        m_axi_gmem3_ARVALID => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARVALID,
        m_axi_gmem3_ARREADY => ap_const_logic_0,
        m_axi_gmem3_ARADDR => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARADDR,
        m_axi_gmem3_ARID => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARID,
        m_axi_gmem3_ARLEN => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARLEN,
        m_axi_gmem3_ARSIZE => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARSIZE,
        m_axi_gmem3_ARBURST => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARBURST,
        m_axi_gmem3_ARLOCK => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARLOCK,
        m_axi_gmem3_ARCACHE => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARCACHE,
        m_axi_gmem3_ARPROT => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARPROT,
        m_axi_gmem3_ARQOS => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARQOS,
        m_axi_gmem3_ARREGION => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARREGION,
        m_axi_gmem3_ARUSER => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_ARUSER,
        m_axi_gmem3_RVALID => ap_const_logic_0,
        m_axi_gmem3_RREADY => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_RREADY,
        m_axi_gmem3_RDATA => ap_const_lv64_0,
        m_axi_gmem3_RLAST => ap_const_logic_0,
        m_axi_gmem3_RID => ap_const_lv1_0,
        m_axi_gmem3_RFIFONUM => ap_const_lv9_0,
        m_axi_gmem3_RUSER => ap_const_lv1_0,
        m_axi_gmem3_RRESP => ap_const_lv2_0,
        m_axi_gmem3_BVALID => gmem3_BVALID,
        m_axi_gmem3_BREADY => xfMat2Array_64_9_720_720_1_1_U0_m_axi_gmem3_BREADY,
        m_axi_gmem3_BRESP => gmem3_BRESP,
        m_axi_gmem3_BID => gmem3_BID,
        m_axi_gmem3_BUSER => gmem3_BUSER,
        dstPtr_dout => img_out_c_dout,
        dstPtr_num_data_valid => img_out_c_num_data_valid,
        dstPtr_fifo_cap => img_out_c_fifo_cap,
        dstPtr_empty_n => img_out_c_empty_n,
        dstPtr_read => xfMat2Array_64_9_720_720_1_1_U0_dstPtr_read,
        stride_dout => out_img_linestride_c_dout,
        stride_num_data_valid => out_img_linestride_c_num_data_valid,
        stride_fifo_cap => out_img_linestride_c_fifo_cap,
        stride_empty_n => out_img_linestride_c_empty_n,
        stride_read => xfMat2Array_64_9_720_720_1_1_U0_stride_read);

    img_out_c_U : component pp_pipeline_accel_fifo_w64_d7_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => entry_proc11_U0_img_out_c_din,
        if_full_n => img_out_c_full_n,
        if_write => entry_proc11_U0_img_out_c_write,
        if_dout => img_out_c_dout,
        if_num_data_valid => img_out_c_num_data_valid,
        if_fifo_cap => img_out_c_fifo_cap,
        if_empty_n => img_out_c_empty_n,
        if_read => xfMat2Array_64_9_720_720_1_1_U0_dstPtr_read);

    out_img_linestride_c_U : component pp_pipeline_accel_fifo_w32_d7_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => entry_proc11_U0_out_img_linestride_c_din,
        if_full_n => out_img_linestride_c_full_n,
        if_write => entry_proc11_U0_out_img_linestride_c_write,
        if_dout => out_img_linestride_c_dout,
        if_num_data_valid => out_img_linestride_c_num_data_valid,
        if_fifo_cap => out_img_linestride_c_fifo_cap,
        if_empty_n => out_img_linestride_c_empty_n,
        if_read => xfMat2Array_64_9_720_720_1_1_U0_stride_read);

    imgInput_uv_rows_channel_U : component pp_pipeline_accel_fifo_w11_d2_S_x
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Block_entry20_proc_U0_ap_return_0,
        if_full_n => imgInput_uv_rows_channel_full_n,
        if_write => ap_channel_done_imgInput_uv_rows_channel,
        if_dout => imgInput_uv_rows_channel_dout,
        if_num_data_valid => imgInput_uv_rows_channel_num_data_valid,
        if_fifo_cap => imgInput_uv_rows_channel_fifo_cap,
        if_empty_n => imgInput_uv_rows_channel_empty_n,
        if_read => Array2xfMat_64_6_1080_1920_1_U0_ap_ready);

    imgInput_uv_cols_channel_U : component pp_pipeline_accel_fifo_w11_d2_S_x
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Block_entry20_proc_U0_ap_return_1,
        if_full_n => imgInput_uv_cols_channel_full_n,
        if_write => ap_channel_done_imgInput_uv_cols_channel,
        if_dout => imgInput_uv_cols_channel_dout,
        if_num_data_valid => imgInput_uv_cols_channel_num_data_valid,
        if_fifo_cap => imgInput_uv_cols_channel_fifo_cap,
        if_empty_n => imgInput_uv_cols_channel_empty_n,
        if_read => Array2xfMat_64_6_1080_1920_1_U0_ap_ready);

    rgb_mat_rows_channel_U : component pp_pipeline_accel_fifo_w32_d4_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Block_entry20_proc_U0_ap_return_2,
        if_full_n => rgb_mat_rows_channel_full_n,
        if_write => ap_channel_done_rgb_mat_rows_channel,
        if_dout => rgb_mat_rows_channel_dout,
        if_num_data_valid => rgb_mat_rows_channel_num_data_valid,
        if_fifo_cap => rgb_mat_rows_channel_fifo_cap,
        if_empty_n => rgb_mat_rows_channel_empty_n,
        if_read => resize_1_9_2160_3840_720_720_1_9_U0_ap_ready);

    rgb_mat_cols_channel_U : component pp_pipeline_accel_fifo_w32_d4_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Block_entry20_proc_U0_ap_return_3,
        if_full_n => rgb_mat_cols_channel_full_n,
        if_write => ap_channel_done_rgb_mat_cols_channel,
        if_dout => rgb_mat_cols_channel_dout,
        if_num_data_valid => rgb_mat_cols_channel_num_data_valid,
        if_fifo_cap => rgb_mat_cols_channel_fifo_cap,
        if_empty_n => rgb_mat_cols_channel_empty_n,
        if_read => resize_1_9_2160_3840_720_720_1_9_U0_ap_ready);

    out_mat_rows_channel_U : component pp_pipeline_accel_fifo_w32_d6_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Block_entry20_proc_U0_ap_return_4,
        if_full_n => out_mat_rows_channel_full_n,
        if_write => ap_channel_done_out_mat_rows_channel,
        if_dout => out_mat_rows_channel_dout,
        if_num_data_valid => out_mat_rows_channel_num_data_valid,
        if_fifo_cap => out_mat_rows_channel_fifo_cap,
        if_empty_n => out_mat_rows_channel_empty_n,
        if_read => xfMat2Array_64_9_720_720_1_1_U0_ap_ready);

    out_mat_cols_channel_U : component pp_pipeline_accel_fifo_w32_d6_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Block_entry20_proc_U0_ap_return_5,
        if_full_n => out_mat_cols_channel_full_n,
        if_write => ap_channel_done_out_mat_cols_channel,
        if_dout => out_mat_cols_channel_dout,
        if_num_data_valid => out_mat_cols_channel_num_data_valid,
        if_fifo_cap => out_mat_cols_channel_fifo_cap,
        if_empty_n => out_mat_cols_channel_empty_n,
        if_read => xfMat2Array_64_9_720_720_1_1_U0_ap_ready);

    imgInput_y_rows_c36_channel_U : component pp_pipeline_accel_fifo_w32_d2_S_x
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Block_entry20_proc_U0_ap_return_6,
        if_full_n => imgInput_y_rows_c36_channel_full_n,
        if_write => ap_channel_done_imgInput_y_rows_c36_channel,
        if_dout => imgInput_y_rows_c36_channel_dout,
        if_num_data_valid => imgInput_y_rows_c36_channel_num_data_valid,
        if_fifo_cap => imgInput_y_rows_c36_channel_fifo_cap,
        if_empty_n => imgInput_y_rows_c36_channel_empty_n,
        if_read => Array2xfMat_64_0_2160_3840_1_U0_ap_ready);

    imgInput_y_cols_c37_channel_U : component pp_pipeline_accel_fifo_w32_d2_S_x
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Block_entry20_proc_U0_ap_return_7,
        if_full_n => imgInput_y_cols_c37_channel_full_n,
        if_write => ap_channel_done_imgInput_y_cols_c37_channel,
        if_dout => imgInput_y_cols_c37_channel_dout,
        if_num_data_valid => imgInput_y_cols_c37_channel_num_data_valid,
        if_fifo_cap => imgInput_y_cols_c37_channel_fifo_cap,
        if_empty_n => imgInput_y_cols_c37_channel_empty_n,
        if_read => Array2xfMat_64_0_2160_3840_1_U0_ap_ready);

    resize_out_mat_rows_c38_channel_U : component pp_pipeline_accel_fifo_w32_d4_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Block_entry20_proc_U0_ap_return_8,
        if_full_n => resize_out_mat_rows_c38_channel_full_n,
        if_write => ap_channel_done_resize_out_mat_rows_c38_channel,
        if_dout => resize_out_mat_rows_c38_channel_dout,
        if_num_data_valid => resize_out_mat_rows_c38_channel_num_data_valid,
        if_fifo_cap => resize_out_mat_rows_c38_channel_fifo_cap,
        if_empty_n => resize_out_mat_rows_c38_channel_empty_n,
        if_read => resize_1_9_2160_3840_720_720_1_9_U0_ap_ready);

    resize_out_mat_cols_c39_channel_U : component pp_pipeline_accel_fifo_w32_d4_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Block_entry20_proc_U0_ap_return_9,
        if_full_n => resize_out_mat_cols_c39_channel_full_n,
        if_write => ap_channel_done_resize_out_mat_cols_c39_channel,
        if_dout => resize_out_mat_cols_c39_channel_dout,
        if_num_data_valid => resize_out_mat_cols_c39_channel_num_data_valid,
        if_fifo_cap => resize_out_mat_cols_c39_channel_fifo_cap,
        if_empty_n => resize_out_mat_cols_c39_channel_empty_n,
        if_read => resize_1_9_2160_3840_720_720_1_9_U0_ap_ready);

    imgInput_y_data_U : component pp_pipeline_accel_fifo_w8_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_data81_din,
        if_full_n => imgInput_y_data_full_n,
        if_write => Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_data81_write,
        if_dout => imgInput_y_data_dout,
        if_num_data_valid => imgInput_y_data_num_data_valid,
        if_fifo_cap => imgInput_y_data_fifo_cap,
        if_empty_n => imgInput_y_data_empty_n,
        if_read => nv122bgr_0_6_9_2160_3840_1_1_U0_imgInput_y_data81_read);

    imgInput_y_rows_c_U : component pp_pipeline_accel_fifo_w32_d2_S_x
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_rows_c_din,
        if_full_n => imgInput_y_rows_c_full_n,
        if_write => Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_rows_c_write,
        if_dout => imgInput_y_rows_c_dout,
        if_num_data_valid => imgInput_y_rows_c_num_data_valid,
        if_fifo_cap => imgInput_y_rows_c_fifo_cap,
        if_empty_n => imgInput_y_rows_c_empty_n,
        if_read => nv122bgr_0_6_9_2160_3840_1_1_U0_src_y_rows_read);

    imgInput_y_cols_c_U : component pp_pipeline_accel_fifo_w32_d2_S_x
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_cols_c_din,
        if_full_n => imgInput_y_cols_c_full_n,
        if_write => Array2xfMat_64_0_2160_3840_1_U0_imgInput_y_cols_c_write,
        if_dout => imgInput_y_cols_c_dout,
        if_num_data_valid => imgInput_y_cols_c_num_data_valid,
        if_fifo_cap => imgInput_y_cols_c_fifo_cap,
        if_empty_n => imgInput_y_cols_c_empty_n,
        if_read => nv122bgr_0_6_9_2160_3840_1_1_U0_src_y_cols_read);

    select_ln59_loc_channel_U : component pp_pipeline_accel_fifo_w32_d2_S_x
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Block_entry2022_proc_U0_ap_return,
        if_full_n => select_ln59_loc_channel_full_n,
        if_write => Block_entry2022_proc_U0_ap_done,
        if_dout => select_ln59_loc_channel_dout,
        if_num_data_valid => select_ln59_loc_channel_num_data_valid,
        if_fifo_cap => select_ln59_loc_channel_fifo_cap,
        if_empty_n => select_ln59_loc_channel_empty_n,
        if_read => Array2xfMat_64_6_1080_1920_1_U0_ap_ready);

    imgInput_uv_data_U : component pp_pipeline_accel_fifo_w16_d2_S_x0
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Array2xfMat_64_6_1080_1920_1_U0_imgInput_uv_data_din,
        if_full_n => imgInput_uv_data_full_n,
        if_write => Array2xfMat_64_6_1080_1920_1_U0_imgInput_uv_data_write,
        if_dout => imgInput_uv_data_dout,
        if_num_data_valid => imgInput_uv_data_num_data_valid,
        if_fifo_cap => imgInput_uv_data_fifo_cap,
        if_empty_n => imgInput_uv_data_empty_n,
        if_read => nv122bgr_0_6_9_2160_3840_1_1_U0_imgInput_uv_data82_read);

    rgb_mat_data_U : component pp_pipeline_accel_fifo_w24_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => nv122bgr_0_6_9_2160_3840_1_1_U0_rgb_mat_data83_din,
        if_full_n => rgb_mat_data_full_n,
        if_write => nv122bgr_0_6_9_2160_3840_1_1_U0_rgb_mat_data83_write,
        if_dout => rgb_mat_data_dout,
        if_num_data_valid => rgb_mat_data_num_data_valid,
        if_fifo_cap => rgb_mat_data_fifo_cap,
        if_empty_n => rgb_mat_data_empty_n,
        if_read => resize_1_9_2160_3840_720_720_1_9_U0_rgb_mat_data83_read);

    resize_out_mat_data_U : component pp_pipeline_accel_fifo_w24_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_data84_din,
        if_full_n => resize_out_mat_data_full_n,
        if_write => resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_data84_write,
        if_dout => resize_out_mat_data_dout,
        if_num_data_valid => resize_out_mat_data_num_data_valid,
        if_fifo_cap => resize_out_mat_data_fifo_cap,
        if_empty_n => resize_out_mat_data_empty_n,
        if_read => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_resize_out_mat_data84_read);

    resize_out_mat_rows_c_U : component pp_pipeline_accel_fifo_w32_d2_S_x
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_rows_c_din,
        if_full_n => resize_out_mat_rows_c_full_n,
        if_write => resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_rows_c_write,
        if_dout => resize_out_mat_rows_c_dout,
        if_num_data_valid => resize_out_mat_rows_c_num_data_valid,
        if_fifo_cap => resize_out_mat_rows_c_fifo_cap,
        if_empty_n => resize_out_mat_rows_c_empty_n,
        if_read => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_in_mat_rows_read);

    resize_out_mat_cols_c_U : component pp_pipeline_accel_fifo_w32_d2_S_x
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_cols_c_din,
        if_full_n => resize_out_mat_cols_c_full_n,
        if_write => resize_1_9_2160_3840_720_720_1_9_U0_resize_out_mat_cols_c_write,
        if_dout => resize_out_mat_cols_c_dout,
        if_num_data_valid => resize_out_mat_cols_c_num_data_valid,
        if_fifo_cap => resize_out_mat_cols_c_fifo_cap,
        if_empty_n => resize_out_mat_cols_c_empty_n,
        if_read => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_in_mat_cols_read);

    out_mat_data_U : component pp_pipeline_accel_fifo_w24_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_out_mat_data85_din,
        if_full_n => out_mat_data_full_n,
        if_write => preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_out_mat_data85_write,
        if_dout => out_mat_data_dout,
        if_num_data_valid => out_mat_data_num_data_valid,
        if_fifo_cap => out_mat_data_fifo_cap,
        if_empty_n => out_mat_data_empty_n,
        if_read => xfMat2Array_64_9_720_720_1_1_U0_out_mat_data85_read);

    start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_U : component pp_pipeline_accel_start_for_nv122bgr_0_6_9_2160_3840_1_1_U0
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_din,
        if_full_n => start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_full_n,
        if_write => Array2xfMat_64_0_2160_3840_1_U0_start_write,
        if_dout => start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_dout,
        if_empty_n => start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_empty_n,
        if_read => nv122bgr_0_6_9_2160_3840_1_1_U0_ap_ready);





    ap_sync_reg_Array2xfMat_64_0_2160_3840_1_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_Array2xfMat_64_0_2160_3840_1_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_Array2xfMat_64_0_2160_3840_1_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_Array2xfMat_64_0_2160_3840_1_U0_ap_ready <= ap_sync_Array2xfMat_64_0_2160_3840_1_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_Array2xfMat_64_6_1080_1920_1_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_Array2xfMat_64_6_1080_1920_1_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_Array2xfMat_64_6_1080_1920_1_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_Array2xfMat_64_6_1080_1920_1_U0_ap_ready <= ap_sync_Array2xfMat_64_6_1080_1920_1_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_Block_entry2022_proc_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_Block_entry2022_proc_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_Block_entry2022_proc_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_Block_entry2022_proc_U0_ap_ready <= ap_sync_Block_entry2022_proc_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_Block_entry20_proc_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_Block_entry20_proc_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_Block_entry20_proc_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_Block_entry20_proc_U0_ap_ready <= ap_sync_Block_entry20_proc_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_channel_write_imgInput_uv_cols_channel_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_channel_write_imgInput_uv_cols_channel <= ap_const_logic_0;
            else
                if (((Block_entry20_proc_U0_ap_done and Block_entry20_proc_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_imgInput_uv_cols_channel <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_imgInput_uv_cols_channel <= ap_sync_channel_write_imgInput_uv_cols_channel;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_channel_write_imgInput_uv_rows_channel_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_channel_write_imgInput_uv_rows_channel <= ap_const_logic_0;
            else
                if (((Block_entry20_proc_U0_ap_done and Block_entry20_proc_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_imgInput_uv_rows_channel <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_imgInput_uv_rows_channel <= ap_sync_channel_write_imgInput_uv_rows_channel;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_channel_write_imgInput_y_cols_c37_channel_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_channel_write_imgInput_y_cols_c37_channel <= ap_const_logic_0;
            else
                if (((Block_entry20_proc_U0_ap_done and Block_entry20_proc_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_imgInput_y_cols_c37_channel <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_imgInput_y_cols_c37_channel <= ap_sync_channel_write_imgInput_y_cols_c37_channel;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_channel_write_imgInput_y_rows_c36_channel_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_channel_write_imgInput_y_rows_c36_channel <= ap_const_logic_0;
            else
                if (((Block_entry20_proc_U0_ap_done and Block_entry20_proc_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_imgInput_y_rows_c36_channel <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_imgInput_y_rows_c36_channel <= ap_sync_channel_write_imgInput_y_rows_c36_channel;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_channel_write_out_mat_cols_channel_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_channel_write_out_mat_cols_channel <= ap_const_logic_0;
            else
                if (((Block_entry20_proc_U0_ap_done and Block_entry20_proc_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_out_mat_cols_channel <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_out_mat_cols_channel <= ap_sync_channel_write_out_mat_cols_channel;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_channel_write_out_mat_rows_channel_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_channel_write_out_mat_rows_channel <= ap_const_logic_0;
            else
                if (((Block_entry20_proc_U0_ap_done and Block_entry20_proc_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_out_mat_rows_channel <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_out_mat_rows_channel <= ap_sync_channel_write_out_mat_rows_channel;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_channel_write_resize_out_mat_cols_c39_channel_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_channel_write_resize_out_mat_cols_c39_channel <= ap_const_logic_0;
            else
                if (((Block_entry20_proc_U0_ap_done and Block_entry20_proc_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_resize_out_mat_cols_c39_channel <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_resize_out_mat_cols_c39_channel <= ap_sync_channel_write_resize_out_mat_cols_c39_channel;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_channel_write_resize_out_mat_rows_c38_channel_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_channel_write_resize_out_mat_rows_c38_channel <= ap_const_logic_0;
            else
                if (((Block_entry20_proc_U0_ap_done and Block_entry20_proc_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_resize_out_mat_rows_c38_channel <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_resize_out_mat_rows_c38_channel <= ap_sync_channel_write_resize_out_mat_rows_c38_channel;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_channel_write_rgb_mat_cols_channel_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_channel_write_rgb_mat_cols_channel <= ap_const_logic_0;
            else
                if (((Block_entry20_proc_U0_ap_done and Block_entry20_proc_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_rgb_mat_cols_channel <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_rgb_mat_cols_channel <= ap_sync_channel_write_rgb_mat_cols_channel;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_channel_write_rgb_mat_rows_channel_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_channel_write_rgb_mat_rows_channel <= ap_const_logic_0;
            else
                if (((Block_entry20_proc_U0_ap_done and Block_entry20_proc_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_rgb_mat_rows_channel <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_rgb_mat_rows_channel <= ap_sync_channel_write_rgb_mat_rows_channel;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_entry_proc11_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_entry_proc11_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_entry_proc11_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_entry_proc11_U0_ap_ready <= ap_sync_entry_proc11_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_sync_reg_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready <= ap_sync_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    ap_rst_n_inv_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            ap_rst_n_inv <= ap_rst_reg_1;
        end if;
    end process;

    ap_rst_reg_1_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            ap_rst_reg_1 <= ap_rst_reg_2;
        end if;
    end process;

    ap_rst_reg_2_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
                        ap_rst_reg_2 <= not(ap_rst_n);
        end if;
    end process;
    Array2xfMat_64_0_2160_3840_1_U0_ap_continue <= ap_const_logic_1;
    Array2xfMat_64_0_2160_3840_1_U0_ap_start <= (imgInput_y_rows_c36_channel_empty_n and imgInput_y_cols_c37_channel_empty_n and (ap_sync_reg_Array2xfMat_64_0_2160_3840_1_U0_ap_ready xor ap_const_logic_1) and ap_start);
    Array2xfMat_64_6_1080_1920_1_U0_ap_continue <= ap_const_logic_1;
    Array2xfMat_64_6_1080_1920_1_U0_ap_start <= (select_ln59_loc_channel_empty_n and imgInput_uv_rows_channel_empty_n and imgInput_uv_cols_channel_empty_n and (ap_sync_reg_Array2xfMat_64_6_1080_1920_1_U0_ap_ready xor ap_const_logic_1) and ap_start);
    Block_entry2022_proc_U0_ap_continue <= select_ln59_loc_channel_full_n;
    Block_entry2022_proc_U0_ap_start <= ((ap_sync_reg_Block_entry2022_proc_U0_ap_ready xor ap_const_logic_1) and ap_start);
    Block_entry20_proc_U0_ap_continue <= (ap_sync_channel_write_rgb_mat_rows_channel and ap_sync_channel_write_rgb_mat_cols_channel and ap_sync_channel_write_resize_out_mat_rows_c38_channel and ap_sync_channel_write_resize_out_mat_cols_c39_channel and ap_sync_channel_write_out_mat_rows_channel and ap_sync_channel_write_out_mat_cols_channel and ap_sync_channel_write_imgInput_y_rows_c36_channel and ap_sync_channel_write_imgInput_y_cols_c37_channel and ap_sync_channel_write_imgInput_uv_rows_channel and ap_sync_channel_write_imgInput_uv_cols_channel);
    Block_entry20_proc_U0_ap_start <= ((ap_sync_reg_Block_entry20_proc_U0_ap_ready xor ap_const_logic_1) and ap_start);
    ap_channel_done_imgInput_uv_cols_channel <= ((ap_sync_reg_channel_write_imgInput_uv_cols_channel xor ap_const_logic_1) and Block_entry20_proc_U0_ap_done);
    ap_channel_done_imgInput_uv_rows_channel <= ((ap_sync_reg_channel_write_imgInput_uv_rows_channel xor ap_const_logic_1) and Block_entry20_proc_U0_ap_done);
    ap_channel_done_imgInput_y_cols_c37_channel <= ((ap_sync_reg_channel_write_imgInput_y_cols_c37_channel xor ap_const_logic_1) and Block_entry20_proc_U0_ap_done);
    ap_channel_done_imgInput_y_rows_c36_channel <= ((ap_sync_reg_channel_write_imgInput_y_rows_c36_channel xor ap_const_logic_1) and Block_entry20_proc_U0_ap_done);
    ap_channel_done_out_mat_cols_channel <= ((ap_sync_reg_channel_write_out_mat_cols_channel xor ap_const_logic_1) and Block_entry20_proc_U0_ap_done);
    ap_channel_done_out_mat_rows_channel <= ((ap_sync_reg_channel_write_out_mat_rows_channel xor ap_const_logic_1) and Block_entry20_proc_U0_ap_done);
    ap_channel_done_resize_out_mat_cols_c39_channel <= ((ap_sync_reg_channel_write_resize_out_mat_cols_c39_channel xor ap_const_logic_1) and Block_entry20_proc_U0_ap_done);
    ap_channel_done_resize_out_mat_rows_c38_channel <= ((ap_sync_reg_channel_write_resize_out_mat_rows_c38_channel xor ap_const_logic_1) and Block_entry20_proc_U0_ap_done);
    ap_channel_done_rgb_mat_cols_channel <= ((ap_sync_reg_channel_write_rgb_mat_cols_channel xor ap_const_logic_1) and Block_entry20_proc_U0_ap_done);
    ap_channel_done_rgb_mat_rows_channel <= ((ap_sync_reg_channel_write_rgb_mat_rows_channel xor ap_const_logic_1) and Block_entry20_proc_U0_ap_done);
    ap_done <= xfMat2Array_64_9_720_720_1_1_U0_ap_done;
    ap_idle <= (xfMat2Array_64_9_720_720_1_1_U0_ap_idle and resize_1_9_2160_3840_720_720_1_9_U0_ap_idle and preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_idle and nv122bgr_0_6_9_2160_3840_1_1_U0_ap_idle and (select_ln59_loc_channel_empty_n xor ap_const_logic_1) and (resize_out_mat_cols_c39_channel_empty_n xor ap_const_logic_1) and (resize_out_mat_rows_c38_channel_empty_n xor ap_const_logic_1) and (imgInput_y_cols_c37_channel_empty_n xor ap_const_logic_1) and (imgInput_y_rows_c36_channel_empty_n xor ap_const_logic_1) and (out_mat_cols_channel_empty_n xor ap_const_logic_1) and (out_mat_rows_channel_empty_n xor ap_const_logic_1) and (rgb_mat_cols_channel_empty_n xor ap_const_logic_1) and (rgb_mat_rows_channel_empty_n xor ap_const_logic_1) and (imgInput_uv_cols_channel_empty_n xor ap_const_logic_1) and (imgInput_uv_rows_channel_empty_n xor ap_const_logic_1) and entry_proc11_U0_ap_idle and Block_entry20_proc_U0_ap_idle and Block_entry2022_proc_U0_ap_idle and Array2xfMat_64_6_1080_1920_1_U0_ap_idle and Array2xfMat_64_0_2160_3840_1_U0_ap_idle);
    ap_ready <= ap_sync_ready;
    ap_sync_Array2xfMat_64_0_2160_3840_1_U0_ap_ready <= (ap_sync_reg_Array2xfMat_64_0_2160_3840_1_U0_ap_ready or Array2xfMat_64_0_2160_3840_1_U0_ap_ready);
    ap_sync_Array2xfMat_64_6_1080_1920_1_U0_ap_ready <= (ap_sync_reg_Array2xfMat_64_6_1080_1920_1_U0_ap_ready or Array2xfMat_64_6_1080_1920_1_U0_ap_ready);
    ap_sync_Block_entry2022_proc_U0_ap_ready <= (ap_sync_reg_Block_entry2022_proc_U0_ap_ready or Block_entry2022_proc_U0_ap_ready);
    ap_sync_Block_entry20_proc_U0_ap_ready <= (ap_sync_reg_Block_entry20_proc_U0_ap_ready or Block_entry20_proc_U0_ap_ready);
    ap_sync_channel_write_imgInput_uv_cols_channel <= ((imgInput_uv_cols_channel_full_n and ap_channel_done_imgInput_uv_cols_channel) or ap_sync_reg_channel_write_imgInput_uv_cols_channel);
    ap_sync_channel_write_imgInput_uv_rows_channel <= ((imgInput_uv_rows_channel_full_n and ap_channel_done_imgInput_uv_rows_channel) or ap_sync_reg_channel_write_imgInput_uv_rows_channel);
    ap_sync_channel_write_imgInput_y_cols_c37_channel <= ((imgInput_y_cols_c37_channel_full_n and ap_channel_done_imgInput_y_cols_c37_channel) or ap_sync_reg_channel_write_imgInput_y_cols_c37_channel);
    ap_sync_channel_write_imgInput_y_rows_c36_channel <= ((imgInput_y_rows_c36_channel_full_n and ap_channel_done_imgInput_y_rows_c36_channel) or ap_sync_reg_channel_write_imgInput_y_rows_c36_channel);
    ap_sync_channel_write_out_mat_cols_channel <= ((out_mat_cols_channel_full_n and ap_channel_done_out_mat_cols_channel) or ap_sync_reg_channel_write_out_mat_cols_channel);
    ap_sync_channel_write_out_mat_rows_channel <= ((out_mat_rows_channel_full_n and ap_channel_done_out_mat_rows_channel) or ap_sync_reg_channel_write_out_mat_rows_channel);
    ap_sync_channel_write_resize_out_mat_cols_c39_channel <= ((resize_out_mat_cols_c39_channel_full_n and ap_channel_done_resize_out_mat_cols_c39_channel) or ap_sync_reg_channel_write_resize_out_mat_cols_c39_channel);
    ap_sync_channel_write_resize_out_mat_rows_c38_channel <= ((resize_out_mat_rows_c38_channel_full_n and ap_channel_done_resize_out_mat_rows_c38_channel) or ap_sync_reg_channel_write_resize_out_mat_rows_c38_channel);
    ap_sync_channel_write_rgb_mat_cols_channel <= ((rgb_mat_cols_channel_full_n and ap_channel_done_rgb_mat_cols_channel) or ap_sync_reg_channel_write_rgb_mat_cols_channel);
    ap_sync_channel_write_rgb_mat_rows_channel <= ((rgb_mat_rows_channel_full_n and ap_channel_done_rgb_mat_rows_channel) or ap_sync_reg_channel_write_rgb_mat_rows_channel);
    ap_sync_entry_proc11_U0_ap_ready <= (entry_proc11_U0_ap_ready or ap_sync_reg_entry_proc11_U0_ap_ready);
    ap_sync_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready <= (preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready or ap_sync_reg_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready);
    ap_sync_ready <= (ap_sync_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready and ap_sync_entry_proc11_U0_ap_ready and ap_sync_Block_entry20_proc_U0_ap_ready and ap_sync_Block_entry2022_proc_U0_ap_ready and ap_sync_Array2xfMat_64_6_1080_1920_1_U0_ap_ready and ap_sync_Array2xfMat_64_0_2160_3840_1_U0_ap_ready);
    entry_proc11_U0_ap_continue <= ap_const_logic_1;
    entry_proc11_U0_ap_start <= ((ap_sync_reg_entry_proc11_U0_ap_ready xor ap_const_logic_1) and ap_start);
    gmem1_RID <= ap_const_lv1_0;
    gmem1_RLAST <= ap_const_logic_0;
    gmem1_RRESP <= ap_const_lv2_0;
    gmem1_RUSER <= ap_const_lv1_0;
    gmem2_RID <= ap_const_lv1_0;
    gmem2_RLAST <= ap_const_logic_0;
    gmem2_RRESP <= ap_const_lv2_0;
    gmem2_RUSER <= ap_const_lv1_0;
    gmem3_BID <= ap_const_lv1_0;
    gmem3_BRESP <= ap_const_lv2_0;
    gmem3_BUSER <= ap_const_lv1_0;
    gmem4_RID <= ap_const_lv1_0;
    gmem4_RLAST <= ap_const_logic_0;
    gmem4_RRESP <= ap_const_lv2_0;
    gmem4_RUSER <= ap_const_lv1_0;
    nv122bgr_0_6_9_2160_3840_1_1_U0_ap_continue <= ap_const_logic_1;
    nv122bgr_0_6_9_2160_3840_1_1_U0_ap_start <= start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_empty_n;
    preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_continue <= ap_const_logic_1;
    preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_start <= ((ap_sync_reg_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready xor ap_const_logic_1) and ap_start);
    resize_1_9_2160_3840_720_720_1_9_U0_ap_continue <= ap_const_logic_1;
    resize_1_9_2160_3840_720_720_1_9_U0_ap_start <= (rgb_mat_rows_channel_empty_n and rgb_mat_cols_channel_empty_n and resize_out_mat_rows_c38_channel_empty_n and resize_out_mat_cols_c39_channel_empty_n);
    start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_din <= (0=>ap_const_logic_1, others=>'-');
    xfMat2Array_64_9_720_720_1_1_U0_ap_continue <= ap_continue;
    xfMat2Array_64_9_720_720_1_1_U0_ap_start <= (out_mat_rows_channel_empty_n and out_mat_cols_channel_empty_n);
end behav;
