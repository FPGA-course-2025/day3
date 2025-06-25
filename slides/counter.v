module counter(
     input clk,
     input [3:0] sw,
     input [3:0] btn,
     output reg [3:0] led
);
    reg [31:0] counter;

    always @ (posedge clk) begin
        led[0] <= counter[23];
        led[1] <= counter[24];
        led[2] <= counter[25];
        led[3] <= counter[26];
        counter <= counter + 1;
    end
endmodule
