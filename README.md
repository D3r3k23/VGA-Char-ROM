## VGA Char ROM

This was a lab project for my digital systems class. The project was designed to work on a Blackboard from [Real Digital](https://www.realdigital.org/), which includes a Znyq SoC with an ARM processor and Artix FPGA. The project includes a VGA controller which can draw a single character on the display, written in Verilog. The character, its location, and color are controlled by software using the AXI bus to communicate with the ARM.


#### [Video of the test application running](https://drive.google.com/file/d/1hD0VHN7D27NxYsh888R6UdT9YapW_Cg8/view?usp=sharing)


### System block diagram
![System Block Diagram](system_bd.png?raw=true)
vga_char_rom_v1_0/

*VGA to HDMI encoder module provided by [Real Digital](https://www.realdigital.org/doc/715356000ec89fbfd26a44cd2444659b)*
