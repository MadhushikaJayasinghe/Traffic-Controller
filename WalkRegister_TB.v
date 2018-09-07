`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:03:44 07/13/2018
// Design Name:   WalkRegister
// Module Name:   C:/Users/140250d/Desktop/Traffic Controller/Traffic_controller/WalkRegister_TB.v
// Project Name:  Traffic_controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: WalkRegister
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module WalkRegister_TB;

	// Inputs
	reg walk_Btn_Pressed;
	reg clk;
	reg walkRegister_reset;
	reg sys_reset;

	// Outputs
	wire walkRegister_status;

	// Instantiate the Unit Under Test (UUT)
	WalkRegister uut (
		.walk_Btn_Pressed(walk_Btn_Pressed), 
		.walkRegister_status(walkRegister_status), 
		.clk(clk), 
		.walkRegister_reset(walkRegister_reset), 
		.sys_reset(sys_reset)
	);
	initial begin
		forever #50 clk = ~ clk ;
	end
	
	initial begin
		// Initialize Inputs
		walk_Btn_Pressed = 0;
		clk = 0;
		walkRegister_reset = 0;
		sys_reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		sys_reset = 1;
		
		#100
		sys_reset = 0;
		
		// Add stimulus here
		walk_Btn_Pressed = 1;
		
		#100;
		walkRegister_reset = 1;
		
		#100;
		walk_Btn_Pressed = 0;
		walkRegister_reset = 0;
		
		
		#100;
		walk_Btn_Pressed = 1;
		
		#100;
		walk_Btn_Pressed =0;
		
		#100;
		sys_reset = 1;
		
		#100
		sys_reset = 0;

	end
      
endmodule

