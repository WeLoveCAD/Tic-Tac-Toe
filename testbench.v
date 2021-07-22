
module testbench;
	reg clk, rst1, rst2;
  	reg[8:0] player1, player2;
	wire reset, p1win, p2win, led1win, led2win, done;
	wire[8:0] p1out, p2out;

	tictactoe dut(.clk(clk), .player1(player1), .player2(player2), 
                  .rst1(rst1), .rst2(rst2), .reset(reset), .p1win(p1win), .p2win(p2win), .led1win(led1win), 
						.led2win(led2win), .done(done), .p1out(p1out), .p2out(p2out));
	
	initial begin 
		clk = 0; 
		$monitor ("time: ", $time, 
					"clk=%b, player1=%b, player2=%b, rst1=%b, rst2=%b, reset=%b, p1win=%b, p2win=%b, led1win=%b, led2win=%b, done=%b, p1out=%b, p2out=%b\n", 
					clk, player1, player2, reset, rst1, rst2, p1win, p2win, led1win, led2win, done, p1out, p2out);
      $dumpvars(0);
		
	end
	
	always #10 clk = ~clk;
	initial begin
			 #10 player1=9'b100000000; 
			 #20 								player2=9'b000100000;
			 #20 player1=9'b110000000;
			 #20 								player2=9'b000110000;  
			 #20 player1=9'b111000000; 
			 #20 player1=9'b100000000; 
			 #20 								player2=9'b000010000;
			 #20 player1=9'b101000000;
			 #20 								player2=9'b010010000;  
			 #20 player1=9'b101000100; 
			 #20 								player2=9'b010010010;
			 #300 $finish;
	end

endmodule