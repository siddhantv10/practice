//or2_tb.v
`timescale 10ms / 1ms
`include "or2.v"

module or2_tb();

reg a,b;
wire y;
or2 gate(y,a,b);

initial begin
    $dumpfile("or2.vcd");
    $dumpvars(0, or2_tb);
    #10 a=0; b=0;
    #100;
    $finish;
end

always #10 a = ~a;

always #5 b = ~b;

endmodule