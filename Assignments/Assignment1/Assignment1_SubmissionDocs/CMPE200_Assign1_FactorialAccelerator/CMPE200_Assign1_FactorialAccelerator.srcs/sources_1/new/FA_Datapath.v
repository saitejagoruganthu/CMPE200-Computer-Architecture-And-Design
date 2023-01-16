`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 08:42:53 PM
// Design Name: 
// Module Name: FA_Datapath
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


module FA_Datapath #(parameter Data_width = 32)(
    input CLK,
    input [3:0]n,
    input Sel,
    input Load_Reg,
    input Load_Cnt,
    input OE,
    input EN,
    output GT1,
    output GT12,
    output [Data_width - 1:0] product
    );
    
    wire [3:0] Counter_Output;
    wire [Data_width - 1:0] Mux_Output;
    wire [Data_width - 1:0] Reg_Output;
    wire [Data_width - 1:0] Mul_Output;
    
    Comparator #(4) Cmp_GT12Checker (.A(n), .B(4'd12), .GT(GT12));
    Comparator #(4) Cmp_GT1Checker (.A(Counter_Output), .B(4'd1), .GT(GT1));
    Counter #(4) CNT (.D(n), .Q(Counter_Output), .Load_Cnt(Load_Cnt), .EN(EN), .CLK(CLK));
    Multiplier #(32) MUL (.X({28'b0,Counter_Output}), .Y(Reg_Output), .Z(Mul_Output));
    Multiplexer2x1 #(32) MUX (.Inp1(32'b1), .Inp0(Mul_Output), .Sel(Sel), .Out(Mux_Output));
    Multiplexer2x1 #(32) Out_Buffer (.Inp0(32'b0), .Inp1(Reg_Output), .Sel(OE), .Out(product));
    Register #(32) REG (.D(Mux_Output), .Q(Reg_Output), .Load_Reg(Load_Reg), .CLK(CLK));
endmodule
