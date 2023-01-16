`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 08:51:56 PM
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


module Multiplier #(parameter Data_width = 32)(
    input [Data_width - 1:0] X,
    input [Data_width - 1:0] Y,
    output reg [Data_width - 1:0] Z
    );
    always @ (X or Y)
        begin
            Z <= X * Y;
        end
endmodule
