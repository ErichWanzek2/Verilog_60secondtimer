module top_level(CLOCK_50,SW, HEX0, HEX1, HEX2, LEDR);// Defines the top_level for the timer circuit
	input wire CLOCK_50; // Declares input hardware 50MHz Clock
	input wire [2:0]SW; //Declares 3 input switches
	output [2:0]LEDR; //Declares 3 output LEDR wires
	
	assign LEDR[2:0] = SW[2:0]; // Assigns the 3 LEDRS to the 3 switches 

	wire Reset; // Declares the Reset wire
	wire Direction; // Declares the Direction wire
	wire Hold; // Declares the Hold wire
	
	assign Reset = SW[2];       //Assign Reset wire to switch 2
	assign Direction = SW[1];	 //Assign Direction wire switch 1
	assign Hold = SW[0];        //Assign Hold wire to switch 0
	
	output wire [6:0]HEX0; //defines output wires for HEX0 display.
	output wire [6:0]HEX1; //defines output wires for HEX1 display.
	output wire [6:0]HEX2; //defines output wires for HEX2 display.
	
	wire c1, c2, c3, c4, c5, c6, c7; //Declare intermediate clock wires
	
	wire [3:0]A0; //Declare 3 bit Data A0 wire
	wire [3:0]A1; //Declare 3 bit Data A1 wire
	wire [3:0]A2; //Declare 3 bit Data A2 wire
	
	
	//Instantiate the divider modules and cascade outputs to get correct clock frequency
	
	divide_by_5 inst0(CLOCK_50, c1); // Instantiate the divide_by_5 module, output 10MHz
	divide_by_10 inst1 (c1, c2); //Instantiate the divide_by_10 module #1 output 1MHz
	divide_by_10 inst2 (c2, c3); //Instantiate the divide_by_10 module #2 output 0.1MHZ
	divide_by_10 inst3 (c3, c4); //Instantiate the divide_by_10 module #3 output 0.01MHz
	divide_by_10 inst4 (c4, c5); //Instantiate the divide_by_10 module #4 output 1KHz
	divide_by_10 inst5 (c5, c6); //Instantiate the divide_by_10 module #5 output 0.1KHz
	divide_by_10 inst6 (c6, c7); //Instantiate the divide_by_10 module #6 output 0.1HZ

	
	wire Overflow0, Overflow1, Overflow2; //Declare the Overflow wires to feed into succesive counter modules
	

	decimal_counter inst9(A0, Overflow0, c7, Reset, Direction, Hold); //Instantiate the decimal_counter module
	decimal_counter inst10(A1, Overflow1, Overflow0, Reset, Direction, Hold); //Instantiate the decimal_counter module
	hex_counter inst11(A2, Overflow2, Overflow1, Reset, Direction, Hold); //Instantiate the hex_counter module
	
	
	hex_7seg_bitwise inst12(A0, HEX0); //Instantiate the hex_7seg_bitwise for HEX display 0
	hex_7seg_bitwise inst13(A1, HEX1); //Instantiate the hex_7seg_bitwise for HEX display 1
	hex_7seg_bitwise inst14(A2, HEX2); //Instantiate the hex_7seg_bitwise for HEX display 2
	
endmodule //ends module
