`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2022 10:45:02 PM
// Design Name: 
// Module Name: alu
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


module alu (
        input  wire [3:0]  op,
        input  wire [31:0] a,
        input  wire [31:0] b,
        input  wire [4:0] shamt,
        output wire        zero,
        output reg  [31:0] y, hi, lo
    );

    assign zero = (y == 0);

    always @ (op, a, b) begin
        case (op)
            4'b0000: y <= a & b;
            4'b0001: y <= a | b;
            4'b0010: y <= a + b;
            4'b0110: y <= a - b;
            4'b0111: y <= (a < b) ? 1 : 0;
            4'b1000: {hi,lo} <= a * b;
            4'b1001: y <= b << shamt;
            4'b1010: y <= b >> shamt;
        endcase
    end

endmodule
