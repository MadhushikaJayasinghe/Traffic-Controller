`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:02:34 07/11/2018 
// Design Name: 
// Module Name:    Traffic_Controller 
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
module Traffic_Controller(tv, st, ex, en, reset, clk, sensor, walkRequest, reprogram, extTimeSelector, extTimeValue, Rm, Ym, Gm, Rs, Ys, Gs, W);

	input reset, clk, sensor, walkRequest, reprogram;
   input [1:0] extTimeSelector;
   input [3:0] extTimeValue;
   output Rm, Ym, Gm, Rs, Ys, Gs, W, st, ex, en;
	output [3:0] tv;
	reg [3:0] tv;
	reg st, ex, en;

	//reg Rm, Ym, Gm, Rs, Ys, Gs, W;

	wire reset_db_out, walkRequest_db_out, reprogram_db_out, sys_reset, sensor_sync, WR_sync,
			prog_sync, WR, WR_reset, one_hz_enable, divider_reset, start_timer, expired;
	wire[1:0] interval;
	wire[3:0] time_value;
	wire[6:0] light_signals;
	
	always @ (posedge clk)
		begin
			tv <= time_value;
			st <= start_timer;							
			ex <= expired;
			en <= one_hz_enable;
		end
	

	
	Synchronizer synchronizer(.reset_in(reset/*_db_out*/),
										.walkRequest_in(walkRequest/*_db_out*/),
										.reprogram_in(reprogram/*_db_out*/),
										.sensor_in(sensor),
										.reset_syn_out(sys_reset),
										.walkRequest_syn_out(WR_sync),
										.reprogram_syn_out(prog_sync),
										.sensor_syn_out(sensor_sync),
										.clk(clk));
										
	WalkRegister walkRegister(.walk_Btn_Pressed(WR_sync),
										.walkRegister_status(WR),
										.clk(clk),
										.walkRegister_reset(WR_reset),
										.sys_reset(sys_reset));
										
	TimeParameters timeParameters(.selector(extTimeSelector),
											.reprogram_value(extTimeValue),
											.interval_address(interval),
											.prg_sync_in(prog_sync),
											.output_value(time_value),
											.clk(clk),
											.sys_reset(sys_reset));
											
	Timer timer(.input_value(time_value),
					.enable(one_hz_enable),
					.start_timer(st),
					.expired(expired),
					.divider_reset(divider_reset),
					.clk(clk),
					.sys_reset(sys_reset));
					
	Divider divider(.enable_output(one_hz_enable), .clk(clk), .divider_reset(divider_reset));
	
	Lights lights(.light_signals(light_signals),
						.Rm(Rm), .Ym(Ym), .Gm(Gm),
						.Rs(Rs), .Ys(Ys), .Gs(Gs),
						.W(W));
						
	FSM fsm(.sensor_sync_in(sensor_sync),
			.walkRegister_status(WR),
			.prg_sync_in(prog_sync),
			.expired(expired),
			.walkRegister_reset(WR_reset),
			.interval_address(interval),
			.start_timer(start_timer),
			.light_signals(light_signals),
			.clk(clk),
			.sys_reset(sys_reset));
			
			
endmodule
