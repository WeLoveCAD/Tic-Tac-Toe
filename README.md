# Group: We Love CAD
Group members: 

TAN YI EN A18KE0279

KHOO CHIU XUAN A18KE0087

MUHAMMAD FIRDAUS BIN SAMSUDIN A17KE0167

# 1.0 Project Introduction
Tic Tac Toe is a very popular paper-and-pencil game in a 3x3 grid for two players. The player who makes the first three of their marks in a diagonal, vertical, or horizontal row wins the game.

Rules for Tic Tac Toe:
1. The game is played on a grid 3x3 which is represented by leds.
2. There will be two players who are player1 and player2. Players take turns to light up the nine LEDs given. Player1 represented by LEDs with red colour while player2 represented    by LEDs with green colour.
3. The player who successfully lights up three leds in a row which is up, down, across, or diagonally is the winner. The winner’s LED will light up when one of the players wins      the game.
![image](https://user-images.githubusercontent.com/87267229/125195445-3e162380-e288-11eb-8583-3c520cadbbaa.png)
Figure 1. Possible winning patterns
4. When all the nine leds are lit up, the game is over and draw.
![image](https://user-images.githubusercontent.com/87267229/125195547-a9f88c00-e288-11eb-92e0-d8f6476bd043.png)
Figure 2. The game is draw.
5. When a player is willing to rematch, input a switch which represents reset.

# Software Used
Altera Quartus II

# Hardware Used
1. ALTERA MAX II EPM240T100C5N CPLD development board 5V
2. USB blaster
3. 20 1kohm resistors
4. 10 red LEDs (Player1: 9 for playing game and 1 for showing winning)
5. 10 green LEDs (Player2: 9 for playing game and 1 for showing winning)
6. Breadboards
7. Male-to-female jumper wires
8. Male-to-male jumper wires

# Datapath Unit Verilog Code
module Datapath(
    input rst1, rst2, done,
    input [8:0] player1, player2,
    output reg p1win, p2win,
    output reset,
    output reg [8:0] p1out, p2out);
    
   initial begin p1out=0; p2out=0; end

   always@*
     begin
      if (rst1 == 1 || rst2 == 1 || done) 
        begin p1out <= 0; p2out <= 0; end
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

# Control Unit Verilog Code
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

# Top Level Module Verilog Code
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

# Diagram Generated from Code in Quartus II
![image](https://user-images.githubusercontent.com/87267229/125196802-c3500700-e28d-11eb-96bf-84ad84d87bd9.png)
Figure 3. Block dragram of Top Level Module
![image](https://user-images.githubusercontent.com/87267229/125196838-ee3a5b00-e28d-11eb-9d92-26231f718a8a.png)
Figure 4. IOBD of DU and CU



