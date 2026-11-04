vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../VGAColourCycleDemo.gen/sources_1/ip/clk_wiz_0" \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../VGAColourCycleDemo.gen/sources_1/ip/clk_wiz_0" \
"../../../VGAColourCycleDemo.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_wiz.v" \
"../../../VGAColourCycleDemo.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.v" \
"../../../VGAColourCycleDemo.srcs/sources_1/imports/Downloads/VGAColourCycle.v" \
"../../../VGAColourCycleDemo.srcs/sources_1/imports/Downloads/VGASync.v" \
"../../../VGAColourCycleDemo.srcs/sources_1/imports/Downloads/VGATop.v" \

vlog -work xil_defaultlib \
"glbl.v"

