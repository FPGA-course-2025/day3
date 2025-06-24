module orand_tb();
        wire andout;
        wire orout;
        reg clock;
        reg test1;
        reg test2;

        always begin
                #1 clock = !clock;
        end

        initial begin
                $dumpfile("orand.vcd");
                $dumpvars;
        end

        initial begin
                clock = 0;
                test1 = 1'b0;
                test2 = 1'b0;
                #3
                test1 = 1'b1;
                #3
                test2 = 1'b1;
                #10
                $finish;
        end

        andModule andGate(test1,clock, andout);
        orModule orGate(andout,test2, orout);
endmodule
