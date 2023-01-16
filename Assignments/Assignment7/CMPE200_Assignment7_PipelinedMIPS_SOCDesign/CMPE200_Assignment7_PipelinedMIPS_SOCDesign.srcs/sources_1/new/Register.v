`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2022 11:08:41 PM
// Design Name: 
// Module Name: Register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Register #(parameter DATA_WIDTH = 32)(
    	input wire clk,
    	input wire load_reg,
    	input wire [DATA_WIDTH-1:0] in,
    	output reg [DATA_WIDTH-1:0] out);

	always@(posedge clk) begin
    	if(load_reg) begin
        	out = in;
    	end
    	// else out = out
	end

endmodule
