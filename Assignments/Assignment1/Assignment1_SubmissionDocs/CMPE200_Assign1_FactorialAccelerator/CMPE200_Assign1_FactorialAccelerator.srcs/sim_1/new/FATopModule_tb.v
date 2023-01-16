`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 11:25:50 PM
// Design Name: 
// Module Name: FATopModule_tb
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


module FATopModule_tb;
reg Go_tb, CLK_tb;
reg [3:0] n_tb;
wire Done_tb, Error_tb;
wire[31:0] product_tb;

FATopModule FATM(.n(n_tb), 
                .Go(Go_tb), 
                .CLK(CLK_tb), 
                .Done(Done_tb), 
                .Error(Error_tb), 
                .product(product_tb));
                
task automatic tick;
    begin
        CLK_tb <= 1'b0;
        #50;
        CLK_tb <= 1'b1;
        #50;
    end
endtask

initial
begin
    $display("Factorial Testing Begins");
    CLK_tb = 0;
    n_tb = 4'd1;
    tick;
    while(n_tb < 15)
    begin
        Go_tb = 1;
        CLK_tb = 0;
        tick;
        while(!(Done_tb) || (Error_tb))
        begin
            tick;
        end
        if(Done_tb)
        begin
            $display("%0d! = %0d", n_tb, product_tb);
        end
        else if(Error_tb)
        begin
            $display("Error received, input = %0d", n_tb);
        end
        n_tb = n_tb + 4'd1;
    end
    $display("Test Complete");
    $finish;
end
endmodule