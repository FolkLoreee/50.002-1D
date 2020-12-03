set projDir "D:/Documents/alchitry/50.002-1D/work/vivado"
set projName "blinding_lights"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Documents/alchitry/50.002-1D/work/verilog/au_top_0.v" "D:/Documents/alchitry/50.002-1D/work/verilog/led_clock_1.v" "D:/Documents/alchitry/50.002-1D/work/verilog/led_decoder_2.v" "D:/Documents/alchitry/50.002-1D/work/verilog/ws2812b_writer_3.v" "D:/Documents/alchitry/50.002-1D/work/verilog/seq_plus_twoSlow_4.v" "D:/Documents/alchitry/50.002-1D/work/verilog/main_fsm_5.v" "D:/Documents/alchitry/50.002-1D/work/verilog/alu_6.v" "D:/Documents/alchitry/50.002-1D/work/verilog/button_conditioner_7.v" "D:/Documents/alchitry/50.002-1D/work/verilog/edge_detector_8.v" "D:/Documents/alchitry/50.002-1D/work/verilog/register_9.v" "D:/Documents/alchitry/50.002-1D/work/verilog/answer_seq_10.v" "D:/Documents/alchitry/50.002-1D/work/verilog/reset_conditioner_11.v" "D:/Documents/alchitry/50.002-1D/work/verilog/multi_seven_seg_12.v" "D:/Documents/alchitry/50.002-1D/work/verilog/counter_13.v" "D:/Documents/alchitry/50.002-1D/work/verilog/adder_14.v" "D:/Documents/alchitry/50.002-1D/work/verilog/boolean_15.v" "D:/Documents/alchitry/50.002-1D/work/verilog/shifter_16.v" "D:/Documents/alchitry/50.002-1D/work/verilog/compare_17.v" "D:/Documents/alchitry/50.002-1D/work/verilog/pipeline_18.v" "D:/Documents/alchitry/50.002-1D/work/verilog/edge_detector_19.v" "D:/Documents/alchitry/50.002-1D/work/verilog/counter_20.v" "D:/Documents/alchitry/50.002-1D/work/verilog/pn_gen_21.v" "D:/Documents/alchitry/50.002-1D/work/verilog/counter_22.v" "D:/Documents/alchitry/50.002-1D/work/verilog/seven_seg_23.v" "D:/Documents/alchitry/50.002-1D/work/verilog/decoder_24.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "D:/Documents/alchitry/50.002-1D/constraint/blinding_lights.xdc" "D:/Documents/alchitry/50.002-1D/work/constraint/custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
