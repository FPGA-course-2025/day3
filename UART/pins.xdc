set_property PACKAGE_PIN E3 [get_ports CLK100MHZ]
set_property IOSTANDARD LVCMOS33 [get_ports CLK100MHZ]
create_clock -period 10 -name sys_clk [get_ports CLK100MHZ]

set_property PACKAGE_PIN A9 [get_ports uart_txd_in]
set_property IOSTANDARD LVCMOS33 [get_ports uart_txd_in]

set_property PACKAGE_PIN D10 [get_ports uart_rxd_out]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rxd_out]