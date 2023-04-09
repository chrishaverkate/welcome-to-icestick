module top(input clk, output D1, output D2, output D3, output D4, output D5);
    wire clk_out;
    wire [23:0] scalar = 12000000; // Value to divide the clock by
    reg [3:0] rot;

    // Scale the internal clock down (by scalar) to make the LED blinking visible
    clk_scaler clk_scaler_inst(clk, scalar, clk_out);

    // Determine the next LED value and assign it to the output
    led_driver led_driver_inst(clk_out, D1, D2, D3, D4, D5);

endmodule
