V_SOURCE=uart_tx.v uart_rx.v uart_tb.v
TEST_MODULE=uart_tb
COV_REPORT=cov_rp
LIB_NAME=work
OUTPUT=transcript modelsim.ini ${COV_REPORT}.ucdb ${TEST_MODULE}.vcd

all:
	@echo "-- Create a new library: ${LIB_NAME}"
	@vlib ${LIB_NAME}
	@vmap ${LIB_NAME} work
	@echo "-- Compile the design and testbench..."
	@vlog -coveropt 3 +cover +acc ${V_SOURCE}
	@echo "-- Run the simulation for code coverage..."
	@vsim -coverage -vopt ${LIB_NAME}.${TEST_MODULE} -c -do "coverage save -onexit -directive -codeAll ${COV_REPORT}.ucdb;run -all"
	@echo "-- Export the code coverage to HTML file..."
	@vcover report -html ${COV_REPORT}.ucdb

clean:
	rm -rf ${OUTPUT}
	rm -rf ${LIB_NAME}
	rm -rf covhtmlreport
