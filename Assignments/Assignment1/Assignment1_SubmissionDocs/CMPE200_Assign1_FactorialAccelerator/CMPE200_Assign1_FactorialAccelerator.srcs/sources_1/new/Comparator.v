`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 08:51:56 PM
// Design Name: 
// Module Name: Comparator
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


module Comparator #(parameter DataWidth =4)(
    input [DataWidth - 1:0] A,
    input [DataWidth - 1:0] B,
    output reg GT
    );
    always @(A or B)
        begin
            //Initialize GT value with '0'
            GT <= 1'b0;
            
            if(A > B)
                GT <= 1'b1;
        end
endmodule
