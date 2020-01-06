module divide_by_10(Clockin, Clockout); //Defines clock divide_by_10 module

	input Clockin;   //Declares Clockin input
	output Clockout; //Declares Clockout output
	
	wire clock;  //Declares a clock wire 
	
	divide_by_2(Clockin, clock);  //Instantiates the divide_by_2 module, feeds clock wire to next module
	divide_by_5(clock, Clockout); //Instantiates the divide_by_5 module, outputs clockout

endmodule //ends module
