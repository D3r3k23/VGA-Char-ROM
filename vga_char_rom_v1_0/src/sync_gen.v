
`include "vga_params.vh"

module sync_gen
(
    input  wire pix_clk, rst,
    output wire hsync, vsync, vid_active,
    output wire [11 : 0] H_count, V_count
);

    vga_counter #(
        .WIDTH ( 12         ),
        .MAX   ( H_SYNC_MAX ))
    H_counter
    (
        .clk ( pix_clk ),
        .rst ( rst     ),
        .en  ( 1'b1    ),
        .val ( H_count )
    );

    wire V_en = (H_count == H_SYNC_MAX);

    vga_counter #(
        .WIDTH ( 12         ),
        .MAX   ( V_SYNC_MAX ))
    V_counter
    (
        .clk ( pix_clk ),
        .rst ( rst     ),
        .en  ( V_en    ),
        .val ( V_count )
    );

    assign hsync = (H_SYNC_MIN <= H_count) & (H_count <= H_SYNC_MAX);
    assign vsync = (V_SYNC_MIN <= V_count) & (V_count <= V_SYNC_MAX);

    wire H_active = (H_ACTIVE_MIN <= H_count) & (H_count <= H_ACTIVE_MAX);
    wire V_active = (V_ACTIVE_MIN <= V_count) & (V_count <= V_ACTIVE_MAX);

    assign vid_active = H_active & V_active;

endmodule