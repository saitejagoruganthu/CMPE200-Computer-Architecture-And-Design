module tb_system;

reg clk;
reg rst;

reg [31:0] gpi1_var;
reg [31:0] gpi2_var;
wire [31:0] gpO1_var;
wire [31:0] gpO2_var;
reg [3:0] n_tb;
integer i;

system DUT(
    .clk(clk),
    .reset(rst),
    .gpi1(gpi1_var),
    .gpi2(gpi2_var),
    .gpO1(gpO1_var),
    .gpO2(gpO2_var)
);

task tick;
    begin
        clk = 1'b0; #5;
        clk = 1'b1; #5;
    end
endtask

task reset;
    begin
        rst = 1'b0; #5;
        rst = 1'b1; #5;
        rst = 1'b0;
    end
endtask

initial begin
    reset;
    n_tb = 4'd1;
    
    gpi1_var = 32'h4;
    gpi2_var = 32'h1;
    
    for(i=0;i<30;i=i+1)
        begin
            tick;
        end
 
    $finish;
    end

endmodule