`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Tirumala Saiteja Goruganthu
// 
// Create Date: 11/01/2022 08:21:34 PM
// Design Name: 
// Module Name: HiLo_reg
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

module HiLo_reg# (parameter WIDTH = 32) (
    input wire clk, rst, we,
    input wire [WIDTH - 1:0] hi, lo,
    output reg [WIDTH - 1:0] hi_out, lo_out
    );
    
    always @ (posedge clk, posedge rst)
    begin
        if (rst) {hi_out, lo_out} <= 0;
        else if (we) {hi_out, lo_out} <= {hi,lo};
        else {hi_out, lo_out} <= {hi_out, lo_out};
    end 
endmodule
