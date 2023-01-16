`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 08:51:56 PM
// Design Name: 
// Module Name: Multiplexer
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


module Multiplexer2x1 #(parameter Data_width = 32)(
    input [Data_width - 1:0] Inp0,
    input [Data_width - 1:0]Inp1,
    input Sel,
    output reg [Data_width-1 : 0] Out
    );
    always @(Inp0, Inp1, Sel)
        begin
            if(Sel)
                Out <= Inp1;
            else
                Out <= Inp0;
        end
endmodule
