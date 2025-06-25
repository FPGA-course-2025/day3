module main(

	input clk,
	input btnC,
	output led1,
	output led2,
	output led3,
	output led4,
	output led5
);

	assign reset = btnC;
	wire [4:0] Output;

	reg [31:0] divider;

	always @ (posedge clk) begin
		divider <= divider + 1;
	end

	always @ (posedge clk) begin
		Output[4:0] <= divider[27:23];
	end

	assign {led1, led2, led3, led4, led5} = Output[4:0];

endmodule
