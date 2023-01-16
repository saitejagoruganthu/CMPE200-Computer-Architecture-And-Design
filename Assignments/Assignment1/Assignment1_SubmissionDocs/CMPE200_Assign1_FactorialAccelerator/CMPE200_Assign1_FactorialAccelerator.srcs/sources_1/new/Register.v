`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 08:51:56 PM
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


module Register #(parameter Data_width = 32)(
    input [Data_width - 1:0] D,
    input Load_Reg,
    input CLK,
    output reg [Data_width - 1:0] Q
    );
    always @(posedge CLK)
        begin
            if(Load_Reg)
                Q <= D;
        end
endmodule
