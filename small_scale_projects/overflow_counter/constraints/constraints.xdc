#These constraints are set for the Basys3 FPGA Board
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[15]}]

set_property PACKAGE_PIN U16 [get_ports {led[0]}]
set_property PACKAGE_PIN E19 [get_ports {led[1]}]
set_property PACKAGE_PIN U19 [get_ports {led[2]}]
set_property PACKAGE_PIN V19 [get_ports {led[3]}]
set_property PACKAGE_PIN W18 [get_ports {led[4]}]
set_property PACKAGE_PIN U15 [get_ports {led[5]}]
set_property PACKAGE_PIN U14 [get_ports {led[6]}]
set_property PACKAGE_PIN V14 [get_ports {led[7]}]
set_property PACKAGE_PIN V13 [get_ports {led[8]}]
set_property PACKAGE_PIN V3 [get_ports {led[9]}]
set_property PACKAGE_PIN W3 [get_ports {led[10]}]
set_property PACKAGE_PIN U3 [get_ports {led[11]}]
set_property PACKAGE_PIN P3 [get_ports {led[12]}]
set_property PACKAGE_PIN N3 [get_ports {led[13]}]
set_property PACKAGE_PIN P1 [get_ports {led[14]}]
set_property PACKAGE_PIN L1 [get_ports {led[15]}]

set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property PACKAGE_PIN U18 [get_ports reset]

set_property IOSTANDARD LVCMOS33 [get_ports enable]
set_property PACKAGE_PIN V17 [get_ports enable]

create_clock -period 10.00 [get_ports clk_100MHz]
set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33} [get_ports clk_100MHz]

#7 displayerment display
set_property PACKAGE_PIN W7 [get_ports {displayer[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {displayer[6]}]
set_property PACKAGE_PIN W6 [get_ports {displayer[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {displayer[5]}]
set_property PACKAGE_PIN U8 [get_ports {displayer[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {displayer[4]}]
set_property PACKAGE_PIN V8 [get_ports {displayer[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {displayer[3]}]
set_property PACKAGE_PIN U5 [get_ports {displayer[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {displayer[2]}]
set_property PACKAGE_PIN V5 [get_ports {displayer[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {displayer[1]}]
set_property PACKAGE_PIN U7 [get_ports {displayer[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {displayer[0]}]


set_property PACKAGE_PIN U2 [get_ports {digit_selector[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {digit_selector[0]}]
set_property PACKAGE_PIN U4 [get_ports {digit_selector[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {digit_selector[1]}]
set_property PACKAGE_PIN V4 [get_ports {digit_selector[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {digit_selector[2]}]
set_property PACKAGE_PIN W4 [get_ports {digit_selector[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {digit_selector[3]}]
