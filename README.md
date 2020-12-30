## VGA Char ROM


This was a lab project for my digital systems class. The project was designed to work on a Blackboard from [Real Digital](https://www.realdigital.org/), which includes a Znyq SoC with an ARM processor and Artix FPGA. The project includes a VGA controller which can draw a single character on the display, written in Verilog. The character, its location, and color are controlled by software using the AXI bus to communicate with the ARM.

The functionality of this project was extended in [VGA-Console](https://github.com/D3r3k23/VGA-Console).


### [Video of the test application running](https://drive.google.com/file/d/1hD0VHN7D27NxYsh888R6UdT9YapW_Cg8/view?usp=sharing)


### System block diagram
![System Block Diagram](system_bd.png?raw=true)


### *Provided by Real Digital:*
* [VGA-HDMI encoder IP](https://github.com/RealDigitalOrg/VivadoIP/tree/master/hdmi_tx_1.0)
* [char_rom.v block ram module](https://www.realdigital.org/doc/93562a1dd6587887f4265d6ecac23929)
