module blink(
     input  clk,
     output reg [7:0] led
);
    reg counter;
    initial
        counter = 0;
    always @ (posedge clk) begin
        led[0] <= counter;
        counter <= counter + 1;
    end
endmodule
