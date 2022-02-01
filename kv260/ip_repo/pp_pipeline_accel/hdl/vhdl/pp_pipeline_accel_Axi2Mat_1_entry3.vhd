-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pp_pipeline_accel_Axi2Mat_1_entry3 is
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
    din : IN STD_LOGIC_VECTOR (63 downto 0);
    rows : IN STD_LOGIC_VECTOR (31 downto 0);
    cols : IN STD_LOGIC_VECTOR (31 downto 0);
    stride : IN STD_LOGIC_VECTOR (31 downto 0);
    din_out_din : OUT STD_LOGIC_VECTOR (63 downto 0);
    din_out_full_n : IN STD_LOGIC;
    din_out_write : OUT STD_LOGIC;
    rows_out_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    rows_out_full_n : IN STD_LOGIC;
    rows_out_write : OUT STD_LOGIC;
    cols_out_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    cols_out_full_n : IN STD_LOGIC;
    cols_out_write : OUT STD_LOGIC;
    stride_out_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    stride_out_full_n : IN STD_LOGIC;
    stride_out_write : OUT STD_LOGIC );
end;


architecture behav of pp_pipeline_accel_Axi2Mat_1_entry3 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal real_start : STD_LOGIC;
    signal start_once_reg : STD_LOGIC := '0';
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal internal_ap_ready : STD_LOGIC;
    signal din_out_blk_n : STD_LOGIC;
    signal rows_out_blk_n : STD_LOGIC;
    signal cols_out_blk_n : STD_LOGIC;
    signal stride_out_blk_n : STD_LOGIC;
    signal ap_block_state1 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
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
                elsif ((not(((real_start = ap_const_logic_0) or (stride_out_full_n = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (din_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    start_once_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                start_once_reg <= ap_const_logic_0;
            else
                if (((real_start = ap_const_logic_1) and (internal_ap_ready = ap_const_logic_0))) then 
                    start_once_reg <= ap_const_logic_1;
                elsif ((internal_ap_ready = ap_const_logic_1)) then 
                    start_once_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (real_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, din_out_full_n, rows_out_full_n, cols_out_full_n, stride_out_full_n)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_block_state1_assign_proc : process(real_start, ap_done_reg, din_out_full_n, rows_out_full_n, cols_out_full_n, stride_out_full_n)
    begin
                ap_block_state1 <= ((real_start = ap_const_logic_0) or (stride_out_full_n = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (din_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_done_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, din_out_full_n, rows_out_full_n, cols_out_full_n, stride_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (stride_out_full_n = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (din_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(real_start, ap_CS_fsm_state1)
    begin
        if (((real_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_ready <= internal_ap_ready;

    cols_out_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, cols_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            cols_out_blk_n <= cols_out_full_n;
        else 
            cols_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    cols_out_din <= cols;

    cols_out_write_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, din_out_full_n, rows_out_full_n, cols_out_full_n, stride_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (stride_out_full_n = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (din_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            cols_out_write <= ap_const_logic_1;
        else 
            cols_out_write <= ap_const_logic_0;
        end if; 
    end process;


    din_out_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, din_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            din_out_blk_n <= din_out_full_n;
        else 
            din_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    din_out_din <= din;

    din_out_write_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, din_out_full_n, rows_out_full_n, cols_out_full_n, stride_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (stride_out_full_n = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (din_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            din_out_write <= ap_const_logic_1;
        else 
            din_out_write <= ap_const_logic_0;
        end if; 
    end process;


    internal_ap_ready_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, din_out_full_n, rows_out_full_n, cols_out_full_n, stride_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (stride_out_full_n = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (din_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            internal_ap_ready <= ap_const_logic_1;
        else 
            internal_ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    real_start_assign_proc : process(ap_start, start_full_n, start_once_reg)
    begin
        if (((start_full_n = ap_const_logic_0) and (start_once_reg = ap_const_logic_0))) then 
            real_start <= ap_const_logic_0;
        else 
            real_start <= ap_start;
        end if; 
    end process;


    rows_out_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, rows_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            rows_out_blk_n <= rows_out_full_n;
        else 
            rows_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    rows_out_din <= rows;

    rows_out_write_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, din_out_full_n, rows_out_full_n, cols_out_full_n, stride_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (stride_out_full_n = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (din_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            rows_out_write <= ap_const_logic_1;
        else 
            rows_out_write <= ap_const_logic_0;
        end if; 
    end process;

    start_out <= real_start;

    start_write_assign_proc : process(real_start, start_once_reg)
    begin
        if (((real_start = ap_const_logic_1) and (start_once_reg = ap_const_logic_0))) then 
            start_write <= ap_const_logic_1;
        else 
            start_write <= ap_const_logic_0;
        end if; 
    end process;


    stride_out_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, stride_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            stride_out_blk_n <= stride_out_full_n;
        else 
            stride_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    stride_out_din <= stride;

    stride_out_write_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, din_out_full_n, rows_out_full_n, cols_out_full_n, stride_out_full_n)
    begin
        if ((not(((real_start = ap_const_logic_0) or (stride_out_full_n = ap_const_logic_0) or (cols_out_full_n = ap_const_logic_0) or (rows_out_full_n = ap_const_logic_0) or (din_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            stride_out_write <= ap_const_logic_1;
        else 
            stride_out_write <= ap_const_logic_0;
        end if; 
    end process;

end behav;
