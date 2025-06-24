module blinkModule_tb();
	wire out;
	reg clock;

	always begin
		#1 clock = !clock;
	end

	initial begin
		$dumpfile("blink.vcd");
		$dumpvars;
	end
	
	initial begin
		clock = 0;
		#10
		$finish;
	end

	blinkModule blinkGate(clock, out);
endmodule
