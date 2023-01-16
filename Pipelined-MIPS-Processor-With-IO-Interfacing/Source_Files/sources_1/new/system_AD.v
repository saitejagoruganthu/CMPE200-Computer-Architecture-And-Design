module system_AD(
        input WE,
        input [31:0] A,
        output reg WEM,
        output reg WE1,
        output reg WE2,
        output reg [1:0] RdSel
    );
    
    always @ (*) begin
        // Address range in if statements based on memory map table
        if (A >= 32'h0 && A <= 32'hFC) begin
            WEM = WE;
            WE1 = 0;
            WE2 = 0;
            RdSel = 2'b00;
        end
        else if (A >= 32'h800 && A <= 32'h80C) begin
            WEM = 0;
            WE1 = WE;
            WE2 = 0;
            RdSel = 2'b10;
        end
        else if (A >= 32'h900 && A <= 32'h90C) begin
            WEM = 0;
            WE1 = 0;
            WE2 = WE;
            RdSel = 2'b11;
        end
        else begin
            WEM = 0;
            WE1 = 0;
            WE2 = 0;
            RdSel = 2'b00;
        end
    end
endmodule