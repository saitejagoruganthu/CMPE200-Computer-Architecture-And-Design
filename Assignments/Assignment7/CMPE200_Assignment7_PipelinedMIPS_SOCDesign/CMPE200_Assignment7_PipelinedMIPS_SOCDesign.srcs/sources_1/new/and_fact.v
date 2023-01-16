module and_fact #(parameter WIDTH = 32)(
    input [WIDTH - 1:0] a, b,
    output wire c
    );
    
    assign c = a & b;
endmodule