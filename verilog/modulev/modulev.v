module modulev(
     input clk,
     input [3:0] sw,
     input [3:0] btn,
     output reg [3:0] led
);
    wire [3:0] pattern;

    patternMux mux (
        .sel(sw[0]),
        .pattern(pattern)
    );

    always @ (posedge clk) begin
        led <= pattern;
    end
endmodule