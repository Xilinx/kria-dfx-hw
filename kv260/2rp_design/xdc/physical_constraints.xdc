create_pblock pblock_1
add_cells_to_pblock [get_pblocks pblock_1] [get_cells -quiet [list opendfx_shell_i/RP_1]]
resize_pblock pblock_1 -add {SLICE_X18Y120:SLICE_X60Y239}
resize_pblock pblock_1 -add {BUFG_GT_X0Y48:BUFG_GT_X0Y95}
resize_pblock pblock_1 -add {BUFG_GT_SYNC_X0Y30:BUFG_GT_SYNC_X0Y59}
resize_pblock pblock_1 -add {CFGIO_SITE_X0Y0:CFGIO_SITE_X0Y0 CONFIG_SITE_X0Y0:CONFIG_SITE_X0Y0}
resize_pblock pblock_1 -add {DSP48E2_X4Y48:DSP48E2_X12Y95}
resize_pblock pblock_1 -add {GTHE4_CHANNEL_X0Y8:GTHE4_CHANNEL_X0Y15 GTHE4_COMMON_X0Y2:GTHE4_COMMON_X0Y3}
resize_pblock pblock_1 -add {IOB_X1Y104:IOB_X1Y207}
resize_pblock pblock_1 -add {RAMB18_X0Y48:RAMB18_X2Y95 RAMB36_X0Y24:RAMB36_X2Y47}
resize_pblock pblock_1 -add {SYSMONE4_X0Y0:SYSMONE4_X0Y0}
resize_pblock pblock_1 -add {URAM288_X0Y32:URAM288_X0Y63}
set_property CONTAIN_ROUTING 1 [get_pblocks pblock_1]
set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_1]
set_property IS_SOFT FALSE [get_pblocks pblock_1]
set_property SNAPPING_MODE ON [get_pblocks pblock_1]

create_pblock pblock_0
add_cells_to_pblock [get_pblocks pblock_0] [get_cells -quiet [list opendfx_shell_i/RP_0]]
resize_pblock pblock_0 -add {SLICE_X18Y0:SLICE_X60Y119}
resize_pblock pblock_0 -add {BUFG_GT_X0Y0:BUFG_GT_X0Y47}
resize_pblock pblock_0 -add {BUFG_GT_SYNC_X0Y0:BUFG_GT_SYNC_X0Y29}
resize_pblock pblock_0 -add {DSP48E2_X4Y0:DSP48E2_X12Y47}
resize_pblock pblock_0 -add {GTHE4_CHANNEL_X0Y0:GTHE4_CHANNEL_X0Y7 GTHE4_COMMON_X0Y0:GTHE4_COMMON_X0Y1}
resize_pblock pblock_0 -add {IOB_X1Y0:IOB_X1Y103}
resize_pblock pblock_0 -add {PCIE40E4_X0Y0:PCIE40E4_X0Y1}
resize_pblock pblock_0 -add {RAMB18_X0Y0:RAMB18_X2Y47 RAMB36_X0Y0:RAMB36_X2Y23}
resize_pblock pblock_0 -add {URAM288_X0Y0:URAM288_X0Y31}
set_property CONTAIN_ROUTING 1 [get_pblocks pblock_0]
set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_0]
set_property IS_SOFT FALSE [get_pblocks pblock_0]
set_property SNAPPING_MODE ON [get_pblocks pblock_0]


create_pblock pblock_static
add_cells_to_pblock [get_pblocks pblock_static] [get_cells -quiet [list opendfx_shell_i/static_shell]]
resize_pblock [get_pblocks pblock_static] -add {PS8_X0Y0:PS8_X0Y0}
resize_pblock [get_pblocks pblock_static] -add {VCU_X0Y0:VCU_X0Y0}
resize_pblock pblock_static -add {SLICE_X0Y0:SLICE_X17Y239}
resize_pblock pblock_static -add {BUFG_PS_X0Y0:BUFG_PS_X0Y95}
resize_pblock pblock_static -add {DSP48E2_X0Y0:DSP48E2_X3Y95}
set_property CONTAIN_ROUTING 1 [get_pblocks pblock_static]
set_property IS_SOFT FALSE [get_pblocks pblock_static]
set_property SNAPPING_MODE ON [get_pblocks pblock_static]


create_pblock pblock_shim_rp_0
add_cells_to_pblock pblock_shim_rp_0 [get_cells -quiet [list opendfx_shell_i/static_shell/sc_data/axi_clock_converter_0 \
opendfx_shell_i/static_shell/sc_rm_cfg/axi_clock_converter_0 \
opendfx_shell_i/static_shell/dfx_decoupler/dfx_decoupler_0]]
resize_pblock pblock_shim_rp_0 -add SLICE_X16Y5:SLICE_X17Y114

create_pblock pblock_shim_rp_1
add_cells_to_pblock pblock_shim_rp_1 [get_cells -quiet [list opendfx_shell_i/static_shell/sc_data/axi_clock_converter_1 \
opendfx_shell_i/static_shell/sc_rm_cfg/axi_clock_converter_1 \
opendfx_shell_i/static_shell/dfx_decoupler/dfx_decoupler_1]]
resize_pblock pblock_shim_rp_1 -add SLICE_X16Y125:SLICE_X17Y234

