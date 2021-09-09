module addsub5(count,sum,pause);
output logic [4:0]sum;
input logic pause;
input logic [4:0]count;
always_comb
begin
if (pause)
begin
if (count < 30)
sum = count + 1;
end
if (~pause & (count == 30))
sum = 0;
end
endmodule
