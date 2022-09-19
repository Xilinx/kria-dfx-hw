-- Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
-- SPDX-License-Identifier: MIT
-- ==============================================================
-- Version: 2022.1
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_entry_proc9 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    rows_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    rows_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    rows_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    rows_empty_n : IN STD_LOGIC;
    rows_read : OUT STD_LOGIC;
    rows_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    rows_c_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    rows_c_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    rows_c_full_n : IN STD_LOGIC;
    rows_c_write : OUT STD_LOGIC;
    cols_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    cols_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    cols_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    cols_empty_n : IN STD_LOGIC;
    cols_read : OUT STD_LOGIC;
    cols_c_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    cols_c_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    cols_c_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    cols_c_full_n : IN STD_LOGIC;
    cols_c_write : OUT STD_LOGIC );
end;


architecture behav of pp_pipeline_accel_entry_proc9 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal rows_blk_n : STD_LOGIC;
    signal rows_c_blk_n : STD_LOGIC;
    signal cols_blk_n : STD_LOGIC;
    signal cols_c_blk_n : STD_LOGIC;
    signal ap_block_state1 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;


begin




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
                elsif ((not(((ap_start = ap_const_logic_0) or (cols_c_full_n = ap_const_logic_0) or (cols_empty_n = ap_const_logic_0) or (rows_c_full_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, rows_empty_n, rows_c_full_n, cols_empty_n, cols_c_full_n)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg, rows_empty_n, rows_c_full_n, cols_empty_n, cols_c_full_n)
    begin
        if (((ap_start = ap_const_logic_0) or (cols_c_full_n = ap_const_logic_0) or (cols_empty_n = ap_const_logic_0) or (rows_c_full_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, rows_empty_n, rows_c_full_n, cols_empty_n, cols_c_full_n)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (cols_c_full_n = ap_const_logic_0) or (cols_empty_n = ap_const_logic_0) or (rows_c_full_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_done_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_empty_n, rows_c_full_n, cols_empty_n, cols_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cols_c_full_n = ap_const_logic_0) or (cols_empty_n = ap_const_logic_0) or (rows_c_full_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
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


    ap_ready_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_empty_n, rows_c_full_n, cols_empty_n, cols_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cols_c_full_n = ap_const_logic_0) or (cols_empty_n = ap_const_logic_0) or (rows_c_full_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    cols_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, cols_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            cols_blk_n <= cols_empty_n;
        else 
            cols_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    cols_c_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, cols_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            cols_c_blk_n <= cols_c_full_n;
        else 
            cols_c_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    cols_c_din <= cols_dout;

    cols_c_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_empty_n, rows_c_full_n, cols_empty_n, cols_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cols_c_full_n = ap_const_logic_0) or (cols_empty_n = ap_const_logic_0) or (rows_c_full_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            cols_c_write <= ap_const_logic_1;
        else 
            cols_c_write <= ap_const_logic_0;
        end if; 
    end process;


    cols_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_empty_n, rows_c_full_n, cols_empty_n, cols_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cols_c_full_n = ap_const_logic_0) or (cols_empty_n = ap_const_logic_0) or (rows_c_full_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            cols_read <= ap_const_logic_1;
        else 
            cols_read <= ap_const_logic_0;
        end if; 
    end process;


    rows_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            rows_blk_n <= rows_empty_n;
        else 
            rows_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    rows_c_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            rows_c_blk_n <= rows_c_full_n;
        else 
            rows_c_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    rows_c_din <= rows_dout;

    rows_c_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_empty_n, rows_c_full_n, cols_empty_n, cols_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cols_c_full_n = ap_const_logic_0) or (cols_empty_n = ap_const_logic_0) or (rows_c_full_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            rows_c_write <= ap_const_logic_1;
        else 
            rows_c_write <= ap_const_logic_0;
        end if; 
    end process;


    rows_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, rows_empty_n, rows_c_full_n, cols_empty_n, cols_c_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (cols_c_full_n = ap_const_logic_0) or (cols_empty_n = ap_const_logic_0) or (rows_c_full_n = ap_const_logic_0) or (rows_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            rows_read <= ap_const_logic_1;
        else 
            rows_read <= ap_const_logic_0;
        end if; 
    end process;

end behav;
