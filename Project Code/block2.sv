module block2# (parameter N = 9)(clk,reset,set,outsource,count,totalsignal);//first block
input logic reset,clk,set,totalsignal; // internal for updating after reaching the end.
output logic [3:0]count;
input logic [3:0]outsource;
logic [3:0] sum1,sum2,sum0;
assign count = 0;
addsub2 #(N) A1(count,sum0,totalsignal);
MUX1 #(4) muxcheck(count,sum0,~totalsignal,sum1);
MUX1 #(4) mux1(outsource,sum1,set,sum2);
Regfour #(4) R1(clk,reset,sum2, count);
endmodule


module block2000# (parameter N = 5)(clk,reset,ctrl,set,outsource,count,totalsignal);//first block
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


