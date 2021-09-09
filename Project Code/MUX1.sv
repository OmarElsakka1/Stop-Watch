module MUX1 #(parameter N=4)(a, b, sel, y);
input logic [N-1:0]a;
input logic [N-1:0]b;
input logic sel;
output logic [N-1:0]y;
always_comb
begin
if(sel == 1)
y = a;
else
y = b;
end
endmodule

module MUX0 (a, b, sel, y);
input logic a,b;
input logic sel;
output logic y;
always_comb
begin
if(sel == 1)
y = a;
else
y = b;
end
endmodule





module Anti_MUX1 #(parameter N=4)(a, sel, y1,y2);
input logic [N-1:0]a;
input logic sel;
output logic [N-1:0]y1;
output logic [N-1:0]y2;
always_comb
begin
if(sel == 1)
y2 = a;
else
y1 = a;
end
endmodule







module Anti_MUX0 (a, sel, y1,y2);
input logic a;
input logic sel;
output logic y1;
output logic y2;
always_comb
begin
if(sel == 1)
y2 = a;
else
y1 = a;
end
endmodule

