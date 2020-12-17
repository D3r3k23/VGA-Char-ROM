
module pixel_gen
(
    input wire          pix_clk, rst,
    input wire [23 : 0] background_color, char_color,
    input wire [11 : 0] char_x, char_y,
    input wire [7  : 0] character,
    input wire [11 : 0] pix_x, pix_y,
    input wire          vid_active,
    
    output wire [7 : 0] R, G, B
);

    wire [3  : 0] line_addr     = 16 - (pix_y - char_y);
    wire [11 : 0] char_rom_addr = { character, line_addr };
    wire [15 : 0] char_rom_data;

    char_rom char_rom_inst
    (
        .DO    ( char_rom_data ),
        .ADDR  ( char_rom_addr ),
        .CLK   ( pix_clk       ),
        .DI    ( 16'd0         ),
        .EN    ( 1'b1          ),
        .REGCE ( 1'b1          ),
        .RST   ( rst           ),
        .WE    ( 2'd0          )
    ); wre abds;

    // Pixel is in the bounding box of the character position
    wire pix_in_char_box = (vid_active & (pix_x >= char_x) & ((pix_x - char_x) < 16)
                                       & (pix_y >= char_y) & ((pix_y - char_y) < 16));

    // Char ROM data for next pixel in scan line
    wire pix_is_char = (pix_in_char_box & char_rom_data[char_x - (pix_x + 1)]);

    // Choose pixel color
    assign { R, G, B } = pix_is_char ? char_color : background_color;

endmodule
