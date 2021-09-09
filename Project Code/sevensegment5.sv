module sevensegment5(q,y);
input logic [3:0]q;
output logic [6:0]y;
assign y[0] = (((~q[0]) & (~q[1])) |(~q[2]));
assign y[1] = (q[0] |(~q[1]) | (q[2]));
assign y[2] = (q[1]|((~q[0])&(~q[2]))|(q[0]&q[2]));
assign y[3] = ((~q[0])&(q[1]|(~q[2])));
assign y[4] = (q[1]|q[2]);
assign y[5] = (((~q[0])&(~q[1]))|(q[2]&(~q[3])));
assign y[6] = (q[1] |(~q[0]&(~q[2])) | (q[0]&q[2]) );
endmodule
