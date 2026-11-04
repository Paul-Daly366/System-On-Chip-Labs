vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../VGACodingTest.gen/sources_1/ip/clk_wiz_0" \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../VGACodingTest.gen/sources_1/ip/clk_wiz_0" \
"../../../VGACodingTest.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_wiz.v" \
"../../../VGACodingTest.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.v" \
"../../../VGACodingTest.srcs/sources_1/new/VGASimpleTest.v" \
"../../../VGACodingTest.srcs/sources_1/imports/Downloads/VGASync.v" \
"../../../VGACodingTest.srcs/sources_1/imports/Downloads/VGATop.v" \

vlog -work xil_defaultlib \
"glbl.v"

