
module vga_counter
#(parameter
    integer WIDTH = 8,
    integer MAX   = 255
)(
    input wire clk, rst, en,
    output reg [WIDTH - 1 : 0] val
);

    always @( posedge clk )
        if (rst)
            val <= 0;
        else if (en)
            val <= (val < MAX) ? (val + 1) : 0;
        else
            val <= val;

endmodule
