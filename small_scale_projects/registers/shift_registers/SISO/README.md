In a serial_in serial_out shift register, the data coming in and the data moving out are both single bit. However, the number of cyles it takes for the data to be displayed at the output depends on the length of the shift register and hence is paramterized.

Shift registers can be either shigt left or shift right. Implementing a shift right register in this module.

Total number of cycles in active mode (non-reset mode) taken for the input to reach output is data length + shift register length.
