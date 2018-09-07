`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:30:17 07/12/2018
// Design Name:   Timer
// Module Name:   /HDL/Traffic_controller/Timer_TB.v
// Project Name:  Traffic_controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Timer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Timer_TB;

	// Inputs
	reg [3:0] input_value;
	reg enable;
	reg start_timer;
	reg clk;
	reg sys_reset;

	// Outputs
	wire expired;
	wire divider_reset;

	// Instantiate the Unit Under Test (UUT)
	Timer uut (
		.input_value(input_value), 
		.enable(enable), 
		.start_timer(start_timer), 
		.expired(expired), 
		.divider_reset(divider_reset), 
		.clk(clk), 
		.sys_reset(sys_reset)
	);
		
		initial begin							
			forever #10 clk = ~clk;
		end
	

	initial begin
		// Initialize Inputs
		input_value = 0;
		enable = 1;
		start_timer = 0;
		clk = 0;
		sys_reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		start_timer = 1;
		input_value = 4'b0111;
		
		
		#100
		start_timer = 0;
		
		#100
		start_timer = 1;
		input_value = 4'b0101;
				

		#100
		start_timer = 0;
		
		#100
		start_timer = 1;
		input_value = 4'b0110;
		
		
		#100 
		start_timer = 0;
		
		#100
		start_timer = 1;
		sys_reset = 1;

	end
      
endmodule

