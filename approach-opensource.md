# Open Source Development
There is an active community around FPGA development, along with open source tools.

# Resources
* [Toolchain for Lattice iCE40 FPGAs](https://wiki.debian.org/FPGA/Lattice) - High-level guide to development

* [ICESTICK Examples](https://github.com/Obijuan/open-fpga-verilog-tutorial/tree/master/tutorial/ICESTICK) - Note: these are in Spanish, but lots of good stuff still.

# Development Software
The pipeline employs the following tools:

* [yosys](https://packages.debian.org/yosys) - for logic synthesis of Verilog code. The output is a netlist describing how all cells are connected together in BLIF format.
* [arachne-pnr](https://packages.debian.org/arachne-pnr) - for placement and routing of the netlist. The output is a textual bitstream.

The final step, i.e. preparing the bitstream for the FPGA, and transferring it to the FPGA, uses:

* [fpga-icestorm](https://packages.debian.org/fpga-icestorm) - for the Lattice boards, using libusb/libftdi

## Setup
### Ubuntu 22.04
**Install Packages**

`yosys`, `arachne-pnr`, and `fpga-icestorm` are all available as `apt packages`

```bash
sudo apt install yosys arachne-pnr fpga-icestorm
```

**UDEV Rules**
```bash
echo 'ACTION=="add", ATTR{idVendor}=="0403", ATTR{idProduct}=="6010", MODE:="666"' > '53-lattice-ftdi.rules'
sudo mv '53-lattice-ftdi.rules' '/etc/udev/rules.d/'
```

## Programming
Generally speaking, the process is:
1. Write Verilog code (mydesign.v)
2. Synthesize the Verilog code into a netlist (mydesign.blif)
3. Place and route the netlist into a bitstream (mydesign.txt)
4. Convert the bitstream into a binary file (mydesign.bin)

```mermaid
    flowchart LR
	mydesign.v -->|yosys| mydesign.blif
	mydesign.blif -->|arachne-pnr| mydesign.txt
	mydesign.txt -->|icepack| mydesign.bin
```
For a working example, see the `all` target in the [blinky makefile](examples/blinky/Makefile).

## Burning
To put your design on the FPGA, you need to use `iceprog` to burn the binary file to the FPGA.
See the `burn` target in the [blinky makefile](examples/blinky/Makefile).

## Simulation
