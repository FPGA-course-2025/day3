module andModule(A, B, C);
        input wire A;
        input wire B;
        output wire C;
        assign C = A & B;
endmodule

module orModule(A, B, C);
        input wire A;
        input wire B;
        output wire C;
        assign C = A | B;
endmodule
