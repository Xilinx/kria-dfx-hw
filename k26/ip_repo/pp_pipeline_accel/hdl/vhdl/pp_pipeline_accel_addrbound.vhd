-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_addrbound is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    return_r : OUT STD_LOGIC_VECTOR (18 downto 0);
    rows_dout : IN STD_LOGIC_VECTOR (15 downto 0);
    rows_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    rows_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    rows_empty_n : IN STD_LOGIC;
    rows_read : OUT STD_LOGIC;
    cols : IN STD_LOGIC_VECTOR (15 downto 0) );
end;


architecture behav of pp_pipeline_accel_addrbound is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (4 downto 0) := "01000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv19_0 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000000";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv25_3F : STD_LOGIC_VECTOR (24 downto 0) := "0000000000000000000111111";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal rows_blk_n : STD_LOGIC;
    signal lhs_reg_140 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal trunc_ln_reg_155 : STD_LOGIC_VECTOR (18 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_block_state1 : BOOLEAN;
    signal return_r_preg : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000000";
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal trunc_ln1540_fu_83_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_127_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln1540_fu_83_p1 : STD_LOGIC_VECTOR (19 downto 0);
    signal trunc_ln1540_1_fu_94_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln1540_1_fu_94_p1 : STD_LOGIC_VECTOR (21 downto 0);
    signal shl_ln_fu_86_p3 : STD_LOGIC_VECTOR (24 downto 0);
    signal shl_ln1540_1_fu_97_p3 : STD_LOGIC_VECTOR (24 downto 0);
    signal ret_V_fu_105_p2 : STD_LOGIC_VECTOR (24 downto 0);
    signal add_ln587_fu_111_p2 : STD_LOGIC_VECTOR (24 downto 0);
    signal grp_fu_127_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_127_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal grp_fu_127_p00 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_127_p10 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component pp_pipeline_accel_mul_mul_16ns_16ns_32_3_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (15 downto 0);
        din1 : IN STD_LOGIC_VECTOR (15 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    mul_mul_16ns_16ns_32_3_1_U286 : component pp_pipeline_accel_mul_mul_16ns_16ns_32_3_1
    generic map (
        ID => 1,
        NUM_STAGE => 3,
        din0_WIDTH => 16,
        din1_WIDTH => 16,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_127_p0,
        din1 => grp_fu_127_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_127_p2);





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
                elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    return_r_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                return_r_preg <= ap_const_lv19_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                    return_r_preg <= trunc_ln_reg_155;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                lhs_reg_140 <= rows_dout;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                trunc_ln_reg_155 <= add_ln587_fu_111_p2(24 downto 6);
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, rows_empty_n)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
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
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;
    add_ln587_fu_111_p2 <= std_logic_vector(unsigned(ret_V_fu_105_p2) + unsigned(ap_const_lv25_3F));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg, rows_empty_n)
    begin
        if (((rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;
    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;
    ap_ST_fsm_state5_blk <= ap_const_logic_0;

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, rows_empty_n)
    begin
                ap_block_state1 <= ((rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
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


    ap_ready_assign_proc : process(ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_127_p0 <= grp_fu_127_p00(16 - 1 downto 0);
    grp_fu_127_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(cols),32));
    grp_fu_127_p1 <= grp_fu_127_p10(16 - 1 downto 0);
    grp_fu_127_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(lhs_reg_140),32));
    ret_V_fu_105_p2 <= std_logic_vector(unsigned(shl_ln_fu_86_p3) - unsigned(shl_ln1540_1_fu_97_p3));

    return_r_assign_proc : process(trunc_ln_reg_155, return_r_preg, ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            return_r <= trunc_ln_reg_155;
        else 
            return_r <= return_r_preg;
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


    rows_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_empty_n)
    begin
        if ((not(((rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            rows_read <= ap_const_logic_1;
        else 
            rows_read <= ap_const_logic_0;
        end if; 
    end process;

    shl_ln1540_1_fu_97_p3 <= (trunc_ln1540_1_fu_94_p1 & ap_const_lv3_0);
    shl_ln_fu_86_p3 <= (trunc_ln1540_fu_83_p1 & ap_const_lv5_0);
    trunc_ln1540_1_fu_94_p0 <= grp_fu_127_p2;
    trunc_ln1540_1_fu_94_p1 <= trunc_ln1540_1_fu_94_p0(22 - 1 downto 0);
    trunc_ln1540_fu_83_p0 <= grp_fu_127_p2;
    trunc_ln1540_fu_83_p1 <= trunc_ln1540_fu_83_p0(20 - 1 downto 0);
end behav;
