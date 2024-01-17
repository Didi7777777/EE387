setenv LMC_TIMEUNIT -9
vlib work
vmap work work
# compile 
vlog -work work "../sv/seq_detector.sv"
vlog -work work "../sv/seq_detector_tb.sv"
# run simulation
vsim -classdebug -voptargs=+acc +notimingchecks -L work 
work.seq_detector_tb -wlf seq_detector.wlf
# wave
add wave -noupdate -group seq_detector_tb
add wave -noupdate -group seq_detector_tb -radix hexadecimal 
/seq_detector_tb/*
add wave -noupdate -group seq_detector_tb/sd
add wave -noupdate -group seq_detector_tb/sd -radix hexadecimal 
/seq_detector_tb/sd/*
run -all
