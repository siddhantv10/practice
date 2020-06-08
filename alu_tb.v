`timescale 10ms / 1ms
`include "alu.v"

module alu_tb();


reg [3:0] a,b,s;
reg cin;
reg m;

wire [3:0] f , g , p;
wire cout, eqv;  

alu uut(a,b,cin, s,m, f, cout, eqv, g,p);

initial begin
	$dumpfile("alu.vcd");
	$dumpvars(0,alu_tb);
	#10;
	
	repeat(5)
        begin
    	{s,m,cin} =$random%6; a = $random%4; b = $random%4; #10;
        end
	
	$finish;
	end

endmodule