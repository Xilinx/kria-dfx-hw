// Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: MIT

    wire dl_reset;
    wire dl_clock;
    assign dl_reset = ap_rst_n;
    assign dl_clock = ap_clk;
    wire [5:0] proc_0_data_FIFO_blk;
    wire [5:0] proc_0_data_PIPO_blk;
    wire [5:0] proc_0_start_FIFO_blk;
    wire [5:0] proc_0_TLF_FIFO_blk;
    wire [5:0] proc_0_input_sync_blk;
    wire [5:0] proc_0_output_sync_blk;
    wire [5:0] proc_dep_vld_vec_0;
    reg [5:0] proc_dep_vld_vec_0_reg;
    wire [5:0] in_chan_dep_vld_vec_0;
    wire [179:0] in_chan_dep_data_vec_0;
    wire [5:0] token_in_vec_0;
    wire [5:0] out_chan_dep_vld_vec_0;
    wire [29:0] out_chan_dep_data_0;
    wire [5:0] token_out_vec_0;
    wire dl_detect_out_0;
    wire dep_chan_vld_1_0;
    wire [29:0] dep_chan_data_1_0;
    wire token_1_0;
    wire dep_chan_vld_2_0;
    wire [29:0] dep_chan_data_2_0;
    wire token_2_0;
    wire dep_chan_vld_9_0;
    wire [29:0] dep_chan_data_9_0;
    wire token_9_0;
    wire dep_chan_vld_10_0;
    wire [29:0] dep_chan_data_10_0;
    wire token_10_0;
    wire dep_chan_vld_19_0;
    wire [29:0] dep_chan_data_19_0;
    wire token_19_0;
    wire dep_chan_vld_20_0;
    wire [29:0] dep_chan_data_20_0;
    wire token_20_0;
    wire [4:0] proc_1_data_FIFO_blk;
    wire [4:0] proc_1_data_PIPO_blk;
    wire [4:0] proc_1_start_FIFO_blk;
    wire [4:0] proc_1_TLF_FIFO_blk;
    wire [4:0] proc_1_input_sync_blk;
    wire [4:0] proc_1_output_sync_blk;
    wire [4:0] proc_dep_vld_vec_1;
    reg [4:0] proc_dep_vld_vec_1_reg;
    wire [6:0] in_chan_dep_vld_vec_1;
    wire [209:0] in_chan_dep_data_vec_1;
    wire [6:0] token_in_vec_1;
    wire [4:0] out_chan_dep_vld_vec_1;
    wire [29:0] out_chan_dep_data_1;
    wire [4:0] token_out_vec_1;
    wire dl_detect_out_1;
    wire dep_chan_vld_0_1;
    wire [29:0] dep_chan_data_0_1;
    wire token_0_1;
    wire dep_chan_vld_2_1;
    wire [29:0] dep_chan_data_2_1;
    wire token_2_1;
    wire dep_chan_vld_9_1;
    wire [29:0] dep_chan_data_9_1;
    wire token_9_1;
    wire dep_chan_vld_10_1;
    wire [29:0] dep_chan_data_10_1;
    wire token_10_1;
    wire dep_chan_vld_18_1;
    wire [29:0] dep_chan_data_18_1;
    wire token_18_1;
    wire dep_chan_vld_19_1;
    wire [29:0] dep_chan_data_19_1;
    wire token_19_1;
    wire dep_chan_vld_20_1;
    wire [29:0] dep_chan_data_20_1;
    wire token_20_1;
    wire [5:0] proc_2_data_FIFO_blk;
    wire [5:0] proc_2_data_PIPO_blk;
    wire [5:0] proc_2_start_FIFO_blk;
    wire [5:0] proc_2_TLF_FIFO_blk;
    wire [5:0] proc_2_input_sync_blk;
    wire [5:0] proc_2_output_sync_blk;
    wire [5:0] proc_dep_vld_vec_2;
    reg [5:0] proc_dep_vld_vec_2_reg;
    wire [5:0] in_chan_dep_vld_vec_2;
    wire [179:0] in_chan_dep_data_vec_2;
    wire [5:0] token_in_vec_2;
    wire [5:0] out_chan_dep_vld_vec_2;
    wire [29:0] out_chan_dep_data_2;
    wire [5:0] token_out_vec_2;
    wire dl_detect_out_2;
    wire dep_chan_vld_0_2;
    wire [29:0] dep_chan_data_0_2;
    wire token_0_2;
    wire dep_chan_vld_1_2;
    wire [29:0] dep_chan_data_1_2;
    wire token_1_2;
    wire dep_chan_vld_9_2;
    wire [29:0] dep_chan_data_9_2;
    wire token_9_2;
    wire dep_chan_vld_10_2;
    wire [29:0] dep_chan_data_10_2;
    wire token_10_2;
    wire dep_chan_vld_17_2;
    wire [29:0] dep_chan_data_17_2;
    wire token_17_2;
    wire dep_chan_vld_19_2;
    wire [29:0] dep_chan_data_19_2;
    wire token_19_2;
    wire [2:0] proc_3_data_FIFO_blk;
    wire [2:0] proc_3_data_PIPO_blk;
    wire [2:0] proc_3_start_FIFO_blk;
    wire [2:0] proc_3_TLF_FIFO_blk;
    wire [2:0] proc_3_input_sync_blk;
    wire [2:0] proc_3_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_3;
    reg [2:0] proc_dep_vld_vec_3_reg;
    wire [2:0] in_chan_dep_vld_vec_3;
    wire [89:0] in_chan_dep_data_vec_3;
    wire [2:0] token_in_vec_3;
    wire [2:0] out_chan_dep_vld_vec_3;
    wire [29:0] out_chan_dep_data_3;
    wire [2:0] token_out_vec_3;
    wire dl_detect_out_3;
    wire dep_chan_vld_4_3;
    wire [29:0] dep_chan_data_4_3;
    wire token_4_3;
    wire dep_chan_vld_5_3;
    wire [29:0] dep_chan_data_5_3;
    wire token_5_3;
    wire dep_chan_vld_6_3;
    wire [29:0] dep_chan_data_6_3;
    wire token_6_3;
    wire [2:0] proc_4_data_FIFO_blk;
    wire [2:0] proc_4_data_PIPO_blk;
    wire [2:0] proc_4_start_FIFO_blk;
    wire [2:0] proc_4_TLF_FIFO_blk;
    wire [2:0] proc_4_input_sync_blk;
    wire [2:0] proc_4_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_4;
    reg [2:0] proc_dep_vld_vec_4_reg;
    wire [2:0] in_chan_dep_vld_vec_4;
    wire [89:0] in_chan_dep_data_vec_4;
    wire [2:0] token_in_vec_4;
    wire [2:0] out_chan_dep_vld_vec_4;
    wire [29:0] out_chan_dep_data_4;
    wire [2:0] token_out_vec_4;
    wire dl_detect_out_4;
    wire dep_chan_vld_3_4;
    wire [29:0] dep_chan_data_3_4;
    wire token_3_4;
    wire dep_chan_vld_5_4;
    wire [29:0] dep_chan_data_5_4;
    wire token_5_4;
    wire dep_chan_vld_8_4;
    wire [29:0] dep_chan_data_8_4;
    wire token_8_4;
    wire [1:0] proc_5_data_FIFO_blk;
    wire [1:0] proc_5_data_PIPO_blk;
    wire [1:0] proc_5_start_FIFO_blk;
    wire [1:0] proc_5_TLF_FIFO_blk;
    wire [1:0] proc_5_input_sync_blk;
    wire [1:0] proc_5_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_5;
    reg [1:0] proc_dep_vld_vec_5_reg;
    wire [1:0] in_chan_dep_vld_vec_5;
    wire [59:0] in_chan_dep_data_vec_5;
    wire [1:0] token_in_vec_5;
    wire [1:0] out_chan_dep_vld_vec_5;
    wire [29:0] out_chan_dep_data_5;
    wire [1:0] token_out_vec_5;
    wire dl_detect_out_5;
    wire dep_chan_vld_3_5;
    wire [29:0] dep_chan_data_3_5;
    wire token_3_5;
    wire dep_chan_vld_4_5;
    wire [29:0] dep_chan_data_4_5;
    wire token_4_5;
    wire [2:0] proc_6_data_FIFO_blk;
    wire [2:0] proc_6_data_PIPO_blk;
    wire [2:0] proc_6_start_FIFO_blk;
    wire [2:0] proc_6_TLF_FIFO_blk;
    wire [2:0] proc_6_input_sync_blk;
    wire [2:0] proc_6_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_6;
    reg [2:0] proc_dep_vld_vec_6_reg;
    wire [2:0] in_chan_dep_vld_vec_6;
    wire [89:0] in_chan_dep_data_vec_6;
    wire [2:0] token_in_vec_6;
    wire [2:0] out_chan_dep_vld_vec_6;
    wire [29:0] out_chan_dep_data_6;
    wire [2:0] token_out_vec_6;
    wire dl_detect_out_6;
    wire dep_chan_vld_3_6;
    wire [29:0] dep_chan_data_3_6;
    wire token_3_6;
    wire dep_chan_vld_7_6;
    wire [29:0] dep_chan_data_7_6;
    wire token_7_6;
    wire dep_chan_vld_8_6;
    wire [29:0] dep_chan_data_8_6;
    wire token_8_6;
    wire [1:0] proc_7_data_FIFO_blk;
    wire [1:0] proc_7_data_PIPO_blk;
    wire [1:0] proc_7_start_FIFO_blk;
    wire [1:0] proc_7_TLF_FIFO_blk;
    wire [1:0] proc_7_input_sync_blk;
    wire [1:0] proc_7_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_7;
    reg [1:0] proc_dep_vld_vec_7_reg;
    wire [1:0] in_chan_dep_vld_vec_7;
    wire [59:0] in_chan_dep_data_vec_7;
    wire [1:0] token_in_vec_7;
    wire [1:0] out_chan_dep_vld_vec_7;
    wire [29:0] out_chan_dep_data_7;
    wire [1:0] token_out_vec_7;
    wire dl_detect_out_7;
    wire dep_chan_vld_6_7;
    wire [29:0] dep_chan_data_6_7;
    wire token_6_7;
    wire dep_chan_vld_8_7;
    wire [29:0] dep_chan_data_8_7;
    wire token_8_7;
    wire [2:0] proc_8_data_FIFO_blk;
    wire [2:0] proc_8_data_PIPO_blk;
    wire [2:0] proc_8_start_FIFO_blk;
    wire [2:0] proc_8_TLF_FIFO_blk;
    wire [2:0] proc_8_input_sync_blk;
    wire [2:0] proc_8_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_8;
    reg [2:0] proc_dep_vld_vec_8_reg;
    wire [2:0] in_chan_dep_vld_vec_8;
    wire [89:0] in_chan_dep_data_vec_8;
    wire [2:0] token_in_vec_8;
    wire [2:0] out_chan_dep_vld_vec_8;
    wire [29:0] out_chan_dep_data_8;
    wire [2:0] token_out_vec_8;
    wire dl_detect_out_8;
    wire dep_chan_vld_4_8;
    wire [29:0] dep_chan_data_4_8;
    wire token_4_8;
    wire dep_chan_vld_6_8;
    wire [29:0] dep_chan_data_6_8;
    wire token_6_8;
    wire dep_chan_vld_7_8;
    wire [29:0] dep_chan_data_7_8;
    wire token_7_8;
    wire [4:0] proc_9_data_FIFO_blk;
    wire [4:0] proc_9_data_PIPO_blk;
    wire [4:0] proc_9_start_FIFO_blk;
    wire [4:0] proc_9_TLF_FIFO_blk;
    wire [4:0] proc_9_input_sync_blk;
    wire [4:0] proc_9_output_sync_blk;
    wire [4:0] proc_dep_vld_vec_9;
    reg [4:0] proc_dep_vld_vec_9_reg;
    wire [4:0] in_chan_dep_vld_vec_9;
    wire [149:0] in_chan_dep_data_vec_9;
    wire [4:0] token_in_vec_9;
    wire [4:0] out_chan_dep_vld_vec_9;
    wire [29:0] out_chan_dep_data_9;
    wire [4:0] token_out_vec_9;
    wire dl_detect_out_9;
    wire dep_chan_vld_0_9;
    wire [29:0] dep_chan_data_0_9;
    wire token_0_9;
    wire dep_chan_vld_1_9;
    wire [29:0] dep_chan_data_1_9;
    wire token_1_9;
    wire dep_chan_vld_2_9;
    wire [29:0] dep_chan_data_2_9;
    wire token_2_9;
    wire dep_chan_vld_10_9;
    wire [29:0] dep_chan_data_10_9;
    wire token_10_9;
    wire dep_chan_vld_19_9;
    wire [29:0] dep_chan_data_19_9;
    wire token_19_9;
    wire [5:0] proc_10_data_FIFO_blk;
    wire [5:0] proc_10_data_PIPO_blk;
    wire [5:0] proc_10_start_FIFO_blk;
    wire [5:0] proc_10_TLF_FIFO_blk;
    wire [5:0] proc_10_input_sync_blk;
    wire [5:0] proc_10_output_sync_blk;
    wire [5:0] proc_dep_vld_vec_10;
    reg [5:0] proc_dep_vld_vec_10_reg;
    wire [5:0] in_chan_dep_vld_vec_10;
    wire [179:0] in_chan_dep_data_vec_10;
    wire [5:0] token_in_vec_10;
    wire [5:0] out_chan_dep_vld_vec_10;
    wire [29:0] out_chan_dep_data_10;
    wire [5:0] token_out_vec_10;
    wire dl_detect_out_10;
    wire dep_chan_vld_0_10;
    wire [29:0] dep_chan_data_0_10;
    wire token_0_10;
    wire dep_chan_vld_1_10;
    wire [29:0] dep_chan_data_1_10;
    wire token_1_10;
    wire dep_chan_vld_2_10;
    wire [29:0] dep_chan_data_2_10;
    wire token_2_10;
    wire dep_chan_vld_9_10;
    wire [29:0] dep_chan_data_9_10;
    wire token_9_10;
    wire dep_chan_vld_17_10;
    wire [29:0] dep_chan_data_17_10;
    wire token_17_10;
    wire dep_chan_vld_19_10;
    wire [29:0] dep_chan_data_19_10;
    wire token_19_10;
    wire [2:0] proc_11_data_FIFO_blk;
    wire [2:0] proc_11_data_PIPO_blk;
    wire [2:0] proc_11_start_FIFO_blk;
    wire [2:0] proc_11_TLF_FIFO_blk;
    wire [2:0] proc_11_input_sync_blk;
    wire [2:0] proc_11_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_11;
    reg [2:0] proc_dep_vld_vec_11_reg;
    wire [2:0] in_chan_dep_vld_vec_11;
    wire [89:0] in_chan_dep_data_vec_11;
    wire [2:0] token_in_vec_11;
    wire [2:0] out_chan_dep_vld_vec_11;
    wire [29:0] out_chan_dep_data_11;
    wire [2:0] token_out_vec_11;
    wire dl_detect_out_11;
    wire dep_chan_vld_12_11;
    wire [29:0] dep_chan_data_12_11;
    wire token_12_11;
    wire dep_chan_vld_13_11;
    wire [29:0] dep_chan_data_13_11;
    wire token_13_11;
    wire dep_chan_vld_14_11;
    wire [29:0] dep_chan_data_14_11;
    wire token_14_11;
    wire [3:0] proc_12_data_FIFO_blk;
    wire [3:0] proc_12_data_PIPO_blk;
    wire [3:0] proc_12_start_FIFO_blk;
    wire [3:0] proc_12_TLF_FIFO_blk;
    wire [3:0] proc_12_input_sync_blk;
    wire [3:0] proc_12_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_12;
    reg [3:0] proc_dep_vld_vec_12_reg;
    wire [3:0] in_chan_dep_vld_vec_12;
    wire [119:0] in_chan_dep_data_vec_12;
    wire [3:0] token_in_vec_12;
    wire [3:0] out_chan_dep_vld_vec_12;
    wire [29:0] out_chan_dep_data_12;
    wire [3:0] token_out_vec_12;
    wire dl_detect_out_12;
    wire dep_chan_vld_11_12;
    wire [29:0] dep_chan_data_11_12;
    wire token_11_12;
    wire dep_chan_vld_13_12;
    wire [29:0] dep_chan_data_13_12;
    wire token_13_12;
    wire dep_chan_vld_14_12;
    wire [29:0] dep_chan_data_14_12;
    wire token_14_12;
    wire dep_chan_vld_16_12;
    wire [29:0] dep_chan_data_16_12;
    wire token_16_12;
    wire [1:0] proc_13_data_FIFO_blk;
    wire [1:0] proc_13_data_PIPO_blk;
    wire [1:0] proc_13_start_FIFO_blk;
    wire [1:0] proc_13_TLF_FIFO_blk;
    wire [1:0] proc_13_input_sync_blk;
    wire [1:0] proc_13_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_13;
    reg [1:0] proc_dep_vld_vec_13_reg;
    wire [1:0] in_chan_dep_vld_vec_13;
    wire [59:0] in_chan_dep_data_vec_13;
    wire [1:0] token_in_vec_13;
    wire [1:0] out_chan_dep_vld_vec_13;
    wire [29:0] out_chan_dep_data_13;
    wire [1:0] token_out_vec_13;
    wire dl_detect_out_13;
    wire dep_chan_vld_11_13;
    wire [29:0] dep_chan_data_11_13;
    wire token_11_13;
    wire dep_chan_vld_12_13;
    wire [29:0] dep_chan_data_12_13;
    wire token_12_13;
    wire [3:0] proc_14_data_FIFO_blk;
    wire [3:0] proc_14_data_PIPO_blk;
    wire [3:0] proc_14_start_FIFO_blk;
    wire [3:0] proc_14_TLF_FIFO_blk;
    wire [3:0] proc_14_input_sync_blk;
    wire [3:0] proc_14_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_14;
    reg [3:0] proc_dep_vld_vec_14_reg;
    wire [3:0] in_chan_dep_vld_vec_14;
    wire [119:0] in_chan_dep_data_vec_14;
    wire [3:0] token_in_vec_14;
    wire [3:0] out_chan_dep_vld_vec_14;
    wire [29:0] out_chan_dep_data_14;
    wire [3:0] token_out_vec_14;
    wire dl_detect_out_14;
    wire dep_chan_vld_11_14;
    wire [29:0] dep_chan_data_11_14;
    wire token_11_14;
    wire dep_chan_vld_12_14;
    wire [29:0] dep_chan_data_12_14;
    wire token_12_14;
    wire dep_chan_vld_15_14;
    wire [29:0] dep_chan_data_15_14;
    wire token_15_14;
    wire dep_chan_vld_16_14;
    wire [29:0] dep_chan_data_16_14;
    wire token_16_14;
    wire [1:0] proc_15_data_FIFO_blk;
    wire [1:0] proc_15_data_PIPO_blk;
    wire [1:0] proc_15_start_FIFO_blk;
    wire [1:0] proc_15_TLF_FIFO_blk;
    wire [1:0] proc_15_input_sync_blk;
    wire [1:0] proc_15_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_15;
    reg [1:0] proc_dep_vld_vec_15_reg;
    wire [1:0] in_chan_dep_vld_vec_15;
    wire [59:0] in_chan_dep_data_vec_15;
    wire [1:0] token_in_vec_15;
    wire [1:0] out_chan_dep_vld_vec_15;
    wire [29:0] out_chan_dep_data_15;
    wire [1:0] token_out_vec_15;
    wire dl_detect_out_15;
    wire dep_chan_vld_14_15;
    wire [29:0] dep_chan_data_14_15;
    wire token_14_15;
    wire dep_chan_vld_16_15;
    wire [29:0] dep_chan_data_16_15;
    wire token_16_15;
    wire [2:0] proc_16_data_FIFO_blk;
    wire [2:0] proc_16_data_PIPO_blk;
    wire [2:0] proc_16_start_FIFO_blk;
    wire [2:0] proc_16_TLF_FIFO_blk;
    wire [2:0] proc_16_input_sync_blk;
    wire [2:0] proc_16_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_16;
    reg [2:0] proc_dep_vld_vec_16_reg;
    wire [2:0] in_chan_dep_vld_vec_16;
    wire [89:0] in_chan_dep_data_vec_16;
    wire [2:0] token_in_vec_16;
    wire [2:0] out_chan_dep_vld_vec_16;
    wire [29:0] out_chan_dep_data_16;
    wire [2:0] token_out_vec_16;
    wire dl_detect_out_16;
    wire dep_chan_vld_12_16;
    wire [29:0] dep_chan_data_12_16;
    wire token_12_16;
    wire dep_chan_vld_14_16;
    wire [29:0] dep_chan_data_14_16;
    wire token_14_16;
    wire dep_chan_vld_15_16;
    wire [29:0] dep_chan_data_15_16;
    wire token_15_16;
    wire [2:0] proc_17_data_FIFO_blk;
    wire [2:0] proc_17_data_PIPO_blk;
    wire [2:0] proc_17_start_FIFO_blk;
    wire [2:0] proc_17_TLF_FIFO_blk;
    wire [2:0] proc_17_input_sync_blk;
    wire [2:0] proc_17_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_17;
    reg [2:0] proc_dep_vld_vec_17_reg;
    wire [2:0] in_chan_dep_vld_vec_17;
    wire [89:0] in_chan_dep_data_vec_17;
    wire [2:0] token_in_vec_17;
    wire [2:0] out_chan_dep_vld_vec_17;
    wire [29:0] out_chan_dep_data_17;
    wire [2:0] token_out_vec_17;
    wire dl_detect_out_17;
    wire dep_chan_vld_2_17;
    wire [29:0] dep_chan_data_2_17;
    wire token_2_17;
    wire dep_chan_vld_10_17;
    wire [29:0] dep_chan_data_10_17;
    wire token_10_17;
    wire dep_chan_vld_18_17;
    wire [29:0] dep_chan_data_18_17;
    wire token_18_17;
    wire [2:0] proc_18_data_FIFO_blk;
    wire [2:0] proc_18_data_PIPO_blk;
    wire [2:0] proc_18_start_FIFO_blk;
    wire [2:0] proc_18_TLF_FIFO_blk;
    wire [2:0] proc_18_input_sync_blk;
    wire [2:0] proc_18_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_18;
    reg [2:0] proc_dep_vld_vec_18_reg;
    wire [1:0] in_chan_dep_vld_vec_18;
    wire [59:0] in_chan_dep_data_vec_18;
    wire [1:0] token_in_vec_18;
    wire [2:0] out_chan_dep_vld_vec_18;
    wire [29:0] out_chan_dep_data_18;
    wire [2:0] token_out_vec_18;
    wire dl_detect_out_18;
    wire dep_chan_vld_17_18;
    wire [29:0] dep_chan_data_17_18;
    wire token_17_18;
    wire dep_chan_vld_19_18;
    wire [29:0] dep_chan_data_19_18;
    wire token_19_18;
    wire [6:0] proc_19_data_FIFO_blk;
    wire [6:0] proc_19_data_PIPO_blk;
    wire [6:0] proc_19_start_FIFO_blk;
    wire [6:0] proc_19_TLF_FIFO_blk;
    wire [6:0] proc_19_input_sync_blk;
    wire [6:0] proc_19_output_sync_blk;
    wire [6:0] proc_dep_vld_vec_19;
    reg [6:0] proc_dep_vld_vec_19_reg;
    wire [6:0] in_chan_dep_vld_vec_19;
    wire [209:0] in_chan_dep_data_vec_19;
    wire [6:0] token_in_vec_19;
    wire [6:0] out_chan_dep_vld_vec_19;
    wire [29:0] out_chan_dep_data_19;
    wire [6:0] token_out_vec_19;
    wire dl_detect_out_19;
    wire dep_chan_vld_0_19;
    wire [29:0] dep_chan_data_0_19;
    wire token_0_19;
    wire dep_chan_vld_1_19;
    wire [29:0] dep_chan_data_1_19;
    wire token_1_19;
    wire dep_chan_vld_2_19;
    wire [29:0] dep_chan_data_2_19;
    wire token_2_19;
    wire dep_chan_vld_9_19;
    wire [29:0] dep_chan_data_9_19;
    wire token_9_19;
    wire dep_chan_vld_10_19;
    wire [29:0] dep_chan_data_10_19;
    wire token_10_19;
    wire dep_chan_vld_18_19;
    wire [29:0] dep_chan_data_18_19;
    wire token_18_19;
    wire dep_chan_vld_20_19;
    wire [29:0] dep_chan_data_20_19;
    wire token_20_19;
    wire [2:0] proc_20_data_FIFO_blk;
    wire [2:0] proc_20_data_PIPO_blk;
    wire [2:0] proc_20_start_FIFO_blk;
    wire [2:0] proc_20_TLF_FIFO_blk;
    wire [2:0] proc_20_input_sync_blk;
    wire [2:0] proc_20_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_20;
    reg [2:0] proc_dep_vld_vec_20_reg;
    wire [1:0] in_chan_dep_vld_vec_20;
    wire [59:0] in_chan_dep_data_vec_20;
    wire [1:0] token_in_vec_20;
    wire [2:0] out_chan_dep_vld_vec_20;
    wire [29:0] out_chan_dep_data_20;
    wire [2:0] token_out_vec_20;
    wire dl_detect_out_20;
    wire dep_chan_vld_0_20;
    wire [29:0] dep_chan_data_0_20;
    wire token_0_20;
    wire dep_chan_vld_19_20;
    wire [29:0] dep_chan_data_19_20;
    wire token_19_20;
    wire [3:0] proc_21_data_FIFO_blk;
    wire [3:0] proc_21_data_PIPO_blk;
    wire [3:0] proc_21_start_FIFO_blk;
    wire [3:0] proc_21_TLF_FIFO_blk;
    wire [3:0] proc_21_input_sync_blk;
    wire [3:0] proc_21_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_21;
    reg [3:0] proc_dep_vld_vec_21_reg;
    wire [3:0] in_chan_dep_vld_vec_21;
    wire [119:0] in_chan_dep_data_vec_21;
    wire [3:0] token_in_vec_21;
    wire [3:0] out_chan_dep_vld_vec_21;
    wire [29:0] out_chan_dep_data_21;
    wire [3:0] token_out_vec_21;
    wire dl_detect_out_21;
    wire dep_chan_vld_22_21;
    wire [29:0] dep_chan_data_22_21;
    wire token_22_21;
    wire dep_chan_vld_23_21;
    wire [29:0] dep_chan_data_23_21;
    wire token_23_21;
    wire dep_chan_vld_25_21;
    wire [29:0] dep_chan_data_25_21;
    wire token_25_21;
    wire dep_chan_vld_29_21;
    wire [29:0] dep_chan_data_29_21;
    wire token_29_21;
    wire [1:0] proc_22_data_FIFO_blk;
    wire [1:0] proc_22_data_PIPO_blk;
    wire [1:0] proc_22_start_FIFO_blk;
    wire [1:0] proc_22_TLF_FIFO_blk;
    wire [1:0] proc_22_input_sync_blk;
    wire [1:0] proc_22_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_22;
    reg [1:0] proc_dep_vld_vec_22_reg;
    wire [2:0] in_chan_dep_vld_vec_22;
    wire [89:0] in_chan_dep_data_vec_22;
    wire [2:0] token_in_vec_22;
    wire [1:0] out_chan_dep_vld_vec_22;
    wire [29:0] out_chan_dep_data_22;
    wire [1:0] token_out_vec_22;
    wire dl_detect_out_22;
    wire dep_chan_vld_21_22;
    wire [29:0] dep_chan_data_21_22;
    wire token_21_22;
    wire dep_chan_vld_23_22;
    wire [29:0] dep_chan_data_23_22;
    wire token_23_22;
    wire dep_chan_vld_25_22;
    wire [29:0] dep_chan_data_25_22;
    wire token_25_22;
    wire [2:0] proc_23_data_FIFO_blk;
    wire [2:0] proc_23_data_PIPO_blk;
    wire [2:0] proc_23_start_FIFO_blk;
    wire [2:0] proc_23_TLF_FIFO_blk;
    wire [2:0] proc_23_input_sync_blk;
    wire [2:0] proc_23_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_23;
    reg [2:0] proc_dep_vld_vec_23_reg;
    wire [1:0] in_chan_dep_vld_vec_23;
    wire [59:0] in_chan_dep_data_vec_23;
    wire [1:0] token_in_vec_23;
    wire [2:0] out_chan_dep_vld_vec_23;
    wire [29:0] out_chan_dep_data_23;
    wire [2:0] token_out_vec_23;
    wire dl_detect_out_23;
    wire dep_chan_vld_21_23;
    wire [29:0] dep_chan_data_21_23;
    wire token_21_23;
    wire dep_chan_vld_24_23;
    wire [29:0] dep_chan_data_24_23;
    wire token_24_23;
    wire [0:0] proc_24_data_FIFO_blk;
    wire [0:0] proc_24_data_PIPO_blk;
    wire [0:0] proc_24_start_FIFO_blk;
    wire [0:0] proc_24_TLF_FIFO_blk;
    wire [0:0] proc_24_input_sync_blk;
    wire [0:0] proc_24_output_sync_blk;
    wire [0:0] proc_dep_vld_vec_24;
    reg [0:0] proc_dep_vld_vec_24_reg;
    wire [1:0] in_chan_dep_vld_vec_24;
    wire [59:0] in_chan_dep_data_vec_24;
    wire [1:0] token_in_vec_24;
    wire [0:0] out_chan_dep_vld_vec_24;
    wire [29:0] out_chan_dep_data_24;
    wire [0:0] token_out_vec_24;
    wire dl_detect_out_24;
    wire dep_chan_vld_23_24;
    wire [29:0] dep_chan_data_23_24;
    wire token_23_24;
    wire dep_chan_vld_29_24;
    wire [29:0] dep_chan_data_29_24;
    wire token_29_24;
    wire [2:0] proc_25_data_FIFO_blk;
    wire [2:0] proc_25_data_PIPO_blk;
    wire [2:0] proc_25_start_FIFO_blk;
    wire [2:0] proc_25_TLF_FIFO_blk;
    wire [2:0] proc_25_input_sync_blk;
    wire [2:0] proc_25_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_25;
    reg [2:0] proc_dep_vld_vec_25_reg;
    wire [2:0] in_chan_dep_vld_vec_25;
    wire [89:0] in_chan_dep_data_vec_25;
    wire [2:0] token_in_vec_25;
    wire [2:0] out_chan_dep_vld_vec_25;
    wire [29:0] out_chan_dep_data_25;
    wire [2:0] token_out_vec_25;
    wire dl_detect_out_25;
    wire dep_chan_vld_21_25;
    wire [29:0] dep_chan_data_21_25;
    wire token_21_25;
    wire dep_chan_vld_22_25;
    wire [29:0] dep_chan_data_22_25;
    wire token_22_25;
    wire dep_chan_vld_29_25;
    wire [29:0] dep_chan_data_29_25;
    wire token_29_25;
    wire [1:0] proc_26_data_FIFO_blk;
    wire [1:0] proc_26_data_PIPO_blk;
    wire [1:0] proc_26_start_FIFO_blk;
    wire [1:0] proc_26_TLF_FIFO_blk;
    wire [1:0] proc_26_input_sync_blk;
    wire [1:0] proc_26_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_26;
    reg [1:0] proc_dep_vld_vec_26_reg;
    wire [1:0] in_chan_dep_vld_vec_26;
    wire [59:0] in_chan_dep_data_vec_26;
    wire [1:0] token_in_vec_26;
    wire [1:0] out_chan_dep_vld_vec_26;
    wire [29:0] out_chan_dep_data_26;
    wire [1:0] token_out_vec_26;
    wire dl_detect_out_26;
    wire dep_chan_vld_27_26;
    wire [29:0] dep_chan_data_27_26;
    wire token_27_26;
    wire dep_chan_vld_28_26;
    wire [29:0] dep_chan_data_28_26;
    wire token_28_26;
    wire [1:0] proc_27_data_FIFO_blk;
    wire [1:0] proc_27_data_PIPO_blk;
    wire [1:0] proc_27_start_FIFO_blk;
    wire [1:0] proc_27_TLF_FIFO_blk;
    wire [1:0] proc_27_input_sync_blk;
    wire [1:0] proc_27_output_sync_blk;
    wire [1:0] proc_dep_vld_vec_27;
    reg [1:0] proc_dep_vld_vec_27_reg;
    wire [1:0] in_chan_dep_vld_vec_27;
    wire [59:0] in_chan_dep_data_vec_27;
    wire [1:0] token_in_vec_27;
    wire [1:0] out_chan_dep_vld_vec_27;
    wire [29:0] out_chan_dep_data_27;
    wire [1:0] token_out_vec_27;
    wire dl_detect_out_27;
    wire dep_chan_vld_26_27;
    wire [29:0] dep_chan_data_26_27;
    wire token_26_27;
    wire dep_chan_vld_28_27;
    wire [29:0] dep_chan_data_28_27;
    wire token_28_27;
    wire [2:0] proc_28_data_FIFO_blk;
    wire [2:0] proc_28_data_PIPO_blk;
    wire [2:0] proc_28_start_FIFO_blk;
    wire [2:0] proc_28_TLF_FIFO_blk;
    wire [2:0] proc_28_input_sync_blk;
    wire [2:0] proc_28_output_sync_blk;
    wire [2:0] proc_dep_vld_vec_28;
    reg [2:0] proc_dep_vld_vec_28_reg;
    wire [2:0] in_chan_dep_vld_vec_28;
    wire [89:0] in_chan_dep_data_vec_28;
    wire [2:0] token_in_vec_28;
    wire [2:0] out_chan_dep_vld_vec_28;
    wire [29:0] out_chan_dep_data_28;
    wire [2:0] token_out_vec_28;
    wire dl_detect_out_28;
    wire dep_chan_vld_26_28;
    wire [29:0] dep_chan_data_26_28;
    wire token_26_28;
    wire dep_chan_vld_27_28;
    wire [29:0] dep_chan_data_27_28;
    wire token_27_28;
    wire dep_chan_vld_29_28;
    wire [29:0] dep_chan_data_29_28;
    wire token_29_28;
    wire [3:0] proc_29_data_FIFO_blk;
    wire [3:0] proc_29_data_PIPO_blk;
    wire [3:0] proc_29_start_FIFO_blk;
    wire [3:0] proc_29_TLF_FIFO_blk;
    wire [3:0] proc_29_input_sync_blk;
    wire [3:0] proc_29_output_sync_blk;
    wire [3:0] proc_dep_vld_vec_29;
    reg [3:0] proc_dep_vld_vec_29_reg;
    wire [2:0] in_chan_dep_vld_vec_29;
    wire [89:0] in_chan_dep_data_vec_29;
    wire [2:0] token_in_vec_29;
    wire [3:0] out_chan_dep_vld_vec_29;
    wire [29:0] out_chan_dep_data_29;
    wire [3:0] token_out_vec_29;
    wire dl_detect_out_29;
    wire dep_chan_vld_21_29;
    wire [29:0] dep_chan_data_21_29;
    wire token_21_29;
    wire dep_chan_vld_25_29;
    wire [29:0] dep_chan_data_25_29;
    wire token_25_29;
    wire dep_chan_vld_28_29;
    wire [29:0] dep_chan_data_28_29;
    wire token_28_29;
    wire [29:0] dl_in_vec;
    wire dl_detect_out;
    wire token_clear;
    reg [29:0] origin;

    reg ap_done_reg_0;// for module Array2xfMat_64_0_2160_3840_1_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_0 <= 'b0;
        end
        else begin
            ap_done_reg_0 <= Array2xfMat_64_0_2160_3840_1_U0.ap_done & ~Array2xfMat_64_0_2160_3840_1_U0.ap_continue;
        end
    end

    reg ap_done_reg_1;// for module Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2AxiStream_1_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_1 <= 'b0;
        end
        else begin
            ap_done_reg_1 <= Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2AxiStream_1_U0.ap_done & ~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2AxiStream_1_U0.ap_continue;
        end
    end

    reg ap_done_reg_2;// for module Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.last_blk_pxl_width_2_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_2 <= 'b0;
        end
        else begin
            ap_done_reg_2 <= Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.last_blk_pxl_width_2_U0.ap_done & ~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.last_blk_pxl_width_2_U0.ap_continue;
        end
    end

    reg ap_done_reg_3;// for module Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.AxiStream2MatStream_2_1_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_3 <= 'b0;
        end
        else begin
            ap_done_reg_3 <= Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.AxiStream2MatStream_2_1_U0.ap_done & ~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.AxiStream2MatStream_2_1_U0.ap_continue;
        end
    end

    reg ap_done_reg_4;// for module Array2xfMat_64_6_1080_1920_1_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_4 <= 'b0;
        end
        else begin
            ap_done_reg_4 <= Array2xfMat_64_6_1080_1920_1_U0.ap_done & ~Array2xfMat_64_6_1080_1920_1_U0.ap_continue;
        end
    end

    reg ap_done_reg_5;// for module Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2AxiStream_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_5 <= 'b0;
        end
        else begin
            ap_done_reg_5 <= Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2AxiStream_U0.ap_done & ~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2AxiStream_U0.ap_continue;
        end
    end

    reg ap_done_reg_6;// for module Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.last_blk_pxl_width_1_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_6 <= 'b0;
        end
        else begin
            ap_done_reg_6 <= Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.last_blk_pxl_width_1_U0.ap_done & ~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.last_blk_pxl_width_1_U0.ap_continue;
        end
    end

    reg ap_done_reg_7;// for module Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.AxiStream2MatStream_2_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_7 <= 'b0;
        end
        else begin
            ap_done_reg_7 <= Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.AxiStream2MatStream_2_U0.ap_done & ~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.AxiStream2MatStream_2_U0.ap_continue;
        end
    end

    reg ap_done_reg_8;// for module resize_1_9_2160_3840_720_720_1_9_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_8 <= 'b0;
        end
        else begin
            ap_done_reg_8 <= resize_1_9_2160_3840_720_720_1_9_U0.ap_done & ~resize_1_9_2160_3840_720_720_1_9_U0.ap_continue;
        end
    end

    reg ap_done_reg_9;// for module xfMat2Array_64_9_720_720_1_1_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_9 <= 'b0;
        end
        else begin
            ap_done_reg_9 <= xfMat2Array_64_9_720_720_1_1_U0.ap_done & ~xfMat2Array_64_9_720_720_1_1_U0.ap_continue;
        end
    end

    reg ap_done_reg_10;// for module xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.addrbound_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_10 <= 'b0;
        end
        else begin
            ap_done_reg_10 <= xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.addrbound_U0.ap_done & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.addrbound_U0.ap_continue;
        end
    end

    reg ap_done_reg_11;// for module xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2Axi_Block_entry35_proc_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_11 <= 'b0;
        end
        else begin
            ap_done_reg_11 <= xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2Axi_Block_entry35_proc_U0.ap_done & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2Axi_Block_entry35_proc_U0.ap_continue;
        end
    end

    reg ap_done_reg_12;// for module xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.last_blk_pxl_width_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_12 <= 'b0;
        end
        else begin
            ap_done_reg_12 <= xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.last_blk_pxl_width_U0.ap_done & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.last_blk_pxl_width_U0.ap_continue;
        end
    end

    reg ap_done_reg_13;// for module xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.MatStream2AxiStream_2_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_13 <= 'b0;
        end
        else begin
            ap_done_reg_13 <= xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.MatStream2AxiStream_2_U0.ap_done & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.MatStream2AxiStream_2_U0.ap_continue;
        end
    end

    reg ap_done_reg_14;// for module xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.AxiStream2Axi_U0
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            ap_done_reg_14 <= 'b0;
        end
        else begin
            ap_done_reg_14 <= xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.AxiStream2Axi_U0.ap_done & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.AxiStream2Axi_U0.ap_continue;
        end
    end

reg [15:0] trans_in_cnt_0;// for process Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2Mat_Block_entry3_proc_U0
always @(negedge dl_reset or posedge dl_clock) begin
    if (~dl_reset) begin
         trans_in_cnt_0 <= 16'h0;
    end
    else if (Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2Mat_Block_entry3_proc_U0.start_write == 1'b1) begin
        trans_in_cnt_0 <= trans_in_cnt_0 + 16'h1;
    end
    else begin
        trans_in_cnt_0 <= trans_in_cnt_0;
    end
end

reg [15:0] trans_out_cnt_0;// for process Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2Mat_Block_entry3_proc_U0
always @(negedge dl_reset or posedge dl_clock) begin
    if (~dl_reset) begin
         trans_out_cnt_0 <= 16'h0;
    end
    else if (Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2Mat_Block_entry3_proc_U0.ap_done == 1'b1 && Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2Mat_Block_entry3_proc_U0.ap_continue == 1'b1) begin
        trans_out_cnt_0 <= trans_out_cnt_0 + 16'h1;
    end
    else begin
        trans_out_cnt_0 <= trans_out_cnt_0;
    end
end

reg [15:0] trans_in_cnt_1;// for process Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2Mat_Block_entry1_proc_U0
always @(negedge dl_reset or posedge dl_clock) begin
    if (~dl_reset) begin
         trans_in_cnt_1 <= 16'h0;
    end
    else if (Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2Mat_Block_entry1_proc_U0.start_write == 1'b1) begin
        trans_in_cnt_1 <= trans_in_cnt_1 + 16'h1;
    end
    else begin
        trans_in_cnt_1 <= trans_in_cnt_1;
    end
end

reg [15:0] trans_out_cnt_1;// for process Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2Mat_Block_entry1_proc_U0
always @(negedge dl_reset or posedge dl_clock) begin
    if (~dl_reset) begin
         trans_out_cnt_1 <= 16'h0;
    end
    else if (Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2Mat_Block_entry1_proc_U0.ap_done == 1'b1 && Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2Mat_Block_entry1_proc_U0.ap_continue == 1'b1) begin
        trans_out_cnt_1 <= trans_out_cnt_1 + 16'h1;
    end
    else begin
        trans_out_cnt_1 <= trans_out_cnt_1;
    end
end

reg [15:0] trans_in_cnt_2;// for process Array2xfMat_64_0_2160_3840_1_U0
always @(negedge dl_reset or posedge dl_clock) begin
    if (~dl_reset) begin
         trans_in_cnt_2 <= 16'h0;
    end
    else if (Array2xfMat_64_0_2160_3840_1_U0.start_write == 1'b1) begin
        trans_in_cnt_2 <= trans_in_cnt_2 + 16'h1;
    end
    else begin
        trans_in_cnt_2 <= trans_in_cnt_2;
    end
end

reg [15:0] trans_out_cnt_2;// for process Array2xfMat_64_0_2160_3840_1_U0
always @(negedge dl_reset or posedge dl_clock) begin
    if (~dl_reset) begin
         trans_out_cnt_2 <= 16'h0;
    end
    else if (Array2xfMat_64_0_2160_3840_1_U0.ap_done == 1'b1 && Array2xfMat_64_0_2160_3840_1_U0.ap_continue == 1'b1) begin
        trans_out_cnt_2 <= trans_out_cnt_2 + 16'h1;
    end
    else begin
        trans_out_cnt_2 <= trans_out_cnt_2;
    end
end

    // Process: entry_proc11_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 0, 6, 6) pp_pipeline_accel_hls_deadlock_detect_unit_0 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_0),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_0),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_0),
        .token_in_vec(token_in_vec_0),
        .dl_detect_in(dl_detect_out),
        .origin(origin[0]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_0),
        .out_chan_dep_data(out_chan_dep_data_0),
        .token_out_vec(token_out_vec_0),
        .dl_detect_out(dl_in_vec[0]));

    assign proc_0_data_FIFO_blk[0] = 1'b0 | (~entry_proc11_U0.img_out_c_blk_n) | (~entry_proc11_U0.out_img_linestride_c_blk_n);
    assign proc_0_data_PIPO_blk[0] = 1'b0;
    assign proc_0_start_FIFO_blk[0] = 1'b0;
    assign proc_0_TLF_FIFO_blk[0] = 1'b0;
    assign proc_0_input_sync_blk[0] = 1'b0;
    assign proc_0_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_0[0] = dl_detect_out ? proc_dep_vld_vec_0_reg[0] : (proc_0_data_FIFO_blk[0] | proc_0_data_PIPO_blk[0] | proc_0_start_FIFO_blk[0] | proc_0_TLF_FIFO_blk[0] | proc_0_input_sync_blk[0] | proc_0_output_sync_blk[0]);
    assign proc_0_data_FIFO_blk[1] = 1'b0;
    assign proc_0_data_PIPO_blk[1] = 1'b0;
    assign proc_0_start_FIFO_blk[1] = 1'b0;
    assign proc_0_TLF_FIFO_blk[1] = 1'b0;
    assign proc_0_input_sync_blk[1] = 1'b0 | (ap_sync_entry_proc11_U0_ap_ready & entry_proc11_U0.ap_idle & ~ap_sync_Block_entry20_proc_U0_ap_ready);
    assign proc_0_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_0[1] = dl_detect_out ? proc_dep_vld_vec_0_reg[1] : (proc_0_data_FIFO_blk[1] | proc_0_data_PIPO_blk[1] | proc_0_start_FIFO_blk[1] | proc_0_TLF_FIFO_blk[1] | proc_0_input_sync_blk[1] | proc_0_output_sync_blk[1]);
    assign proc_0_data_FIFO_blk[2] = 1'b0;
    assign proc_0_data_PIPO_blk[2] = 1'b0;
    assign proc_0_start_FIFO_blk[2] = 1'b0;
    assign proc_0_TLF_FIFO_blk[2] = 1'b0;
    assign proc_0_input_sync_blk[2] = 1'b0 | (ap_sync_entry_proc11_U0_ap_ready & entry_proc11_U0.ap_idle & ~ap_sync_Array2xfMat_64_0_2160_3840_1_U0_ap_ready);
    assign proc_0_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_0[2] = dl_detect_out ? proc_dep_vld_vec_0_reg[2] : (proc_0_data_FIFO_blk[2] | proc_0_data_PIPO_blk[2] | proc_0_start_FIFO_blk[2] | proc_0_TLF_FIFO_blk[2] | proc_0_input_sync_blk[2] | proc_0_output_sync_blk[2]);
    assign proc_0_data_FIFO_blk[3] = 1'b0;
    assign proc_0_data_PIPO_blk[3] = 1'b0;
    assign proc_0_start_FIFO_blk[3] = 1'b0;
    assign proc_0_TLF_FIFO_blk[3] = 1'b0;
    assign proc_0_input_sync_blk[3] = 1'b0 | (ap_sync_entry_proc11_U0_ap_ready & entry_proc11_U0.ap_idle & ~ap_sync_Block_entry2022_proc_U0_ap_ready);
    assign proc_0_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_0[3] = dl_detect_out ? proc_dep_vld_vec_0_reg[3] : (proc_0_data_FIFO_blk[3] | proc_0_data_PIPO_blk[3] | proc_0_start_FIFO_blk[3] | proc_0_TLF_FIFO_blk[3] | proc_0_input_sync_blk[3] | proc_0_output_sync_blk[3]);
    assign proc_0_data_FIFO_blk[4] = 1'b0;
    assign proc_0_data_PIPO_blk[4] = 1'b0;
    assign proc_0_start_FIFO_blk[4] = 1'b0;
    assign proc_0_TLF_FIFO_blk[4] = 1'b0;
    assign proc_0_input_sync_blk[4] = 1'b0 | (ap_sync_entry_proc11_U0_ap_ready & entry_proc11_U0.ap_idle & ~ap_sync_Array2xfMat_64_6_1080_1920_1_U0_ap_ready);
    assign proc_0_output_sync_blk[4] = 1'b0;
    assign proc_dep_vld_vec_0[4] = dl_detect_out ? proc_dep_vld_vec_0_reg[4] : (proc_0_data_FIFO_blk[4] | proc_0_data_PIPO_blk[4] | proc_0_start_FIFO_blk[4] | proc_0_TLF_FIFO_blk[4] | proc_0_input_sync_blk[4] | proc_0_output_sync_blk[4]);
    assign proc_0_data_FIFO_blk[5] = 1'b0;
    assign proc_0_data_PIPO_blk[5] = 1'b0;
    assign proc_0_start_FIFO_blk[5] = 1'b0;
    assign proc_0_TLF_FIFO_blk[5] = 1'b0;
    assign proc_0_input_sync_blk[5] = 1'b0 | (ap_sync_entry_proc11_U0_ap_ready & entry_proc11_U0.ap_idle & ~ap_sync_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready);
    assign proc_0_output_sync_blk[5] = 1'b0;
    assign proc_dep_vld_vec_0[5] = dl_detect_out ? proc_dep_vld_vec_0_reg[5] : (proc_0_data_FIFO_blk[5] | proc_0_data_PIPO_blk[5] | proc_0_start_FIFO_blk[5] | proc_0_TLF_FIFO_blk[5] | proc_0_input_sync_blk[5] | proc_0_output_sync_blk[5]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_0_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_0_reg <= proc_dep_vld_vec_0;
        end
    end
    assign in_chan_dep_vld_vec_0[0] = dep_chan_vld_1_0;
    assign in_chan_dep_data_vec_0[29 : 0] = dep_chan_data_1_0;
    assign token_in_vec_0[0] = token_1_0;
    assign in_chan_dep_vld_vec_0[1] = dep_chan_vld_2_0;
    assign in_chan_dep_data_vec_0[59 : 30] = dep_chan_data_2_0;
    assign token_in_vec_0[1] = token_2_0;
    assign in_chan_dep_vld_vec_0[2] = dep_chan_vld_9_0;
    assign in_chan_dep_data_vec_0[89 : 60] = dep_chan_data_9_0;
    assign token_in_vec_0[2] = token_9_0;
    assign in_chan_dep_vld_vec_0[3] = dep_chan_vld_10_0;
    assign in_chan_dep_data_vec_0[119 : 90] = dep_chan_data_10_0;
    assign token_in_vec_0[3] = token_10_0;
    assign in_chan_dep_vld_vec_0[4] = dep_chan_vld_19_0;
    assign in_chan_dep_data_vec_0[149 : 120] = dep_chan_data_19_0;
    assign token_in_vec_0[4] = token_19_0;
    assign in_chan_dep_vld_vec_0[5] = dep_chan_vld_20_0;
    assign in_chan_dep_data_vec_0[179 : 150] = dep_chan_data_20_0;
    assign token_in_vec_0[5] = token_20_0;
    assign dep_chan_vld_0_20 = out_chan_dep_vld_vec_0[0];
    assign dep_chan_data_0_20 = out_chan_dep_data_0;
    assign token_0_20 = token_out_vec_0[0];
    assign dep_chan_vld_0_1 = out_chan_dep_vld_vec_0[1];
    assign dep_chan_data_0_1 = out_chan_dep_data_0;
    assign token_0_1 = token_out_vec_0[1];
    assign dep_chan_vld_0_2 = out_chan_dep_vld_vec_0[2];
    assign dep_chan_data_0_2 = out_chan_dep_data_0;
    assign token_0_2 = token_out_vec_0[2];
    assign dep_chan_vld_0_9 = out_chan_dep_vld_vec_0[3];
    assign dep_chan_data_0_9 = out_chan_dep_data_0;
    assign token_0_9 = token_out_vec_0[3];
    assign dep_chan_vld_0_10 = out_chan_dep_vld_vec_0[4];
    assign dep_chan_data_0_10 = out_chan_dep_data_0;
    assign token_0_10 = token_out_vec_0[4];
    assign dep_chan_vld_0_19 = out_chan_dep_vld_vec_0[5];
    assign dep_chan_data_0_19 = out_chan_dep_data_0;
    assign token_0_19 = token_out_vec_0[5];

    // Process: Block_entry20_proc_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 1, 7, 5) pp_pipeline_accel_hls_deadlock_detect_unit_1 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_1),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_1),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_1),
        .token_in_vec(token_in_vec_1),
        .dl_detect_in(dl_detect_out),
        .origin(origin[1]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_1),
        .out_chan_dep_data(out_chan_dep_data_1),
        .token_out_vec(token_out_vec_1),
        .dl_detect_out(dl_in_vec[1]));

    assign proc_1_data_FIFO_blk[0] = 1'b0;
    assign proc_1_data_PIPO_blk[0] = 1'b0;
    assign proc_1_start_FIFO_blk[0] = 1'b0;
    assign proc_1_TLF_FIFO_blk[0] = 1'b0;
    assign proc_1_input_sync_blk[0] = 1'b0 | (ap_sync_Block_entry20_proc_U0_ap_ready & Block_entry20_proc_U0.ap_idle & ~ap_sync_entry_proc11_U0_ap_ready);
    assign proc_1_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_1[0] = dl_detect_out ? proc_dep_vld_vec_1_reg[0] : (proc_1_data_FIFO_blk[0] | proc_1_data_PIPO_blk[0] | proc_1_start_FIFO_blk[0] | proc_1_TLF_FIFO_blk[0] | proc_1_input_sync_blk[0] | proc_1_output_sync_blk[0]);
    assign proc_1_data_FIFO_blk[1] = 1'b0;
    assign proc_1_data_PIPO_blk[1] = 1'b0;
    assign proc_1_start_FIFO_blk[1] = 1'b0;
    assign proc_1_TLF_FIFO_blk[1] = 1'b0;
    assign proc_1_input_sync_blk[1] = 1'b0 | (ap_sync_Block_entry20_proc_U0_ap_ready & Block_entry20_proc_U0.ap_idle & ~ap_sync_Array2xfMat_64_0_2160_3840_1_U0_ap_ready);
    assign proc_1_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_1[1] = dl_detect_out ? proc_dep_vld_vec_1_reg[1] : (proc_1_data_FIFO_blk[1] | proc_1_data_PIPO_blk[1] | proc_1_start_FIFO_blk[1] | proc_1_TLF_FIFO_blk[1] | proc_1_input_sync_blk[1] | proc_1_output_sync_blk[1]);
    assign proc_1_data_FIFO_blk[2] = 1'b0;
    assign proc_1_data_PIPO_blk[2] = 1'b0;
    assign proc_1_start_FIFO_blk[2] = 1'b0;
    assign proc_1_TLF_FIFO_blk[2] = 1'b0;
    assign proc_1_input_sync_blk[2] = 1'b0 | (ap_sync_Block_entry20_proc_U0_ap_ready & Block_entry20_proc_U0.ap_idle & ~ap_sync_Block_entry2022_proc_U0_ap_ready);
    assign proc_1_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_1[2] = dl_detect_out ? proc_dep_vld_vec_1_reg[2] : (proc_1_data_FIFO_blk[2] | proc_1_data_PIPO_blk[2] | proc_1_start_FIFO_blk[2] | proc_1_TLF_FIFO_blk[2] | proc_1_input_sync_blk[2] | proc_1_output_sync_blk[2]);
    assign proc_1_data_FIFO_blk[3] = 1'b0;
    assign proc_1_data_PIPO_blk[3] = 1'b0;
    assign proc_1_start_FIFO_blk[3] = 1'b0;
    assign proc_1_TLF_FIFO_blk[3] = 1'b0;
    assign proc_1_input_sync_blk[3] = 1'b0 | (ap_sync_Block_entry20_proc_U0_ap_ready & Block_entry20_proc_U0.ap_idle & ~ap_sync_Array2xfMat_64_6_1080_1920_1_U0_ap_ready);
    assign proc_1_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_1[3] = dl_detect_out ? proc_dep_vld_vec_1_reg[3] : (proc_1_data_FIFO_blk[3] | proc_1_data_PIPO_blk[3] | proc_1_start_FIFO_blk[3] | proc_1_TLF_FIFO_blk[3] | proc_1_input_sync_blk[3] | proc_1_output_sync_blk[3]);
    assign proc_1_data_FIFO_blk[4] = 1'b0;
    assign proc_1_data_PIPO_blk[4] = 1'b0;
    assign proc_1_start_FIFO_blk[4] = 1'b0;
    assign proc_1_TLF_FIFO_blk[4] = 1'b0;
    assign proc_1_input_sync_blk[4] = 1'b0 | (ap_sync_Block_entry20_proc_U0_ap_ready & Block_entry20_proc_U0.ap_idle & ~ap_sync_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready);
    assign proc_1_output_sync_blk[4] = 1'b0;
    assign proc_dep_vld_vec_1[4] = dl_detect_out ? proc_dep_vld_vec_1_reg[4] : (proc_1_data_FIFO_blk[4] | proc_1_data_PIPO_blk[4] | proc_1_start_FIFO_blk[4] | proc_1_TLF_FIFO_blk[4] | proc_1_input_sync_blk[4] | proc_1_output_sync_blk[4]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_1_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_1_reg <= proc_dep_vld_vec_1;
        end
    end
    assign in_chan_dep_vld_vec_1[0] = dep_chan_vld_0_1;
    assign in_chan_dep_data_vec_1[29 : 0] = dep_chan_data_0_1;
    assign token_in_vec_1[0] = token_0_1;
    assign in_chan_dep_vld_vec_1[1] = dep_chan_vld_2_1;
    assign in_chan_dep_data_vec_1[59 : 30] = dep_chan_data_2_1;
    assign token_in_vec_1[1] = token_2_1;
    assign in_chan_dep_vld_vec_1[2] = dep_chan_vld_9_1;
    assign in_chan_dep_data_vec_1[89 : 60] = dep_chan_data_9_1;
    assign token_in_vec_1[2] = token_9_1;
    assign in_chan_dep_vld_vec_1[3] = dep_chan_vld_10_1;
    assign in_chan_dep_data_vec_1[119 : 90] = dep_chan_data_10_1;
    assign token_in_vec_1[3] = token_10_1;
    assign in_chan_dep_vld_vec_1[4] = dep_chan_vld_18_1;
    assign in_chan_dep_data_vec_1[149 : 120] = dep_chan_data_18_1;
    assign token_in_vec_1[4] = token_18_1;
    assign in_chan_dep_vld_vec_1[5] = dep_chan_vld_19_1;
    assign in_chan_dep_data_vec_1[179 : 150] = dep_chan_data_19_1;
    assign token_in_vec_1[5] = token_19_1;
    assign in_chan_dep_vld_vec_1[6] = dep_chan_vld_20_1;
    assign in_chan_dep_data_vec_1[209 : 180] = dep_chan_data_20_1;
    assign token_in_vec_1[6] = token_20_1;
    assign dep_chan_vld_1_0 = out_chan_dep_vld_vec_1[0];
    assign dep_chan_data_1_0 = out_chan_dep_data_1;
    assign token_1_0 = token_out_vec_1[0];
    assign dep_chan_vld_1_2 = out_chan_dep_vld_vec_1[1];
    assign dep_chan_data_1_2 = out_chan_dep_data_1;
    assign token_1_2 = token_out_vec_1[1];
    assign dep_chan_vld_1_9 = out_chan_dep_vld_vec_1[2];
    assign dep_chan_data_1_9 = out_chan_dep_data_1;
    assign token_1_9 = token_out_vec_1[2];
    assign dep_chan_vld_1_10 = out_chan_dep_vld_vec_1[3];
    assign dep_chan_data_1_10 = out_chan_dep_data_1;
    assign token_1_10 = token_out_vec_1[3];
    assign dep_chan_vld_1_19 = out_chan_dep_vld_vec_1[4];
    assign dep_chan_data_1_19 = out_chan_dep_data_1;
    assign token_1_19 = token_out_vec_1[4];

    // Process: Array2xfMat_64_0_2160_3840_1_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 2, 6, 6) pp_pipeline_accel_hls_deadlock_detect_unit_2 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_2),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_2),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_2),
        .token_in_vec(token_in_vec_2),
        .dl_detect_in(dl_detect_out),
        .origin(origin[2]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_2),
        .out_chan_dep_data(out_chan_dep_data_2),
        .token_out_vec(token_out_vec_2),
        .dl_detect_out(dl_in_vec[2]));

    assign proc_2_data_FIFO_blk[0] = 1'b0;
    assign proc_2_data_PIPO_blk[0] = 1'b0;
    assign proc_2_start_FIFO_blk[0] = 1'b0;
    assign proc_2_TLF_FIFO_blk[0] = 1'b0 | (~imgInput_y_rows_c36_channel_U.if_empty_n & Array2xfMat_64_0_2160_3840_1_U0.ap_idle & ~imgInput_y_rows_c36_channel_U.if_write) | (~imgInput_y_cols_c37_channel_U.if_empty_n & Array2xfMat_64_0_2160_3840_1_U0.ap_idle & ~imgInput_y_cols_c37_channel_U.if_write);
    assign proc_2_input_sync_blk[0] = 1'b0 | (ap_sync_Array2xfMat_64_0_2160_3840_1_U0_ap_ready & Array2xfMat_64_0_2160_3840_1_U0.ap_idle & ~ap_sync_Block_entry20_proc_U0_ap_ready);
    assign proc_2_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_2[0] = dl_detect_out ? proc_dep_vld_vec_2_reg[0] : (proc_2_data_FIFO_blk[0] | proc_2_data_PIPO_blk[0] | proc_2_start_FIFO_blk[0] | proc_2_TLF_FIFO_blk[0] | proc_2_input_sync_blk[0] | proc_2_output_sync_blk[0]);
    assign proc_2_data_FIFO_blk[1] = 1'b0 | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.AxiStream2MatStream_2_1_U0.grp_AxiStream2MatStream_2_1_Pipeline_MMIterInLoopRow_fu_62.imgInput_y_data81_blk_n) | (~Array2xfMat_64_0_2160_3840_1_U0.imgInput_y_rows_c_blk_n) | (~Array2xfMat_64_0_2160_3840_1_U0.imgInput_y_cols_c_blk_n);
    assign proc_2_data_PIPO_blk[1] = 1'b0;
    assign proc_2_start_FIFO_blk[1] = 1'b0 | (~start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_U.if_full_n & Array2xfMat_64_0_2160_3840_1_U0.ap_start & ~Array2xfMat_64_0_2160_3840_1_U0.real_start & (trans_in_cnt_2 == trans_out_cnt_2) & ~start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_U.if_read);
    assign proc_2_TLF_FIFO_blk[1] = 1'b0;
    assign proc_2_input_sync_blk[1] = 1'b0;
    assign proc_2_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_2[1] = dl_detect_out ? proc_dep_vld_vec_2_reg[1] : (proc_2_data_FIFO_blk[1] | proc_2_data_PIPO_blk[1] | proc_2_start_FIFO_blk[1] | proc_2_TLF_FIFO_blk[1] | proc_2_input_sync_blk[1] | proc_2_output_sync_blk[1]);
    assign proc_2_data_FIFO_blk[2] = 1'b0;
    assign proc_2_data_PIPO_blk[2] = 1'b0;
    assign proc_2_start_FIFO_blk[2] = 1'b0;
    assign proc_2_TLF_FIFO_blk[2] = 1'b0;
    assign proc_2_input_sync_blk[2] = 1'b0 | (ap_sync_Array2xfMat_64_0_2160_3840_1_U0_ap_ready & Array2xfMat_64_0_2160_3840_1_U0.ap_idle & ~ap_sync_entry_proc11_U0_ap_ready);
    assign proc_2_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_2[2] = dl_detect_out ? proc_dep_vld_vec_2_reg[2] : (proc_2_data_FIFO_blk[2] | proc_2_data_PIPO_blk[2] | proc_2_start_FIFO_blk[2] | proc_2_TLF_FIFO_blk[2] | proc_2_input_sync_blk[2] | proc_2_output_sync_blk[2]);
    assign proc_2_data_FIFO_blk[3] = 1'b0;
    assign proc_2_data_PIPO_blk[3] = 1'b0;
    assign proc_2_start_FIFO_blk[3] = 1'b0;
    assign proc_2_TLF_FIFO_blk[3] = 1'b0;
    assign proc_2_input_sync_blk[3] = 1'b0 | (ap_sync_Array2xfMat_64_0_2160_3840_1_U0_ap_ready & Array2xfMat_64_0_2160_3840_1_U0.ap_idle & ~ap_sync_Block_entry2022_proc_U0_ap_ready);
    assign proc_2_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_2[3] = dl_detect_out ? proc_dep_vld_vec_2_reg[3] : (proc_2_data_FIFO_blk[3] | proc_2_data_PIPO_blk[3] | proc_2_start_FIFO_blk[3] | proc_2_TLF_FIFO_blk[3] | proc_2_input_sync_blk[3] | proc_2_output_sync_blk[3]);
    assign proc_2_data_FIFO_blk[4] = 1'b0;
    assign proc_2_data_PIPO_blk[4] = 1'b0;
    assign proc_2_start_FIFO_blk[4] = 1'b0;
    assign proc_2_TLF_FIFO_blk[4] = 1'b0;
    assign proc_2_input_sync_blk[4] = 1'b0 | (ap_sync_Array2xfMat_64_0_2160_3840_1_U0_ap_ready & Array2xfMat_64_0_2160_3840_1_U0.ap_idle & ~ap_sync_Array2xfMat_64_6_1080_1920_1_U0_ap_ready);
    assign proc_2_output_sync_blk[4] = 1'b0;
    assign proc_dep_vld_vec_2[4] = dl_detect_out ? proc_dep_vld_vec_2_reg[4] : (proc_2_data_FIFO_blk[4] | proc_2_data_PIPO_blk[4] | proc_2_start_FIFO_blk[4] | proc_2_TLF_FIFO_blk[4] | proc_2_input_sync_blk[4] | proc_2_output_sync_blk[4]);
    assign proc_2_data_FIFO_blk[5] = 1'b0;
    assign proc_2_data_PIPO_blk[5] = 1'b0;
    assign proc_2_start_FIFO_blk[5] = 1'b0;
    assign proc_2_TLF_FIFO_blk[5] = 1'b0;
    assign proc_2_input_sync_blk[5] = 1'b0 | (ap_sync_Array2xfMat_64_0_2160_3840_1_U0_ap_ready & Array2xfMat_64_0_2160_3840_1_U0.ap_idle & ~ap_sync_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready);
    assign proc_2_output_sync_blk[5] = 1'b0;
    assign proc_dep_vld_vec_2[5] = dl_detect_out ? proc_dep_vld_vec_2_reg[5] : (proc_2_data_FIFO_blk[5] | proc_2_data_PIPO_blk[5] | proc_2_start_FIFO_blk[5] | proc_2_TLF_FIFO_blk[5] | proc_2_input_sync_blk[5] | proc_2_output_sync_blk[5]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_2_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_2_reg <= proc_dep_vld_vec_2;
        end
    end
    assign in_chan_dep_vld_vec_2[0] = dep_chan_vld_0_2;
    assign in_chan_dep_data_vec_2[29 : 0] = dep_chan_data_0_2;
    assign token_in_vec_2[0] = token_0_2;
    assign in_chan_dep_vld_vec_2[1] = dep_chan_vld_1_2;
    assign in_chan_dep_data_vec_2[59 : 30] = dep_chan_data_1_2;
    assign token_in_vec_2[1] = token_1_2;
    assign in_chan_dep_vld_vec_2[2] = dep_chan_vld_9_2;
    assign in_chan_dep_data_vec_2[89 : 60] = dep_chan_data_9_2;
    assign token_in_vec_2[2] = token_9_2;
    assign in_chan_dep_vld_vec_2[3] = dep_chan_vld_10_2;
    assign in_chan_dep_data_vec_2[119 : 90] = dep_chan_data_10_2;
    assign token_in_vec_2[3] = token_10_2;
    assign in_chan_dep_vld_vec_2[4] = dep_chan_vld_17_2;
    assign in_chan_dep_data_vec_2[149 : 120] = dep_chan_data_17_2;
    assign token_in_vec_2[4] = token_17_2;
    assign in_chan_dep_vld_vec_2[5] = dep_chan_vld_19_2;
    assign in_chan_dep_data_vec_2[179 : 150] = dep_chan_data_19_2;
    assign token_in_vec_2[5] = token_19_2;
    assign dep_chan_vld_2_1 = out_chan_dep_vld_vec_2[0];
    assign dep_chan_data_2_1 = out_chan_dep_data_2;
    assign token_2_1 = token_out_vec_2[0];
    assign dep_chan_vld_2_17 = out_chan_dep_vld_vec_2[1];
    assign dep_chan_data_2_17 = out_chan_dep_data_2;
    assign token_2_17 = token_out_vec_2[1];
    assign dep_chan_vld_2_0 = out_chan_dep_vld_vec_2[2];
    assign dep_chan_data_2_0 = out_chan_dep_data_2;
    assign token_2_0 = token_out_vec_2[2];
    assign dep_chan_vld_2_9 = out_chan_dep_vld_vec_2[3];
    assign dep_chan_data_2_9 = out_chan_dep_data_2;
    assign token_2_9 = token_out_vec_2[3];
    assign dep_chan_vld_2_10 = out_chan_dep_vld_vec_2[4];
    assign dep_chan_data_2_10 = out_chan_dep_data_2;
    assign token_2_10 = token_out_vec_2[4];
    assign dep_chan_vld_2_19 = out_chan_dep_vld_vec_2[5];
    assign dep_chan_data_2_19 = out_chan_dep_data_2;
    assign token_2_19 = token_out_vec_2[5];

    // Process: Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2Mat_Block_entry3_proc_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 3, 3, 3) pp_pipeline_accel_hls_deadlock_detect_unit_3 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_3),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_3),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_3),
        .token_in_vec(token_in_vec_3),
        .dl_detect_in(dl_detect_out),
        .origin(origin[3]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_3),
        .out_chan_dep_data(out_chan_dep_data_3),
        .token_out_vec(token_out_vec_3),
        .dl_detect_out(dl_in_vec[3]));

    assign proc_3_data_FIFO_blk[0] = 1'b0 | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2Mat_Block_entry3_proc_U0.rows_c_blk_n) | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2Mat_Block_entry3_proc_U0.cols_c_blk_n);
    assign proc_3_data_PIPO_blk[0] = 1'b0;
    assign proc_3_start_FIFO_blk[0] = 1'b0 | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.start_for_AxiStream2Mat_1_U0_U.if_full_n & Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2Mat_Block_entry3_proc_U0.ap_start & ~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2Mat_Block_entry3_proc_U0.real_start & (trans_in_cnt_0 == trans_out_cnt_0) & ~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.start_for_AxiStream2Mat_1_U0_U.if_read);
    assign proc_3_TLF_FIFO_blk[0] = 1'b0;
    assign proc_3_input_sync_blk[0] = 1'b0;
    assign proc_3_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_3[0] = dl_detect_out ? proc_dep_vld_vec_3_reg[0] : (proc_3_data_FIFO_blk[0] | proc_3_data_PIPO_blk[0] | proc_3_start_FIFO_blk[0] | proc_3_TLF_FIFO_blk[0] | proc_3_input_sync_blk[0] | proc_3_output_sync_blk[0]);
    assign proc_3_data_FIFO_blk[1] = 1'b0 | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2Mat_Block_entry3_proc_U0.rows_c_blk_n) | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2Mat_Block_entry3_proc_U0.cols_c_blk_n);
    assign proc_3_data_PIPO_blk[1] = 1'b0;
    assign proc_3_start_FIFO_blk[1] = 1'b0;
    assign proc_3_TLF_FIFO_blk[1] = 1'b0;
    assign proc_3_input_sync_blk[1] = 1'b0;
    assign proc_3_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_3[1] = dl_detect_out ? proc_dep_vld_vec_3_reg[1] : (proc_3_data_FIFO_blk[1] | proc_3_data_PIPO_blk[1] | proc_3_start_FIFO_blk[1] | proc_3_TLF_FIFO_blk[1] | proc_3_input_sync_blk[1] | proc_3_output_sync_blk[1]);
    assign proc_3_data_FIFO_blk[2] = 1'b0;
    assign proc_3_data_PIPO_blk[2] = 1'b0;
    assign proc_3_start_FIFO_blk[2] = 1'b0;
    assign proc_3_TLF_FIFO_blk[2] = 1'b0;
    assign proc_3_input_sync_blk[2] = 1'b0 | (Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.ap_sync_Axi2Mat_Block_entry3_proc_U0_ap_ready & Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2Mat_Block_entry3_proc_U0.ap_idle & ~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.ap_sync_Axi2AxiStream_1_U0_ap_ready);
    assign proc_3_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_3[2] = dl_detect_out ? proc_dep_vld_vec_3_reg[2] : (proc_3_data_FIFO_blk[2] | proc_3_data_PIPO_blk[2] | proc_3_start_FIFO_blk[2] | proc_3_TLF_FIFO_blk[2] | proc_3_input_sync_blk[2] | proc_3_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_3_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_3_reg <= proc_dep_vld_vec_3;
        end
    end
    assign in_chan_dep_vld_vec_3[0] = dep_chan_vld_4_3;
    assign in_chan_dep_data_vec_3[29 : 0] = dep_chan_data_4_3;
    assign token_in_vec_3[0] = token_4_3;
    assign in_chan_dep_vld_vec_3[1] = dep_chan_vld_5_3;
    assign in_chan_dep_data_vec_3[59 : 30] = dep_chan_data_5_3;
    assign token_in_vec_3[1] = token_5_3;
    assign in_chan_dep_vld_vec_3[2] = dep_chan_vld_6_3;
    assign in_chan_dep_data_vec_3[89 : 60] = dep_chan_data_6_3;
    assign token_in_vec_3[2] = token_6_3;
    assign dep_chan_vld_3_5 = out_chan_dep_vld_vec_3[0];
    assign dep_chan_data_3_5 = out_chan_dep_data_3;
    assign token_3_5 = token_out_vec_3[0];
    assign dep_chan_vld_3_6 = out_chan_dep_vld_vec_3[1];
    assign dep_chan_data_3_6 = out_chan_dep_data_3;
    assign token_3_6 = token_out_vec_3[1];
    assign dep_chan_vld_3_4 = out_chan_dep_vld_vec_3[2];
    assign dep_chan_data_3_4 = out_chan_dep_data_3;
    assign token_3_4 = token_out_vec_3[2];

    // Process: Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2AxiStream_1_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 4, 3, 3) pp_pipeline_accel_hls_deadlock_detect_unit_4 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_4),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_4),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_4),
        .token_in_vec(token_in_vec_4),
        .dl_detect_in(dl_detect_out),
        .origin(origin[4]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_4),
        .out_chan_dep_data(out_chan_dep_data_4),
        .token_out_vec(token_out_vec_4),
        .dl_detect_out(dl_in_vec[4]));

    assign proc_4_data_FIFO_blk[0] = 1'b0 | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2AxiStream_1_U0.grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142.ldata_blk_n);
    assign proc_4_data_PIPO_blk[0] = 1'b0;
    assign proc_4_start_FIFO_blk[0] = 1'b0;
    assign proc_4_TLF_FIFO_blk[0] = 1'b0;
    assign proc_4_input_sync_blk[0] = 1'b0;
    assign proc_4_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_4[0] = dl_detect_out ? proc_dep_vld_vec_4_reg[0] : (proc_4_data_FIFO_blk[0] | proc_4_data_PIPO_blk[0] | proc_4_start_FIFO_blk[0] | proc_4_TLF_FIFO_blk[0] | proc_4_input_sync_blk[0] | proc_4_output_sync_blk[0]);
    assign proc_4_data_FIFO_blk[1] = 1'b0 | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2AxiStream_1_U0.grp_Axi2AxiStream_1_Pipeline_VITIS_LOOP_1028_1_fu_142.ldata_blk_n);
    assign proc_4_data_PIPO_blk[1] = 1'b0;
    assign proc_4_start_FIFO_blk[1] = 1'b0;
    assign proc_4_TLF_FIFO_blk[1] = 1'b0;
    assign proc_4_input_sync_blk[1] = 1'b0;
    assign proc_4_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_4[1] = dl_detect_out ? proc_dep_vld_vec_4_reg[1] : (proc_4_data_FIFO_blk[1] | proc_4_data_PIPO_blk[1] | proc_4_start_FIFO_blk[1] | proc_4_TLF_FIFO_blk[1] | proc_4_input_sync_blk[1] | proc_4_output_sync_blk[1]);
    assign proc_4_data_FIFO_blk[2] = 1'b0;
    assign proc_4_data_PIPO_blk[2] = 1'b0;
    assign proc_4_start_FIFO_blk[2] = 1'b0;
    assign proc_4_TLF_FIFO_blk[2] = 1'b0 | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.rows_burst_loc_channel_U.if_empty_n & Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2AxiStream_1_U0.ap_idle & ~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.rows_burst_loc_channel_U.if_write) | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.rows_stride_loc_channel_U.if_empty_n & Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2AxiStream_1_U0.ap_idle & ~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.rows_stride_loc_channel_U.if_write) | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.cols_cast_loc_channel_U.if_empty_n & Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2AxiStream_1_U0.ap_idle & ~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.cols_cast_loc_channel_U.if_write);
    assign proc_4_input_sync_blk[2] = 1'b0 | (Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.ap_sync_Axi2AxiStream_1_U0_ap_ready & Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.Axi2AxiStream_1_U0.ap_idle & ~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.ap_sync_Axi2Mat_Block_entry3_proc_U0_ap_ready);
    assign proc_4_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_4[2] = dl_detect_out ? proc_dep_vld_vec_4_reg[2] : (proc_4_data_FIFO_blk[2] | proc_4_data_PIPO_blk[2] | proc_4_start_FIFO_blk[2] | proc_4_TLF_FIFO_blk[2] | proc_4_input_sync_blk[2] | proc_4_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_4_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_4_reg <= proc_dep_vld_vec_4;
        end
    end
    assign in_chan_dep_vld_vec_4[0] = dep_chan_vld_3_4;
    assign in_chan_dep_data_vec_4[29 : 0] = dep_chan_data_3_4;
    assign token_in_vec_4[0] = token_3_4;
    assign in_chan_dep_vld_vec_4[1] = dep_chan_vld_5_4;
    assign in_chan_dep_data_vec_4[59 : 30] = dep_chan_data_5_4;
    assign token_in_vec_4[1] = token_5_4;
    assign in_chan_dep_vld_vec_4[2] = dep_chan_vld_8_4;
    assign in_chan_dep_data_vec_4[89 : 60] = dep_chan_data_8_4;
    assign token_in_vec_4[2] = token_8_4;
    assign dep_chan_vld_4_5 = out_chan_dep_vld_vec_4[0];
    assign dep_chan_data_4_5 = out_chan_dep_data_4;
    assign token_4_5 = token_out_vec_4[0];
    assign dep_chan_vld_4_8 = out_chan_dep_vld_vec_4[1];
    assign dep_chan_data_4_8 = out_chan_dep_data_4;
    assign token_4_8 = token_out_vec_4[1];
    assign dep_chan_vld_4_3 = out_chan_dep_vld_vec_4[2];
    assign dep_chan_data_4_3 = out_chan_dep_data_4;
    assign token_4_3 = token_out_vec_4[2];

    // Process: Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 5, 2, 2) pp_pipeline_accel_hls_deadlock_detect_unit_5 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_5),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_5),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_5),
        .token_in_vec(token_in_vec_5),
        .dl_detect_in(dl_detect_out),
        .origin(origin[5]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_5),
        .out_chan_dep_data(out_chan_dep_data_5),
        .token_out_vec(token_out_vec_5),
        .dl_detect_out(dl_in_vec[5]));

    assign proc_5_data_FIFO_blk[0] = 1'b0 | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.AxiStream2MatStream_2_1_U0.grp_AxiStream2MatStream_2_1_Pipeline_MMIterInLoopRow_fu_62.ldata1_blk_n);
    assign proc_5_data_PIPO_blk[0] = 1'b0;
    assign proc_5_start_FIFO_blk[0] = 1'b0;
    assign proc_5_TLF_FIFO_blk[0] = 1'b0;
    assign proc_5_input_sync_blk[0] = 1'b0;
    assign proc_5_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_5[0] = dl_detect_out ? proc_dep_vld_vec_5_reg[0] : (proc_5_data_FIFO_blk[0] | proc_5_data_PIPO_blk[0] | proc_5_start_FIFO_blk[0] | proc_5_TLF_FIFO_blk[0] | proc_5_input_sync_blk[0] | proc_5_output_sync_blk[0]);
    assign proc_5_data_FIFO_blk[1] = 1'b0 | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.entry_proc9_U0.rows_blk_n) | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.entry_proc9_U0.cols_blk_n);
    assign proc_5_data_PIPO_blk[1] = 1'b0;
    assign proc_5_start_FIFO_blk[1] = 1'b0 | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.start_for_AxiStream2Mat_1_U0_U.if_empty_n & Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.ap_idle & ~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.start_for_AxiStream2Mat_1_U0_U.if_write);
    assign proc_5_TLF_FIFO_blk[1] = 1'b0;
    assign proc_5_input_sync_blk[1] = 1'b0;
    assign proc_5_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_5[1] = dl_detect_out ? proc_dep_vld_vec_5_reg[1] : (proc_5_data_FIFO_blk[1] | proc_5_data_PIPO_blk[1] | proc_5_start_FIFO_blk[1] | proc_5_TLF_FIFO_blk[1] | proc_5_input_sync_blk[1] | proc_5_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_5_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_5_reg <= proc_dep_vld_vec_5;
        end
    end
    assign in_chan_dep_vld_vec_5[0] = dep_chan_vld_3_5;
    assign in_chan_dep_data_vec_5[29 : 0] = dep_chan_data_3_5;
    assign token_in_vec_5[0] = token_3_5;
    assign in_chan_dep_vld_vec_5[1] = dep_chan_vld_4_5;
    assign in_chan_dep_data_vec_5[59 : 30] = dep_chan_data_4_5;
    assign token_in_vec_5[1] = token_4_5;
    assign dep_chan_vld_5_4 = out_chan_dep_vld_vec_5[0];
    assign dep_chan_data_5_4 = out_chan_dep_data_5;
    assign token_5_4 = token_out_vec_5[0];
    assign dep_chan_vld_5_3 = out_chan_dep_vld_vec_5[1];
    assign dep_chan_data_5_3 = out_chan_dep_data_5;
    assign token_5_3 = token_out_vec_5[1];

    // Process: Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.entry_proc9_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 6, 3, 3) pp_pipeline_accel_hls_deadlock_detect_unit_6 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_6),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_6),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_6),
        .token_in_vec(token_in_vec_6),
        .dl_detect_in(dl_detect_out),
        .origin(origin[6]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_6),
        .out_chan_dep_data(out_chan_dep_data_6),
        .token_out_vec(token_out_vec_6),
        .dl_detect_out(dl_in_vec[6]));

    assign proc_6_data_FIFO_blk[0] = 1'b0 | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.entry_proc9_U0.rows_blk_n) | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.entry_proc9_U0.cols_blk_n);
    assign proc_6_data_PIPO_blk[0] = 1'b0;
    assign proc_6_start_FIFO_blk[0] = 1'b0;
    assign proc_6_TLF_FIFO_blk[0] = 1'b0;
    assign proc_6_input_sync_blk[0] = 1'b0;
    assign proc_6_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_6[0] = dl_detect_out ? proc_dep_vld_vec_6_reg[0] : (proc_6_data_FIFO_blk[0] | proc_6_data_PIPO_blk[0] | proc_6_start_FIFO_blk[0] | proc_6_TLF_FIFO_blk[0] | proc_6_input_sync_blk[0] | proc_6_output_sync_blk[0]);
    assign proc_6_data_FIFO_blk[1] = 1'b0 | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.entry_proc9_U0.rows_c_blk_n) | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.entry_proc9_U0.cols_c_blk_n);
    assign proc_6_data_PIPO_blk[1] = 1'b0;
    assign proc_6_start_FIFO_blk[1] = 1'b0;
    assign proc_6_TLF_FIFO_blk[1] = 1'b0;
    assign proc_6_input_sync_blk[1] = 1'b0;
    assign proc_6_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_6[1] = dl_detect_out ? proc_dep_vld_vec_6_reg[1] : (proc_6_data_FIFO_blk[1] | proc_6_data_PIPO_blk[1] | proc_6_start_FIFO_blk[1] | proc_6_TLF_FIFO_blk[1] | proc_6_input_sync_blk[1] | proc_6_output_sync_blk[1]);
    assign proc_6_data_FIFO_blk[2] = 1'b0;
    assign proc_6_data_PIPO_blk[2] = 1'b0;
    assign proc_6_start_FIFO_blk[2] = 1'b0;
    assign proc_6_TLF_FIFO_blk[2] = 1'b0;
    assign proc_6_input_sync_blk[2] = 1'b0 | (Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.ap_sync_entry_proc9_U0_ap_ready & Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.entry_proc9_U0.ap_idle & ~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.ap_sync_last_blk_pxl_width_2_U0_ap_ready);
    assign proc_6_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_6[2] = dl_detect_out ? proc_dep_vld_vec_6_reg[2] : (proc_6_data_FIFO_blk[2] | proc_6_data_PIPO_blk[2] | proc_6_start_FIFO_blk[2] | proc_6_TLF_FIFO_blk[2] | proc_6_input_sync_blk[2] | proc_6_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_6_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_6_reg <= proc_dep_vld_vec_6;
        end
    end
    assign in_chan_dep_vld_vec_6[0] = dep_chan_vld_3_6;
    assign in_chan_dep_data_vec_6[29 : 0] = dep_chan_data_3_6;
    assign token_in_vec_6[0] = token_3_6;
    assign in_chan_dep_vld_vec_6[1] = dep_chan_vld_7_6;
    assign in_chan_dep_data_vec_6[59 : 30] = dep_chan_data_7_6;
    assign token_in_vec_6[1] = token_7_6;
    assign in_chan_dep_vld_vec_6[2] = dep_chan_vld_8_6;
    assign in_chan_dep_data_vec_6[89 : 60] = dep_chan_data_8_6;
    assign token_in_vec_6[2] = token_8_6;
    assign dep_chan_vld_6_3 = out_chan_dep_vld_vec_6[0];
    assign dep_chan_data_6_3 = out_chan_dep_data_6;
    assign token_6_3 = token_out_vec_6[0];
    assign dep_chan_vld_6_8 = out_chan_dep_vld_vec_6[1];
    assign dep_chan_data_6_8 = out_chan_dep_data_6;
    assign token_6_8 = token_out_vec_6[1];
    assign dep_chan_vld_6_7 = out_chan_dep_vld_vec_6[2];
    assign dep_chan_data_6_7 = out_chan_dep_data_6;
    assign token_6_7 = token_out_vec_6[2];

    // Process: Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.last_blk_pxl_width_2_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 7, 2, 2) pp_pipeline_accel_hls_deadlock_detect_unit_7 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_7),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_7),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_7),
        .token_in_vec(token_in_vec_7),
        .dl_detect_in(dl_detect_out),
        .origin(origin[7]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_7),
        .out_chan_dep_data(out_chan_dep_data_7),
        .token_out_vec(token_out_vec_7),
        .dl_detect_out(dl_in_vec[7]));

    assign proc_7_data_FIFO_blk[0] = 1'b0;
    assign proc_7_data_PIPO_blk[0] = 1'b0;
    assign proc_7_start_FIFO_blk[0] = 1'b0;
    assign proc_7_TLF_FIFO_blk[0] = 1'b0 | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.last_blk_width_channel_U.if_full_n & Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.last_blk_pxl_width_2_U0.ap_done & ap_done_reg_2 & ~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.last_blk_width_channel_U.if_read);
    assign proc_7_input_sync_blk[0] = 1'b0;
    assign proc_7_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_7[0] = dl_detect_out ? proc_dep_vld_vec_7_reg[0] : (proc_7_data_FIFO_blk[0] | proc_7_data_PIPO_blk[0] | proc_7_start_FIFO_blk[0] | proc_7_TLF_FIFO_blk[0] | proc_7_input_sync_blk[0] | proc_7_output_sync_blk[0]);
    assign proc_7_data_FIFO_blk[1] = 1'b0;
    assign proc_7_data_PIPO_blk[1] = 1'b0;
    assign proc_7_start_FIFO_blk[1] = 1'b0;
    assign proc_7_TLF_FIFO_blk[1] = 1'b0;
    assign proc_7_input_sync_blk[1] = 1'b0 | (Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.ap_sync_last_blk_pxl_width_2_U0_ap_ready & Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.last_blk_pxl_width_2_U0.ap_idle & ~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.ap_sync_entry_proc9_U0_ap_ready);
    assign proc_7_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_7[1] = dl_detect_out ? proc_dep_vld_vec_7_reg[1] : (proc_7_data_FIFO_blk[1] | proc_7_data_PIPO_blk[1] | proc_7_start_FIFO_blk[1] | proc_7_TLF_FIFO_blk[1] | proc_7_input_sync_blk[1] | proc_7_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_7_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_7_reg <= proc_dep_vld_vec_7;
        end
    end
    assign in_chan_dep_vld_vec_7[0] = dep_chan_vld_6_7;
    assign in_chan_dep_data_vec_7[29 : 0] = dep_chan_data_6_7;
    assign token_in_vec_7[0] = token_6_7;
    assign in_chan_dep_vld_vec_7[1] = dep_chan_vld_8_7;
    assign in_chan_dep_data_vec_7[59 : 30] = dep_chan_data_8_7;
    assign token_in_vec_7[1] = token_8_7;
    assign dep_chan_vld_7_8 = out_chan_dep_vld_vec_7[0];
    assign dep_chan_data_7_8 = out_chan_dep_data_7;
    assign token_7_8 = token_out_vec_7[0];
    assign dep_chan_vld_7_6 = out_chan_dep_vld_vec_7[1];
    assign dep_chan_data_7_6 = out_chan_dep_data_7;
    assign token_7_6 = token_out_vec_7[1];

    // Process: Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.AxiStream2MatStream_2_1_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 8, 3, 3) pp_pipeline_accel_hls_deadlock_detect_unit_8 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_8),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_8),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_8),
        .token_in_vec(token_in_vec_8),
        .dl_detect_in(dl_detect_out),
        .origin(origin[8]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_8),
        .out_chan_dep_data(out_chan_dep_data_8),
        .token_out_vec(token_out_vec_8),
        .dl_detect_out(dl_in_vec[8]));

    assign proc_8_data_FIFO_blk[0] = 1'b0 | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.AxiStream2MatStream_2_1_U0.grp_AxiStream2MatStream_2_1_Pipeline_MMIterInLoopRow_fu_62.ldata1_blk_n);
    assign proc_8_data_PIPO_blk[0] = 1'b0;
    assign proc_8_start_FIFO_blk[0] = 1'b0;
    assign proc_8_TLF_FIFO_blk[0] = 1'b0;
    assign proc_8_input_sync_blk[0] = 1'b0;
    assign proc_8_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_8[0] = dl_detect_out ? proc_dep_vld_vec_8_reg[0] : (proc_8_data_FIFO_blk[0] | proc_8_data_PIPO_blk[0] | proc_8_start_FIFO_blk[0] | proc_8_TLF_FIFO_blk[0] | proc_8_input_sync_blk[0] | proc_8_output_sync_blk[0]);
    assign proc_8_data_FIFO_blk[1] = 1'b0 | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.AxiStream2MatStream_2_1_U0.rows_blk_n) | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.AxiStream2MatStream_2_1_U0.cols_bound_per_npc_blk_n);
    assign proc_8_data_PIPO_blk[1] = 1'b0;
    assign proc_8_start_FIFO_blk[1] = 1'b0;
    assign proc_8_TLF_FIFO_blk[1] = 1'b0;
    assign proc_8_input_sync_blk[1] = 1'b0;
    assign proc_8_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_8[1] = dl_detect_out ? proc_dep_vld_vec_8_reg[1] : (proc_8_data_FIFO_blk[1] | proc_8_data_PIPO_blk[1] | proc_8_start_FIFO_blk[1] | proc_8_TLF_FIFO_blk[1] | proc_8_input_sync_blk[1] | proc_8_output_sync_blk[1]);
    assign proc_8_data_FIFO_blk[2] = 1'b0;
    assign proc_8_data_PIPO_blk[2] = 1'b0;
    assign proc_8_start_FIFO_blk[2] = 1'b0;
    assign proc_8_TLF_FIFO_blk[2] = 1'b0 | (~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.last_blk_width_channel_U.if_empty_n & Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.AxiStream2MatStream_2_1_U0.ap_idle & ~Array2xfMat_64_0_2160_3840_1_U0.grp_Axi2Mat_1_fu_92.AxiStream2Mat_1_U0.last_blk_width_channel_U.if_write);
    assign proc_8_input_sync_blk[2] = 1'b0;
    assign proc_8_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_8[2] = dl_detect_out ? proc_dep_vld_vec_8_reg[2] : (proc_8_data_FIFO_blk[2] | proc_8_data_PIPO_blk[2] | proc_8_start_FIFO_blk[2] | proc_8_TLF_FIFO_blk[2] | proc_8_input_sync_blk[2] | proc_8_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_8_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_8_reg <= proc_dep_vld_vec_8;
        end
    end
    assign in_chan_dep_vld_vec_8[0] = dep_chan_vld_4_8;
    assign in_chan_dep_data_vec_8[29 : 0] = dep_chan_data_4_8;
    assign token_in_vec_8[0] = token_4_8;
    assign in_chan_dep_vld_vec_8[1] = dep_chan_vld_6_8;
    assign in_chan_dep_data_vec_8[59 : 30] = dep_chan_data_6_8;
    assign token_in_vec_8[1] = token_6_8;
    assign in_chan_dep_vld_vec_8[2] = dep_chan_vld_7_8;
    assign in_chan_dep_data_vec_8[89 : 60] = dep_chan_data_7_8;
    assign token_in_vec_8[2] = token_7_8;
    assign dep_chan_vld_8_4 = out_chan_dep_vld_vec_8[0];
    assign dep_chan_data_8_4 = out_chan_dep_data_8;
    assign token_8_4 = token_out_vec_8[0];
    assign dep_chan_vld_8_6 = out_chan_dep_vld_vec_8[1];
    assign dep_chan_data_8_6 = out_chan_dep_data_8;
    assign token_8_6 = token_out_vec_8[1];
    assign dep_chan_vld_8_7 = out_chan_dep_vld_vec_8[2];
    assign dep_chan_data_8_7 = out_chan_dep_data_8;
    assign token_8_7 = token_out_vec_8[2];

    // Process: Block_entry2022_proc_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 9, 5, 5) pp_pipeline_accel_hls_deadlock_detect_unit_9 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_9),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_9),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_9),
        .token_in_vec(token_in_vec_9),
        .dl_detect_in(dl_detect_out),
        .origin(origin[9]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_9),
        .out_chan_dep_data(out_chan_dep_data_9),
        .token_out_vec(token_out_vec_9),
        .dl_detect_out(dl_in_vec[9]));

    assign proc_9_data_FIFO_blk[0] = 1'b0;
    assign proc_9_data_PIPO_blk[0] = 1'b0;
    assign proc_9_start_FIFO_blk[0] = 1'b0;
    assign proc_9_TLF_FIFO_blk[0] = 1'b0;
    assign proc_9_input_sync_blk[0] = 1'b0 | (ap_sync_Block_entry2022_proc_U0_ap_ready & Block_entry2022_proc_U0.ap_idle & ~ap_sync_entry_proc11_U0_ap_ready);
    assign proc_9_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_9[0] = dl_detect_out ? proc_dep_vld_vec_9_reg[0] : (proc_9_data_FIFO_blk[0] | proc_9_data_PIPO_blk[0] | proc_9_start_FIFO_blk[0] | proc_9_TLF_FIFO_blk[0] | proc_9_input_sync_blk[0] | proc_9_output_sync_blk[0]);
    assign proc_9_data_FIFO_blk[1] = 1'b0;
    assign proc_9_data_PIPO_blk[1] = 1'b0;
    assign proc_9_start_FIFO_blk[1] = 1'b0;
    assign proc_9_TLF_FIFO_blk[1] = 1'b0;
    assign proc_9_input_sync_blk[1] = 1'b0 | (ap_sync_Block_entry2022_proc_U0_ap_ready & Block_entry2022_proc_U0.ap_idle & ~ap_sync_Block_entry20_proc_U0_ap_ready);
    assign proc_9_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_9[1] = dl_detect_out ? proc_dep_vld_vec_9_reg[1] : (proc_9_data_FIFO_blk[1] | proc_9_data_PIPO_blk[1] | proc_9_start_FIFO_blk[1] | proc_9_TLF_FIFO_blk[1] | proc_9_input_sync_blk[1] | proc_9_output_sync_blk[1]);
    assign proc_9_data_FIFO_blk[2] = 1'b0;
    assign proc_9_data_PIPO_blk[2] = 1'b0;
    assign proc_9_start_FIFO_blk[2] = 1'b0;
    assign proc_9_TLF_FIFO_blk[2] = 1'b0;
    assign proc_9_input_sync_blk[2] = 1'b0 | (ap_sync_Block_entry2022_proc_U0_ap_ready & Block_entry2022_proc_U0.ap_idle & ~ap_sync_Array2xfMat_64_0_2160_3840_1_U0_ap_ready);
    assign proc_9_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_9[2] = dl_detect_out ? proc_dep_vld_vec_9_reg[2] : (proc_9_data_FIFO_blk[2] | proc_9_data_PIPO_blk[2] | proc_9_start_FIFO_blk[2] | proc_9_TLF_FIFO_blk[2] | proc_9_input_sync_blk[2] | proc_9_output_sync_blk[2]);
    assign proc_9_data_FIFO_blk[3] = 1'b0;
    assign proc_9_data_PIPO_blk[3] = 1'b0;
    assign proc_9_start_FIFO_blk[3] = 1'b0;
    assign proc_9_TLF_FIFO_blk[3] = 1'b0;
    assign proc_9_input_sync_blk[3] = 1'b0 | (ap_sync_Block_entry2022_proc_U0_ap_ready & Block_entry2022_proc_U0.ap_idle & ~ap_sync_Array2xfMat_64_6_1080_1920_1_U0_ap_ready);
    assign proc_9_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_9[3] = dl_detect_out ? proc_dep_vld_vec_9_reg[3] : (proc_9_data_FIFO_blk[3] | proc_9_data_PIPO_blk[3] | proc_9_start_FIFO_blk[3] | proc_9_TLF_FIFO_blk[3] | proc_9_input_sync_blk[3] | proc_9_output_sync_blk[3]);
    assign proc_9_data_FIFO_blk[4] = 1'b0;
    assign proc_9_data_PIPO_blk[4] = 1'b0;
    assign proc_9_start_FIFO_blk[4] = 1'b0;
    assign proc_9_TLF_FIFO_blk[4] = 1'b0;
    assign proc_9_input_sync_blk[4] = 1'b0 | (ap_sync_Block_entry2022_proc_U0_ap_ready & Block_entry2022_proc_U0.ap_idle & ~ap_sync_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready);
    assign proc_9_output_sync_blk[4] = 1'b0;
    assign proc_dep_vld_vec_9[4] = dl_detect_out ? proc_dep_vld_vec_9_reg[4] : (proc_9_data_FIFO_blk[4] | proc_9_data_PIPO_blk[4] | proc_9_start_FIFO_blk[4] | proc_9_TLF_FIFO_blk[4] | proc_9_input_sync_blk[4] | proc_9_output_sync_blk[4]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_9_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_9_reg <= proc_dep_vld_vec_9;
        end
    end
    assign in_chan_dep_vld_vec_9[0] = dep_chan_vld_0_9;
    assign in_chan_dep_data_vec_9[29 : 0] = dep_chan_data_0_9;
    assign token_in_vec_9[0] = token_0_9;
    assign in_chan_dep_vld_vec_9[1] = dep_chan_vld_1_9;
    assign in_chan_dep_data_vec_9[59 : 30] = dep_chan_data_1_9;
    assign token_in_vec_9[1] = token_1_9;
    assign in_chan_dep_vld_vec_9[2] = dep_chan_vld_2_9;
    assign in_chan_dep_data_vec_9[89 : 60] = dep_chan_data_2_9;
    assign token_in_vec_9[2] = token_2_9;
    assign in_chan_dep_vld_vec_9[3] = dep_chan_vld_10_9;
    assign in_chan_dep_data_vec_9[119 : 90] = dep_chan_data_10_9;
    assign token_in_vec_9[3] = token_10_9;
    assign in_chan_dep_vld_vec_9[4] = dep_chan_vld_19_9;
    assign in_chan_dep_data_vec_9[149 : 120] = dep_chan_data_19_9;
    assign token_in_vec_9[4] = token_19_9;
    assign dep_chan_vld_9_0 = out_chan_dep_vld_vec_9[0];
    assign dep_chan_data_9_0 = out_chan_dep_data_9;
    assign token_9_0 = token_out_vec_9[0];
    assign dep_chan_vld_9_1 = out_chan_dep_vld_vec_9[1];
    assign dep_chan_data_9_1 = out_chan_dep_data_9;
    assign token_9_1 = token_out_vec_9[1];
    assign dep_chan_vld_9_2 = out_chan_dep_vld_vec_9[2];
    assign dep_chan_data_9_2 = out_chan_dep_data_9;
    assign token_9_2 = token_out_vec_9[2];
    assign dep_chan_vld_9_10 = out_chan_dep_vld_vec_9[3];
    assign dep_chan_data_9_10 = out_chan_dep_data_9;
    assign token_9_10 = token_out_vec_9[3];
    assign dep_chan_vld_9_19 = out_chan_dep_vld_vec_9[4];
    assign dep_chan_data_9_19 = out_chan_dep_data_9;
    assign token_9_19 = token_out_vec_9[4];

    // Process: Array2xfMat_64_6_1080_1920_1_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 10, 6, 6) pp_pipeline_accel_hls_deadlock_detect_unit_10 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_10),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_10),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_10),
        .token_in_vec(token_in_vec_10),
        .dl_detect_in(dl_detect_out),
        .origin(origin[10]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_10),
        .out_chan_dep_data(out_chan_dep_data_10),
        .token_out_vec(token_out_vec_10),
        .dl_detect_out(dl_in_vec[10]));

    assign proc_10_data_FIFO_blk[0] = 1'b0;
    assign proc_10_data_PIPO_blk[0] = 1'b0;
    assign proc_10_start_FIFO_blk[0] = 1'b0;
    assign proc_10_TLF_FIFO_blk[0] = 1'b0 | (~imgInput_uv_rows_channel_U.if_empty_n & Array2xfMat_64_6_1080_1920_1_U0.ap_idle & ~imgInput_uv_rows_channel_U.if_write) | (~imgInput_uv_cols_channel_U.if_empty_n & Array2xfMat_64_6_1080_1920_1_U0.ap_idle & ~imgInput_uv_cols_channel_U.if_write);
    assign proc_10_input_sync_blk[0] = 1'b0 | (ap_sync_Array2xfMat_64_6_1080_1920_1_U0_ap_ready & Array2xfMat_64_6_1080_1920_1_U0.ap_idle & ~ap_sync_Block_entry20_proc_U0_ap_ready);
    assign proc_10_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_10[0] = dl_detect_out ? proc_dep_vld_vec_10_reg[0] : (proc_10_data_FIFO_blk[0] | proc_10_data_PIPO_blk[0] | proc_10_start_FIFO_blk[0] | proc_10_TLF_FIFO_blk[0] | proc_10_input_sync_blk[0] | proc_10_output_sync_blk[0]);
    assign proc_10_data_FIFO_blk[1] = 1'b0 | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.AxiStream2MatStream_2_U0.grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64.imgInput_uv_data82_blk_n);
    assign proc_10_data_PIPO_blk[1] = 1'b0;
    assign proc_10_start_FIFO_blk[1] = 1'b0;
    assign proc_10_TLF_FIFO_blk[1] = 1'b0;
    assign proc_10_input_sync_blk[1] = 1'b0;
    assign proc_10_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_10[1] = dl_detect_out ? proc_dep_vld_vec_10_reg[1] : (proc_10_data_FIFO_blk[1] | proc_10_data_PIPO_blk[1] | proc_10_start_FIFO_blk[1] | proc_10_TLF_FIFO_blk[1] | proc_10_input_sync_blk[1] | proc_10_output_sync_blk[1]);
    assign proc_10_data_FIFO_blk[2] = 1'b0;
    assign proc_10_data_PIPO_blk[2] = 1'b0;
    assign proc_10_start_FIFO_blk[2] = 1'b0;
    assign proc_10_TLF_FIFO_blk[2] = 1'b0 | (~select_ln59_loc_channel_U.if_empty_n & Array2xfMat_64_6_1080_1920_1_U0.ap_idle & ~select_ln59_loc_channel_U.if_write);
    assign proc_10_input_sync_blk[2] = 1'b0 | (ap_sync_Array2xfMat_64_6_1080_1920_1_U0_ap_ready & Array2xfMat_64_6_1080_1920_1_U0.ap_idle & ~ap_sync_Block_entry2022_proc_U0_ap_ready);
    assign proc_10_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_10[2] = dl_detect_out ? proc_dep_vld_vec_10_reg[2] : (proc_10_data_FIFO_blk[2] | proc_10_data_PIPO_blk[2] | proc_10_start_FIFO_blk[2] | proc_10_TLF_FIFO_blk[2] | proc_10_input_sync_blk[2] | proc_10_output_sync_blk[2]);
    assign proc_10_data_FIFO_blk[3] = 1'b0;
    assign proc_10_data_PIPO_blk[3] = 1'b0;
    assign proc_10_start_FIFO_blk[3] = 1'b0;
    assign proc_10_TLF_FIFO_blk[3] = 1'b0;
    assign proc_10_input_sync_blk[3] = 1'b0 | (ap_sync_Array2xfMat_64_6_1080_1920_1_U0_ap_ready & Array2xfMat_64_6_1080_1920_1_U0.ap_idle & ~ap_sync_entry_proc11_U0_ap_ready);
    assign proc_10_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_10[3] = dl_detect_out ? proc_dep_vld_vec_10_reg[3] : (proc_10_data_FIFO_blk[3] | proc_10_data_PIPO_blk[3] | proc_10_start_FIFO_blk[3] | proc_10_TLF_FIFO_blk[3] | proc_10_input_sync_blk[3] | proc_10_output_sync_blk[3]);
    assign proc_10_data_FIFO_blk[4] = 1'b0;
    assign proc_10_data_PIPO_blk[4] = 1'b0;
    assign proc_10_start_FIFO_blk[4] = 1'b0;
    assign proc_10_TLF_FIFO_blk[4] = 1'b0;
    assign proc_10_input_sync_blk[4] = 1'b0 | (ap_sync_Array2xfMat_64_6_1080_1920_1_U0_ap_ready & Array2xfMat_64_6_1080_1920_1_U0.ap_idle & ~ap_sync_Array2xfMat_64_0_2160_3840_1_U0_ap_ready);
    assign proc_10_output_sync_blk[4] = 1'b0;
    assign proc_dep_vld_vec_10[4] = dl_detect_out ? proc_dep_vld_vec_10_reg[4] : (proc_10_data_FIFO_blk[4] | proc_10_data_PIPO_blk[4] | proc_10_start_FIFO_blk[4] | proc_10_TLF_FIFO_blk[4] | proc_10_input_sync_blk[4] | proc_10_output_sync_blk[4]);
    assign proc_10_data_FIFO_blk[5] = 1'b0;
    assign proc_10_data_PIPO_blk[5] = 1'b0;
    assign proc_10_start_FIFO_blk[5] = 1'b0;
    assign proc_10_TLF_FIFO_blk[5] = 1'b0;
    assign proc_10_input_sync_blk[5] = 1'b0 | (ap_sync_Array2xfMat_64_6_1080_1920_1_U0_ap_ready & Array2xfMat_64_6_1080_1920_1_U0.ap_idle & ~ap_sync_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready);
    assign proc_10_output_sync_blk[5] = 1'b0;
    assign proc_dep_vld_vec_10[5] = dl_detect_out ? proc_dep_vld_vec_10_reg[5] : (proc_10_data_FIFO_blk[5] | proc_10_data_PIPO_blk[5] | proc_10_start_FIFO_blk[5] | proc_10_TLF_FIFO_blk[5] | proc_10_input_sync_blk[5] | proc_10_output_sync_blk[5]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_10_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_10_reg <= proc_dep_vld_vec_10;
        end
    end
    assign in_chan_dep_vld_vec_10[0] = dep_chan_vld_0_10;
    assign in_chan_dep_data_vec_10[29 : 0] = dep_chan_data_0_10;
    assign token_in_vec_10[0] = token_0_10;
    assign in_chan_dep_vld_vec_10[1] = dep_chan_vld_1_10;
    assign in_chan_dep_data_vec_10[59 : 30] = dep_chan_data_1_10;
    assign token_in_vec_10[1] = token_1_10;
    assign in_chan_dep_vld_vec_10[2] = dep_chan_vld_2_10;
    assign in_chan_dep_data_vec_10[89 : 60] = dep_chan_data_2_10;
    assign token_in_vec_10[2] = token_2_10;
    assign in_chan_dep_vld_vec_10[3] = dep_chan_vld_9_10;
    assign in_chan_dep_data_vec_10[119 : 90] = dep_chan_data_9_10;
    assign token_in_vec_10[3] = token_9_10;
    assign in_chan_dep_vld_vec_10[4] = dep_chan_vld_17_10;
    assign in_chan_dep_data_vec_10[149 : 120] = dep_chan_data_17_10;
    assign token_in_vec_10[4] = token_17_10;
    assign in_chan_dep_vld_vec_10[5] = dep_chan_vld_19_10;
    assign in_chan_dep_data_vec_10[179 : 150] = dep_chan_data_19_10;
    assign token_in_vec_10[5] = token_19_10;
    assign dep_chan_vld_10_1 = out_chan_dep_vld_vec_10[0];
    assign dep_chan_data_10_1 = out_chan_dep_data_10;
    assign token_10_1 = token_out_vec_10[0];
    assign dep_chan_vld_10_17 = out_chan_dep_vld_vec_10[1];
    assign dep_chan_data_10_17 = out_chan_dep_data_10;
    assign token_10_17 = token_out_vec_10[1];
    assign dep_chan_vld_10_9 = out_chan_dep_vld_vec_10[2];
    assign dep_chan_data_10_9 = out_chan_dep_data_10;
    assign token_10_9 = token_out_vec_10[2];
    assign dep_chan_vld_10_0 = out_chan_dep_vld_vec_10[3];
    assign dep_chan_data_10_0 = out_chan_dep_data_10;
    assign token_10_0 = token_out_vec_10[3];
    assign dep_chan_vld_10_2 = out_chan_dep_vld_vec_10[4];
    assign dep_chan_data_10_2 = out_chan_dep_data_10;
    assign token_10_2 = token_out_vec_10[4];
    assign dep_chan_vld_10_19 = out_chan_dep_vld_vec_10[5];
    assign dep_chan_data_10_19 = out_chan_dep_data_10;
    assign token_10_19 = token_out_vec_10[5];

    // Process: Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2Mat_Block_entry1_proc_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 11, 3, 3) pp_pipeline_accel_hls_deadlock_detect_unit_11 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_11),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_11),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_11),
        .token_in_vec(token_in_vec_11),
        .dl_detect_in(dl_detect_out),
        .origin(origin[11]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_11),
        .out_chan_dep_data(out_chan_dep_data_11),
        .token_out_vec(token_out_vec_11),
        .dl_detect_out(dl_in_vec[11]));

    assign proc_11_data_FIFO_blk[0] = 1'b0 | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2Mat_Block_entry1_proc_U0.rows_c_blk_n);
    assign proc_11_data_PIPO_blk[0] = 1'b0;
    assign proc_11_start_FIFO_blk[0] = 1'b0 | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.start_for_AxiStream2Mat_U0_U.if_full_n & Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2Mat_Block_entry1_proc_U0.ap_start & ~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2Mat_Block_entry1_proc_U0.real_start & (trans_in_cnt_1 == trans_out_cnt_1) & ~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.start_for_AxiStream2Mat_U0_U.if_read);
    assign proc_11_TLF_FIFO_blk[0] = 1'b0;
    assign proc_11_input_sync_blk[0] = 1'b0;
    assign proc_11_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_11[0] = dl_detect_out ? proc_dep_vld_vec_11_reg[0] : (proc_11_data_FIFO_blk[0] | proc_11_data_PIPO_blk[0] | proc_11_start_FIFO_blk[0] | proc_11_TLF_FIFO_blk[0] | proc_11_input_sync_blk[0] | proc_11_output_sync_blk[0]);
    assign proc_11_data_FIFO_blk[1] = 1'b0 | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2Mat_Block_entry1_proc_U0.rows_c_blk_n);
    assign proc_11_data_PIPO_blk[1] = 1'b0;
    assign proc_11_start_FIFO_blk[1] = 1'b0;
    assign proc_11_TLF_FIFO_blk[1] = 1'b0;
    assign proc_11_input_sync_blk[1] = 1'b0;
    assign proc_11_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_11[1] = dl_detect_out ? proc_dep_vld_vec_11_reg[1] : (proc_11_data_FIFO_blk[1] | proc_11_data_PIPO_blk[1] | proc_11_start_FIFO_blk[1] | proc_11_TLF_FIFO_blk[1] | proc_11_input_sync_blk[1] | proc_11_output_sync_blk[1]);
    assign proc_11_data_FIFO_blk[2] = 1'b0;
    assign proc_11_data_PIPO_blk[2] = 1'b0;
    assign proc_11_start_FIFO_blk[2] = 1'b0;
    assign proc_11_TLF_FIFO_blk[2] = 1'b0;
    assign proc_11_input_sync_blk[2] = 1'b0 | (Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.ap_sync_Axi2Mat_Block_entry1_proc_U0_ap_ready & Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2Mat_Block_entry1_proc_U0.ap_idle & ~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.ap_sync_Axi2AxiStream_U0_ap_ready);
    assign proc_11_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_11[2] = dl_detect_out ? proc_dep_vld_vec_11_reg[2] : (proc_11_data_FIFO_blk[2] | proc_11_data_PIPO_blk[2] | proc_11_start_FIFO_blk[2] | proc_11_TLF_FIFO_blk[2] | proc_11_input_sync_blk[2] | proc_11_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_11_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_11_reg <= proc_dep_vld_vec_11;
        end
    end
    assign in_chan_dep_vld_vec_11[0] = dep_chan_vld_12_11;
    assign in_chan_dep_data_vec_11[29 : 0] = dep_chan_data_12_11;
    assign token_in_vec_11[0] = token_12_11;
    assign in_chan_dep_vld_vec_11[1] = dep_chan_vld_13_11;
    assign in_chan_dep_data_vec_11[59 : 30] = dep_chan_data_13_11;
    assign token_in_vec_11[1] = token_13_11;
    assign in_chan_dep_vld_vec_11[2] = dep_chan_vld_14_11;
    assign in_chan_dep_data_vec_11[89 : 60] = dep_chan_data_14_11;
    assign token_in_vec_11[2] = token_14_11;
    assign dep_chan_vld_11_13 = out_chan_dep_vld_vec_11[0];
    assign dep_chan_data_11_13 = out_chan_dep_data_11;
    assign token_11_13 = token_out_vec_11[0];
    assign dep_chan_vld_11_14 = out_chan_dep_vld_vec_11[1];
    assign dep_chan_data_11_14 = out_chan_dep_data_11;
    assign token_11_14 = token_out_vec_11[1];
    assign dep_chan_vld_11_12 = out_chan_dep_vld_vec_11[2];
    assign dep_chan_data_11_12 = out_chan_dep_data_11;
    assign token_11_12 = token_out_vec_11[2];

    // Process: Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2AxiStream_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 12, 4, 4) pp_pipeline_accel_hls_deadlock_detect_unit_12 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_12),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_12),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_12),
        .token_in_vec(token_in_vec_12),
        .dl_detect_in(dl_detect_out),
        .origin(origin[12]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_12),
        .out_chan_dep_data(out_chan_dep_data_12),
        .token_out_vec(token_out_vec_12),
        .dl_detect_out(dl_in_vec[12]));

    assign proc_12_data_FIFO_blk[0] = 1'b0 | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2AxiStream_U0.grp_Axi2AxiStream_Pipeline_VITIS_LOOP_1028_1_fu_164.ldata_blk_n) | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2AxiStream_U0.cols_c_blk_n);
    assign proc_12_data_PIPO_blk[0] = 1'b0;
    assign proc_12_start_FIFO_blk[0] = 1'b0;
    assign proc_12_TLF_FIFO_blk[0] = 1'b0;
    assign proc_12_input_sync_blk[0] = 1'b0;
    assign proc_12_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_12[0] = dl_detect_out ? proc_dep_vld_vec_12_reg[0] : (proc_12_data_FIFO_blk[0] | proc_12_data_PIPO_blk[0] | proc_12_start_FIFO_blk[0] | proc_12_TLF_FIFO_blk[0] | proc_12_input_sync_blk[0] | proc_12_output_sync_blk[0]);
    assign proc_12_data_FIFO_blk[1] = 1'b0 | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2AxiStream_U0.grp_Axi2AxiStream_Pipeline_VITIS_LOOP_1028_1_fu_164.ldata_blk_n);
    assign proc_12_data_PIPO_blk[1] = 1'b0;
    assign proc_12_start_FIFO_blk[1] = 1'b0;
    assign proc_12_TLF_FIFO_blk[1] = 1'b0;
    assign proc_12_input_sync_blk[1] = 1'b0;
    assign proc_12_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_12[1] = dl_detect_out ? proc_dep_vld_vec_12_reg[1] : (proc_12_data_FIFO_blk[1] | proc_12_data_PIPO_blk[1] | proc_12_start_FIFO_blk[1] | proc_12_TLF_FIFO_blk[1] | proc_12_input_sync_blk[1] | proc_12_output_sync_blk[1]);
    assign proc_12_data_FIFO_blk[2] = 1'b0;
    assign proc_12_data_PIPO_blk[2] = 1'b0;
    assign proc_12_start_FIFO_blk[2] = 1'b0;
    assign proc_12_TLF_FIFO_blk[2] = 1'b0 | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.rows_burst_loc_channel_U.if_empty_n & Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2AxiStream_U0.ap_idle & ~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.rows_burst_loc_channel_U.if_write) | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.rows_stride_loc_channel_U.if_empty_n & Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2AxiStream_U0.ap_idle & ~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.rows_stride_loc_channel_U.if_write);
    assign proc_12_input_sync_blk[2] = 1'b0 | (Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.ap_sync_Axi2AxiStream_U0_ap_ready & Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2AxiStream_U0.ap_idle & ~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.ap_sync_Axi2Mat_Block_entry1_proc_U0_ap_ready);
    assign proc_12_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_12[2] = dl_detect_out ? proc_dep_vld_vec_12_reg[2] : (proc_12_data_FIFO_blk[2] | proc_12_data_PIPO_blk[2] | proc_12_start_FIFO_blk[2] | proc_12_TLF_FIFO_blk[2] | proc_12_input_sync_blk[2] | proc_12_output_sync_blk[2]);
    assign proc_12_data_FIFO_blk[3] = 1'b0 | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.Axi2AxiStream_U0.cols_c_blk_n);
    assign proc_12_data_PIPO_blk[3] = 1'b0;
    assign proc_12_start_FIFO_blk[3] = 1'b0;
    assign proc_12_TLF_FIFO_blk[3] = 1'b0;
    assign proc_12_input_sync_blk[3] = 1'b0;
    assign proc_12_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_12[3] = dl_detect_out ? proc_dep_vld_vec_12_reg[3] : (proc_12_data_FIFO_blk[3] | proc_12_data_PIPO_blk[3] | proc_12_start_FIFO_blk[3] | proc_12_TLF_FIFO_blk[3] | proc_12_input_sync_blk[3] | proc_12_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_12_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_12_reg <= proc_dep_vld_vec_12;
        end
    end
    assign in_chan_dep_vld_vec_12[0] = dep_chan_vld_11_12;
    assign in_chan_dep_data_vec_12[29 : 0] = dep_chan_data_11_12;
    assign token_in_vec_12[0] = token_11_12;
    assign in_chan_dep_vld_vec_12[1] = dep_chan_vld_13_12;
    assign in_chan_dep_data_vec_12[59 : 30] = dep_chan_data_13_12;
    assign token_in_vec_12[1] = token_13_12;
    assign in_chan_dep_vld_vec_12[2] = dep_chan_vld_14_12;
    assign in_chan_dep_data_vec_12[89 : 60] = dep_chan_data_14_12;
    assign token_in_vec_12[2] = token_14_12;
    assign in_chan_dep_vld_vec_12[3] = dep_chan_vld_16_12;
    assign in_chan_dep_data_vec_12[119 : 90] = dep_chan_data_16_12;
    assign token_in_vec_12[3] = token_16_12;
    assign dep_chan_vld_12_13 = out_chan_dep_vld_vec_12[0];
    assign dep_chan_data_12_13 = out_chan_dep_data_12;
    assign token_12_13 = token_out_vec_12[0];
    assign dep_chan_vld_12_16 = out_chan_dep_vld_vec_12[1];
    assign dep_chan_data_12_16 = out_chan_dep_data_12;
    assign token_12_16 = token_out_vec_12[1];
    assign dep_chan_vld_12_11 = out_chan_dep_vld_vec_12[2];
    assign dep_chan_data_12_11 = out_chan_dep_data_12;
    assign token_12_11 = token_out_vec_12[2];
    assign dep_chan_vld_12_14 = out_chan_dep_vld_vec_12[3];
    assign dep_chan_data_12_14 = out_chan_dep_data_12;
    assign token_12_14 = token_out_vec_12[3];

    // Process: Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 13, 2, 2) pp_pipeline_accel_hls_deadlock_detect_unit_13 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_13),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_13),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_13),
        .token_in_vec(token_in_vec_13),
        .dl_detect_in(dl_detect_out),
        .origin(origin[13]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_13),
        .out_chan_dep_data(out_chan_dep_data_13),
        .token_out_vec(token_out_vec_13),
        .dl_detect_out(dl_in_vec[13]));

    assign proc_13_data_FIFO_blk[0] = 1'b0 | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.AxiStream2MatStream_2_U0.grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64.ldata1_blk_n) | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.entry_proc8_U0.cols_blk_n);
    assign proc_13_data_PIPO_blk[0] = 1'b0;
    assign proc_13_start_FIFO_blk[0] = 1'b0;
    assign proc_13_TLF_FIFO_blk[0] = 1'b0;
    assign proc_13_input_sync_blk[0] = 1'b0;
    assign proc_13_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_13[0] = dl_detect_out ? proc_dep_vld_vec_13_reg[0] : (proc_13_data_FIFO_blk[0] | proc_13_data_PIPO_blk[0] | proc_13_start_FIFO_blk[0] | proc_13_TLF_FIFO_blk[0] | proc_13_input_sync_blk[0] | proc_13_output_sync_blk[0]);
    assign proc_13_data_FIFO_blk[1] = 1'b0 | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.entry_proc8_U0.rows_blk_n);
    assign proc_13_data_PIPO_blk[1] = 1'b0;
    assign proc_13_start_FIFO_blk[1] = 1'b0 | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.start_for_AxiStream2Mat_U0_U.if_empty_n & Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.ap_idle & ~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.start_for_AxiStream2Mat_U0_U.if_write);
    assign proc_13_TLF_FIFO_blk[1] = 1'b0;
    assign proc_13_input_sync_blk[1] = 1'b0;
    assign proc_13_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_13[1] = dl_detect_out ? proc_dep_vld_vec_13_reg[1] : (proc_13_data_FIFO_blk[1] | proc_13_data_PIPO_blk[1] | proc_13_start_FIFO_blk[1] | proc_13_TLF_FIFO_blk[1] | proc_13_input_sync_blk[1] | proc_13_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_13_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_13_reg <= proc_dep_vld_vec_13;
        end
    end
    assign in_chan_dep_vld_vec_13[0] = dep_chan_vld_11_13;
    assign in_chan_dep_data_vec_13[29 : 0] = dep_chan_data_11_13;
    assign token_in_vec_13[0] = token_11_13;
    assign in_chan_dep_vld_vec_13[1] = dep_chan_vld_12_13;
    assign in_chan_dep_data_vec_13[59 : 30] = dep_chan_data_12_13;
    assign token_in_vec_13[1] = token_12_13;
    assign dep_chan_vld_13_12 = out_chan_dep_vld_vec_13[0];
    assign dep_chan_data_13_12 = out_chan_dep_data_13;
    assign token_13_12 = token_out_vec_13[0];
    assign dep_chan_vld_13_11 = out_chan_dep_vld_vec_13[1];
    assign dep_chan_data_13_11 = out_chan_dep_data_13;
    assign token_13_11 = token_out_vec_13[1];

    // Process: Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.entry_proc8_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 14, 4, 4) pp_pipeline_accel_hls_deadlock_detect_unit_14 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_14),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_14),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_14),
        .token_in_vec(token_in_vec_14),
        .dl_detect_in(dl_detect_out),
        .origin(origin[14]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_14),
        .out_chan_dep_data(out_chan_dep_data_14),
        .token_out_vec(token_out_vec_14),
        .dl_detect_out(dl_in_vec[14]));

    assign proc_14_data_FIFO_blk[0] = 1'b0 | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.entry_proc8_U0.rows_blk_n);
    assign proc_14_data_PIPO_blk[0] = 1'b0;
    assign proc_14_start_FIFO_blk[0] = 1'b0;
    assign proc_14_TLF_FIFO_blk[0] = 1'b0;
    assign proc_14_input_sync_blk[0] = 1'b0;
    assign proc_14_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_14[0] = dl_detect_out ? proc_dep_vld_vec_14_reg[0] : (proc_14_data_FIFO_blk[0] | proc_14_data_PIPO_blk[0] | proc_14_start_FIFO_blk[0] | proc_14_TLF_FIFO_blk[0] | proc_14_input_sync_blk[0] | proc_14_output_sync_blk[0]);
    assign proc_14_data_FIFO_blk[1] = 1'b0 | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.entry_proc8_U0.rows_c_blk_n) | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.entry_proc8_U0.cols_c_blk_n);
    assign proc_14_data_PIPO_blk[1] = 1'b0;
    assign proc_14_start_FIFO_blk[1] = 1'b0;
    assign proc_14_TLF_FIFO_blk[1] = 1'b0;
    assign proc_14_input_sync_blk[1] = 1'b0;
    assign proc_14_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_14[1] = dl_detect_out ? proc_dep_vld_vec_14_reg[1] : (proc_14_data_FIFO_blk[1] | proc_14_data_PIPO_blk[1] | proc_14_start_FIFO_blk[1] | proc_14_TLF_FIFO_blk[1] | proc_14_input_sync_blk[1] | proc_14_output_sync_blk[1]);
    assign proc_14_data_FIFO_blk[2] = 1'b0 | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.entry_proc8_U0.cols_blk_n);
    assign proc_14_data_PIPO_blk[2] = 1'b0;
    assign proc_14_start_FIFO_blk[2] = 1'b0;
    assign proc_14_TLF_FIFO_blk[2] = 1'b0;
    assign proc_14_input_sync_blk[2] = 1'b0;
    assign proc_14_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_14[2] = dl_detect_out ? proc_dep_vld_vec_14_reg[2] : (proc_14_data_FIFO_blk[2] | proc_14_data_PIPO_blk[2] | proc_14_start_FIFO_blk[2] | proc_14_TLF_FIFO_blk[2] | proc_14_input_sync_blk[2] | proc_14_output_sync_blk[2]);
    assign proc_14_data_FIFO_blk[3] = 1'b0;
    assign proc_14_data_PIPO_blk[3] = 1'b0;
    assign proc_14_start_FIFO_blk[3] = 1'b0;
    assign proc_14_TLF_FIFO_blk[3] = 1'b0;
    assign proc_14_input_sync_blk[3] = 1'b0 | (Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.ap_sync_entry_proc8_U0_ap_ready & Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.entry_proc8_U0.ap_idle & ~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.ap_sync_last_blk_pxl_width_1_U0_ap_ready);
    assign proc_14_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_14[3] = dl_detect_out ? proc_dep_vld_vec_14_reg[3] : (proc_14_data_FIFO_blk[3] | proc_14_data_PIPO_blk[3] | proc_14_start_FIFO_blk[3] | proc_14_TLF_FIFO_blk[3] | proc_14_input_sync_blk[3] | proc_14_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_14_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_14_reg <= proc_dep_vld_vec_14;
        end
    end
    assign in_chan_dep_vld_vec_14[0] = dep_chan_vld_11_14;
    assign in_chan_dep_data_vec_14[29 : 0] = dep_chan_data_11_14;
    assign token_in_vec_14[0] = token_11_14;
    assign in_chan_dep_vld_vec_14[1] = dep_chan_vld_12_14;
    assign in_chan_dep_data_vec_14[59 : 30] = dep_chan_data_12_14;
    assign token_in_vec_14[1] = token_12_14;
    assign in_chan_dep_vld_vec_14[2] = dep_chan_vld_15_14;
    assign in_chan_dep_data_vec_14[89 : 60] = dep_chan_data_15_14;
    assign token_in_vec_14[2] = token_15_14;
    assign in_chan_dep_vld_vec_14[3] = dep_chan_vld_16_14;
    assign in_chan_dep_data_vec_14[119 : 90] = dep_chan_data_16_14;
    assign token_in_vec_14[3] = token_16_14;
    assign dep_chan_vld_14_11 = out_chan_dep_vld_vec_14[0];
    assign dep_chan_data_14_11 = out_chan_dep_data_14;
    assign token_14_11 = token_out_vec_14[0];
    assign dep_chan_vld_14_16 = out_chan_dep_vld_vec_14[1];
    assign dep_chan_data_14_16 = out_chan_dep_data_14;
    assign token_14_16 = token_out_vec_14[1];
    assign dep_chan_vld_14_12 = out_chan_dep_vld_vec_14[2];
    assign dep_chan_data_14_12 = out_chan_dep_data_14;
    assign token_14_12 = token_out_vec_14[2];
    assign dep_chan_vld_14_15 = out_chan_dep_vld_vec_14[3];
    assign dep_chan_data_14_15 = out_chan_dep_data_14;
    assign token_14_15 = token_out_vec_14[3];

    // Process: Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.last_blk_pxl_width_1_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 15, 2, 2) pp_pipeline_accel_hls_deadlock_detect_unit_15 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_15),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_15),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_15),
        .token_in_vec(token_in_vec_15),
        .dl_detect_in(dl_detect_out),
        .origin(origin[15]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_15),
        .out_chan_dep_data(out_chan_dep_data_15),
        .token_out_vec(token_out_vec_15),
        .dl_detect_out(dl_in_vec[15]));

    assign proc_15_data_FIFO_blk[0] = 1'b0;
    assign proc_15_data_PIPO_blk[0] = 1'b0;
    assign proc_15_start_FIFO_blk[0] = 1'b0;
    assign proc_15_TLF_FIFO_blk[0] = 1'b0 | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.last_blk_width_channel_U.if_full_n & Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.last_blk_pxl_width_1_U0.ap_done & ap_done_reg_6 & ~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.last_blk_width_channel_U.if_read);
    assign proc_15_input_sync_blk[0] = 1'b0;
    assign proc_15_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_15[0] = dl_detect_out ? proc_dep_vld_vec_15_reg[0] : (proc_15_data_FIFO_blk[0] | proc_15_data_PIPO_blk[0] | proc_15_start_FIFO_blk[0] | proc_15_TLF_FIFO_blk[0] | proc_15_input_sync_blk[0] | proc_15_output_sync_blk[0]);
    assign proc_15_data_FIFO_blk[1] = 1'b0;
    assign proc_15_data_PIPO_blk[1] = 1'b0;
    assign proc_15_start_FIFO_blk[1] = 1'b0;
    assign proc_15_TLF_FIFO_blk[1] = 1'b0;
    assign proc_15_input_sync_blk[1] = 1'b0 | (Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.ap_sync_last_blk_pxl_width_1_U0_ap_ready & Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.last_blk_pxl_width_1_U0.ap_idle & ~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.ap_sync_entry_proc8_U0_ap_ready);
    assign proc_15_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_15[1] = dl_detect_out ? proc_dep_vld_vec_15_reg[1] : (proc_15_data_FIFO_blk[1] | proc_15_data_PIPO_blk[1] | proc_15_start_FIFO_blk[1] | proc_15_TLF_FIFO_blk[1] | proc_15_input_sync_blk[1] | proc_15_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_15_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_15_reg <= proc_dep_vld_vec_15;
        end
    end
    assign in_chan_dep_vld_vec_15[0] = dep_chan_vld_14_15;
    assign in_chan_dep_data_vec_15[29 : 0] = dep_chan_data_14_15;
    assign token_in_vec_15[0] = token_14_15;
    assign in_chan_dep_vld_vec_15[1] = dep_chan_vld_16_15;
    assign in_chan_dep_data_vec_15[59 : 30] = dep_chan_data_16_15;
    assign token_in_vec_15[1] = token_16_15;
    assign dep_chan_vld_15_16 = out_chan_dep_vld_vec_15[0];
    assign dep_chan_data_15_16 = out_chan_dep_data_15;
    assign token_15_16 = token_out_vec_15[0];
    assign dep_chan_vld_15_14 = out_chan_dep_vld_vec_15[1];
    assign dep_chan_data_15_14 = out_chan_dep_data_15;
    assign token_15_14 = token_out_vec_15[1];

    // Process: Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.AxiStream2MatStream_2_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 16, 3, 3) pp_pipeline_accel_hls_deadlock_detect_unit_16 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_16),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_16),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_16),
        .token_in_vec(token_in_vec_16),
        .dl_detect_in(dl_detect_out),
        .origin(origin[16]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_16),
        .out_chan_dep_data(out_chan_dep_data_16),
        .token_out_vec(token_out_vec_16),
        .dl_detect_out(dl_in_vec[16]));

    assign proc_16_data_FIFO_blk[0] = 1'b0 | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.AxiStream2MatStream_2_U0.grp_AxiStream2MatStream_2_Pipeline_MMIterInLoopRow_fu_64.ldata1_blk_n);
    assign proc_16_data_PIPO_blk[0] = 1'b0;
    assign proc_16_start_FIFO_blk[0] = 1'b0;
    assign proc_16_TLF_FIFO_blk[0] = 1'b0;
    assign proc_16_input_sync_blk[0] = 1'b0;
    assign proc_16_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_16[0] = dl_detect_out ? proc_dep_vld_vec_16_reg[0] : (proc_16_data_FIFO_blk[0] | proc_16_data_PIPO_blk[0] | proc_16_start_FIFO_blk[0] | proc_16_TLF_FIFO_blk[0] | proc_16_input_sync_blk[0] | proc_16_output_sync_blk[0]);
    assign proc_16_data_FIFO_blk[1] = 1'b0 | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.AxiStream2MatStream_2_U0.rows_blk_n) | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.AxiStream2MatStream_2_U0.cols_bound_per_npc_blk_n);
    assign proc_16_data_PIPO_blk[1] = 1'b0;
    assign proc_16_start_FIFO_blk[1] = 1'b0;
    assign proc_16_TLF_FIFO_blk[1] = 1'b0;
    assign proc_16_input_sync_blk[1] = 1'b0;
    assign proc_16_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_16[1] = dl_detect_out ? proc_dep_vld_vec_16_reg[1] : (proc_16_data_FIFO_blk[1] | proc_16_data_PIPO_blk[1] | proc_16_start_FIFO_blk[1] | proc_16_TLF_FIFO_blk[1] | proc_16_input_sync_blk[1] | proc_16_output_sync_blk[1]);
    assign proc_16_data_FIFO_blk[2] = 1'b0;
    assign proc_16_data_PIPO_blk[2] = 1'b0;
    assign proc_16_start_FIFO_blk[2] = 1'b0;
    assign proc_16_TLF_FIFO_blk[2] = 1'b0 | (~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.last_blk_width_channel_U.if_empty_n & Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.AxiStream2MatStream_2_U0.ap_idle & ~Array2xfMat_64_6_1080_1920_1_U0.grp_Axi2Mat_fu_64.AxiStream2Mat_U0.last_blk_width_channel_U.if_write);
    assign proc_16_input_sync_blk[2] = 1'b0;
    assign proc_16_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_16[2] = dl_detect_out ? proc_dep_vld_vec_16_reg[2] : (proc_16_data_FIFO_blk[2] | proc_16_data_PIPO_blk[2] | proc_16_start_FIFO_blk[2] | proc_16_TLF_FIFO_blk[2] | proc_16_input_sync_blk[2] | proc_16_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_16_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_16_reg <= proc_dep_vld_vec_16;
        end
    end
    assign in_chan_dep_vld_vec_16[0] = dep_chan_vld_12_16;
    assign in_chan_dep_data_vec_16[29 : 0] = dep_chan_data_12_16;
    assign token_in_vec_16[0] = token_12_16;
    assign in_chan_dep_vld_vec_16[1] = dep_chan_vld_14_16;
    assign in_chan_dep_data_vec_16[59 : 30] = dep_chan_data_14_16;
    assign token_in_vec_16[1] = token_14_16;
    assign in_chan_dep_vld_vec_16[2] = dep_chan_vld_15_16;
    assign in_chan_dep_data_vec_16[89 : 60] = dep_chan_data_15_16;
    assign token_in_vec_16[2] = token_15_16;
    assign dep_chan_vld_16_12 = out_chan_dep_vld_vec_16[0];
    assign dep_chan_data_16_12 = out_chan_dep_data_16;
    assign token_16_12 = token_out_vec_16[0];
    assign dep_chan_vld_16_14 = out_chan_dep_vld_vec_16[1];
    assign dep_chan_data_16_14 = out_chan_dep_data_16;
    assign token_16_14 = token_out_vec_16[1];
    assign dep_chan_vld_16_15 = out_chan_dep_vld_vec_16[2];
    assign dep_chan_data_16_15 = out_chan_dep_data_16;
    assign token_16_15 = token_out_vec_16[2];

    // Process: nv122bgr_0_6_9_2160_3840_1_1_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 17, 3, 3) pp_pipeline_accel_hls_deadlock_detect_unit_17 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_17),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_17),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_17),
        .token_in_vec(token_in_vec_17),
        .dl_detect_in(dl_detect_out),
        .origin(origin[17]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_17),
        .out_chan_dep_data(out_chan_dep_data_17),
        .token_out_vec(token_out_vec_17),
        .dl_detect_out(dl_in_vec[17]));

    assign proc_17_data_FIFO_blk[0] = 1'b0 | (~nv122bgr_0_6_9_2160_3840_1_1_U0.src_y_rows_blk_n) | (~nv122bgr_0_6_9_2160_3840_1_1_U0.src_y_cols_blk_n) | (~nv122bgr_0_6_9_2160_3840_1_1_U0.grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46.grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102.imgInput_y_data81_blk_n);
    assign proc_17_data_PIPO_blk[0] = 1'b0;
    assign proc_17_start_FIFO_blk[0] = 1'b0 | (~start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_U.if_empty_n & nv122bgr_0_6_9_2160_3840_1_1_U0.ap_idle & ~start_for_nv122bgr_0_6_9_2160_3840_1_1_U0_U.if_write);
    assign proc_17_TLF_FIFO_blk[0] = 1'b0;
    assign proc_17_input_sync_blk[0] = 1'b0;
    assign proc_17_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_17[0] = dl_detect_out ? proc_dep_vld_vec_17_reg[0] : (proc_17_data_FIFO_blk[0] | proc_17_data_PIPO_blk[0] | proc_17_start_FIFO_blk[0] | proc_17_TLF_FIFO_blk[0] | proc_17_input_sync_blk[0] | proc_17_output_sync_blk[0]);
    assign proc_17_data_FIFO_blk[1] = 1'b0 | (~nv122bgr_0_6_9_2160_3840_1_1_U0.grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46.grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102.imgInput_uv_data82_blk_n);
    assign proc_17_data_PIPO_blk[1] = 1'b0;
    assign proc_17_start_FIFO_blk[1] = 1'b0;
    assign proc_17_TLF_FIFO_blk[1] = 1'b0;
    assign proc_17_input_sync_blk[1] = 1'b0;
    assign proc_17_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_17[1] = dl_detect_out ? proc_dep_vld_vec_17_reg[1] : (proc_17_data_FIFO_blk[1] | proc_17_data_PIPO_blk[1] | proc_17_start_FIFO_blk[1] | proc_17_TLF_FIFO_blk[1] | proc_17_input_sync_blk[1] | proc_17_output_sync_blk[1]);
    assign proc_17_data_FIFO_blk[2] = 1'b0 | (~nv122bgr_0_6_9_2160_3840_1_1_U0.grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_s_fu_46.grp_KernNv122bgr_0_6_9_2160_3840_1_1_1_5_9_Pipeline_ColLoop_fu_102.rgb_mat_data83_blk_n);
    assign proc_17_data_PIPO_blk[2] = 1'b0;
    assign proc_17_start_FIFO_blk[2] = 1'b0;
    assign proc_17_TLF_FIFO_blk[2] = 1'b0;
    assign proc_17_input_sync_blk[2] = 1'b0;
    assign proc_17_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_17[2] = dl_detect_out ? proc_dep_vld_vec_17_reg[2] : (proc_17_data_FIFO_blk[2] | proc_17_data_PIPO_blk[2] | proc_17_start_FIFO_blk[2] | proc_17_TLF_FIFO_blk[2] | proc_17_input_sync_blk[2] | proc_17_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_17_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_17_reg <= proc_dep_vld_vec_17;
        end
    end
    assign in_chan_dep_vld_vec_17[0] = dep_chan_vld_2_17;
    assign in_chan_dep_data_vec_17[29 : 0] = dep_chan_data_2_17;
    assign token_in_vec_17[0] = token_2_17;
    assign in_chan_dep_vld_vec_17[1] = dep_chan_vld_10_17;
    assign in_chan_dep_data_vec_17[59 : 30] = dep_chan_data_10_17;
    assign token_in_vec_17[1] = token_10_17;
    assign in_chan_dep_vld_vec_17[2] = dep_chan_vld_18_17;
    assign in_chan_dep_data_vec_17[89 : 60] = dep_chan_data_18_17;
    assign token_in_vec_17[2] = token_18_17;
    assign dep_chan_vld_17_2 = out_chan_dep_vld_vec_17[0];
    assign dep_chan_data_17_2 = out_chan_dep_data_17;
    assign token_17_2 = token_out_vec_17[0];
    assign dep_chan_vld_17_10 = out_chan_dep_vld_vec_17[1];
    assign dep_chan_data_17_10 = out_chan_dep_data_17;
    assign token_17_10 = token_out_vec_17[1];
    assign dep_chan_vld_17_18 = out_chan_dep_vld_vec_17[2];
    assign dep_chan_data_17_18 = out_chan_dep_data_17;
    assign token_17_18 = token_out_vec_17[2];

    // Process: resize_1_9_2160_3840_720_720_1_9_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 18, 2, 3) pp_pipeline_accel_hls_deadlock_detect_unit_18 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_18),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_18),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_18),
        .token_in_vec(token_in_vec_18),
        .dl_detect_in(dl_detect_out),
        .origin(origin[18]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_18),
        .out_chan_dep_data(out_chan_dep_data_18),
        .token_out_vec(token_out_vec_18),
        .dl_detect_out(dl_in_vec[18]));

    assign proc_18_data_FIFO_blk[0] = 1'b0;
    assign proc_18_data_PIPO_blk[0] = 1'b0;
    assign proc_18_start_FIFO_blk[0] = 1'b0;
    assign proc_18_TLF_FIFO_blk[0] = 1'b0 | (~rgb_mat_rows_channel_U.if_empty_n & resize_1_9_2160_3840_720_720_1_9_U0.ap_idle & ~rgb_mat_rows_channel_U.if_write) | (~rgb_mat_cols_channel_U.if_empty_n & resize_1_9_2160_3840_720_720_1_9_U0.ap_idle & ~rgb_mat_cols_channel_U.if_write) | (~resize_out_mat_rows_c38_channel_U.if_empty_n & resize_1_9_2160_3840_720_720_1_9_U0.ap_idle & ~resize_out_mat_rows_c38_channel_U.if_write) | (~resize_out_mat_cols_c39_channel_U.if_empty_n & resize_1_9_2160_3840_720_720_1_9_U0.ap_idle & ~resize_out_mat_cols_c39_channel_U.if_write);
    assign proc_18_input_sync_blk[0] = 1'b0;
    assign proc_18_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_18[0] = dl_detect_out ? proc_dep_vld_vec_18_reg[0] : (proc_18_data_FIFO_blk[0] | proc_18_data_PIPO_blk[0] | proc_18_start_FIFO_blk[0] | proc_18_TLF_FIFO_blk[0] | proc_18_input_sync_blk[0] | proc_18_output_sync_blk[0]);
    assign proc_18_data_FIFO_blk[1] = 1'b0 | (~resize_1_9_2160_3840_720_720_1_9_U0.grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82.grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216.rgb_mat_data83_blk_n);
    assign proc_18_data_PIPO_blk[1] = 1'b0;
    assign proc_18_start_FIFO_blk[1] = 1'b0;
    assign proc_18_TLF_FIFO_blk[1] = 1'b0;
    assign proc_18_input_sync_blk[1] = 1'b0;
    assign proc_18_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_18[1] = dl_detect_out ? proc_dep_vld_vec_18_reg[1] : (proc_18_data_FIFO_blk[1] | proc_18_data_PIPO_blk[1] | proc_18_start_FIFO_blk[1] | proc_18_TLF_FIFO_blk[1] | proc_18_input_sync_blk[1] | proc_18_output_sync_blk[1]);
    assign proc_18_data_FIFO_blk[2] = 1'b0 | (~resize_1_9_2160_3840_720_720_1_9_U0.grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_s_fu_82.grp_resizeNNBilinear_9_2160_3840_1_720_720_1_9_Pipeline_VITIS_LOOP_394_5_fu_216.resize_out_mat_data84_blk_n) | (~resize_1_9_2160_3840_720_720_1_9_U0.resize_out_mat_rows_c_blk_n) | (~resize_1_9_2160_3840_720_720_1_9_U0.resize_out_mat_cols_c_blk_n);
    assign proc_18_data_PIPO_blk[2] = 1'b0;
    assign proc_18_start_FIFO_blk[2] = 1'b0;
    assign proc_18_TLF_FIFO_blk[2] = 1'b0;
    assign proc_18_input_sync_blk[2] = 1'b0;
    assign proc_18_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_18[2] = dl_detect_out ? proc_dep_vld_vec_18_reg[2] : (proc_18_data_FIFO_blk[2] | proc_18_data_PIPO_blk[2] | proc_18_start_FIFO_blk[2] | proc_18_TLF_FIFO_blk[2] | proc_18_input_sync_blk[2] | proc_18_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_18_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_18_reg <= proc_dep_vld_vec_18;
        end
    end
    assign in_chan_dep_vld_vec_18[0] = dep_chan_vld_17_18;
    assign in_chan_dep_data_vec_18[29 : 0] = dep_chan_data_17_18;
    assign token_in_vec_18[0] = token_17_18;
    assign in_chan_dep_vld_vec_18[1] = dep_chan_vld_19_18;
    assign in_chan_dep_data_vec_18[59 : 30] = dep_chan_data_19_18;
    assign token_in_vec_18[1] = token_19_18;
    assign dep_chan_vld_18_1 = out_chan_dep_vld_vec_18[0];
    assign dep_chan_data_18_1 = out_chan_dep_data_18;
    assign token_18_1 = token_out_vec_18[0];
    assign dep_chan_vld_18_17 = out_chan_dep_vld_vec_18[1];
    assign dep_chan_data_18_17 = out_chan_dep_data_18;
    assign token_18_17 = token_out_vec_18[1];
    assign dep_chan_vld_18_19 = out_chan_dep_vld_vec_18[2];
    assign dep_chan_data_18_19 = out_chan_dep_data_18;
    assign token_18_19 = token_out_vec_18[2];

    // Process: preProcess_9_9_720_720_1_8_8_8_4_8_8_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 19, 7, 7) pp_pipeline_accel_hls_deadlock_detect_unit_19 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_19),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_19),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_19),
        .token_in_vec(token_in_vec_19),
        .dl_detect_in(dl_detect_out),
        .origin(origin[19]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_19),
        .out_chan_dep_data(out_chan_dep_data_19),
        .token_out_vec(token_out_vec_19),
        .dl_detect_out(dl_in_vec[19]));

    assign proc_19_data_FIFO_blk[0] = 1'b0 | (~preProcess_9_9_720_720_1_8_8_8_4_8_8_U0.in_mat_rows_blk_n) | (~preProcess_9_9_720_720_1_8_8_8_4_8_8_U0.in_mat_cols_blk_n) | (~preProcess_9_9_720_720_1_8_8_8_4_8_8_U0.grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122.resize_out_mat_data84_blk_n);
    assign proc_19_data_PIPO_blk[0] = 1'b0;
    assign proc_19_start_FIFO_blk[0] = 1'b0;
    assign proc_19_TLF_FIFO_blk[0] = 1'b0;
    assign proc_19_input_sync_blk[0] = 1'b0;
    assign proc_19_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_19[0] = dl_detect_out ? proc_dep_vld_vec_19_reg[0] : (proc_19_data_FIFO_blk[0] | proc_19_data_PIPO_blk[0] | proc_19_start_FIFO_blk[0] | proc_19_TLF_FIFO_blk[0] | proc_19_input_sync_blk[0] | proc_19_output_sync_blk[0]);
    assign proc_19_data_FIFO_blk[1] = 1'b0 | (~preProcess_9_9_720_720_1_8_8_8_4_8_8_U0.grp_preProcess_9_9_720_720_1_8_8_8_4_8_8_Pipeline_VITIS_LOOP_49_1_fu_122.out_mat_data85_blk_n);
    assign proc_19_data_PIPO_blk[1] = 1'b0;
    assign proc_19_start_FIFO_blk[1] = 1'b0;
    assign proc_19_TLF_FIFO_blk[1] = 1'b0;
    assign proc_19_input_sync_blk[1] = 1'b0;
    assign proc_19_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_19[1] = dl_detect_out ? proc_dep_vld_vec_19_reg[1] : (proc_19_data_FIFO_blk[1] | proc_19_data_PIPO_blk[1] | proc_19_start_FIFO_blk[1] | proc_19_TLF_FIFO_blk[1] | proc_19_input_sync_blk[1] | proc_19_output_sync_blk[1]);
    assign proc_19_data_FIFO_blk[2] = 1'b0;
    assign proc_19_data_PIPO_blk[2] = 1'b0;
    assign proc_19_start_FIFO_blk[2] = 1'b0;
    assign proc_19_TLF_FIFO_blk[2] = 1'b0;
    assign proc_19_input_sync_blk[2] = 1'b0 | (ap_sync_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready & preProcess_9_9_720_720_1_8_8_8_4_8_8_U0.ap_idle & ~ap_sync_entry_proc11_U0_ap_ready);
    assign proc_19_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_19[2] = dl_detect_out ? proc_dep_vld_vec_19_reg[2] : (proc_19_data_FIFO_blk[2] | proc_19_data_PIPO_blk[2] | proc_19_start_FIFO_blk[2] | proc_19_TLF_FIFO_blk[2] | proc_19_input_sync_blk[2] | proc_19_output_sync_blk[2]);
    assign proc_19_data_FIFO_blk[3] = 1'b0;
    assign proc_19_data_PIPO_blk[3] = 1'b0;
    assign proc_19_start_FIFO_blk[3] = 1'b0;
    assign proc_19_TLF_FIFO_blk[3] = 1'b0;
    assign proc_19_input_sync_blk[3] = 1'b0 | (ap_sync_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready & preProcess_9_9_720_720_1_8_8_8_4_8_8_U0.ap_idle & ~ap_sync_Block_entry20_proc_U0_ap_ready);
    assign proc_19_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_19[3] = dl_detect_out ? proc_dep_vld_vec_19_reg[3] : (proc_19_data_FIFO_blk[3] | proc_19_data_PIPO_blk[3] | proc_19_start_FIFO_blk[3] | proc_19_TLF_FIFO_blk[3] | proc_19_input_sync_blk[3] | proc_19_output_sync_blk[3]);
    assign proc_19_data_FIFO_blk[4] = 1'b0;
    assign proc_19_data_PIPO_blk[4] = 1'b0;
    assign proc_19_start_FIFO_blk[4] = 1'b0;
    assign proc_19_TLF_FIFO_blk[4] = 1'b0;
    assign proc_19_input_sync_blk[4] = 1'b0 | (ap_sync_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready & preProcess_9_9_720_720_1_8_8_8_4_8_8_U0.ap_idle & ~ap_sync_Array2xfMat_64_0_2160_3840_1_U0_ap_ready);
    assign proc_19_output_sync_blk[4] = 1'b0;
    assign proc_dep_vld_vec_19[4] = dl_detect_out ? proc_dep_vld_vec_19_reg[4] : (proc_19_data_FIFO_blk[4] | proc_19_data_PIPO_blk[4] | proc_19_start_FIFO_blk[4] | proc_19_TLF_FIFO_blk[4] | proc_19_input_sync_blk[4] | proc_19_output_sync_blk[4]);
    assign proc_19_data_FIFO_blk[5] = 1'b0;
    assign proc_19_data_PIPO_blk[5] = 1'b0;
    assign proc_19_start_FIFO_blk[5] = 1'b0;
    assign proc_19_TLF_FIFO_blk[5] = 1'b0;
    assign proc_19_input_sync_blk[5] = 1'b0 | (ap_sync_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready & preProcess_9_9_720_720_1_8_8_8_4_8_8_U0.ap_idle & ~ap_sync_Block_entry2022_proc_U0_ap_ready);
    assign proc_19_output_sync_blk[5] = 1'b0;
    assign proc_dep_vld_vec_19[5] = dl_detect_out ? proc_dep_vld_vec_19_reg[5] : (proc_19_data_FIFO_blk[5] | proc_19_data_PIPO_blk[5] | proc_19_start_FIFO_blk[5] | proc_19_TLF_FIFO_blk[5] | proc_19_input_sync_blk[5] | proc_19_output_sync_blk[5]);
    assign proc_19_data_FIFO_blk[6] = 1'b0;
    assign proc_19_data_PIPO_blk[6] = 1'b0;
    assign proc_19_start_FIFO_blk[6] = 1'b0;
    assign proc_19_TLF_FIFO_blk[6] = 1'b0;
    assign proc_19_input_sync_blk[6] = 1'b0 | (ap_sync_preProcess_9_9_720_720_1_8_8_8_4_8_8_U0_ap_ready & preProcess_9_9_720_720_1_8_8_8_4_8_8_U0.ap_idle & ~ap_sync_Array2xfMat_64_6_1080_1920_1_U0_ap_ready);
    assign proc_19_output_sync_blk[6] = 1'b0;
    assign proc_dep_vld_vec_19[6] = dl_detect_out ? proc_dep_vld_vec_19_reg[6] : (proc_19_data_FIFO_blk[6] | proc_19_data_PIPO_blk[6] | proc_19_start_FIFO_blk[6] | proc_19_TLF_FIFO_blk[6] | proc_19_input_sync_blk[6] | proc_19_output_sync_blk[6]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_19_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_19_reg <= proc_dep_vld_vec_19;
        end
    end
    assign in_chan_dep_vld_vec_19[0] = dep_chan_vld_0_19;
    assign in_chan_dep_data_vec_19[29 : 0] = dep_chan_data_0_19;
    assign token_in_vec_19[0] = token_0_19;
    assign in_chan_dep_vld_vec_19[1] = dep_chan_vld_1_19;
    assign in_chan_dep_data_vec_19[59 : 30] = dep_chan_data_1_19;
    assign token_in_vec_19[1] = token_1_19;
    assign in_chan_dep_vld_vec_19[2] = dep_chan_vld_2_19;
    assign in_chan_dep_data_vec_19[89 : 60] = dep_chan_data_2_19;
    assign token_in_vec_19[2] = token_2_19;
    assign in_chan_dep_vld_vec_19[3] = dep_chan_vld_9_19;
    assign in_chan_dep_data_vec_19[119 : 90] = dep_chan_data_9_19;
    assign token_in_vec_19[3] = token_9_19;
    assign in_chan_dep_vld_vec_19[4] = dep_chan_vld_10_19;
    assign in_chan_dep_data_vec_19[149 : 120] = dep_chan_data_10_19;
    assign token_in_vec_19[4] = token_10_19;
    assign in_chan_dep_vld_vec_19[5] = dep_chan_vld_18_19;
    assign in_chan_dep_data_vec_19[179 : 150] = dep_chan_data_18_19;
    assign token_in_vec_19[5] = token_18_19;
    assign in_chan_dep_vld_vec_19[6] = dep_chan_vld_20_19;
    assign in_chan_dep_data_vec_19[209 : 180] = dep_chan_data_20_19;
    assign token_in_vec_19[6] = token_20_19;
    assign dep_chan_vld_19_18 = out_chan_dep_vld_vec_19[0];
    assign dep_chan_data_19_18 = out_chan_dep_data_19;
    assign token_19_18 = token_out_vec_19[0];
    assign dep_chan_vld_19_20 = out_chan_dep_vld_vec_19[1];
    assign dep_chan_data_19_20 = out_chan_dep_data_19;
    assign token_19_20 = token_out_vec_19[1];
    assign dep_chan_vld_19_0 = out_chan_dep_vld_vec_19[2];
    assign dep_chan_data_19_0 = out_chan_dep_data_19;
    assign token_19_0 = token_out_vec_19[2];
    assign dep_chan_vld_19_1 = out_chan_dep_vld_vec_19[3];
    assign dep_chan_data_19_1 = out_chan_dep_data_19;
    assign token_19_1 = token_out_vec_19[3];
    assign dep_chan_vld_19_2 = out_chan_dep_vld_vec_19[4];
    assign dep_chan_data_19_2 = out_chan_dep_data_19;
    assign token_19_2 = token_out_vec_19[4];
    assign dep_chan_vld_19_9 = out_chan_dep_vld_vec_19[5];
    assign dep_chan_data_19_9 = out_chan_dep_data_19;
    assign token_19_9 = token_out_vec_19[5];
    assign dep_chan_vld_19_10 = out_chan_dep_vld_vec_19[6];
    assign dep_chan_data_19_10 = out_chan_dep_data_19;
    assign token_19_10 = token_out_vec_19[6];

    // Process: xfMat2Array_64_9_720_720_1_1_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 20, 2, 3) pp_pipeline_accel_hls_deadlock_detect_unit_20 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_20),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_20),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_20),
        .token_in_vec(token_in_vec_20),
        .dl_detect_in(dl_detect_out),
        .origin(origin[20]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_20),
        .out_chan_dep_data(out_chan_dep_data_20),
        .token_out_vec(token_out_vec_20),
        .dl_detect_out(dl_in_vec[20]));

    assign proc_20_data_FIFO_blk[0] = 1'b0;
    assign proc_20_data_PIPO_blk[0] = 1'b0;
    assign proc_20_start_FIFO_blk[0] = 1'b0;
    assign proc_20_TLF_FIFO_blk[0] = 1'b0 | (~out_mat_rows_channel_U.if_empty_n & xfMat2Array_64_9_720_720_1_1_U0.ap_idle & ~out_mat_rows_channel_U.if_write) | (~out_mat_cols_channel_U.if_empty_n & xfMat2Array_64_9_720_720_1_1_U0.ap_idle & ~out_mat_cols_channel_U.if_write);
    assign proc_20_input_sync_blk[0] = 1'b0;
    assign proc_20_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_20[0] = dl_detect_out ? proc_dep_vld_vec_20_reg[0] : (proc_20_data_FIFO_blk[0] | proc_20_data_PIPO_blk[0] | proc_20_start_FIFO_blk[0] | proc_20_TLF_FIFO_blk[0] | proc_20_input_sync_blk[0] | proc_20_output_sync_blk[0]);
    assign proc_20_data_FIFO_blk[1] = 1'b0 | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.MatStream2AxiStream_2_U0.grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79.out_mat_data85_blk_n);
    assign proc_20_data_PIPO_blk[1] = 1'b0;
    assign proc_20_start_FIFO_blk[1] = 1'b0;
    assign proc_20_TLF_FIFO_blk[1] = 1'b0;
    assign proc_20_input_sync_blk[1] = 1'b0;
    assign proc_20_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_20[1] = dl_detect_out ? proc_dep_vld_vec_20_reg[1] : (proc_20_data_FIFO_blk[1] | proc_20_data_PIPO_blk[1] | proc_20_start_FIFO_blk[1] | proc_20_TLF_FIFO_blk[1] | proc_20_input_sync_blk[1] | proc_20_output_sync_blk[1]);
    assign proc_20_data_FIFO_blk[2] = 1'b0 | (~xfMat2Array_64_9_720_720_1_1_U0.dstPtr_blk_n) | (~xfMat2Array_64_9_720_720_1_1_U0.stride_blk_n);
    assign proc_20_data_PIPO_blk[2] = 1'b0;
    assign proc_20_start_FIFO_blk[2] = 1'b0;
    assign proc_20_TLF_FIFO_blk[2] = 1'b0;
    assign proc_20_input_sync_blk[2] = 1'b0;
    assign proc_20_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_20[2] = dl_detect_out ? proc_dep_vld_vec_20_reg[2] : (proc_20_data_FIFO_blk[2] | proc_20_data_PIPO_blk[2] | proc_20_start_FIFO_blk[2] | proc_20_TLF_FIFO_blk[2] | proc_20_input_sync_blk[2] | proc_20_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_20_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_20_reg <= proc_dep_vld_vec_20;
        end
    end
    assign in_chan_dep_vld_vec_20[0] = dep_chan_vld_0_20;
    assign in_chan_dep_data_vec_20[29 : 0] = dep_chan_data_0_20;
    assign token_in_vec_20[0] = token_0_20;
    assign in_chan_dep_vld_vec_20[1] = dep_chan_vld_19_20;
    assign in_chan_dep_data_vec_20[59 : 30] = dep_chan_data_19_20;
    assign token_in_vec_20[1] = token_19_20;
    assign dep_chan_vld_20_1 = out_chan_dep_vld_vec_20[0];
    assign dep_chan_data_20_1 = out_chan_dep_data_20;
    assign token_20_1 = token_out_vec_20[0];
    assign dep_chan_vld_20_19 = out_chan_dep_vld_vec_20[1];
    assign dep_chan_data_20_19 = out_chan_dep_data_20;
    assign token_20_19 = token_out_vec_20[1];
    assign dep_chan_vld_20_0 = out_chan_dep_vld_vec_20[2];
    assign dep_chan_data_20_0 = out_chan_dep_data_20;
    assign token_20_0 = token_out_vec_20[2];

    // Process: xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.entry_proc10_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 21, 4, 4) pp_pipeline_accel_hls_deadlock_detect_unit_21 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_21),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_21),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_21),
        .token_in_vec(token_in_vec_21),
        .dl_detect_in(dl_detect_out),
        .origin(origin[21]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_21),
        .out_chan_dep_data(out_chan_dep_data_21),
        .token_out_vec(token_out_vec_21),
        .dl_detect_out(dl_in_vec[21]));

    assign proc_21_data_FIFO_blk[0] = 1'b0 | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.entry_proc10_U0.dout_c_blk_n);
    assign proc_21_data_PIPO_blk[0] = 1'b0;
    assign proc_21_start_FIFO_blk[0] = 1'b0;
    assign proc_21_TLF_FIFO_blk[0] = 1'b0;
    assign proc_21_input_sync_blk[0] = 1'b0;
    assign proc_21_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_21[0] = dl_detect_out ? proc_dep_vld_vec_21_reg[0] : (proc_21_data_FIFO_blk[0] | proc_21_data_PIPO_blk[0] | proc_21_start_FIFO_blk[0] | proc_21_TLF_FIFO_blk[0] | proc_21_input_sync_blk[0] | proc_21_output_sync_blk[0]);
    assign proc_21_data_FIFO_blk[1] = 1'b0 | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.entry_proc10_U0.rows_c_blk_n);
    assign proc_21_data_PIPO_blk[1] = 1'b0;
    assign proc_21_start_FIFO_blk[1] = 1'b0;
    assign proc_21_TLF_FIFO_blk[1] = 1'b0;
    assign proc_21_input_sync_blk[1] = 1'b0;
    assign proc_21_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_21[1] = dl_detect_out ? proc_dep_vld_vec_21_reg[1] : (proc_21_data_FIFO_blk[1] | proc_21_data_PIPO_blk[1] | proc_21_start_FIFO_blk[1] | proc_21_TLF_FIFO_blk[1] | proc_21_input_sync_blk[1] | proc_21_output_sync_blk[1]);
    assign proc_21_data_FIFO_blk[2] = 1'b0;
    assign proc_21_data_PIPO_blk[2] = 1'b0;
    assign proc_21_start_FIFO_blk[2] = 1'b0;
    assign proc_21_TLF_FIFO_blk[2] = 1'b0;
    assign proc_21_input_sync_blk[2] = 1'b0 | (xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.ap_sync_entry_proc10_U0_ap_ready & xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.entry_proc10_U0.ap_idle & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.ap_sync_Mat2Axi_Block_entry3_proc_U0_ap_ready);
    assign proc_21_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_21[2] = dl_detect_out ? proc_dep_vld_vec_21_reg[2] : (proc_21_data_FIFO_blk[2] | proc_21_data_PIPO_blk[2] | proc_21_start_FIFO_blk[2] | proc_21_TLF_FIFO_blk[2] | proc_21_input_sync_blk[2] | proc_21_output_sync_blk[2]);
    assign proc_21_data_FIFO_blk[3] = 1'b0;
    assign proc_21_data_PIPO_blk[3] = 1'b0;
    assign proc_21_start_FIFO_blk[3] = 1'b0;
    assign proc_21_TLF_FIFO_blk[3] = 1'b0;
    assign proc_21_input_sync_blk[3] = 1'b0 | (xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.ap_sync_entry_proc10_U0_ap_ready & xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.entry_proc10_U0.ap_idle & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.ap_sync_Mat2AxiStream_U0_ap_ready);
    assign proc_21_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_21[3] = dl_detect_out ? proc_dep_vld_vec_21_reg[3] : (proc_21_data_FIFO_blk[3] | proc_21_data_PIPO_blk[3] | proc_21_start_FIFO_blk[3] | proc_21_TLF_FIFO_blk[3] | proc_21_input_sync_blk[3] | proc_21_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_21_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_21_reg <= proc_dep_vld_vec_21;
        end
    end
    assign in_chan_dep_vld_vec_21[0] = dep_chan_vld_22_21;
    assign in_chan_dep_data_vec_21[29 : 0] = dep_chan_data_22_21;
    assign token_in_vec_21[0] = token_22_21;
    assign in_chan_dep_vld_vec_21[1] = dep_chan_vld_23_21;
    assign in_chan_dep_data_vec_21[59 : 30] = dep_chan_data_23_21;
    assign token_in_vec_21[1] = token_23_21;
    assign in_chan_dep_vld_vec_21[2] = dep_chan_vld_25_21;
    assign in_chan_dep_data_vec_21[89 : 60] = dep_chan_data_25_21;
    assign token_in_vec_21[2] = token_25_21;
    assign in_chan_dep_vld_vec_21[3] = dep_chan_vld_29_21;
    assign in_chan_dep_data_vec_21[119 : 90] = dep_chan_data_29_21;
    assign token_in_vec_21[3] = token_29_21;
    assign dep_chan_vld_21_29 = out_chan_dep_vld_vec_21[0];
    assign dep_chan_data_21_29 = out_chan_dep_data_21;
    assign token_21_29 = token_out_vec_21[0];
    assign dep_chan_vld_21_23 = out_chan_dep_vld_vec_21[1];
    assign dep_chan_data_21_23 = out_chan_dep_data_21;
    assign token_21_23 = token_out_vec_21[1];
    assign dep_chan_vld_21_22 = out_chan_dep_vld_vec_21[2];
    assign dep_chan_data_21_22 = out_chan_dep_data_21;
    assign token_21_22 = token_out_vec_21[2];
    assign dep_chan_vld_21_25 = out_chan_dep_vld_vec_21[3];
    assign dep_chan_data_21_25 = out_chan_dep_data_21;
    assign token_21_25 = token_out_vec_21[3];

    // Process: xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2Axi_Block_entry3_proc_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 22, 3, 2) pp_pipeline_accel_hls_deadlock_detect_unit_22 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_22),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_22),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_22),
        .token_in_vec(token_in_vec_22),
        .dl_detect_in(dl_detect_out),
        .origin(origin[22]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_22),
        .out_chan_dep_data(out_chan_dep_data_22),
        .token_out_vec(token_out_vec_22),
        .dl_detect_out(dl_in_vec[22]));

    assign proc_22_data_FIFO_blk[0] = 1'b0;
    assign proc_22_data_PIPO_blk[0] = 1'b0;
    assign proc_22_start_FIFO_blk[0] = 1'b0;
    assign proc_22_TLF_FIFO_blk[0] = 1'b0;
    assign proc_22_input_sync_blk[0] = 1'b0 | (xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.ap_sync_Mat2Axi_Block_entry3_proc_U0_ap_ready & xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2Axi_Block_entry3_proc_U0.ap_idle & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.ap_sync_entry_proc10_U0_ap_ready);
    assign proc_22_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_22[0] = dl_detect_out ? proc_dep_vld_vec_22_reg[0] : (proc_22_data_FIFO_blk[0] | proc_22_data_PIPO_blk[0] | proc_22_start_FIFO_blk[0] | proc_22_TLF_FIFO_blk[0] | proc_22_input_sync_blk[0] | proc_22_output_sync_blk[0]);
    assign proc_22_data_FIFO_blk[1] = 1'b0;
    assign proc_22_data_PIPO_blk[1] = 1'b0;
    assign proc_22_start_FIFO_blk[1] = 1'b0;
    assign proc_22_TLF_FIFO_blk[1] = 1'b0;
    assign proc_22_input_sync_blk[1] = 1'b0 | (xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.ap_sync_Mat2Axi_Block_entry3_proc_U0_ap_ready & xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2Axi_Block_entry3_proc_U0.ap_idle & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.ap_sync_Mat2AxiStream_U0_ap_ready);
    assign proc_22_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_22[1] = dl_detect_out ? proc_dep_vld_vec_22_reg[1] : (proc_22_data_FIFO_blk[1] | proc_22_data_PIPO_blk[1] | proc_22_start_FIFO_blk[1] | proc_22_TLF_FIFO_blk[1] | proc_22_input_sync_blk[1] | proc_22_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_22_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_22_reg <= proc_dep_vld_vec_22;
        end
    end
    assign in_chan_dep_vld_vec_22[0] = dep_chan_vld_21_22;
    assign in_chan_dep_data_vec_22[29 : 0] = dep_chan_data_21_22;
    assign token_in_vec_22[0] = token_21_22;
    assign in_chan_dep_vld_vec_22[1] = dep_chan_vld_23_22;
    assign in_chan_dep_data_vec_22[59 : 30] = dep_chan_data_23_22;
    assign token_in_vec_22[1] = token_23_22;
    assign in_chan_dep_vld_vec_22[2] = dep_chan_vld_25_22;
    assign in_chan_dep_data_vec_22[89 : 60] = dep_chan_data_25_22;
    assign token_in_vec_22[2] = token_25_22;
    assign dep_chan_vld_22_21 = out_chan_dep_vld_vec_22[0];
    assign dep_chan_data_22_21 = out_chan_dep_data_22;
    assign token_22_21 = token_out_vec_22[0];
    assign dep_chan_vld_22_25 = out_chan_dep_vld_vec_22[1];
    assign dep_chan_data_22_25 = out_chan_dep_data_22;
    assign token_22_25 = token_out_vec_22[1];

    // Process: xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.addrbound_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 23, 2, 3) pp_pipeline_accel_hls_deadlock_detect_unit_23 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_23),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_23),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_23),
        .token_in_vec(token_in_vec_23),
        .dl_detect_in(dl_detect_out),
        .origin(origin[23]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_23),
        .out_chan_dep_data(out_chan_dep_data_23),
        .token_out_vec(token_out_vec_23),
        .dl_detect_out(dl_in_vec[23]));

    assign proc_23_data_FIFO_blk[0] = 1'b0;
    assign proc_23_data_PIPO_blk[0] = 1'b0;
    assign proc_23_start_FIFO_blk[0] = 1'b0;
    assign proc_23_TLF_FIFO_blk[0] = 1'b0 | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.p_channel_U.if_full_n & xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.addrbound_U0.ap_done & ap_done_reg_10 & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.p_channel_U.if_read);
    assign proc_23_input_sync_blk[0] = 1'b0;
    assign proc_23_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_23[0] = dl_detect_out ? proc_dep_vld_vec_23_reg[0] : (proc_23_data_FIFO_blk[0] | proc_23_data_PIPO_blk[0] | proc_23_start_FIFO_blk[0] | proc_23_TLF_FIFO_blk[0] | proc_23_input_sync_blk[0] | proc_23_output_sync_blk[0]);
    assign proc_23_data_FIFO_blk[1] = 1'b0 | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.addrbound_U0.rows_blk_n);
    assign proc_23_data_PIPO_blk[1] = 1'b0;
    assign proc_23_start_FIFO_blk[1] = 1'b0;
    assign proc_23_TLF_FIFO_blk[1] = 1'b0;
    assign proc_23_input_sync_blk[1] = 1'b0;
    assign proc_23_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_23[1] = dl_detect_out ? proc_dep_vld_vec_23_reg[1] : (proc_23_data_FIFO_blk[1] | proc_23_data_PIPO_blk[1] | proc_23_start_FIFO_blk[1] | proc_23_TLF_FIFO_blk[1] | proc_23_input_sync_blk[1] | proc_23_output_sync_blk[1]);
    assign proc_23_data_FIFO_blk[2] = 1'b0;
    assign proc_23_data_PIPO_blk[2] = 1'b0;
    assign proc_23_start_FIFO_blk[2] = 1'b0;
    assign proc_23_TLF_FIFO_blk[2] = 1'b0 | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.tmp_U.if_empty_n & xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.addrbound_U0.ap_idle & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.tmp_U.if_write);
    assign proc_23_input_sync_blk[2] = 1'b0;
    assign proc_23_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_23[2] = dl_detect_out ? proc_dep_vld_vec_23_reg[2] : (proc_23_data_FIFO_blk[2] | proc_23_data_PIPO_blk[2] | proc_23_start_FIFO_blk[2] | proc_23_TLF_FIFO_blk[2] | proc_23_input_sync_blk[2] | proc_23_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_23_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_23_reg <= proc_dep_vld_vec_23;
        end
    end
    assign in_chan_dep_vld_vec_23[0] = dep_chan_vld_21_23;
    assign in_chan_dep_data_vec_23[29 : 0] = dep_chan_data_21_23;
    assign token_in_vec_23[0] = token_21_23;
    assign in_chan_dep_vld_vec_23[1] = dep_chan_vld_24_23;
    assign in_chan_dep_data_vec_23[59 : 30] = dep_chan_data_24_23;
    assign token_in_vec_23[1] = token_24_23;
    assign dep_chan_vld_23_24 = out_chan_dep_vld_vec_23[0];
    assign dep_chan_data_23_24 = out_chan_dep_data_23;
    assign token_23_24 = token_out_vec_23[0];
    assign dep_chan_vld_23_21 = out_chan_dep_vld_vec_23[1];
    assign dep_chan_data_23_21 = out_chan_dep_data_23;
    assign token_23_21 = token_out_vec_23[1];
    assign dep_chan_vld_23_22 = out_chan_dep_vld_vec_23[2];
    assign dep_chan_data_23_22 = out_chan_dep_data_23;
    assign token_23_22 = token_out_vec_23[2];

    // Process: xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2Axi_Block_entry35_proc_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 24, 2, 1) pp_pipeline_accel_hls_deadlock_detect_unit_24 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_24),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_24),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_24),
        .token_in_vec(token_in_vec_24),
        .dl_detect_in(dl_detect_out),
        .origin(origin[24]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_24),
        .out_chan_dep_data(out_chan_dep_data_24),
        .token_out_vec(token_out_vec_24),
        .dl_detect_out(dl_in_vec[24]));

    assign proc_24_data_FIFO_blk[0] = 1'b0;
    assign proc_24_data_PIPO_blk[0] = 1'b0;
    assign proc_24_start_FIFO_blk[0] = 1'b0;
    assign proc_24_TLF_FIFO_blk[0] = 1'b0 | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.p_channel_U.if_empty_n & xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2Axi_Block_entry35_proc_U0.ap_idle & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.p_channel_U.if_write);
    assign proc_24_input_sync_blk[0] = 1'b0;
    assign proc_24_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_24[0] = dl_detect_out ? proc_dep_vld_vec_24_reg[0] : (proc_24_data_FIFO_blk[0] | proc_24_data_PIPO_blk[0] | proc_24_start_FIFO_blk[0] | proc_24_TLF_FIFO_blk[0] | proc_24_input_sync_blk[0] | proc_24_output_sync_blk[0]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_24_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_24_reg <= proc_dep_vld_vec_24;
        end
    end
    assign in_chan_dep_vld_vec_24[0] = dep_chan_vld_23_24;
    assign in_chan_dep_data_vec_24[29 : 0] = dep_chan_data_23_24;
    assign token_in_vec_24[0] = token_23_24;
    assign in_chan_dep_vld_vec_24[1] = dep_chan_vld_29_24;
    assign in_chan_dep_data_vec_24[59 : 30] = dep_chan_data_29_24;
    assign token_in_vec_24[1] = token_29_24;
    assign dep_chan_vld_24_23 = out_chan_dep_vld_vec_24[0];
    assign dep_chan_data_24_23 = out_chan_dep_data_24;
    assign token_24_23 = token_out_vec_24[0];

    // Process: xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 25, 3, 3) pp_pipeline_accel_hls_deadlock_detect_unit_25 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_25),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_25),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_25),
        .token_in_vec(token_in_vec_25),
        .dl_detect_in(dl_detect_out),
        .origin(origin[25]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_25),
        .out_chan_dep_data(out_chan_dep_data_25),
        .token_out_vec(token_out_vec_25),
        .dl_detect_out(dl_in_vec[25]));

    assign proc_25_data_FIFO_blk[0] = 1'b0 | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.MatStream2AxiStream_2_U0.grp_MatStream2AxiStream_2_Pipeline_MMIterOutRow_MMIterOutCol_fu_79.ldata1_blk_n);
    assign proc_25_data_PIPO_blk[0] = 1'b0;
    assign proc_25_start_FIFO_blk[0] = 1'b0;
    assign proc_25_TLF_FIFO_blk[0] = 1'b0;
    assign proc_25_input_sync_blk[0] = 1'b0;
    assign proc_25_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_25[0] = dl_detect_out ? proc_dep_vld_vec_25_reg[0] : (proc_25_data_FIFO_blk[0] | proc_25_data_PIPO_blk[0] | proc_25_start_FIFO_blk[0] | proc_25_TLF_FIFO_blk[0] | proc_25_input_sync_blk[0] | proc_25_output_sync_blk[0]);
    assign proc_25_data_FIFO_blk[1] = 1'b0;
    assign proc_25_data_PIPO_blk[1] = 1'b0;
    assign proc_25_start_FIFO_blk[1] = 1'b0;
    assign proc_25_TLF_FIFO_blk[1] = 1'b0;
    assign proc_25_input_sync_blk[1] = 1'b0 | (xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.ap_sync_Mat2AxiStream_U0_ap_ready & xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.ap_idle & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.ap_sync_entry_proc10_U0_ap_ready);
    assign proc_25_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_25[1] = dl_detect_out ? proc_dep_vld_vec_25_reg[1] : (proc_25_data_FIFO_blk[1] | proc_25_data_PIPO_blk[1] | proc_25_start_FIFO_blk[1] | proc_25_TLF_FIFO_blk[1] | proc_25_input_sync_blk[1] | proc_25_output_sync_blk[1]);
    assign proc_25_data_FIFO_blk[2] = 1'b0;
    assign proc_25_data_PIPO_blk[2] = 1'b0;
    assign proc_25_start_FIFO_blk[2] = 1'b0;
    assign proc_25_TLF_FIFO_blk[2] = 1'b0;
    assign proc_25_input_sync_blk[2] = 1'b0 | (xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.ap_sync_Mat2AxiStream_U0_ap_ready & xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.ap_idle & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.ap_sync_Mat2Axi_Block_entry3_proc_U0_ap_ready);
    assign proc_25_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_25[2] = dl_detect_out ? proc_dep_vld_vec_25_reg[2] : (proc_25_data_FIFO_blk[2] | proc_25_data_PIPO_blk[2] | proc_25_start_FIFO_blk[2] | proc_25_TLF_FIFO_blk[2] | proc_25_input_sync_blk[2] | proc_25_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_25_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_25_reg <= proc_dep_vld_vec_25;
        end
    end
    assign in_chan_dep_vld_vec_25[0] = dep_chan_vld_21_25;
    assign in_chan_dep_data_vec_25[29 : 0] = dep_chan_data_21_25;
    assign token_in_vec_25[0] = token_21_25;
    assign in_chan_dep_vld_vec_25[1] = dep_chan_vld_22_25;
    assign in_chan_dep_data_vec_25[59 : 30] = dep_chan_data_22_25;
    assign token_in_vec_25[1] = token_22_25;
    assign in_chan_dep_vld_vec_25[2] = dep_chan_vld_29_25;
    assign in_chan_dep_data_vec_25[89 : 60] = dep_chan_data_29_25;
    assign token_in_vec_25[2] = token_29_25;
    assign dep_chan_vld_25_29 = out_chan_dep_vld_vec_25[0];
    assign dep_chan_data_25_29 = out_chan_dep_data_25;
    assign token_25_29 = token_out_vec_25[0];
    assign dep_chan_vld_25_21 = out_chan_dep_vld_vec_25[1];
    assign dep_chan_data_25_21 = out_chan_dep_data_25;
    assign token_25_21 = token_out_vec_25[1];
    assign dep_chan_vld_25_22 = out_chan_dep_vld_vec_25[2];
    assign dep_chan_data_25_22 = out_chan_dep_data_25;
    assign token_25_22 = token_out_vec_25[2];

    // Process: xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.entry_proc_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 26, 2, 2) pp_pipeline_accel_hls_deadlock_detect_unit_26 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_26),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_26),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_26),
        .token_in_vec(token_in_vec_26),
        .dl_detect_in(dl_detect_out),
        .origin(origin[26]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_26),
        .out_chan_dep_data(out_chan_dep_data_26),
        .token_out_vec(token_out_vec_26),
        .dl_detect_out(dl_in_vec[26]));

    assign proc_26_data_FIFO_blk[0] = 1'b0 | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.entry_proc_U0.rows_c_blk_n) | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.entry_proc_U0.cols_c_blk_n);
    assign proc_26_data_PIPO_blk[0] = 1'b0;
    assign proc_26_start_FIFO_blk[0] = 1'b0;
    assign proc_26_TLF_FIFO_blk[0] = 1'b0;
    assign proc_26_input_sync_blk[0] = 1'b0;
    assign proc_26_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_26[0] = dl_detect_out ? proc_dep_vld_vec_26_reg[0] : (proc_26_data_FIFO_blk[0] | proc_26_data_PIPO_blk[0] | proc_26_start_FIFO_blk[0] | proc_26_TLF_FIFO_blk[0] | proc_26_input_sync_blk[0] | proc_26_output_sync_blk[0]);
    assign proc_26_data_FIFO_blk[1] = 1'b0;
    assign proc_26_data_PIPO_blk[1] = 1'b0;
    assign proc_26_start_FIFO_blk[1] = 1'b0;
    assign proc_26_TLF_FIFO_blk[1] = 1'b0;
    assign proc_26_input_sync_blk[1] = 1'b0 | (xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.ap_sync_entry_proc_U0_ap_ready & xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.entry_proc_U0.ap_idle & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.ap_sync_last_blk_pxl_width_U0_ap_ready);
    assign proc_26_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_26[1] = dl_detect_out ? proc_dep_vld_vec_26_reg[1] : (proc_26_data_FIFO_blk[1] | proc_26_data_PIPO_blk[1] | proc_26_start_FIFO_blk[1] | proc_26_TLF_FIFO_blk[1] | proc_26_input_sync_blk[1] | proc_26_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_26_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_26_reg <= proc_dep_vld_vec_26;
        end
    end
    assign in_chan_dep_vld_vec_26[0] = dep_chan_vld_27_26;
    assign in_chan_dep_data_vec_26[29 : 0] = dep_chan_data_27_26;
    assign token_in_vec_26[0] = token_27_26;
    assign in_chan_dep_vld_vec_26[1] = dep_chan_vld_28_26;
    assign in_chan_dep_data_vec_26[59 : 30] = dep_chan_data_28_26;
    assign token_in_vec_26[1] = token_28_26;
    assign dep_chan_vld_26_28 = out_chan_dep_vld_vec_26[0];
    assign dep_chan_data_26_28 = out_chan_dep_data_26;
    assign token_26_28 = token_out_vec_26[0];
    assign dep_chan_vld_26_27 = out_chan_dep_vld_vec_26[1];
    assign dep_chan_data_26_27 = out_chan_dep_data_26;
    assign token_26_27 = token_out_vec_26[1];

    // Process: xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.last_blk_pxl_width_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 27, 2, 2) pp_pipeline_accel_hls_deadlock_detect_unit_27 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_27),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_27),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_27),
        .token_in_vec(token_in_vec_27),
        .dl_detect_in(dl_detect_out),
        .origin(origin[27]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_27),
        .out_chan_dep_data(out_chan_dep_data_27),
        .token_out_vec(token_out_vec_27),
        .dl_detect_out(dl_in_vec[27]));

    assign proc_27_data_FIFO_blk[0] = 1'b0;
    assign proc_27_data_PIPO_blk[0] = 1'b0;
    assign proc_27_start_FIFO_blk[0] = 1'b0;
    assign proc_27_TLF_FIFO_blk[0] = 1'b0 | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.last_blk_width_channel_U.if_full_n & xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.last_blk_pxl_width_U0.ap_done & ap_done_reg_12 & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.last_blk_width_channel_U.if_read);
    assign proc_27_input_sync_blk[0] = 1'b0;
    assign proc_27_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_27[0] = dl_detect_out ? proc_dep_vld_vec_27_reg[0] : (proc_27_data_FIFO_blk[0] | proc_27_data_PIPO_blk[0] | proc_27_start_FIFO_blk[0] | proc_27_TLF_FIFO_blk[0] | proc_27_input_sync_blk[0] | proc_27_output_sync_blk[0]);
    assign proc_27_data_FIFO_blk[1] = 1'b0;
    assign proc_27_data_PIPO_blk[1] = 1'b0;
    assign proc_27_start_FIFO_blk[1] = 1'b0;
    assign proc_27_TLF_FIFO_blk[1] = 1'b0;
    assign proc_27_input_sync_blk[1] = 1'b0 | (xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.ap_sync_last_blk_pxl_width_U0_ap_ready & xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.last_blk_pxl_width_U0.ap_idle & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.ap_sync_entry_proc_U0_ap_ready);
    assign proc_27_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_27[1] = dl_detect_out ? proc_dep_vld_vec_27_reg[1] : (proc_27_data_FIFO_blk[1] | proc_27_data_PIPO_blk[1] | proc_27_start_FIFO_blk[1] | proc_27_TLF_FIFO_blk[1] | proc_27_input_sync_blk[1] | proc_27_output_sync_blk[1]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_27_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_27_reg <= proc_dep_vld_vec_27;
        end
    end
    assign in_chan_dep_vld_vec_27[0] = dep_chan_vld_26_27;
    assign in_chan_dep_data_vec_27[29 : 0] = dep_chan_data_26_27;
    assign token_in_vec_27[0] = token_26_27;
    assign in_chan_dep_vld_vec_27[1] = dep_chan_vld_28_27;
    assign in_chan_dep_data_vec_27[59 : 30] = dep_chan_data_28_27;
    assign token_in_vec_27[1] = token_28_27;
    assign dep_chan_vld_27_28 = out_chan_dep_vld_vec_27[0];
    assign dep_chan_data_27_28 = out_chan_dep_data_27;
    assign token_27_28 = token_out_vec_27[0];
    assign dep_chan_vld_27_26 = out_chan_dep_vld_vec_27[1];
    assign dep_chan_data_27_26 = out_chan_dep_data_27;
    assign token_27_26 = token_out_vec_27[1];

    // Process: xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.MatStream2AxiStream_2_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 28, 3, 3) pp_pipeline_accel_hls_deadlock_detect_unit_28 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_28),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_28),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_28),
        .token_in_vec(token_in_vec_28),
        .dl_detect_in(dl_detect_out),
        .origin(origin[28]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_28),
        .out_chan_dep_data(out_chan_dep_data_28),
        .token_out_vec(token_out_vec_28),
        .dl_detect_out(dl_in_vec[28]));

    assign proc_28_data_FIFO_blk[0] = 1'b0 | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.MatStream2AxiStream_2_U0.ldata1_blk_n);
    assign proc_28_data_PIPO_blk[0] = 1'b0;
    assign proc_28_start_FIFO_blk[0] = 1'b0;
    assign proc_28_TLF_FIFO_blk[0] = 1'b0;
    assign proc_28_input_sync_blk[0] = 1'b0;
    assign proc_28_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_28[0] = dl_detect_out ? proc_dep_vld_vec_28_reg[0] : (proc_28_data_FIFO_blk[0] | proc_28_data_PIPO_blk[0] | proc_28_start_FIFO_blk[0] | proc_28_TLF_FIFO_blk[0] | proc_28_input_sync_blk[0] | proc_28_output_sync_blk[0]);
    assign proc_28_data_FIFO_blk[1] = 1'b0 | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.MatStream2AxiStream_2_U0.rows_blk_n) | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.MatStream2AxiStream_2_U0.cols_bound_per_npc_blk_n);
    assign proc_28_data_PIPO_blk[1] = 1'b0;
    assign proc_28_start_FIFO_blk[1] = 1'b0;
    assign proc_28_TLF_FIFO_blk[1] = 1'b0;
    assign proc_28_input_sync_blk[1] = 1'b0;
    assign proc_28_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_28[1] = dl_detect_out ? proc_dep_vld_vec_28_reg[1] : (proc_28_data_FIFO_blk[1] | proc_28_data_PIPO_blk[1] | proc_28_start_FIFO_blk[1] | proc_28_TLF_FIFO_blk[1] | proc_28_input_sync_blk[1] | proc_28_output_sync_blk[1]);
    assign proc_28_data_FIFO_blk[2] = 1'b0;
    assign proc_28_data_PIPO_blk[2] = 1'b0;
    assign proc_28_start_FIFO_blk[2] = 1'b0;
    assign proc_28_TLF_FIFO_blk[2] = 1'b0 | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.last_blk_width_channel_U.if_empty_n & xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.MatStream2AxiStream_2_U0.ap_idle & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.Mat2AxiStream_U0.last_blk_width_channel_U.if_write);
    assign proc_28_input_sync_blk[2] = 1'b0;
    assign proc_28_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_28[2] = dl_detect_out ? proc_dep_vld_vec_28_reg[2] : (proc_28_data_FIFO_blk[2] | proc_28_data_PIPO_blk[2] | proc_28_start_FIFO_blk[2] | proc_28_TLF_FIFO_blk[2] | proc_28_input_sync_blk[2] | proc_28_output_sync_blk[2]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_28_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_28_reg <= proc_dep_vld_vec_28;
        end
    end
    assign in_chan_dep_vld_vec_28[0] = dep_chan_vld_26_28;
    assign in_chan_dep_data_vec_28[29 : 0] = dep_chan_data_26_28;
    assign token_in_vec_28[0] = token_26_28;
    assign in_chan_dep_vld_vec_28[1] = dep_chan_vld_27_28;
    assign in_chan_dep_data_vec_28[59 : 30] = dep_chan_data_27_28;
    assign token_in_vec_28[1] = token_27_28;
    assign in_chan_dep_vld_vec_28[2] = dep_chan_vld_29_28;
    assign in_chan_dep_data_vec_28[89 : 60] = dep_chan_data_29_28;
    assign token_in_vec_28[2] = token_29_28;
    assign dep_chan_vld_28_29 = out_chan_dep_vld_vec_28[0];
    assign dep_chan_data_28_29 = out_chan_dep_data_28;
    assign token_28_29 = token_out_vec_28[0];
    assign dep_chan_vld_28_26 = out_chan_dep_vld_vec_28[1];
    assign dep_chan_data_28_26 = out_chan_dep_data_28;
    assign token_28_26 = token_out_vec_28[1];
    assign dep_chan_vld_28_27 = out_chan_dep_vld_vec_28[2];
    assign dep_chan_data_28_27 = out_chan_dep_data_28;
    assign token_28_27 = token_out_vec_28[2];

    // Process: xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.AxiStream2Axi_U0
    pp_pipeline_accel_hls_deadlock_detect_unit #(30, 29, 3, 4) pp_pipeline_accel_hls_deadlock_detect_unit_29 (
        .reset(dl_reset),
        .clock(dl_clock),
        .proc_dep_vld_vec(proc_dep_vld_vec_29),
        .in_chan_dep_vld_vec(in_chan_dep_vld_vec_29),
        .in_chan_dep_data_vec(in_chan_dep_data_vec_29),
        .token_in_vec(token_in_vec_29),
        .dl_detect_in(dl_detect_out),
        .origin(origin[29]),
        .token_clear(token_clear),
        .out_chan_dep_vld_vec(out_chan_dep_vld_vec_29),
        .out_chan_dep_data(out_chan_dep_data_29),
        .token_out_vec(token_out_vec_29),
        .dl_detect_out(dl_in_vec[29]));

    assign proc_29_data_FIFO_blk[0] = 1'b0 | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.AxiStream2Axi_U0.grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75.ldata1_blk_n);
    assign proc_29_data_PIPO_blk[0] = 1'b0;
    assign proc_29_start_FIFO_blk[0] = 1'b0;
    assign proc_29_TLF_FIFO_blk[0] = 1'b0;
    assign proc_29_input_sync_blk[0] = 1'b0;
    assign proc_29_output_sync_blk[0] = 1'b0;
    assign proc_dep_vld_vec_29[0] = dl_detect_out ? proc_dep_vld_vec_29_reg[0] : (proc_29_data_FIFO_blk[0] | proc_29_data_PIPO_blk[0] | proc_29_start_FIFO_blk[0] | proc_29_TLF_FIFO_blk[0] | proc_29_input_sync_blk[0] | proc_29_output_sync_blk[0]);
    assign proc_29_data_FIFO_blk[1] = 1'b0 | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.AxiStream2Axi_U0.grp_AxiStream2Axi_Pipeline_MMIterOutLoop2_fu_75.ldata1_blk_n);
    assign proc_29_data_PIPO_blk[1] = 1'b0;
    assign proc_29_start_FIFO_blk[1] = 1'b0;
    assign proc_29_TLF_FIFO_blk[1] = 1'b0;
    assign proc_29_input_sync_blk[1] = 1'b0;
    assign proc_29_output_sync_blk[1] = 1'b0;
    assign proc_dep_vld_vec_29[1] = dl_detect_out ? proc_dep_vld_vec_29_reg[1] : (proc_29_data_FIFO_blk[1] | proc_29_data_PIPO_blk[1] | proc_29_start_FIFO_blk[1] | proc_29_TLF_FIFO_blk[1] | proc_29_input_sync_blk[1] | proc_29_output_sync_blk[1]);
    assign proc_29_data_FIFO_blk[2] = 1'b0 | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.AxiStream2Axi_U0.dout_blk_n);
    assign proc_29_data_PIPO_blk[2] = 1'b0;
    assign proc_29_start_FIFO_blk[2] = 1'b0;
    assign proc_29_TLF_FIFO_blk[2] = 1'b0;
    assign proc_29_input_sync_blk[2] = 1'b0;
    assign proc_29_output_sync_blk[2] = 1'b0;
    assign proc_dep_vld_vec_29[2] = dl_detect_out ? proc_dep_vld_vec_29_reg[2] : (proc_29_data_FIFO_blk[2] | proc_29_data_PIPO_blk[2] | proc_29_start_FIFO_blk[2] | proc_29_TLF_FIFO_blk[2] | proc_29_input_sync_blk[2] | proc_29_output_sync_blk[2]);
    assign proc_29_data_FIFO_blk[3] = 1'b0;
    assign proc_29_data_PIPO_blk[3] = 1'b0;
    assign proc_29_start_FIFO_blk[3] = 1'b0;
    assign proc_29_TLF_FIFO_blk[3] = 1'b0 | (~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.axibound_V_U.if_empty_n & xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.AxiStream2Axi_U0.ap_idle & ~xfMat2Array_64_9_720_720_1_1_U0.grp_Mat2Axi_fu_72.axibound_V_U.if_write);
    assign proc_29_input_sync_blk[3] = 1'b0;
    assign proc_29_output_sync_blk[3] = 1'b0;
    assign proc_dep_vld_vec_29[3] = dl_detect_out ? proc_dep_vld_vec_29_reg[3] : (proc_29_data_FIFO_blk[3] | proc_29_data_PIPO_blk[3] | proc_29_start_FIFO_blk[3] | proc_29_TLF_FIFO_blk[3] | proc_29_input_sync_blk[3] | proc_29_output_sync_blk[3]);
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            proc_dep_vld_vec_29_reg <= 'b0;
        end
        else begin
            proc_dep_vld_vec_29_reg <= proc_dep_vld_vec_29;
        end
    end
    assign in_chan_dep_vld_vec_29[0] = dep_chan_vld_21_29;
    assign in_chan_dep_data_vec_29[29 : 0] = dep_chan_data_21_29;
    assign token_in_vec_29[0] = token_21_29;
    assign in_chan_dep_vld_vec_29[1] = dep_chan_vld_25_29;
    assign in_chan_dep_data_vec_29[59 : 30] = dep_chan_data_25_29;
    assign token_in_vec_29[1] = token_25_29;
    assign in_chan_dep_vld_vec_29[2] = dep_chan_vld_28_29;
    assign in_chan_dep_data_vec_29[89 : 60] = dep_chan_data_28_29;
    assign token_in_vec_29[2] = token_28_29;
    assign dep_chan_vld_29_25 = out_chan_dep_vld_vec_29[0];
    assign dep_chan_data_29_25 = out_chan_dep_data_29;
    assign token_29_25 = token_out_vec_29[0];
    assign dep_chan_vld_29_28 = out_chan_dep_vld_vec_29[1];
    assign dep_chan_data_29_28 = out_chan_dep_data_29;
    assign token_29_28 = token_out_vec_29[1];
    assign dep_chan_vld_29_21 = out_chan_dep_vld_vec_29[2];
    assign dep_chan_data_29_21 = out_chan_dep_data_29;
    assign token_29_21 = token_out_vec_29[2];
    assign dep_chan_vld_29_24 = out_chan_dep_vld_vec_29[3];
    assign dep_chan_data_29_24 = out_chan_dep_data_29;
    assign token_29_24 = token_out_vec_29[3];


`include "pp_pipeline_accel_hls_deadlock_report_unit.vh"
