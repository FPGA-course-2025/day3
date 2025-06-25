module counter(
     input  clk,
     output reg [7:0] led
);

    reg [32:0] counter;

    initial 
        counter = 0;
    
    always @ (posedge clk) begin
        led[0] <= counter[23];
        counter <= counter + 1;
    end

endmodule
