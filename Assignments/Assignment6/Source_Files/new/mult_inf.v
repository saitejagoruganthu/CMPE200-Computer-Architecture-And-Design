`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Tirumala Saiteja Goruganthu
// 
// Create Date: 11/01/2022 08:47:11 PM
// Design Name: 
// Module Name: mult_inf
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


module mult_inf #(parameter WIDTH = 32)(

    input wire [WIDTH - 1:0] a, b,
    output reg [2*WIDTH - 1:0] out

    );
    
    always @ (a, b) begin
        out <= a * b;
    end
endmodule
