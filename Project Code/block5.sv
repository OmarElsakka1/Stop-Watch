module block5# (parameter N = 5)(clk,reset,count,pause,signalpowersaver);//first block
input logic reset,clk,pause;
output logic [N-1:0]count;
output logic signalpowersaver;
logic [N-1:0] sum0;
assign count = 0;
addsub5 A1(count,sum0,pause);
Regfour #(5) R1(clk,reset,sum0,count);
always_comb
begin
if((~count[0]) & (count[1]) & (count[2]) & (count[3]) & (count[4]))
signalpowersaver = 1;
else
signalpowersaver = 0;
end
endmodule
