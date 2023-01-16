`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 08:51:56 PM
// Design Name: 
// Module Name: Counter
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


module Counter #(parameter Data_width = 4)(
    input CLK,
    input [Data_width - 1: 0] D,
    input Load_Cnt,
    input EN,
    output reg [Data_width - 1: 0]Q
    );
    always @ (posedge CLK)
    begin
        if(EN)
        begin
            if(Load_Cnt)
                Q <= D;
            else
            begin
                Q <= Q - 1'b1;
            end
        end
    end
endmodule
