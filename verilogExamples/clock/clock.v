module clockModule_tb();
	reg clock;

	always begin
		#1 clock = !clock;
	end

	initial begin
		$dumpfile("clock.vcd");
		$dumpvars;
	end
	
	initial begin
		clock = 0;
		#10
		$finish;
	end
endmodule
