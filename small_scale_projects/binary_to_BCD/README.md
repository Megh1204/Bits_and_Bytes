This project is implemented on Basys-3 FPGA Board. Hence, the constraints file is set accordingly.


This project focuses on converting a binary number into its BCD by using Shift Add-3 Method. 

Shift Add-3 Method Algorithm:
Initialization:         Start with the binary number you want to convert. 
Shift Left:             Shift the binary number to the left by one bit position. 
Check for 5 or Greater: Check each BCD digit (4-bit group) to see if it's 5 or greater. 
Add 3:                  If a BCD digit is 5 or greater, add 3 to it. 
Repeat:                 Repeat steps 2-4 for each bit position in the binary number. 