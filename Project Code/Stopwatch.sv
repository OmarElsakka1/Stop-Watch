module Stopwatch_watch(reset0,clk,ctrl0,set,pause1,mood,outsource1,outsource2,outsource3,outsource4,display0,display1,display2,display3);//pause1-start0
input logic reset0,clk,ctrl0,set,pause1,mood; // mood here to choose between time or stopwatch
output logic [6:0] display0,display1,display2,display3;
input logic [3:0]outsource1,outsource2,outsource3,outsource4;
logic [3:0]outsource11,outsource12,outsource13,outsource14;
logic [3:0]outsource21,outsource22,outsource23,outsource24;
logic signalpowersaver,check,ctrl;
logic [6:0]countseconds;
logic [2:0]fsmchange;
logic [3:0]count0,count1,count2,count3;
logic [3:0]count0_time,count1_time,count2_time,count3_time;
logic [4:0]count4;
logic enter0,enter1,enter2,enter3;
logic enterfin0,enterfin1,enterfin2,enterfin3;
logic enterfin0_time,enterfin1_time,enterfin2_time,enterfin3_time;
logic reset,reset1,reset2,set_time;
logic error_surpass,sel,reseting,stopreseting;
logic error_surpass_printing, error2,errorchanging_printing;
logic error_surpass_time,error_surpass_printing_time,notzero;
logic resetblock51,resetingblock51;


assign check = 1;
assign reset = 0;
assign set = 0;
//assign pause = pause1;
assign mood = 0;
assign ctrl0 = 0;
assign reset0 = 0;

assign outsource1 = 0;
assign outsource2 = 0;
assign outsource3 = 0;
assign outsource4 = 0;

always@(posedge reset1)
begin
pause1 = 1;
end



block1000 #(6) blocking (clk,reset,fsmchange);

always_comb
begin
if ( (outsource11 > 9) | (outsource12 > 5) | (outsource13 > 9) | (outsource14 > 5) )
error_surpass = 1;
else
error_surpass = 0;
assign notzero = ( (~(outsource11 == 0)) | (~(outsource12 == 0)) | (~(outsource13 == 0)) | (~(outsource14 == 0)) );
if (( (~(error_surpass)) & notzero & (set & (pause1) & (ctrl0) ) ) | (reset1 & ctrl)) // 
sel = 1;
else
sel = 0;
if (~(ctrl == ctrl0))
error2 = 1;
else 
error2 = 0;
if ( (outsource21 > 9) | (outsource22 > 5) | (outsource23 > 3) | (outsource24 > 2) )
error_surpass_time = 1;
else 
error_surpass_time = 0;
if( (~(error_surpass_time)) & (set & mood) )//I added the pause recently
set_time = 1;
else
set_time = 0;
end








errorchanging_block stopreset1(clk,reset1,reseting,stopreseting);

always@(negedge pause1)
begin 
count4 = 0;
end

always@(posedge ctrl0, negedge ctrl0,posedge pause1,negedge pause1)
begin 
if (pause1 & (sel == 0))
ctrl = ctrl0;
else if (pause1 & (sel == 1) )
ctrl = ctrl0;
if (stopreseting)
reseting = 0;
end

always@(negedge ctrl)
begin 
reseting = 1;
end






always_comb
begin
if (mood&set)
begin
outsource21 = outsource1;
outsource22 = outsource2;
outsource23 = outsource3;
outsource24 = outsource4;
end
if ( (~(mood)) & set & ctrl)
begin
outsource11 = outsource1;
outsource12 = outsource2;
outsource13 = outsource3;
outsource14 = outsource4;
end
end
errorcounter_block mala(clk,reset1,error_surpass,error_surpass_printing);//added 
errorchanging_block mala2(clk,reset1,error2,errorchanging_printing);


block5 #(5) B5(clk,resetingblock51,count4,pause1,signalpowersaver); // Giving the signalpowersaver

assign enter0 = (ctrl & ((~(count0 == 0)) | (~(count1 == 0)) | (~(count2 == 0)) | (~(count3 == 0))) );
assign enterfin0 = ( (((~ctrl) & (~pause1)) | ((~pause1) & enter0)) & (~(error_surpass_printing)) & (~(errorchanging_printing)) );

block1 #(9) Block1(clk,reset1,ctrl,sel,outsource11,count0,enterfin0);
block3 B13(count0,count0_time,fsmchange,clk,reset1,signalpowersaver,error_surpass_printing,
error_surpass_printing_time,errorchanging_printing,mood,display0);

assign enter1 = ( (count0 == 9) & (~ctrl) );
assign enterfin1 = (enter1 | ( (count0 == 0) & ( (~(count3 == 0)) | (~(count2 == 0 )) | (~(count1 == 0))) & ctrl ));

block1 #(5)Block2(clk,reset1,ctrl,sel,outsource12,count1,enterfin1);
block4 B24(count1,count1_time,fsmchange,clk,reset1,signalpowersaver,error_surpass_printing,
error_surpass_printing_time,errorchanging_printing,mood,display1);

assign enter2 = (enter1 & (count1 == 5) );
assign enterfin2 = (enter2 | ( (count0 == 0) & (count1 == 0) & ( (~(count3 == 0)) | (~(count2 == 0)) ) & ctrl ));

block1 #(9)Block6(clk,reset1,ctrl,sel,outsource13,count2,enterfin2);
block6 B33(count2,count2_time,fsmchange,clk,reset1,signalpowersaver,error_surpass_printing,
error_surpass_printing_time,errorchanging_printing,mood,display2);



assign enter3 = (enter2 & (count2 == 9));
assign enterfin3 = (enter3 | ( ((count0 == 0) & (count1 == 0) & (count2 == 0) & (~(count3 == 0)) & ctrl) ) );

block1 #(6)Block7(clk,reset1,ctrl,sel,outsource14,count3,enterfin3);
block7 B44(count3,count3_time,fsmchange,clk,reset1,signalpowersaver,error_surpass_printing,
error_surpass_printing_time,errorchanging_printing,mood,display3);

assign reset1 = ((enterfin0 & ( (count3 == 6) & (count2 == 0) & (count1 == 0) & (count0 == 0) )) | (reset0 & (~(mood)) ) | reseting);


//From here we will start the the watch










block1_time blockseconds(clk,reset2,countseconds);
block2 #(9) Block10(clk,reset2,set_time,outsource21,count0_time,enterfin0_time);
block2 #(5) Block11(clk,reset2,set_time,outsource22,count1_time,enterfin1_time);
block2 #(9) Block12(clk,reset2,set_time,outsource23,count2_time,enterfin2_time);
block2 #(2) Block13(clk,reset2,set_time,outsource24,count3_time,enterfin3_time);

assign enterfin0_time = (countseconds == 59);
assign enterfin1_time = (enterfin0_time & count0_time == 9);
assign enterfin2_time = (enterfin1_time & (count1_time == 5) );
assign enterfin3_time = (enterfin2_time & (count2_time == 9) );

assign reset2 = ((enterfin0_time&((count3_time == 2)&(count2_time == 4)&(count1_time == 0)&(count0_time == 0)&(countseconds == 0)))|(reset0&(mood) ));
errorcounter_block mala3(clk,reset2,error_surpass_time,error_surpass_printing_time);//added 

endmodule
