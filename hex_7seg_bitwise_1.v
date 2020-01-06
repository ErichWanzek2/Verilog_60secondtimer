module hex_7seg_bitwise (X, segment); //module name 7 segment display, part 1e

	input wire [3:0]X; //defines a wire that's 4 bits wide
	output wire [6:0]segment; //defines an output wire that is 7 bits wide

	// Base for copying and pasting to make typing segments easier: A[3]&B[2]&C[1]&D[0] |

	// S0 = Sum(1,4,11,13)
	// Segment[0] = ~A[3]&~B[2]&~C[1]&D[0] | ~A[3]&B[2]&~C[1]&~D[0] | A[3]&B[2]&~C[1]&D[0] | A[3]&~B[2]&C[1]&D[0];
	assign segment[0] = ~X[3]&~X[2]&~X[1]&X[0] | ~X[3]&X[2]&~X[1]&~X[0] | X[3]&X[2]&~X[1]&X[0] | X[3]&~X[2]&X[1]&X[0];

	 
	// S1 = Sum(5,6,11,12,14,15)
	// Segment[1] = A[3]&B[2]&~D[0] | ~A[3]&B[2]&~C[1]&D[0] | B[2]&C[1]&~D[0] | A[3]&C[1]&D[0];
	assign segment[1] = X[3]&X[2]&~X[0] | ~X[3]&X[2]&~X[1]&X[0] | X[2]&X[1]&~X[0] | X[3]&X[1]&X[0];

	 
	// S2 = Sum(2,12,14,15)
	// Segment[2] = ~A[3]&~B[2]&C[1]&~D[0] | A[3]&B[2]&~D[0] | A[3]&B[2]&C[1];
	assign segment[2] = ~X[3]&~X[2]&X[1]&~X[0] | X[3]&X[2]&~X[0] | X[3]&X[2]&X[1];

	 
	// S3 = Sum(1,4,7,9,10,15)
	// Segment[3] = ~A[3]&B[2]&~C[1]&~D[0] | ~B[2]&~C[1]&D[0] | B[2]&C[1]&D[0] | A[3]&~B[2]&C[1]&~D[0]
	assign segment[3] = ~X[3]&X[2]&~X[1]&~X[0] | ~X[2]&~X[1]&X[0] | X[2]&X[1]&X[0] | X[3]&~X[2]&X[1]&~X[0];

	 
	// S4 = Sum(1,3,4,5,7,9)
	// Segment[4] = ~A[3]&B[2]&~C[1] | ~A[3]&D[0] | ~B[2]&~C[1]&D[0]
	assign segment[4] = ~X[3]&X[2]&~X[1] | ~X[3]&X[0] | ~X[2]&~X[1]&X[0];

	 
	// S5 = Sum(1,2,3,7,13)
	// Segment[5] = ~A[3]&~B[2]&D[0] | ~A[3]&C[1]&D[0] | ~A[3]&~B[2]&C[1] | A[3]&B[2]&~C[1]&D[0]
	assign segment[5] = ~X[3]&~X[2]&X[0] | ~X[3]&X[1]&X[0] | ~X[3]&~X[2]&X[1] | X[3]&X[2]&~X[1]&X[0];

	 
	// S6 = Sum(0,1,7,12)
	// Segment[6] = ~A[3]&~B[2]&~C[1] |  ~A[3]&B[2]&C[1]&D[0] |  A[3]&B[2]&~C[1]&~D[0]
	assign segment[6] = ~X[3]&~X[2]&~X[1] |  ~X[3]&X[2]&X[1]&X[0] |  X[3]&X[2]&~X[1]&~X[0];

endmodule //ends module

