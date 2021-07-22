module Control(
input reset, clk,
input p1win, p2win,
output reg led1win, led2win, done);
reg ps, ns;

always @(posedge clk, posedge reset)
if (reset == 1) ps <= 0;
else ps <= ns;

always@(ps, p1win, p2win, reset)
begin led1win=0; led2win=0; done=0;
case (ps)
0: if (reset==1) ns=0; else ns=1;
1: if (p1win==1 && p2win==0) begin ns=0; led1win=1; done=1; end
		else if (p1win==0 && p2win==1) begin ns=0; led2win=1; done=1; end
		else ns=1;
endcase
end
endmodule
