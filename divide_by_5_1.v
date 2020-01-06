module divide_by_5(Clockin, Clockout); //Defines clock divide_by_5 module

	input Clockin; // Declares Clockin input
	output Clockout; //Declares Clockout output


	reg [2:0]counter1; //Declares 3 bit wide register counter1
	reg [2:0]counter2; //Declares 3 bit wide register counter2


	wire clkout1; //Declares wire for clkout1
	wire clkout2; //Declares wire for clkout2


	always @(posedge Clockin) begin //Initiates always @ loop with positive edge clock trigger
		if(counter1 == 4 ) //If counter1 reaches 4 reset counter to zero
		counter1 <= 0;		 //If counter1 reaches 4 reset counter to zero
		
		else 
		counter1 <= counter1 + 1 ;  //else add value of 1 to counter1
	end

	
	always @(negedge Clockin) begin //Initiates always @ loop with negatve edge clock trigger
		if(counter2 == 4)	//If counter2 reaches 4 for reset counter to zero
		counter2 <= 0; 	//If counter2 reaches 4 for reset counter to zero

		else 
		counter2 <= counter2+ 1; //else add value of 1 to counter2
	end

	
	assign clkout1  = counter1[1]; //assings the value of clkout1 to the 2nd bit of the register counter1
	assign clkout2  = counter2[1]; //assings the value of clkout2 to the 2nd bit of the register counter2

	assign Clockout = clkout1 | clkout2; //Adds clkout1 to clkout2 by logical or


endmodule //ends module
