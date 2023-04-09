module clk_scaler (input clk, input [23:0] scalar, output clk_out);
    reg [23:0] divider;
    reg clk_out = 0;

    always @(posedge clk) begin
        if (divider == scalar) begin
            divider <= 0;
            clk_out <= 1;
        end else begin
            divider <= divider + 1;
            clk_out <= 0;
        end
    end
endmodule