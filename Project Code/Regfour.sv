module Regfour #(parameter N = 4)(clk, reset, ain, aout);
input logic clk, reset;
input logic [N-1:0]ain;
output logic [N-1:0]aout;

always_ff @(posedge clk, posedge reset)
if (reset)
aout<=0;
else
aout<=ain;
endmodule
