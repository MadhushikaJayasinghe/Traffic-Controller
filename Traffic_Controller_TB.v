`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:05:35 07/13/2018
// Design Name:   Traffic_Controller
// Module Name:   C:/Users/140250d/Desktop/Traffic Controller/Traffic_controller/Traffic_Controller_TB.v
// Project Name:  Traffic_controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Traffic_Controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Traffic_Controller_TB;

	// Inputs
	reg reset;
	reg clk;
	reg sensor;
	reg walkRequest;
	reg reprogram;
	reg [1:0] extTimeSelector;
	reg [3:0] extTimeValue;

	// Outputs
	wire [3:0] tv;
	wire st;
	wire ex;
	wire en;
	wire Rm;
	wire Ym;
	wire Gm;
	wire Rs;
	wire Ys;
	wire Gs;
	wire W;

	// Instantiate the Unit Under Test (UUT)
	Traffic_Controller uut (
		.tv(tv), 
		.st(st), 
		.ex(ex), 
		.en(en), 
		.reset(reset), 
		.clk(clk), 
		.sensor(sensor), 
		.walkRequest(walkRequest), 
		.reprogram(reprogram), 
		.extTimeSelector(extTimeSelector), 
		.extTimeValue(extTimeValue), 
		.Rm(Rm), 
		.Ym(Ym), 
		.Gm(Gm), 
		.Rs(Rs), 
		.Ys(Ys), 
		.Gs(Gs), 
		.W(W)
	);

	initial begin
		forever #10 clk = ~clk;
	end
	initial begin
		// Initialize Inputs
		reset = 0;
		clk = 0;
		sensor = 0;
		walkRequest = 0;
		reprogram = 0;
		extTimeSelector = 0;
		extTimeValue = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 1;
		
		#20;
		
		reset = 0;
		
		#100;
		
		sensor = 1;
		
		#300
		sensor = 0;
		
		#100 
		reset = 1;
		
		#100
		reset = 0;
		

	end
      
endmodule

