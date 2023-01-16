`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2022 04:11:53 PM
// Design Name: 
// Module Name: mips_pipelined_top
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


module mips_pipelined_top(
        input wire clk,
        input wire rst,
        input  wire [4:0]  ra3,
        input  wire [31:0] instr,
        input  wire [31:0] rd_dm,
        output wire        we_dm,
        output wire [31:0] pc_current,
        output wire [31:0] alu_out,
        output wire [31:0] wd_dm,
        output wire [31:0] rd3
    );
    
    wire [31:0] DONT_USE;
    
    mips_pipelined mips_pipelined(
        .clk(clk),
        .rst(rst),
        .ra3(ra3),
        .we_dm(we_dm),
        .pc_current(pc_current),
        .instr(instr),
        .alu_out(alu_out),
        .wd_dm(wd_dm),
        .rd_dm(rd_dm),
        .rd3(rd3)
    );
    
    imem iMemory(
        .a(pc_current[7:2]),
        .y(instr)        
    );
    
    dmem dMemory(
        .clk(clk),
        .we(we_dm),
        .a(alu_out[7:2]),
        .d(wd_dm),
        .q(rd_dm)
    );
endmodule
