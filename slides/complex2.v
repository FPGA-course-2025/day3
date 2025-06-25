
module complex(
    input wire A,
    input wire B,
    input wire C,
    input wire D,
    input wire E,
    input wire F,
    input wire G,
    output wire H
);

    assign H = A & ((B | C) & (~D & (F | ~G)) | E);
endmodule
