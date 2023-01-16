module tb_mips_pipelined_top;

reg clk;
reg rst;
wire we_dm;
wire [31:0] pc_current;
wire [31:0] instr;
wire [31:0] alu_out;
wire [31:0] wd_dm;
wire [31:0] rd_dm;
wire [31:0] DONT_USE;

integer i;

mips_pipelined_top DUT(
    .clk(clk),
    .rst(rst),
    .ra3(5'h0),
    .we_dm(we_dm),
    .pc_current(pc_current),
    .instr(instr),
    .alu_out(alu_out),
    .wd_dm(wd_dm),
    .rd_dm(rd_dm),
    .rd3(DONT_USE)
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
    for(i=0;i<300;i=i+1)
        begin
            tick;
        end
    reset;
    while(pc_current != 32'hb4) tick;
    $finish;
    end
endmodule