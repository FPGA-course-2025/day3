module patternMux(
    input sel,
    output [3:0] pattern
);

    assign pattern = sel ? 4'b1010 : 4'b0101;
endmodule