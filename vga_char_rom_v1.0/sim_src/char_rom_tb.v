
`timescale 1ns / 1ps

module char_rom_tb();

    // Inputs
    reg clk = 0;
    reg rst = 1;

    wire [11 : 0] addr;
    
    // Outputs
    wire [15 : 0] DO;

    // Generate clk
    always #5 clk <= ~clk;

    reg [3 : 0] line_addr = 15;

    always @( posedge clk )
    begin
        if (line_addr == 0)
            line_addr <= 15;
        else
            line_addr <= line_addr - 1;
    end

    addr <= { "E", line_addr };

    char_rom dut
    (
        .DO    ( DO    ),
        .ADDR  ( addr  ),
        .CLK   ( clk   ),
        .DI    ( 16'h0 ),
        .EN    ( 1'b1  ),
        .REGCE ( 1'b0  ),
        .RST   ( rst   ),
        .WE    ( 2'd0  ) 
    );
    
    initial
    begin
        #20 rst = 0;

        #200 $finish;
    end

endmodule
