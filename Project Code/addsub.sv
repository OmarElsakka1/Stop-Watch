module addsub# (parameter N = 9)(count,sum,ctrl,signal);
output logic [3:0]sum;
input logic ctrl,signal;
input logic [3:0]count;
always_comb
begin
if ((~ctrl) & signal)
begin
if (~(count == N))
sum = count + 1;
if (count == N)
sum = 0;
end
if(ctrl & signal)
begin
if (~(count == 0))
sum = count - 1;
if (count == 0)
sum = N;
end
end
endmodule



module addsub2 #(parameter N = 9)(count,sum,signal);
output logic [3:0]sum;
input logic signal;
input logic [3:0]count;
always_comb
begin
if (signal)
begin
if (~(count == N))
sum = count + 1;
if (count == N)
sum = 0;
end
end
endmodule


module addsub59 #(parameter N = 59)(count,sum,signal);
output logic [6:0]sum;
input logic signal;
input logic [6:0]count;
always_comb
begin
if (signal)
begin
if (~(count == N))
sum = count + 1;
if (count == N)
sum = 0;
end
end
endmodule

