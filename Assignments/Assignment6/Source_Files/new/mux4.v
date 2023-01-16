`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Tirumala Saiteja Goruganthu
// 
// Create Date: 11/01/2022 08:08:29 PM
// Design Name: 
// Module Name: mux4
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


module mux4 #(parameter WIDTH = 8) (
        input  wire [1:0]     sel,
        input  wire [WIDTH-1:0] a,
        input  wire [WIDTH-1:0] b,
        input  wire [WIDTH-1:0] c,
        input  wire [WIDTH-1:0] d, 
        output reg [WIDTH-1:0]  y
    );
    
    always @ (*)
    begin
        case (sel)
            2'b00: y <= a;
            2'b01: y <= b;
            2'b10: y <= c;
            2'b11: y <= d;
        endcase
    end
    

endmodule