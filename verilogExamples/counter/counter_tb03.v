module counter_tb; 
  reg clk, reset, enable; 
  wire [3:0] count; 
    
  counter U0 ( 
  .clk    (clk), 
  .reset  (reset), 
  .enable (enable), 
  .count  (count) 
  ); 
    
  initial begin
    clk = 0; 
    reset = 0; 
    enable = 1; 
  end 
    
  always  
    #5 clk = !clk; 
    
  initial  begin
    $dumpfile ("counter.vcd"); 
    $dumpvars; 
  end 
    
  initial  begin
    $display("\t\ttime,\tclk,\treset,\tenable,\tcount"); 
    $monitor("%d,\t%b,\t%b,\t%b,\t%d",$time, clk,reset,enable,count); 
  end 
    
  initial begin 
  #10 reset = 1;
  #11 reset = 0;
  #100 $finish; 
  end    

  //Rest of testbench code after this line 
    
endmodule
