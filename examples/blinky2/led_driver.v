module led_driver (input clk, output D1, output D2, output D3, output D4, output D5);
    reg [3:0] rot = 4'b0001;

    always @(posedge clk) begin
        if (rot == 4'b1000)
            rot <= 4'b0001;
        else
            rot <= rot << 1;
    end

    assign D1 = rot[0];
    assign D2 = rot[1];
    assign D3 = rot[2];
    assign D4 = rot[3];
    assign D5 = 1;
endmodule