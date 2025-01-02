`timescale 1ns/1ps
module test_bench;
	reg clk;
	reg rst_n;
	reg sign_in;
	wire pulse_out_p;
	wire pulse_out_n;

	reg exp_pulse_out_p;
	reg exp_pulse_out_n;

	edge_detector dut(
		.clk(clk),
		.rst_n(rst_n),
		.sign_in(sign_in),
		.pulse_out_p(pulse_out_p),
		.pulse_out_n(pulse_out_n)
	);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	task verify;
		input exp_pulse_out_p;
		input pulse_out_p;
		input exp_pulse_out_n;
		input pulse_out_n;
		begin
			if((exp_pulse_out_p == pulse_out_p)&&(exp_pulse_out_n == pulse_out_n)) begin
				$display("-----------------------------------------------------------------------------------------------------------------");
				$display("PASSED: Expected pulse_out_p: %b, Got pulse_out_p: %b, Expected pulse_out_n: %b, pulse_out_n: %b", exp_pulse_out_p, pulse_out_p, exp_pulse_out_n, pulse_out_n);
				$display("-----------------------------------------------------------------------------------------------------------------");
			end else begin
				$display("-----------------------------------------------------------------------------------------------------------------");
				$display("PASSED: Expected pulse_out_p: %b, Got pulse_out_p: %b, Expected pulse_out_n: %b, pulse_out_n: %b", exp_pulse_out_p, pulse_out_p, exp_pulse_out_n, pulse_out_n);
				$display("-----------------------------------------------------------------------------------------------------------------");
			end
		end
	endtask

	initial begin
		$dumpfile("test_bench.vcd");
		$dumpvars(0, test_bench);

		$display("-------------------------------------------------------------------------------------------------------------------");
		$display("------------------------------------TESTBENCH FOR EDGE DETECTOR ---------------------------------------------------");
		$display("-------------------------------------------------------------------------------------------------------------------");

		rst_n = 0;
		sign_in = 0;
		exp_pulse_out_p = 0;
		exp_pulse_out_n = 0;
		#1;
		verify(exp_pulse_out_p, pulse_out_p, exp_pulse_out_n, pulse_out_n);

		#10;
		rst_n = 1;

		#10;
		sign_in = 1;
		exp_pulse_out_p = 1;
		exp_pulse_out_n = 0;
		#1;
		verify(exp_pulse_out_p, pulse_out_p, exp_pulse_out_n, pulse_out_n);

		#10;
		sign_in = 0;
		exp_pulse_out_p = 0;
		exp_pulse_out_n = 1;
		#1;
		verify(exp_pulse_out_p, pulse_out_p, exp_pulse_out_n, pulse_out_n);

		#10;
		sign_in = 0;
		exp_pulse_out_p = 0;
		exp_pulse_out_n = 0;
		#1;
		verify(exp_pulse_out_p, pulse_out_p, exp_pulse_out_n, pulse_out_n);

		#10;
		sign_in = 1;
		exp_pulse_out_p = 1;
		exp_pulse_out_n = 0;
		#1;
		verify(exp_pulse_out_p, pulse_out_p, exp_pulse_out_n, pulse_out_n);

		#10;
		sign_in = 1;
		exp_pulse_out_p = 0;
		exp_pulse_out_n = 0;
		#1;
		verify(exp_pulse_out_p, pulse_out_p, exp_pulse_out_n, pulse_out_n);

		#10;
		sign_in = 0;
		exp_pulse_out_p = 0;
		exp_pulse_out_n = 1;
		#1;
		verify(exp_pulse_out_p, pulse_out_p, exp_pulse_out_n, pulse_out_n);

		#100;
		$finish;
	end
endmodule

