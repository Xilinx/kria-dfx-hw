# Copyright (C) 2022, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT
set_clock_groups -asynchronous \
-group [get_clocks -of [get_pins opendfx_shell_i/static_shell/zynq_ultra_ps_e_0/inst/buffer_pl_clk_0.PL_CLK_0_BUFG/O]] \
-group [get_clocks -of [get_pins opendfx_shell_i/static_shell/zynq_ultra_ps_e_0/inst/buffer_pl_clk_1.PL_CLK_1_BUFG/O]] \
-group [get_clocks -of [get_pins opendfx_shell_i/static_shell/zynq_ultra_ps_e_0/inst/buffer_pl_clk_2.PL_CLK_2_BUFG/O]] \
-group [get_clocks -of [get_pins opendfx_shell_i/static_shell/zynq_ultra_ps_e_0/inst/buffer_pl_clk_3.PL_CLK_3_BUFG/O]]

set_property HD.NO_ROUTE_CONTAINMENT true [get_nets -segments -of [get_pins -of [get_cells -hier -filter {PRIMITIVE_SUBGROUP == BUFFER && NAME =~ *opendfx_shell_i/static_shell/clk_reset_gen*}] -filter {DIRECTION == OUT}]]

set_multicycle_path -setup -from [get_pins {opendfx_shell_i/static_shell/clk_reset_gen/rp*_clken_sync/inst/block[0].data_sync_reg3/C}] 3
set_multicycle_path -hold -from [get_pins {opendfx_shell_i/static_shell/clk_reset_gen/rp*_clken_sync/inst/block[0].data_sync_reg3/C}] 2

