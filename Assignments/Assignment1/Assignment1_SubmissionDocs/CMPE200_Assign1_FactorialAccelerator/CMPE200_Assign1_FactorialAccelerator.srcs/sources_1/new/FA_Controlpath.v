`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 08:47:02 PM
// Design Name: 
// Module Name: FA_Controlpath
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


module FA_Controlpath(
    input CLK,
    input Go,
    input GT1,
    input GT12,
    output reg Sel,
    output reg Load_Reg,
    output reg Load_Cnt,
    output reg OE,
    output reg EN,
    output Done,
    output Error
    );
    reg[2:0] CurrState=0, NextState;
    reg Err_Flag = 0, Done_Flag = 0;
    
    assign Error = GT12;
    assign Done = Done_Flag;
    
    //Initialize the states
    parameter S0 = 3'd0, S1 = 3'd1, S2 = 3'd2, S3 = 3'd3, S4 = 3'd4;
    
    always @ (CurrState, Go)
        begin
            case (CurrState)
                S0: //Idle State
                case({Go, GT12})
                    //Idle State and Go='1', GT12='1'
                    2'b11: {NextState, Err_Flag} <= {S0, 1'b1};
                    
                    //Idle State and Go='1', GT12='0'
                    2'b10: {NextState, Err_Flag} <= {S1, 1'b0};
                    
                    //Idle State and Go='0', GT12='0/1'
                    2'b0?: {NextState, Err_Flag} <= {S0, 1'b0};
                    
                    default: NextState = S0;
                endcase
                
                //Next State will directly be S2
                S1: NextState <= S2;
                
                //Next State will depend on GT1 value
                S2: NextState <= GT1 ? S4 : S3;
                
                //Next State will directly be S0
                S3: NextState <= S0;
                
                //Next State will directly be S2
                S4: NextState <= S2;
            endcase
       end
       
       always @(posedge CLK)
        CurrState = NextState;
        
        always @(CurrState)
        begin
            case(CurrState)
                S0: //Idle State
                begin
                    {Sel, Load_Cnt, EN, Load_Reg, OE, Done_Flag} <= 6'b1_1_1_0_0_0;
                end
                S1: //Load Register with '1' and Load Counter with n
                begin
                    {Sel, Load_Cnt, EN, Load_Reg, OE, Done_Flag} <= 6'b1_1_1_1_0_0;
                end
                S2: //Conditional state
                begin
                    {Sel, Load_Cnt, EN, Load_Reg, OE, Done_Flag} <= 6'b0_0_0_0_0_0;
                end
                S3: //Output is ready and Done is set to '1'
                begin
                    {Sel, Load_Cnt, EN, Load_Reg, OE, Done_Flag} <= 6'b0_0_0_0_1_1;
                end
                S4: //Decrement the counter and Load the register after multiplication
                begin
                    {Sel, Load_Cnt, EN, Load_Reg, OE, Done_Flag} <= 6'b0_0_1_1_0_0;
                end
            endcase
        end
endmodule
