# Project: Tic Tac Toe by group We Love CAD
Group members: 

TAN YI EN A18KE0279

KHOO CHIU XUAN A18KE0087

MUHAMMAD FIRDAUS BIN SAMSUDIN A17KE0167

# Project Introduction
Tic Tac Toe is a very popular paper-and-pencil game in a 3x3 grid for two players. The player who makes the first three of their marks in a diagonal, vertical, or horizontal row wins the game.

Rules for Tic Tac Toe:
1. The game is played on a grid 3x3 which is represented by leds.
2. There will be two players who are player1 and player2. Players take turns to light up the nine LEDs given. Player1 represented by LEDs with red colour while player2 represented by LEDs with green colour.
3. The player who successfully lights up three leds in a row which is up, down, across, or diagonally is the winner. The winner’s LED will light up when one of the players wins  the game.

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
![image](https://user-images.githubusercontent.com/87267229/125199352-702f8180-e298-11eb-80e3-ab10f839cbe7.png)
![image](https://user-images.githubusercontent.com/87267229/125199379-876e6f00-e298-11eb-96d1-6ffa5d9a6a4c.png)

# Control Unit Verilog Code
![image](https://user-images.githubusercontent.com/87267229/125199311-378fa800-e298-11eb-9c73-f9cf0bcc691d.png)

# Top Level Module Verilog Code
![image](https://user-images.githubusercontent.com/87267229/125199329-4ece9580-e298-11eb-9075-2ea0a93b9ecf.png)

# Testbench Verilog Code
![image](https://user-images.githubusercontent.com/87267229/125202138-d0c4bb80-e2a4-11eb-8abc-dc8ad45b45f2.png)
![image](https://user-images.githubusercontent.com/87267229/125202155-dfab6e00-e2a4-11eb-99cb-71d68367dc63.png)

# Simulation Results
![image](https://user-images.githubusercontent.com/87267229/125202568-b55ab000-e2a6-11eb-827f-bbfdec958756.png)

Figure 3. Compilation report of top level module

![image](https://user-images.githubusercontent.com/87267229/125202607-e4712180-e2a6-11eb-80bf-676346c06f47.png)

Figure 4. Simulation waveform using the testbench

# Diagram Generated from Code in Quartus II
![image](https://user-images.githubusercontent.com/87267229/125196802-c3500700-e28d-11eb-96bf-84ad84d87bd9.png)

Figure 5. Block diagram of top level module with pin planned

![image](https://user-images.githubusercontent.com/87267229/125196838-ee3a5b00-e28d-11eb-9d92-26231f718a8a.png)

Figure 6. IOBD of DU and CU

![image](https://user-images.githubusercontent.com/87267229/125202633-04a0e080-e2a7-11eb-8207-80d8e694a9c9.png)
![image](https://user-images.githubusercontent.com/87267229/125202667-1c786480-e2a7-11eb-92f9-820ae84d21cc.png)

Figure 7: Pin planner of the project

# Hardware Implementation
![image](https://user-images.githubusercontent.com/87267229/125202716-737e3980-e2a7-11eb-80d5-625f67332efa.png)

Figure 8. Hardware implementation on CPLD
