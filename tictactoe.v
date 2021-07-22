module tictactoe(
	input clk, rst1, rst2,
	input [8:0] player1, player2,
	output reset, p1win, p2win, led1win, led2win, done,
	output [8:0] p1out, p2out
	);
	
	Datapath u1(
		.rst1(rst1) ,.rst2(rst2),.done(done), .player1(player1), .player2(player2),
		.p1win(p1win), .p2win(p2win), .reset(reset), .p1out(p1out), .p2out(p2out)
	);
	
	Control u2(
		.reset(reset), .clk(clk), .p1win(p1win), .p2win(p2win),
		.done(done), .led1win(led1win), .led2win(led2win)
	);

endmodule