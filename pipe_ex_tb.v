`timescale 10ms / 1ms
`include "pipe_ex.v"

module pipe_ex_tb();

wire [15:0] Z;
reg [3:0] rs1, rs2, rd, func;
reg [7:0] addr;
reg clk1, clk2;

integer k;

pipe_ex pipe(Z, rs1, rs2, rd, func, addr, clk1, clk2);

initial begin
    clk1 = 0; clk2 = 0;
    repeat(20)                      //generating two clock pulses
        begin
            #5 clk1=1; #5 clk1 = 0;
            #5 clk2=1; #5 clk2 = 0;
        end
    end

initial
    for(k=0; k<16; k=k+1)
        pipe.regbank[k] = k;                //iniitalize regster bank with values of their addresses

initial begin
    #5 rs1=3; rs2 = 5; rd = 10; func =0 ; addr = 125; //ADD
    #20 rs1=3; rs2 = 8; rd = 12; func =2 ; addr = 126;   //mul
    #20 rs1=10; rs2 = 5; rd = 14; func =1 ; addr = 128;     //sub
    //Remember # delay must be equal to sum of delays in the clock generation block

    #60 for(k=125; k<129; k=k+1)
        $display("Mem[%3d], %3d", k, pipe.mem[k]);
end

initial begin
    $dumpfile("pipe_ex.vcd");
    $dumpvars(0, pipe_ex_tb);
    $monitor("Time: %3d, F = %3d", $time, Z);
    #300 $finish;
end 

endmodule