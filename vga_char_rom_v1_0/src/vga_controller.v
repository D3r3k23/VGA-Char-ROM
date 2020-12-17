
`include "vga_params.vh"

module vga_controller
(
    input wire          pix_clk, rst,
    input wire [23 : 0] background_color, char_color,
    input wire [11 : 0] char_x, char_y,
    input wire [7  : 0] character,

    output wire [7 : 0] pix_R, pix_G, pix_B,
    output wire         hsync, vsync, vid_active
);

    wire [11 : 0] H_count, V_count;

    sync_gen sync_gen_inst
    (
        .pix_clk    ( pix_clk    ),
        .rst        ( rst        ),
        .hsync      ( hsync      ),
        .vsync      ( vsync      ),
        .vid_active ( vid_active ),
        .H_count    ( H_count    ),
        .V_count    ( V_count    )
    );

    // Active region pixel coordinates
    wire [11 : 0] pix_x = vid_active ? (H_count - H_FRONT) : 0;
    wire [11 : 0] pix_y = vid_active ? (V_count - V_FRONT) : 0;

    pixel_gen pixel_gen_inst
    (
        .pix_clk ( pix_clk ),
        .rst     ( rst     ),

        // Software control
        .background_color ( background_color ),
        .char_color       ( char_color       ),
        .char_x           ( char_x           ),
        .char_y           ( char_y           ),
        .character        ( character        ),

        // VGA data
        .pix_x      ( pix_x      ),
        .pix_y      ( pix_y      ),
        .vid_active ( vid_active ),

        // Output
        .R ( pix_R ),
        .G ( pix_G ),
        .B ( pix_B )
    );

endmodule
