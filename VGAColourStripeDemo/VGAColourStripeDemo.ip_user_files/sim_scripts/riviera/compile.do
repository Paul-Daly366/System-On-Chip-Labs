transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../VGAColourStripeDemo.gen/sources_1/ip/clk_wiz_0" -l xpm -l xil_defaultlib \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  -incr \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../VGAColourStripeDemo.gen/sources_1/ip/clk_wiz_0" -l xpm -l xil_defaultlib \
"../../../VGAColourStripeDemo.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_wiz.v" \
"../../../VGAColourStripeDemo.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.v" \
"../../../VGAColourStripeDemo.srcs/sources_1/imports/Downloads/VGAColourStripes.v" \
"../../../VGAColourStripeDemo.srcs/sources_1/imports/Downloads/VGASync.v" \
"../../../VGAColourStripeDemo.srcs/sources_1/imports/Downloads/VGATop.v" \

vlog -work xil_defaultlib \
"glbl.v"

