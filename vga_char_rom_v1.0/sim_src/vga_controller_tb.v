
`timescale 1ns / 1ps

module vga_controller_tb();

    // Inputs
    reg pix_clk = 0;
    reg rst     = 1;

    wire [23 : 0] background_color = 24'h00FF00;
    wire [23 : 0] char_color       = 24'hFF0000
    wire [11 : 0] char_x           = 12'd192;
    wire [11 : 0] char_y           = 12'd41;
    wire [7  : 0] character        = '0';

    // Outputs
    wire [7 : 0] pix_R, pix_G, pix_B;
    wire         hsync, vsync, vid_active;
    
    // Generate clock
    always #5 pix_clk <= ~pix_clk;

    vga_controller dut
    (
        .pix_clk    ( clk74M ),
        .rst        ( rst    ),

        .background_color ( background_color ),
        .char_color       ( char_color       ),
        .char_x           ( char_x           ),
        .char_y           ( char_y           ),
        .character        ( character        ),

        .pix_R ( pix_R ),
        .pix_G ( pix_G ),
        .pix_B ( pix_B ),

        .hsync      ( hsync      ),
        .vsync      ( vsync      ),
        .vid_active ( vid_active )
    );

    initial
    begin
        #20 rst = 1'b0;

        #4000 $finish
    end

endmodule
