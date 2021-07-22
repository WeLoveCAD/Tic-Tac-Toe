module Datapath(
	input rst1, rst2, done,
	input [8:0] player1, player2,
	output reg p1win, p2win,
	output reset,
	output reg [8:0] p1out, p2out);
	
	
initial begin p1out=0; p2out=0; end

always@*
begin
if (rst1 == 1 || rst2 == 1 || done) begin p1out <= 0; p2out <= 0; end
else
begin p1out = player1; p2out = player2; end
end

assign reset = rst1 || rst2;

always@*
begin
if (p1out[0]==1 && p1out[1]==1 && p1out[2]==1) p1win<=1;
else if (p1out[3]==1 && p1out[4]==1 && p1out[5]==1) p1win<=1;
else if (p1out[6]==1 && p1out[7]==1 && p1out[8]==1) p1win<=1;
else if (p1out[0]==1 && p1out[3]==1 && p1out[6]==1) p1win<=1;
else if (p1out[1]==1 && p1out[4]==1 && p1out[7]==1) p1win<=1;
else if (p1out[2]==1 && p1out[5]==1 && p1out[8]==1) p1win<=1;
else if (p1out[0]==1 && p1out[4]==1 && p1out[8]==1) p1win<=1;
else if (p1out[2]==1 && p1out[4]==1 && p1out[6]==1) p1win<=1;
else p1win<=0;
end

always@*
begin
if (p2out[0]==1 && p2out[1]==1 && p2out[2]==1) p2win<=1;
else if (p2out[3]==1 && p2out[4]==1 && p2out[5]==1) p2win<=1;
else if (p2out[6]==1 && p2out[7]==1 && p2out[8]==1) p2win<=1;
else if (p2out[0]==1 && p2out[3]==1 && p2out[6]==1) p2win<=1;
else if (p2out[1]==1 && p2out[4]==1 && p2out[7]==1) p2win<=1;
else if (p2out[2]==1 && p2out[5]==1 && p2out[8]==1) p2win<=1;
else if (p2out[0]==1 && p2out[4]==1 && p2out[8]==1) p2win<=1;
else if (p2out[2]==1 && p2out[4]==1 && p2out[6]==1) p2win<=1;
else p2win<=0;
end

endmodule
