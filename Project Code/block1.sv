module block1# (parameter N = 9)(clk,reset,ctrl,set,outsource,count,totalsignal);//first block
input logic reset,clk,set,totalsignal,ctrl; // internal for updating after reaching the end.
output logic [3:0]count;
input logic [3:0]outsource;
logic [3:0] sum1,sum2,sum0;
assign count = 0;
addsub #(N) A1(count,sum0,ctrl,totalsignal);
MUX1 #(4) muxcheck(count,sum0,~totalsignal,sum1);
MUX1 #(4) mux1(outsource,sum1,set,sum2);
Regfour #(4) R1(clk,reset,sum2, count);
endmodule



module block1000# (parameter N = 6)(clk,reset,count);//first block
input logic reset,clk; // internal for updating after reaching the end.
output logic [2:0]count;
logic [2:0] sum0;
logic totalsignal,ctrl;
assign count = 0;
assign ctrl = 0;
assign totalsignal = 1; 
addsub #(N) A1(count,sum0,ctrl,totalsignal);
Regfour #(4) R1(clk,reset,sum0, count);
endmodule





module block1_time(clk,reset,count);//first block
input logic reset,clk; // internal for updating after reaching the end.
output logic [6:0]count;
logic [6:0] sum0;
logic totalsignal;
assign count = 0;
assign totalsignal = 1; 
addsub59 #(59) A1(count,sum0,totalsignal);
Regfour #(7) R1(clk,reset,sum0, count);
endmodule


