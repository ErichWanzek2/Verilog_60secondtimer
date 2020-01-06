module divide_by_2(Clockin, Clockout); //Defines clock divide_by_2 module

	input Clockin;   //Declares Clockin input
	output Clockout; //Declares Clockout output
	
	reg [2:0]counter1; //Declares 3 bit wide register counter1
	
	wire clkout1; //Declares wire for clkout1
	
	always @(posedge Clockin) begin //Initiates always @ loop with positive edge clock trigger
		if(counter1 == 1 ) //If counter1 reaches 1, reset counter to zero
		counter1 <= 0; 	 //If counter1 reaches 1, reset counter to zero
		else 
		counter1 <= counter1 + 1 ; //else add value of 1 to counter1
	end


	assign clkout1  = counter1[0]; //assigns the value of clkout1 to the 1st bit of the register counter1
	assign Clockout = clkout1;     //assigns Clockout to clkout1

endmodule //Ends module
