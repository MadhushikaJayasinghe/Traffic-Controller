`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:10:14 07/11/2018 
// Design Name: 
// Module Name:    WalkRegister 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module WalkRegister (walk_Btn_Pressed, walkRegister_status, clk, walkRegister_reset, sys_reset);
    
	input clk, walkRegister_reset, walk_Btn_Pressed, sys_reset;
   output walkRegister_status;
	reg walkRegister_status = 0;

	always @ ( posedge clk )
		begin
		walkRegister_status <= (walkRegister_reset || sys_reset) ? 0 :	walkRegister_status ? walkRegister_status : walk_Btn_Pressed ;
	end
endmodule