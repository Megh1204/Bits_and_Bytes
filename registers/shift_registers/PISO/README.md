In the Parallel In and Serial Out Shift register, the input comes parallelly to all the Flip-flops, while the inout flows out serially. 
There will be a control signal which I defined as shift_nload, which will load when the signal is 0 and shift the data when the signal is 1. 

The PISO can be implemented by either shifting left or hifting right, 
--> Implemented the shift right mechanism in this module.

The time taken for input to be completely observed at the output in active mode (non-reset mode) is 1 (for parallel input) and then whenever the control signal is changed to shift mode takes the length of the parallel in data to be shifted right and be serially observed at the output. 


