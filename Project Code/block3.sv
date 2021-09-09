module block3(a,a_time,a2, clk,reset,signal,error_over_start,error_over_start_time,error_changing,mood, output3);
input logic [3:0] a,a_time;
logic [6:0] output1,output2;
output logic [6:0] output3;
input logic signal,reset,mood;
input logic [2:0]a2;
logic [6:0] y1,y2,output11;
logic [6:0]sumfsm,timeprinting;
logic [6:0]sumdecoder,error_overprint,error_changeprint;
input logic clk;
input logic error_over_start,error_changing,error_over_start_time;
assign error_overprint = 119;
assign error_changeprint = 3;
//FSMpart fsm(a2,clk,reset,sumfsm);
always_comb
begin 
if (a2 == 0)
sumfsm = 1;
if (a2 == 1)
sumfsm = 2;
if (a2 == 2)
sumfsm = 4;
if (a2 == 3)
sumfsm = 8;
if (a2 == 4)
sumfsm = 16;
if (a2 == 5)
sumfsm = 32;
if (a2 == 6)
sumfsm = 64;
end
sevensegment9 D1(a,sumdecoder);
sevensegment9 D2(a_time,timeprinting);
MUX1 #(7) mux1(sumfsm,sumdecoder,signal,y1);
MUX1 #(7) mux2(error_changeprint,y1,error_changing, output1);
MUX1 #(7) mux3(error_overprint,output1,error_over_start, output11);

MUX1 #(7) mux5(error_overprint,timeprinting,error_over_start_time, output2);

MUX1 #(7) mux6(output2,output11,mood, output3);
endmodule


