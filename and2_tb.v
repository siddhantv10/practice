//and2_tb.v//

`timescale 10ms / 1ms
`include "and2.v"

module and2_tb();

reg a,b;
wire y;

and2 gate (y,a,b);

initial begin
    $dumpfile("and2.vcd");
    $dumpvars(0, and2_tb);
    #10 a = 1'b0; b= 1'b0;
    #100;
    $finish;
end

always #10 a = ~a;

always #5 b = ~b;

endmodule