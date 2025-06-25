module ledonoff(
     input clk,
     input [3:0] sw,
     input [3:0] btn,
     output reg [3:0] led
);
    reg oldbtn0;
    reg ledState;

    always @ (posedge clk) begin
        oldbtn0 <= btn[0];
        if (btn[0] && !oldbtn0) begin
            ledState <= ~ledState;
        end
        led[0] <= ledState;
    end
endmodule
