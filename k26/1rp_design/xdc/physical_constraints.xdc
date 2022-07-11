create_pblock pblock_static
add_cells_to_pblock [get_pblocks pblock_static] [get_cells -quiet [list opendfx_shell_i/static_shell]]
resize_pblock [get_pblocks pblock_static] -add {PS8_X0Y0:PS8_X0Y0}
resize_pblock [get_pblocks pblock_static] -add {VCU_X0Y0:VCU_X0Y0}
resize_pblock pblock_static -add {SLICE_X0Y0:SLICE_X16Y239}
resize_pblock pblock_static -add {BUFG_PS_X0Y0:BUFG_PS_X0Y95}
resize_pblock pblock_static -add {DSP48E2_X0Y0:DSP48E2_X3Y95}
resize_pblock pblock_static -add {IOB_X0Y0:IOB_X0Y207}
set_property CONTAIN_ROUTING 1 [get_pblocks pblock_static]
set_property IS_SOFT FALSE [get_pblocks pblock_static]
set_property SNAPPING_MODE ON [get_pblocks pblock_static]

create_pblock shim_rp_0
add_cells_to_pblock shim_rp_0 [get_cells -quiet [list opendfx_shell_i/static_shell/shim_rp0]]
resize_pblock shim_rp_0 -add {SLICE_X0Y0:SLICE_X16Y119 DSP48E2_X0Y0:DSP48E2_X3Y47 IOB_X0Y0:IOB_X0Y103}

set_property parent pblock_static [get_pblocks shim_rp_0]

create_pblock pblock_0
add_cells_to_pblock [get_pblocks pblock_0] [get_cells -quiet [list opendfx_shell_i/RP_0]]
resize_pblock pblock_0 -add {SLICE_X17Y120:SLICE_X60Y239}
resize_pblock pblock_0 -add {BUFG_GT_X0Y48:BUFG_GT_X0Y95}
resize_pblock pblock_0 -add {BUFG_GT_SYNC_X0Y30:BUFG_GT_SYNC_X0Y59}
resize_pblock pblock_0 -add {CFGIO_SITE_X0Y0:CFGIO_SITE_X0Y0 CONFIG_SITE_X0Y0:CONFIG_SITE_X0Y0}
resize_pblock pblock_0 -add {DSP48E2_X4Y48:DSP48E2_X12Y95}
resize_pblock pblock_0 -add {GTHE4_CHANNEL_X0Y8:GTHE4_CHANNEL_X0Y15 GTHE4_COMMON_X0Y2:GTHE4_COMMON_X0Y3}
resize_pblock pblock_0 -add {IOB_X1Y104:IOB_X1Y207}
resize_pblock pblock_0 -add {RAMB18_X0Y48:RAMB18_X2Y95 RAMB36_X0Y24:RAMB36_X2Y47}
resize_pblock pblock_0 -add {SYSMONE4_X0Y0:SYSMONE4_X0Y0}
resize_pblock pblock_0 -add {URAM288_X0Y32:URAM288_X0Y63}
set_property CONTAIN_ROUTING 1 [get_pblocks pblock_0]
set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_0]
set_property IS_SOFT FALSE [get_pblocks pblock_0]
set_property SNAPPING_MODE ON [get_pblocks pblock_0]
