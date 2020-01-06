module hex_counter(A, Overflow, Clock, Reset, Direction, Hold); //Declares the hex_counter module

	input Clock, Reset, Direction, Hold; //Declares the Clock, Reset, Direction, Hold inputs
	output Overflow;  //Declares Overflow output
	output [3:0]A;		//Declares 4 bit output A 
	
	reg rOverflow;		//Declares regsiter rOverflow
	reg [3:0]rA;		//Declares 4 bit register rA
	
	always@(posedge Clock or negedge Reset) //Initiates always @ loop with positive edge clock trigger or negative edge Rest trigger
		
		//if Reset is equal to decimal zero:
		if (Reset ==1'd0) 
			begin
			rOverflow <= 1'b0;  //Set rOverflow register to binary 0
			rA <= 4'd5;         //Set rA register to decimal 5 in binary
			end
			
		//If register rA is less than decimal 5  and direction is set to binary zero and hold is set to binary zero:	
		else if ((rA < 4'd5)&&(Direction == 1'b0)&&(Hold == 1'b0))
			begin	
			rA <= rA + 1'b1;     //Add 1 binary bit to rA register
			rOverflow <= 1'b0;  //Set rOverflow register to binary 0
			end
			
		//If register rA is greater than decimal 0  and direction is set to binary 1 and hold is set to binary zero:	
		else if ((rA > 4'd0)&&(Direction == 1'b1)&&(Hold == 1'b0))
			begin 
			rA <= rA - 1'b1;    //Subtract 1 binary bit from rA register
			rOverflow <= 1'b0;  //Set rOverflow register to binary 0
			end
			
		//If register rA is equal to decimal 5 and direction is set to binary zero and hold is set to binary zero:	
		else if ((rA == 4'd5)&&(Direction == 1'b0)&&(Hold == 1'b0))
			begin
			rA <=4'b0000;       //Set rA register to binary 0000
			rOverflow <= 1'b1;  //Set rOverflow register to binary 1
			end
			
		//If register rA is equal to decimal 5  and direction is set to binary one and hold is set to binary zero:	
		else if ((rA == 4'd0)&&(Direction == 1'b1)&&(Hold == 1'b0))
			begin
			rA <=4'b0101;       //Set rA register to binary 0101
			rOverflow <= 1'b1;  //Set rOverflow register to binary 1
			end
			
		//else statement for all other scenarios:	
		else
			begin
			rA <= rA;			 //reset register rA to current rA value
			rOverflow <= 1'b0; //Set rOverflow register to binary 0
			end
	
	assign Overflow = rOverflow; //Assigns Overflow Output to register rOverflow
	assign A = rA; // Assigns Output A to register rA
			
endmodule //ends module
