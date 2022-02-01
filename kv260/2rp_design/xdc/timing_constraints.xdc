set_clock_groups -asynchronous -group [get_clocks -of [get_pins opendfx_shell_i/static_shell/zynq_ultra_ps_e_0/inst/buffer_pl_clk_0.PL_CLK_0_BUFG/O]] -group [get_clocks -of [get_pins opendfx_shell_i/static_shell/clk_reset_gen/clk_wiz_rp0/inst/CLK_CORE_DRP_I/clk_inst/clkout1_buf/O]] -group [get_clocks -of [get_pins opendfx_shell_i/static_shell/clk_reset_gen/clk_wiz_rp1/inst/CLK_CORE_DRP_I/clk_inst/clkout1_buf/O]] -group [get_clocks -of [get_pins opendfx_shell_i/static_shell/clk_reset_gen/clk_wiz_static/inst/CLK_CORE_DRP_I/clk_inst/clkout1_buf/O]] -group [get_clocks -of [get_pins opendfx_shell_i/static_shell/clk_reset_gen/clk_wiz_static/inst/CLK_CORE_DRP_I/clk_inst/clkout2_buf/O]]

set_property HD.NO_ROUTE_CONTAINMENT true [get_nets -segments -of [get_pins -of [get_cells -hier -filter {PRIMITIVE_SUBGROUP == BUFFER && NAME =~ *opendfx_shell_i/static_shell/clk_reset_gen*}] -filter {DIRECTION == OUT}]]

set_multicycle_path -setup -through [get_pins {opendfx_shell_i/static_shell/clk_reset_gen/rp*_clken_sync/inst/block[0].data_sync_reg3/Q}] 3
set_multicycle_path -hold -through [get_pins {opendfx_shell_i/static_shell/clk_reset_gen/rp*_clken_sync/inst/block[0].data_sync_reg3/C}] 2

set_property CLOCK_DEDICATED_ROUTE ANY_CMT_COLUMN [get_nets {opendfx_shell_i/static_shell/clk_reset_gen/rp*_clk_bufgce/U0/BUFGCE_O[0]}]
set_property CLOCK_DEDICATED_ROUTE ANY_CMT_COLUMN [get_nets {opendfx_shell_i/static_shell/clk_reset_gen/rp*_clk_bufgce/U0/BUFGCE_O[0]}]




