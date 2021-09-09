module newclk(clk,reset,newclk1);
input logic clk,reset;
output logic newclk1;
int x = 0;
always_ff@(posedge clk, posedge reset)
begin
if (x <= 50000000)
x = x + 1;
if(x<=25000000)
newclk1 = 1;
else
newclk1 = 0;
if (x == 50000000 || reset == 1)
x = 0;
end
endmodule

module newclk32(clk,reset,newclk1);
input logic clk,reset;
output logic newclk1;
int x = 0;
always_ff@(posedge clk, posedge reset)
begin
if (x <= 4)
x = x + 1;
if(x<=2)
newclk1 = 1;
else
newclk1 = 0;
if (x == 4 || reset == 1)
x = 0;
end
endmodule


module newclk3(count,sum,result);
output logic [2:0]sum;
output logic result;
input logic [2:0]count;
always_comb
begin
if (count < 4)
sum = count + 1;
if ((count == 0) | (count == 1))
result = 1;
if (count == 3)
sum = 0;
if ((count == 2) | (count == 3))
result = 0;
end
endmodule


module newclkfsm(clk,reset,newclk1);
input logic clk,reset;
output logic newclk1;
int x = 0;
always_ff@(posedge clk, posedge reset)
begin
if (x <= 2)
x = x + 1;
if(x<=1)
newclk1 = 1;
else
newclk1 = 0;
if (x == 2 || reset == 1)
x = 0;
end

endmodule


module newclk4(count,sum,result);
output logic [2:0]sum;
output logic result;
input logic [2:0]count;
always_comb
begin
if (count < 2)
sum = count + 1;
if ((count == 0))
result = 1;
if (count == 1)
sum = 0;
if (count == 1)
result = 0;
end
endmodule

module double_clk(clk,reset,check,result);
input logic clk,reset,check;
logic [2:0]sum;
logic [2:0]count;
output logic result;
always_comb
begin
count = 0;
end
newclk4 newclk11(count,sum,result);

Regfour #(4) R1(clk,reset,sum, count);endmodule



module errorcounter1(count,sum,result);
input logic [2:0] count;
output logic [2:0] sum;
output logic result;
always_comb
begin
case(count)
1: sum = 2;
2: sum = 3;
3: sum = 4;
4: sum = 0;
endcase
if ( (sum == 2) | (sum == 3) | (sum == 4) ) // 
result = 1;
else 
result = 0;
end
endmodule

module errorcounter_block(clk,reset,check,result);
input logic clk,reset,check;
logic [2:0]sum;
logic [2:0]count;
output logic result;
always_comb
begin
if (check) // It is always equal to one
count = 1;
end
errorcounter1 newclk11(count,sum,result);
Regfour #(4) R1(clk,reset,sum, count);endmodule


module errorcounter2(count,sum,result);
input logic [1:0] count;
output logic [1:0] sum;
output logic result;
always_comb
begin
case(count)
1: sum = 2;
2: sum = 0;
endcase
if ( (sum == 2) )
result = 1;
else 
result = 0;
end
endmodule

module errorchanging_block(clk,reset,check,result);
input logic clk,reset,check;
logic [1:0]sum;
logic [1:0]count;
output logic result;
always_comb
begin
if (check) // It is always equal to one
count = 1;
end
errorcounter2 newclk11(count,sum,result);

Regfour #(4) R1(clk,reset,sum, count);endmodule



