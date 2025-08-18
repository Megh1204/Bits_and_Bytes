 Universal Shift Register is a shift register that can mimic the behaviour all the available shift registers within the same module with just simple muxed logic. 

 It can behave like a:
 --> shift right SISO
 --> shift left SISO
 --> Holding the value
 --> Parallel loading input. 

 All of this can be done just by adding an extra 4:1 MUX logic where the selector variables S1 and S0 decide the mode of operation. If the universal shift regsister is of length n, we need n such 4:1 MUXes for mode selection for each of the register's flipflop's.

 S1  S0   Register working
 0    0   Holds previous value/No change.
 0    1   Shift Right Register.
 1    0   Shift Left Register.
 1    1   Parallel loading.


 
