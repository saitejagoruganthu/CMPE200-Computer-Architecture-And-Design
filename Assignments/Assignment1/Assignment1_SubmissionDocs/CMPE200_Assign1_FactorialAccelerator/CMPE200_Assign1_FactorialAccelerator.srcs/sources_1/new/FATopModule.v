`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 08:29:17 PM
// Design Name: 
// Module Name: FATopModule
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


module FATopModule(
    input Go,
    input CLK,
    input[3:0] n,
    output Done,
    output Error,
    output[31:0] product
    );
    
    wire Sel, Load_Reg, Load_Cnt, OE, EN;
    wire GT1, GT12;
    
    FA_Datapath FADP(.CLK(CLK), 
                     .EN(EN), 
                     .n(n), 
                     .Sel(Sel), 
                     .Load_Reg(Load_Reg), 
                     .Load_Cnt(Load_Cnt), 
                     .OE(OE), 
                     .GT1(GT1), 
                     .GT12(GT12), 
                     .product(product));
    
    FA_Controlpath FACP(.EN(EN), 
                        .Go(Go), 
                        .CLK(CLK), 
                        .Sel(Sel), 
                        .Load_Reg(Load_Reg), 
                        .Load_Cnt(Load_Cnt), 
                        .OE(OE), 
                        .GT1(GT1), 
                        .GT12(GT12), 
                        .Done(Done), 
                        .Error(Error));
endmodule
