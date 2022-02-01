#create_pblock pblock_static
#add_cells_to_pblock [get_pblocks pblock_static] [get_cells -quiet [list openacap_shell_i/static_shell]]
#resize_pblock [get_pblocks pblock_static] -add {SLICE_X0Y359:SLICE_X56Y0}
#resize_pblock [get_pblocks pblock_static] -add {DSP48E2_X0Y143:DSP48E2_X4Y0}
#resize_pblock [get_pblocks pblock_static] -add {RAMB18_X0Y143:RAMB18_X1Y0}
#resize_pblock [get_pblocks pblock_static] -add {RAMB36_X0Y71:RAMB36_X1Y0}
#resize_pblock [get_pblocks pblock_static] -add {IOB_X0Y311:IOB_X1Y208}
#resize_pblock [get_pblocks pblock_static] -add {PS8_X0Y0:PS8_X0Y0}
#resize_pblock [get_pblocks pblock_static] -add {VCU_X0Y0:VCU_X0Y0}
##resize_pblock [get_pblocks pblock_static] -add CONFIG_SITE_X0Y0
#resize_pblock [get_pblocks pblock_static] -add {SLICE_X57Y0:SLICE_X65Y119}
#resize_pblock [get_pblocks pblock_static] -add {DSP48E2_X5Y0:DSP48E2_X6Y47}
#resize_pblock [get_pblocks pblock_static] -add {URAM288_X0Y0:URAM288_X0Y31}
#resize_pblock [get_pblocks pblock_static] -add {CLOCKREGION_X2Y0:CLOCKREGION_X3Y1}
#set_property PROHIBIT 1 [get_sites -range SLICE_X57Y118:SLICE_X111Y119]
#set_property CONTAIN_ROUTING 1 [get_pblocks pblock_static]
#set_property IS_SOFT FALSE [get_pblocks pblock_static]

#create_pblock pblock_regslice_2
#add_cells_to_pblock pblock_regslice_2 [get_cells [list openacap_shell_i/static_shell/ic_data/axi_regslice_data_rp1 #openacap_shell_i/static_shell/sc_rm_cfg/axi_regslice_cfg_rp1 #openacap_shell_i/static_shell/dfx_decoupler/dfx_decoupler_1]]
#resize_pblock [get_pblocks pblock_regslice_2] -add {SLICE_X55Y250:SLICE_X56Y349}
##set_property CONTAIN_ROUTING 1 [get_pblocks pblock_regslice_2]
##set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_regslice_2]
#set_property SNAPPING_MODE OFF [get_pblocks pblock_regslice_2]
#set_property IS_SOFT FALSE [get_pblocks pblock_regslice_2]

#create_pblock pblock_regslice_1
#add_cells_to_pblock pblock_regslice_1 [get_cells [list openacap_shell_i/static_shell/ic_data/axi_regslice_data_rp0 #openacap_shell_i/static_shell/sc_rm_cfg/axi_regslice_cfg_rp0 #openacap_shell_i/static_shell/dfx_decoupler/dfx_decoupler_0]]
#resize_pblock [get_pblocks pblock_regslice_1] -add {SLICE_X55Y130:SLICE_X56Y229}
##set_property CONTAIN_ROUTING 1 [get_pblocks pblock_regslice_1]
##set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_regslice_1]
#set_property SNAPPING_MODE OFF [get_pblocks pblock_regslice_1]
#set_property IS_SOFT FALSE [get_pblocks pblock_regslice_1]


create_pblock pblock_2
add_cells_to_pblock [get_pblocks pblock_2] [get_cells -quiet [list opendfx_shell_i/RP_1]]
resize_pblock [get_pblocks pblock_2] -add {SLICE_X17Y10:SLICE_X60Y119}
resize_pblock [get_pblocks pblock_2] -add {BUFG_GT_X0Y24:BUFG_GT_X0Y47}
resize_pblock [get_pblocks pblock_2] -add {BUFG_GT_SYNC_X0Y15:BUFG_GT_SYNC_X0Y29}
resize_pblock [get_pblocks pblock_2] -add {DSP48E2_X4Y4:DSP48E2_X12Y47}
resize_pblock [get_pblocks pblock_2] -add {GTHE4_CHANNEL_X0Y4:GTHE4_CHANNEL_X0Y7}
resize_pblock [get_pblocks pblock_2] -add {GTHE4_COMMON_X0Y1:GTHE4_COMMON_X0Y1}
resize_pblock [get_pblocks pblock_2] -add {IOB_X1Y26:IOB_X1Y103}
resize_pblock [get_pblocks pblock_2] -add {PCIE40E4_X0Y1:PCIE40E4_X0Y1}
resize_pblock [get_pblocks pblock_2] -add {RAMB18_X0Y4:RAMB18_X2Y47}
resize_pblock [get_pblocks pblock_2] -add {RAMB36_X0Y2:RAMB36_X2Y23}
resize_pblock [get_pblocks pblock_2] -add {URAM288_X0Y4:URAM288_X0Y31}
set_property SNAPPING_MODE ON [get_pblocks pblock_2]
set_property IS_SOFT FALSE [get_pblocks pblock_2]
#resize_pblock [get_pblocks pblock_2] -add {SLICE_X32Y120:SLICE_X60Y239}
#resize_pblock [get_pblocks pblock_2] -add {BUFG_GT_X0Y48:BUFG_GT_X0Y95}
#resize_pblock [get_pblocks pblock_2] -add {BUFG_GT_SYNC_X0Y30:BUFG_GT_SYNC_X0Y59}
#resize_pblock [get_pblocks pblock_2] -add {CFGIO_SITE_X0Y0:CFGIO_SITE_X0Y0}
#resize_pblock [get_pblocks pblock_2] -add {CONFIG_SITE_X0Y0:CONFIG_SITE_X0Y0}
#resize_pblock [get_pblocks pblock_2] -add {DSP48E2_X8Y48:DSP48E2_X12Y95}
#resize_pblock [get_pblocks pblock_2] -add {GTHE4_CHANNEL_X0Y8:GTHE4_CHANNEL_X0Y15}
#resize_pblock [get_pblocks pblock_2] -add {GTHE4_COMMON_X0Y2:GTHE4_COMMON_X0Y3}
#resize_pblock [get_pblocks pblock_2] -add {RAMB18_X1Y48:RAMB18_X2Y95}
#resize_pblock [get_pblocks pblock_2] -add {RAMB36_X1Y24:RAMB36_X2Y47}
#resize_pblock [get_pblocks pblock_2] -add {SYSMONE4_X0Y0:SYSMONE4_X0Y0}
#resize_pblock [get_pblocks pblock_2] -add {URAM288_X0Y32:URAM288_X0Y63}
#resize_pblock [get_pblocks pblock_2] -add {SLICE_X57Y240:SLICE_X65Y359}
#resize_pblock [get_pblocks pblock_2] -add {DSP48E2_X5Y96:DSP48E2_X6Y143}
#resize_pblock [get_pblocks pblock_2] -add {URAM288_X0Y64:URAM288_X0Y95}
#set_property PROHIBIT 1 [get_sites -range SLICE_X57Y240:SLICE_X111Y241]

create_pblock pblock_1
add_cells_to_pblock [get_pblocks pblock_1] [get_cells -quiet [list opendfx_shell_i/RP_0]]
resize_pblock [get_pblocks pblock_1] -add {SLICE_X17Y130:SLICE_X60Y239}
resize_pblock [get_pblocks pblock_1] -add {BUFG_GT_X0Y72:BUFG_GT_X0Y95}
resize_pblock [get_pblocks pblock_1] -add {BUFG_GT_SYNC_X0Y45:BUFG_GT_SYNC_X0Y59}
resize_pblock [get_pblocks pblock_1] -add {CFGIO_SITE_X0Y0:CFGIO_SITE_X0Y0}
resize_pblock [get_pblocks pblock_1] -add {DSP48E2_X4Y52:DSP48E2_X12Y95}
resize_pblock [get_pblocks pblock_1] -add {GTHE4_CHANNEL_X0Y12:GTHE4_CHANNEL_X0Y15}
resize_pblock [get_pblocks pblock_1] -add {GTHE4_COMMON_X0Y3:GTHE4_COMMON_X0Y3}
resize_pblock [get_pblocks pblock_1] -add {IOB_X1Y130:IOB_X1Y207}
resize_pblock [get_pblocks pblock_1] -add {RAMB18_X0Y52:RAMB18_X2Y95}
resize_pblock [get_pblocks pblock_1] -add {RAMB36_X0Y26:RAMB36_X2Y47}
resize_pblock [get_pblocks pblock_1] -add {SYSMONE4_X0Y0:SYSMONE4_X0Y0}
resize_pblock [get_pblocks pblock_1] -add {URAM288_X0Y36:URAM288_X0Y63}
set_property SNAPPING_MODE ON [get_pblocks pblock_1]
set_property IS_SOFT FALSE [get_pblocks pblock_1]
#resize_pblock [get_pblocks pblock_1] -add {SLICE_X32Y0:SLICE_X60Y119}
#resize_pblock [get_pblocks pblock_1] -add {BUFG_GT_X0Y0:BUFG_GT_X0Y47}
#resize_pblock [get_pblocks pblock_1] -add {BUFG_GT_SYNC_X0Y0:BUFG_GT_SYNC_X0Y29}
#resize_pblock [get_pblocks pblock_1] -add {DSP48E2_X8Y0:DSP48E2_X12Y47}
#resize_pblock [get_pblocks pblock_1] -add {GTHE4_CHANNEL_X0Y0:GTHE4_CHANNEL_X0Y7}
#resize_pblock [get_pblocks pblock_1] -add {GTHE4_COMMON_X0Y0:GTHE4_COMMON_X0Y1}
#resize_pblock [get_pblocks pblock_1] -add {PCIE40E4_X0Y0:PCIE40E4_X0Y1}
#resize_pblock [get_pblocks pblock_1] -add {RAMB18_X1Y0:RAMB18_X2Y47}
#resize_pblock [get_pblocks pblock_1] -add {RAMB36_X1Y0:RAMB36_X2Y23}
#resize_pblock [get_pblocks pblock_1] -add {URAM288_X0Y0:URAM288_X0Y31}
#resize_pblock [get_pblocks pblock_1] -add {SLICE_X57Y120:SLICE_X65Y239}
#resize_pblock [get_pblocks pblock_1] -add {DSP48E2_X5Y48:DSP48E2_X6Y95}
#resize_pblock [get_pblocks pblock_1] -add {URAM288_X0Y32:URAM288_X0Y63}
#resize_pblock [get_pblocks pblock_1] -add {CLOCKREGION_X2Y2:CLOCKREGION_X3Y3}
#set_property PROHIBIT 1 [get_sites -range SLICE_X57Y238:SLICE_X111Y239]
#Remove the CONFIG_SITE from pblock_1
#resize_pblock pblock_1 -remove [get_sites CONFIG_SITE_X0Y0]
#set_property PROHIBIT 1 [get_sites -range SLICE_X99Y120:SLICE_X100Y179]










