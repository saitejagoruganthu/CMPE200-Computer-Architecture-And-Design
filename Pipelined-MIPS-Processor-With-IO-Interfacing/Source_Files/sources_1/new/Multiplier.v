`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2022 11:08:41 PM
// Design Name: 
// Module Name: Multiplier
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


module Multiplier #(parameter DATA_WIDTH = 32)(
    	input wire [DATA_WIDTH-1:0] a,
    	input wire [DATA_WIDTH-1:0] b,
    	output wire [DATA_WIDTH-1:0] out);

	assign out = a * b;

endmodule
