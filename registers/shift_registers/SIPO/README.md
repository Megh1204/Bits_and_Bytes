In Serial-in Parallel-out, we have data coming in serially, then shifted through the shift register. 
All the outputs Q of the Flip-Flops in the shift register are grabbed to get the Parallel output. 

The shifting inside SIPO can be either shift left or shift right. 
--> This module implements shift right. 

The total time taken for a serial input to reach output in active mode (non-reset mode) is Data length (serial data shifting) + 1 (parallel out)
