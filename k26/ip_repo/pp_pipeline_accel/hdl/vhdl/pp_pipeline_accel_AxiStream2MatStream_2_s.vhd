-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_AxiStream2MatStream_2_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ldata1_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    ldata1_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    ldata1_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    ldata1_empty_n : IN STD_LOGIC;
    ldata1_read : OUT STD_LOGIC;
    imgInput_uv_data82_din : OUT STD_LOGIC_VECTOR (15 downto 0);
    imgInput_uv_data82_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    imgInput_uv_data82_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    imgInput_uv_data82_full_n : IN STD_LOGIC;
    imgInput_uv_data82_write : OUT STD_LOGIC;
    rows_dout : IN STD_LOGIC_VECTOR (10 downto 0);
    rows_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    rows_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    rows_empty_n : IN STD_LOGIC;
    rows_read : OUT STD_LOGIC;
    cols_bound_per_npc_dout : IN STD_LOGIC_VECTOR (10 downto 0);
    cols_bound_per_npc_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    cols_bound_per_npc_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    cols_bound_per_npc_empty_n : IN STD_LOGIC;
    cols_bound_per_npc_read : OUT STD_LOGIC;
    last_blk_width : IN STD_LOGIC_VECTOR (4 downto 0) );
end;


architecture behav of pp_pipeline_accel_AxiStream2MatStream_2_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (4 downto 0) := "01000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv12_FFF : STD_LOGIC_VECTOR (11 downto 0) := "111111111111";
    constant ap_const_lv7_40 : STD_LOGIC_VECTOR (6 downto 0) := "1000000";
    constant ap_const_lv6_3F : STD_LOGIC_VECTOR (5 downto 0) := "111111";
    constant ap_const_lv7_3F : STD_LOGIC_VECTOR (6 downto 0) := "0111111";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal rows_blk_n : STD_LOGIC;
    signal cols_bound_per_npc_blk_n : STD_LOGIC;
    signal cols_bound_per_npc_read_reg_131 : STD_LOGIC_VECTOR (10 downto 0);
    signal last_blk_width_read_reg_147 : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal sub_fu_96_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal sub_reg_154 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal sub3_fu_103_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal sub3_reg_159 : STD_LOGIC_VECTOR (6 downto 0);
    signal sub38_fu_110_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal sub38_reg_164 : STD_LOGIC_VECTOR (5 downto 0);
    signal add_ln1082_fu_117_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal add_ln1082_reg_169 : STD_LOGIC_VECTOR (6 downto 0);
    signal grp_fu_124_p2 : STD_LOGIC_VECTOR (21 downto 0);
    signal mul_ln1062_reg_174 : STD_LOGIC_VECTOR (21 downto 0);
    signal grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_start : STD_LOGIC;
    signal grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_done : STD_LOGIC;
    signal grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_idle : STD_LOGIC;
    signal grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_ready : STD_LOGIC;
    signal grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ldata1_read : STD_LOGIC;
    signal grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_imgInput_uv_data82_din : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_imgInput_uv_data82_write : STD_LOGIC;
    signal grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_block_state1 : BOOLEAN;
    signal cols_bound_per_npc_cast5_fu_93_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal last_blk_width_cast2_fu_87_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal last_blk_width_cast7_fu_90_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal grp_fu_124_p0 : STD_LOGIC_VECTOR (10 downto 0);
    signal grp_fu_124_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal grp_fu_124_ce : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal grp_fu_124_p00 : STD_LOGIC_VECTOR (21 downto 0);
    signal grp_fu_124_p10 : STD_LOGIC_VECTOR (21 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ldata1_dout : IN STD_LOGIC_VECTOR (63 downto 0);
        ldata1_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        ldata1_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        ldata1_empty_n : IN STD_LOGIC;
        ldata1_read : OUT STD_LOGIC;
        imgInput_uv_data82_din : OUT STD_LOGIC_VECTOR (15 downto 0);
        imgInput_uv_data82_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        imgInput_uv_data82_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        imgInput_uv_data82_full_n : IN STD_LOGIC;
        imgInput_uv_data82_write : OUT STD_LOGIC;
        mul_ln1062 : IN STD_LOGIC_VECTOR (21 downto 0);
        sext_ln1082 : IN STD_LOGIC_VECTOR (5 downto 0);
        cols_bound_per_npc_cast3 : IN STD_LOGIC_VECTOR (10 downto 0);
        sub_cast : IN STD_LOGIC_VECTOR (11 downto 0);
        last_blk_width_load : IN STD_LOGIC_VECTOR (4 downto 0);
        sub3 : IN STD_LOGIC_VECTOR (6 downto 0);
        add_ln1082 : IN STD_LOGIC_VECTOR (6 downto 0) );
    end component;


    component pp_pipeline_accel_mul_mul_11ns_11ns_22_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (10 downto 0);
        din1 : IN STD_LOGIC_VECTOR (10 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (21 downto 0) );
    end component;



begin
    grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64 : component pp_pipeline_accel_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_start,
        ap_done => grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_done,
        ap_idle => grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_idle,
        ap_ready => grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_ready,
        ldata1_dout => ldata1_dout,
        ldata1_num_data_valid => ap_const_lv2_0,
        ldata1_fifo_cap => ap_const_lv2_0,
        ldata1_empty_n => ldata1_empty_n,
        ldata1_read => grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ldata1_read,
        imgInput_uv_data82_din => grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_imgInput_uv_data82_din,
        imgInput_uv_data82_num_data_valid => ap_const_lv2_0,
        imgInput_uv_data82_fifo_cap => ap_const_lv2_0,
        imgInput_uv_data82_full_n => imgInput_uv_data82_full_n,
        imgInput_uv_data82_write => grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_imgInput_uv_data82_write,
        mul_ln1062 => mul_ln1062_reg_174,
        sext_ln1082 => sub38_reg_164,
        cols_bound_per_npc_cast3 => cols_bound_per_npc_read_reg_131,
        sub_cast => sub_reg_154,
        last_blk_width_load => last_blk_width_read_reg_147,
        sub3 => sub3_reg_159,
        add_ln1082 => add_ln1082_reg_169);

    mul_mul_11ns_11ns_22_4_1_U115 : component pp_pipeline_accel_mul_mul_11ns_11ns_22_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 11,
        din1_WIDTH => 11,
        dout_WIDTH => 22)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_124_p0,
        din1 => grp_fu_124_p1,
        ce => grp_fu_124_ce,
        dout => grp_fu_124_p2);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                    grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_ready = ap_const_logic_1)) then 
                    grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                add_ln1082_reg_169 <= add_ln1082_fu_117_p2;
                mul_ln1062_reg_174 <= grp_fu_124_p2;
                sub38_reg_164 <= sub38_fu_110_p2;
                sub3_reg_159 <= sub3_fu_103_p2;
                sub_reg_154 <= sub_fu_96_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                cols_bound_per_npc_read_reg_131 <= cols_bound_per_npc_dout;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                last_blk_width_read_reg_147 <= last_blk_width;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, rows_empty_n, cols_bound_per_npc_empty_n, grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_done, ap_CS_fsm_state5)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((cols_bound_per_npc_empty_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                if (((grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;
    add_ln1082_fu_117_p2 <= std_logic_vector(unsigned(last_blk_width_cast2_fu_87_p1) + unsigned(ap_const_lv7_3F));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg, rows_empty_n, cols_bound_per_npc_empty_n)
    begin
        if (((cols_bound_per_npc_empty_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;
    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;

    ap_ST_fsm_state5_blk_assign_proc : process(grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_done)
    begin
        if ((grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state5_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state5_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, rows_empty_n, cols_bound_per_npc_empty_n)
    begin
                ap_block_state1 <= ((cols_bound_per_npc_empty_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_done_reg, grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_done, ap_CS_fsm_state5)
    begin
        if (((grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_done, ap_CS_fsm_state5)
    begin
        if (((grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    cols_bound_per_npc_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, cols_bound_per_npc_empty_n)
    begin
        if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            cols_bound_per_npc_blk_n <= cols_bound_per_npc_empty_n;
        else 
            cols_bound_per_npc_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    cols_bound_per_npc_cast5_fu_93_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(cols_bound_per_npc_read_reg_131),12));

    cols_bound_per_npc_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_empty_n, cols_bound_per_npc_empty_n)
    begin
        if ((not(((cols_bound_per_npc_empty_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            cols_bound_per_npc_read <= ap_const_logic_1;
        else 
            cols_bound_per_npc_read <= ap_const_logic_0;
        end if; 
    end process;

    grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_start <= grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ap_start_reg;

    grp_fu_124_ce_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_empty_n, cols_bound_per_npc_empty_n, ap_CS_fsm_state5)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state5) or ((ap_const_logic_1 = ap_CS_fsm_state1) and ((cols_bound_per_npc_empty_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))))) then 
            grp_fu_124_ce <= ap_const_logic_0;
        else 
            grp_fu_124_ce <= ap_const_logic_1;
        end if; 
    end process;

    grp_fu_124_p0 <= grp_fu_124_p00(11 - 1 downto 0);
    grp_fu_124_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(cols_bound_per_npc_dout),22));
    grp_fu_124_p1 <= grp_fu_124_p10(11 - 1 downto 0);
    grp_fu_124_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rows_dout),22));
    imgInput_uv_data82_din <= grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_imgInput_uv_data82_din;

    imgInput_uv_data82_write_assign_proc : process(grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_imgInput_uv_data82_write, ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            imgInput_uv_data82_write <= grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_imgInput_uv_data82_write;
        else 
            imgInput_uv_data82_write <= ap_const_logic_0;
        end if; 
    end process;

    last_blk_width_cast2_fu_87_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(last_blk_width_read_reg_147),7));
    last_blk_width_cast7_fu_90_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(last_blk_width_read_reg_147),6));

    ldata1_read_assign_proc : process(grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ldata1_read, ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            ldata1_read <= grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64_ldata1_read;
        else 
            ldata1_read <= ap_const_logic_0;
        end if; 
    end process;


    rows_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_empty_n)
    begin
        if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            rows_blk_n <= rows_empty_n;
        else 
            rows_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    rows_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_empty_n, cols_bound_per_npc_empty_n)
    begin
        if ((not(((cols_bound_per_npc_empty_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            rows_read <= ap_const_logic_1;
        else 
            rows_read <= ap_const_logic_0;
        end if; 
    end process;

    sub38_fu_110_p2 <= std_logic_vector(unsigned(last_blk_width_cast7_fu_90_p1) + unsigned(ap_const_lv6_3F));
    sub3_fu_103_p2 <= std_logic_vector(signed(ap_const_lv7_40) - signed(last_blk_width_cast2_fu_87_p1));
    sub_fu_96_p2 <= std_logic_vector(unsigned(cols_bound_per_npc_cast5_fu_93_p1) + unsigned(ap_const_lv12_FFF));
end behav;
