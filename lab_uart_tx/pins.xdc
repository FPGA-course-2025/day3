set_property PACKAGE_PIN E3 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports clock]
create_clock -period 10 -name sys_clk [get_ports clock]

set_property PACKAGE_PIN D9 [get_ports button]
set_property IOSTANDARD LVCMOS33 [get_ports button]

set_property PACKAGE_PIN D10 [get_ports uart_tx]
set_property IOSTANDARD LVCMOS33 [get_ports uart_tx]