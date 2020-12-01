set projDir "D:/Documents/alchitry/50.002-1D/work/vivado"
set projName "blinding_lights"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Documents/alchitry/50.002-1D/work/verilog/au_top_0.v" "D:/Documents/alchitry/50.002-1D/work/verilog/seq_plus_twoSlow_1.v" "D:/Documents/alchitry/50.002-1D/work/verilog/main_fsm_2.v" "D:/Documents/alchitry/50.002-1D/work/verilog/button_conditioner_3.v" "D:/Documents/alchitry/50.002-1D/work/verilog/edge_detector_4.v" "D:/Documents/alchitry/50.002-1D/work/verilog/register_5.v" "D:/Documents/alchitry/50.002-1D/work/verilog/answer_seq_6.v" "D:/Documents/alchitry/50.002-1D/work/verilog/reset_conditioner_7.v" "D:/Documents/alchitry/50.002-1D/work/verilog/adder_8.v" "D:/Documents/alchitry/50.002-1D/work/verilog/counter_9.v" "D:/Documents/alchitry/50.002-1D/work/verilog/pipeline_10.v" "D:/Documents/alchitry/50.002-1D/work/verilog/edge_detector_11.v" "D:/Documents/alchitry/50.002-1D/work/verilog/pn_gen_12.v" "D:/Documents/alchitry/50.002-1D/work/verilog/full_adder_13.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "D:/Documents/alchitry/50.002-1D/work/constraint/alchitry.xdc" "D:/Documents/alchitry/50.002-1D/work/constraint/io.xdc" "D:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
