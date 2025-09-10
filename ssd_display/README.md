Some FPGA's such as the Basys3 used anode based display, i.e., the LED's lights are displayed on active low and turned off at active high. It is useless to create a module for active high and instantiate the invert of it because we will have to use several not gates to invert all the signals in the display and use it elsewhere. 

Hence, I've designed both the modules, one ssd display that is cathodic and other that is anodic that can be reused whenever necessary. 
