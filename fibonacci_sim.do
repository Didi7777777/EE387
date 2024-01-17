setenv LMC_TIMEUNIT -9
vlib work
vmap work work
# compile 
vlog -work work "../HW1/fibonacci.sv"
vlog -work work "../HW1/fibonacci.sv"
# run simulation
vsim -classdebug -voptargs=+acc +notimingchecks -L work 
work.fibonacci_tb -wlf fibonacci.wlf
# wave
add wave -noupdate -group fibonacci_tb
add wave -noupdate -group fibonacci_tb -radix hexadecimal 
/fibonacci_tb/*
add wave -noupdate -group fibonacci_tb/sd
add wave -noupdate -group fibonacci_tb/sd -radix hexadecimal 
/fibonacci_tb/sd/*
run -all
