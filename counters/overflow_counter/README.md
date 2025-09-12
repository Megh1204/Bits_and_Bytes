In this project, I designed an overflow counter with various features. 

The counter uses a 100MHz clock. The Basys3 FPGA board hosts a 100 MHz crystal oscillator, a device used for generating a precisely timed alternating signal. 
Pin W5 on BANK34 of the Basys3 FPGA board operating at LVCMOS33 is a clock signal operating at 100MHz.

There are several modules in this project. So I will discuss the working of each module. 

1. OVERFLOW COUNTER: 	
	1. The 32 bit counter is used for counting at every positive edge of the clock. Hence, the value of the counter increments by one every 10ns when enabled. 
	2. Only the MSB bits of the counter are displayed on the LED's of the Basys3 FPGA board since the LED's will be blinking at a very high speed and hence are very difficult to observe with the naked eye. 
	3. The overflow_count_binary takes the number of times the 32-bit counter has overflown and counts the overflow. Overflow_count_binary is converted to overflow_count_BCD using a Binary to BCD converter since we want to display it in terms of digits on the Seven Segment Display. BCD is preferred over Binary since Binary is just difficult to express in terms of digits. 
	4. If the overflow counter overflows too with 9999 in value, then it resets back to 0000 after one cycle. (can be equivalent to 1_0000 on back of the head calculations)

2. Binary to BCD SSD Display: 
	1. The Basys 3 SSD display is capable of displaying numbers from 0 to 9999. (9999 is represented by 14-bits in Binary)
	2. The module takes in 14-bit input and converts it into its binary equivalent of 16-bits long to be able to fit with the SSD display. (9999 is 1001_1001_1001_1001 in BCD.
	3. This module is designed by using the Shift Add-3 method.

3. SSD Display:
	The SSD display takes 4-bit inputs from 0000 to 1001 and displays their corresponding decimal equivalent on the SSD. 

4. Anode Selector:
	1. There are 12-signals associated with the Seven Segment Display of the Basys3 FPGA Board.
		--> 4-Anodes corresponding to each digit on the SSD. 
		--> 7-cathodes for each segment of each digit and 1-cathode for the decimal point for each digit.
		--> Each of these 8-cathodes will be connected to all the digits. Therefore, if we turn on all the anodes at the same time and drive a single value, then we will see the same value on each of these displays. 
		--> In order to display different values on each digit, we have to create switching between these anodes with some refresh rate with only one anode being "ON" at any given time. 
		--> As each anode is turned on, we are going to change the value of the cathodes we want to display on each digit. 
		--> For each of these four digits to be bright and illuminated, all four digits must be driven once every 1ms to 16ms for a refresh frequency of about 1 KHz to 62.5 Hz. 
		--> The entire display would be refreshed once every 16ms, and hence each digit will be illuminated for 1/4th of the refresh cycle or 4ms. 
		--> The anode selector changes the active anode every 4ms for maintaining a decent refresh rate for the digits to illuminate brightly.

5. TOP MODULE: 
	The top module combines all these inner modules and contains the logic for selecting the segments based on anode refresh rate. 
