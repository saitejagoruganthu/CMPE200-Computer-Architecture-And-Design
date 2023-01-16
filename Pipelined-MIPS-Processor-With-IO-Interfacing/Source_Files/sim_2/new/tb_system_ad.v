module tb_system_ad;
    reg             WE_tb;
    reg     [31:0]  A_tb;
    wire            WE1_tb, WE2_tb, WEM_tb;
    wire    [1:0]   RdSel_tb;
    
    system_AD DUT1 (
        .WE(WE_tb),
        .A(A_tb),
        .WE1(WE1_tb),
        .WE2(WE2_tb),
        .WEM(WEM_tb),
        .RdSel(RdSel_tb)
    );
    
    initial begin
        WE_tb = 0;
        A_tb = 32'h000; #100;
        A_tb = 32'h800; #100;
        A_tb = 32'h900; #100;
    end
endmodule