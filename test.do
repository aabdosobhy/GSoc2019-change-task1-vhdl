vsim work.ser2par

add wave -position end  sim:/ser2par/clk
add wave -position end  sim:/ser2par/start
add wave -position end  sim:/ser2par/serial_bit
add wave -position end  sim:/ser2par/bit_slip
add wave -position end  sim:/ser2par/word_size_select
add wave -position end  sim:/ser2par/parallel_out

force -freeze sim:/ser2par/clk 1 0, 0 {800 ps} -r 1600
force -freeze sim:/ser2par/start 1 0
force -freeze sim:/ser2par/serial_bit 1 0
force -freeze sim:/ser2par/bit_slip 0 0
force -freeze sim:/ser2par/word_size_select 00 0

run
force -freeze sim:/ser2par/start 0 0

run
run
run
run
run
force -freeze sim:/ser2par/serial_bit 0 0
run
run
run
run
force -freeze sim:/ser2par/serial_bit 1 0
run
run
run
run
run
force -freeze sim:/ser2par/bit_slip 1 0
run
run
run
force -freeze sim:/ser2par/serial_bit 0 0
run
run
run
run
force -freeze sim:/ser2par/serial_bit 1 0
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/ser2par/serial_bit 0 0
run
run
run
run
force -freeze sim:/ser2par/serial_bit 1 0
run
run
run
run
run
run
run
force -freeze sim:/ser2par/word_size_select 01 0
run
run
run
force -freeze sim:/ser2par/serial_bit 0 0
run
run
run
force -freeze sim:/ser2par/serial_bit 1 0
run
run
run
run
run
force -freeze sim:/ser2par/serial_bit 0 0
run
run
run
force -freeze sim:/ser2par/serial_bit 1 0
run
run
run
run
run
force -freeze sim:/ser2par/serial_bit 0 0
run
run
run
run
force -freeze sim:/ser2par/serial_bit 1 0
run
run
run
run
run
run
run
force -freeze sim:/ser2par/bit_slip 0 0
force -freeze sim:/ser2par/word_size_select 10 0
force -freeze sim:/ser2par/serial_bit 0 0
run
run
run
run
force -freeze sim:/ser2par/serial_bit 1 0
run
run
run
run
run
run
run
force -freeze sim:/ser2par/serial_bit 0 0
run
run
run
run
force -freeze sim:/ser2par/serial_bit 1 0
run
run
run
run
run
run
run
run
force -freeze sim:/ser2par/serial_bit 0 0
run
run
run
run
run
run
force -freeze sim:/ser2par/serial_bit 1 0
run
run
run
run
run
run
run
force -freeze sim:/ser2par/serial_bit 0 0
run
run
run
run
force -freeze sim:/ser2par/serial_bit 1 0
run
run
run
run
run
run
run
run
force -freeze sim:/ser2par/serial_bit 0 0
run
run
run
run
force -freeze sim:/ser2par/serial_bit 1 0
run
run
run
run
force -freeze sim:/ser2par/serial_bit 0 0
run
run
run
force -freeze sim:/ser2par/serial_bit 1 0
run
run
run
run
force -freeze sim:/ser2par/serial_bit 0 0
run
run
run
force -freeze sim:/ser2par/serial_bit 1 0
run
run
run
run
force -freeze sim:/ser2par/serial_bit 0 0
run
run
run
run
force -freeze sim:/ser2par/serial_bit 1 0
run
run
run
run
run
run
run
run
force -freeze sim:/ser2par/serial_bit 0 0
run
run
run
run
run
run
run
force -freeze sim:/ser2par/serial_bit 1 0
run
run
run
run
run
run
run
run