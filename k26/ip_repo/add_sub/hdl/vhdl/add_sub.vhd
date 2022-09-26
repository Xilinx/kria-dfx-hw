-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add_sub is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    axis_in1_TDATA : IN STD_LOGIC_VECTOR (127 downto 0);
    axis_in1_TVALID : IN STD_LOGIC;
    axis_in1_TREADY : OUT STD_LOGIC;
    axis_in2_TDATA : IN STD_LOGIC_VECTOR (127 downto 0);
    axis_in2_TVALID : IN STD_LOGIC;
    axis_in2_TREADY : OUT STD_LOGIC;
    axis_out_TDATA : OUT STD_LOGIC_VECTOR (127 downto 0);
    axis_out_TVALID : OUT STD_LOGIC;
    axis_out_TREADY : IN STD_LOGIC;
    op : IN STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of add_sub is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "add_sub_add_sub,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xck26-sfvc784-2LV-c,HLS_INPUT_CLOCK=3.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.443000,HLS_SYN_LAT=1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=2,HLS_SYN_LUT=413,HLS_VERSION=2022_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv32_40 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000000";
    constant ap_const_lv32_5F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001011111";
    constant ap_const_lv32_60 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001100000";
    constant ap_const_lv32_7F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001111111";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal axis_in1_TDATA_blk_n : STD_LOGIC;
    signal axis_in2_TDATA_blk_n : STD_LOGIC;
    signal axis_out_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal axis_out_int4_V_fu_230_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_phi_mux_axis_out_int4_V_3_phi_fu_80_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal op_read_read_fu_52_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal axis_out_int4_V_1_fu_202_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal axis_out_int3_V_fu_223_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_phi_mux_axis_out_int3_V_3_phi_fu_89_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal axis_out_int3_V_1_fu_195_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal axis_out_int2_V_fu_216_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_phi_mux_axis_out_int2_V_3_phi_fu_98_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal axis_out_int2_V_1_fu_188_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal axis_out_int1_V_fu_209_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_phi_mux_axis_out_int1_V_3_phi_fu_107_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal axis_out_int1_V_1_fu_181_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln357_fu_173_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln357_1_fu_177_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_113_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_123_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_133_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_143_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_153_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_163_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal regslice_both_axis_out_U_apdone_blk : STD_LOGIC;
    signal ap_block_state2 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal regslice_both_axis_in1_U_apdone_blk : STD_LOGIC;
    signal axis_in1_TDATA_int_regslice : STD_LOGIC_VECTOR (127 downto 0);
    signal axis_in1_TVALID_int_regslice : STD_LOGIC;
    signal axis_in1_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_axis_in1_U_ack_in : STD_LOGIC;
    signal regslice_both_axis_in2_U_apdone_blk : STD_LOGIC;
    signal axis_in2_TDATA_int_regslice : STD_LOGIC_VECTOR (127 downto 0);
    signal axis_in2_TVALID_int_regslice : STD_LOGIC;
    signal axis_in2_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_axis_in2_U_ack_in : STD_LOGIC;
    signal axis_out_TDATA_int_regslice : STD_LOGIC_VECTOR (127 downto 0);
    signal axis_out_TVALID_int_regslice : STD_LOGIC;
    signal axis_out_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_axis_out_U_vld_out : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component add_sub_regslice_both IS
    generic (
        DataWidth : INTEGER );
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_in : IN STD_LOGIC;
        ack_in : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_out : OUT STD_LOGIC;
        ack_out : IN STD_LOGIC;
        apdone_blk : OUT STD_LOGIC );
    end component;



begin
    regslice_both_axis_in1_U : component add_sub_regslice_both
    generic map (
        DataWidth => 128)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => axis_in1_TDATA,
        vld_in => axis_in1_TVALID,
        ack_in => regslice_both_axis_in1_U_ack_in,
        data_out => axis_in1_TDATA_int_regslice,
        vld_out => axis_in1_TVALID_int_regslice,
        ack_out => axis_in1_TREADY_int_regslice,
        apdone_blk => regslice_both_axis_in1_U_apdone_blk);

    regslice_both_axis_in2_U : component add_sub_regslice_both
    generic map (
        DataWidth => 128)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => axis_in2_TDATA,
        vld_in => axis_in2_TVALID,
        ack_in => regslice_both_axis_in2_U_ack_in,
        data_out => axis_in2_TDATA_int_regslice,
        vld_out => axis_in2_TVALID_int_regslice,
        ack_out => axis_in2_TREADY_int_regslice,
        apdone_blk => regslice_both_axis_in2_U_apdone_blk);

    regslice_both_axis_out_U : component add_sub_regslice_both
    generic map (
        DataWidth => 128)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => axis_out_TDATA_int_regslice,
        vld_in => axis_out_TVALID_int_regslice,
        ack_in => axis_out_TREADY_int_regslice,
        data_out => axis_out_TDATA,
        vld_out => regslice_both_axis_out_U_vld_out,
        ack_out => axis_out_TREADY,
        apdone_blk => regslice_both_axis_out_U_apdone_blk);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, regslice_both_axis_out_U_apdone_blk, axis_in1_TVALID_int_regslice, axis_in2_TVALID_int_regslice, axis_out_TREADY_int_regslice)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (axis_out_TREADY_int_regslice = ap_const_logic_0) or (axis_in2_TVALID_int_regslice = ap_const_logic_0) or (axis_in1_TVALID_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if ((not(((axis_out_TREADY_int_regslice = ap_const_logic_0) or (regslice_both_axis_out_U_apdone_blk = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, axis_in1_TVALID_int_regslice, axis_in2_TVALID_int_regslice, axis_out_TREADY_int_regslice)
    begin
        if (((ap_start = ap_const_logic_0) or (axis_out_TREADY_int_regslice = ap_const_logic_0) or (axis_in2_TVALID_int_regslice = ap_const_logic_0) or (axis_in1_TVALID_int_regslice = ap_const_logic_0))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(regslice_both_axis_out_U_apdone_blk, axis_out_TREADY_int_regslice)
    begin
        if (((axis_out_TREADY_int_regslice = ap_const_logic_0) or (regslice_both_axis_out_U_apdone_blk = ap_const_logic_1))) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, axis_in1_TVALID_int_regslice, axis_in2_TVALID_int_regslice, axis_out_TREADY_int_regslice)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (axis_out_TREADY_int_regslice = ap_const_logic_0) or (axis_in2_TVALID_int_regslice = ap_const_logic_0) or (axis_in1_TVALID_int_regslice = ap_const_logic_0));
    end process;


    ap_block_state2_assign_proc : process(regslice_both_axis_out_U_apdone_blk, axis_out_TREADY_int_regslice)
    begin
                ap_block_state2 <= ((axis_out_TREADY_int_regslice = ap_const_logic_0) or (regslice_both_axis_out_U_apdone_blk = ap_const_logic_1));
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_state2, regslice_both_axis_out_U_apdone_blk, axis_out_TREADY_int_regslice)
    begin
        if ((not(((axis_out_TREADY_int_regslice = ap_const_logic_0) or (regslice_both_axis_out_U_apdone_blk = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_axis_out_int1_V_3_phi_fu_107_p4_assign_proc : process(ap_CS_fsm_state1, op_read_read_fu_52_p2, axis_out_int1_V_fu_209_p2, axis_out_int1_V_1_fu_181_p2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
            if ((op_read_read_fu_52_p2 = ap_const_lv1_0)) then 
                ap_phi_mux_axis_out_int1_V_3_phi_fu_107_p4 <= axis_out_int1_V_1_fu_181_p2;
            elsif ((op_read_read_fu_52_p2 = ap_const_lv1_1)) then 
                ap_phi_mux_axis_out_int1_V_3_phi_fu_107_p4 <= axis_out_int1_V_fu_209_p2;
            else 
                ap_phi_mux_axis_out_int1_V_3_phi_fu_107_p4 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            ap_phi_mux_axis_out_int1_V_3_phi_fu_107_p4 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    ap_phi_mux_axis_out_int2_V_3_phi_fu_98_p4_assign_proc : process(ap_CS_fsm_state1, op_read_read_fu_52_p2, axis_out_int2_V_fu_216_p2, axis_out_int2_V_1_fu_188_p2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
            if ((op_read_read_fu_52_p2 = ap_const_lv1_0)) then 
                ap_phi_mux_axis_out_int2_V_3_phi_fu_98_p4 <= axis_out_int2_V_1_fu_188_p2;
            elsif ((op_read_read_fu_52_p2 = ap_const_lv1_1)) then 
                ap_phi_mux_axis_out_int2_V_3_phi_fu_98_p4 <= axis_out_int2_V_fu_216_p2;
            else 
                ap_phi_mux_axis_out_int2_V_3_phi_fu_98_p4 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            ap_phi_mux_axis_out_int2_V_3_phi_fu_98_p4 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    ap_phi_mux_axis_out_int3_V_3_phi_fu_89_p4_assign_proc : process(ap_CS_fsm_state1, op_read_read_fu_52_p2, axis_out_int3_V_fu_223_p2, axis_out_int3_V_1_fu_195_p2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
            if ((op_read_read_fu_52_p2 = ap_const_lv1_0)) then 
                ap_phi_mux_axis_out_int3_V_3_phi_fu_89_p4 <= axis_out_int3_V_1_fu_195_p2;
            elsif ((op_read_read_fu_52_p2 = ap_const_lv1_1)) then 
                ap_phi_mux_axis_out_int3_V_3_phi_fu_89_p4 <= axis_out_int3_V_fu_223_p2;
            else 
                ap_phi_mux_axis_out_int3_V_3_phi_fu_89_p4 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            ap_phi_mux_axis_out_int3_V_3_phi_fu_89_p4 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    ap_phi_mux_axis_out_int4_V_3_phi_fu_80_p4_assign_proc : process(ap_CS_fsm_state1, axis_out_int4_V_fu_230_p2, op_read_read_fu_52_p2, axis_out_int4_V_1_fu_202_p2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
            if ((op_read_read_fu_52_p2 = ap_const_lv1_0)) then 
                ap_phi_mux_axis_out_int4_V_3_phi_fu_80_p4 <= axis_out_int4_V_1_fu_202_p2;
            elsif ((op_read_read_fu_52_p2 = ap_const_lv1_1)) then 
                ap_phi_mux_axis_out_int4_V_3_phi_fu_80_p4 <= axis_out_int4_V_fu_230_p2;
            else 
                ap_phi_mux_axis_out_int4_V_3_phi_fu_80_p4 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            ap_phi_mux_axis_out_int4_V_3_phi_fu_80_p4 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2, regslice_both_axis_out_U_apdone_blk, axis_out_TREADY_int_regslice)
    begin
        if ((not(((axis_out_TREADY_int_regslice = ap_const_logic_0) or (regslice_both_axis_out_U_apdone_blk = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    axis_in1_TDATA_blk_n_assign_proc : process(ap_start, ap_CS_fsm_state1, axis_in1_TVALID_int_regslice)
    begin
        if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            axis_in1_TDATA_blk_n <= axis_in1_TVALID_int_regslice;
        else 
            axis_in1_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    axis_in1_TREADY <= regslice_both_axis_in1_U_ack_in;

    axis_in1_TREADY_int_regslice_assign_proc : process(ap_start, ap_CS_fsm_state1, axis_in1_TVALID_int_regslice, axis_in2_TVALID_int_regslice, axis_out_TREADY_int_regslice)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (axis_out_TREADY_int_regslice = ap_const_logic_0) or (axis_in2_TVALID_int_regslice = ap_const_logic_0) or (axis_in1_TVALID_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            axis_in1_TREADY_int_regslice <= ap_const_logic_1;
        else 
            axis_in1_TREADY_int_regslice <= ap_const_logic_0;
        end if; 
    end process;


    axis_in2_TDATA_blk_n_assign_proc : process(ap_start, ap_CS_fsm_state1, axis_in2_TVALID_int_regslice)
    begin
        if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            axis_in2_TDATA_blk_n <= axis_in2_TVALID_int_regslice;
        else 
            axis_in2_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    axis_in2_TREADY <= regslice_both_axis_in2_U_ack_in;

    axis_in2_TREADY_int_regslice_assign_proc : process(ap_start, ap_CS_fsm_state1, axis_in1_TVALID_int_regslice, axis_in2_TVALID_int_regslice, axis_out_TREADY_int_regslice)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (axis_out_TREADY_int_regslice = ap_const_logic_0) or (axis_in2_TVALID_int_regslice = ap_const_logic_0) or (axis_in1_TVALID_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            axis_in2_TREADY_int_regslice <= ap_const_logic_1;
        else 
            axis_in2_TREADY_int_regslice <= ap_const_logic_0;
        end if; 
    end process;


    axis_out_TDATA_blk_n_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state2, axis_out_TREADY_int_regslice)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            axis_out_TDATA_blk_n <= axis_out_TREADY_int_regslice;
        else 
            axis_out_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    axis_out_TDATA_int_regslice <= (((ap_phi_mux_axis_out_int4_V_3_phi_fu_80_p4 & ap_phi_mux_axis_out_int3_V_3_phi_fu_89_p4) & ap_phi_mux_axis_out_int2_V_3_phi_fu_98_p4) & ap_phi_mux_axis_out_int1_V_3_phi_fu_107_p4);
    axis_out_TVALID <= regslice_both_axis_out_U_vld_out;

    axis_out_TVALID_int_regslice_assign_proc : process(ap_start, ap_CS_fsm_state1, axis_in1_TVALID_int_regslice, axis_in2_TVALID_int_regslice, axis_out_TREADY_int_regslice)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (axis_out_TREADY_int_regslice = ap_const_logic_0) or (axis_in2_TVALID_int_regslice = ap_const_logic_0) or (axis_in1_TVALID_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            axis_out_TVALID_int_regslice <= ap_const_logic_1;
        else 
            axis_out_TVALID_int_regslice <= ap_const_logic_0;
        end if; 
    end process;

    axis_out_int1_V_1_fu_181_p2 <= std_logic_vector(unsigned(trunc_ln357_fu_173_p1) - unsigned(trunc_ln357_1_fu_177_p1));
    axis_out_int1_V_fu_209_p2 <= std_logic_vector(unsigned(trunc_ln357_1_fu_177_p1) + unsigned(trunc_ln357_fu_173_p1));
    axis_out_int2_V_1_fu_188_p2 <= std_logic_vector(unsigned(grp_fu_113_p4) - unsigned(grp_fu_123_p4));
    axis_out_int2_V_fu_216_p2 <= std_logic_vector(unsigned(grp_fu_123_p4) + unsigned(grp_fu_113_p4));
    axis_out_int3_V_1_fu_195_p2 <= std_logic_vector(unsigned(grp_fu_133_p4) - unsigned(grp_fu_143_p4));
    axis_out_int3_V_fu_223_p2 <= std_logic_vector(unsigned(grp_fu_143_p4) + unsigned(grp_fu_133_p4));
    axis_out_int4_V_1_fu_202_p2 <= std_logic_vector(unsigned(grp_fu_153_p4) - unsigned(grp_fu_163_p4));
    axis_out_int4_V_fu_230_p2 <= std_logic_vector(unsigned(grp_fu_163_p4) + unsigned(grp_fu_153_p4));
    grp_fu_113_p4 <= axis_in1_TDATA_int_regslice(63 downto 32);
    grp_fu_123_p4 <= axis_in2_TDATA_int_regslice(63 downto 32);
    grp_fu_133_p4 <= axis_in1_TDATA_int_regslice(95 downto 64);
    grp_fu_143_p4 <= axis_in2_TDATA_int_regslice(95 downto 64);
    grp_fu_153_p4 <= axis_in1_TDATA_int_regslice(127 downto 96);
    grp_fu_163_p4 <= axis_in2_TDATA_int_regslice(127 downto 96);
    op_read_read_fu_52_p2 <= op;
    trunc_ln357_1_fu_177_p1 <= axis_in2_TDATA_int_regslice(32 - 1 downto 0);
    trunc_ln357_fu_173_p1 <= axis_in1_TDATA_int_regslice(32 - 1 downto 0);
end behav;
