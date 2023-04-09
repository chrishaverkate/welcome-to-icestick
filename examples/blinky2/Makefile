 
# Project setup
PROJ      = blinky
BUILD     = ./build

# Files
FILES = blink.v led_driver.v clk_scalar.v

.PHONY: all clean burn timing

all $(BUILD)/$(PROJ).asc $(BUILD)/$(PROJ).bin:
	# if build folder doesn't exist, create it
	mkdir -p $(BUILD)

	# synthesize using Yosys
	yosys -q -p "synth_ice40 -blif $(BUILD)/$(PROJ).blif" $(FILES)

	# Place and route using arachne
	arachne-pnr -p pins.pcf $(BUILD)/$(PROJ).blif -o $(BUILD)/$(PROJ).txt

	# Convert to bitstream using IcePack
	icepack $(BUILD)/$(PROJ).txt $(BUILD)/$(PROJ).bin

burn: $(BUILD)/$(PROJ).bin
	iceprog $(BUILD)/$(PROJ).bin

timing: $(BUILD)/$(PROJ).asc
	icetime -tmd hx$(DEVICE) $(BUILD)/$(PROJ).asc

clean:
	rm build/*
