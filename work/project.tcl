set projDir "D:/Rhythm\ Game/50.002-1D/work/vivado"
set projName "blinding_lights"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Rhythm\ Game/50.002-1D/work/verilog/au_top_0.v" "D:/Rhythm\ Game/50.002-1D/work/verilog/led_clock_1.v" "D:/Rhythm\ Game/50.002-1D/work/verilog/decoder_2.v" "D:/Rhythm\ Game/50.002-1D/work/verilog/ws2812b_writer_3.v" "D:/Rhythm\ Game/50.002-1D/work/verilog/reset_conditioner_4.v" "D:/Rhythm\ Game/50.002-1D/work/verilog/edge_detector_5.v" "D:/Rhythm\ Game/50.002-1D/work/verilog/counter_6.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "D:/Rhythm\ Game/50.002-1D/work/constraint/alchitry.xdc" "D:/Rhythm\ Game/50.002-1D/work/constraint/custom.xdc" "D:/Alchitry/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
