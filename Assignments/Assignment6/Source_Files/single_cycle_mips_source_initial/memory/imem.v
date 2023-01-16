module imem (
        input  wire [5:0]  a,
        output wire [31:0] y
    );

    reg [31:0] rom [0:63];

    initial begin
        $readmemh ("H:\\Masters\\Semester1\\CMPE200\\Assignment6\\memfile.dat", rom);
    end

    assign y = rom[a];
    
endmodule