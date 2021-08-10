@echo off

set V_SOURCE=uart.v uart_tx.v uart_rx.v uart_tb.v
set TEST_MODULE=uart_tb
set COV_REPORT=cov_report
set LIB_NAME=work

echo -- Create a new library: %LIB_NAME%
vlib %LIB_NAME%
vmap %LIB_NAME% %LIB_NAME%
echo -- Compile the design and testbench...
vlog -coveropt 3 +cover +acc %V_SOURCE%
echo -- Run the simulation for code coverage...
vsim -coverage -vopt %LIB_NAME%.%TEST_MODULE% -c -do "coverage save -onexit -directive -codeAll %COV_REPORT%.ucdb;run -all"
echo -- Export the code coverage to HTML file...
vcover report -html %COV_REPORT%.ucdb
