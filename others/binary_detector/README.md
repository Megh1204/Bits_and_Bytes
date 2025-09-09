This folder is a collection of verilog modules that can detect 0,1,X or Z from a given set of signals. Let's say for example if I have a 64-bit input vector and I want to detect if the 64-bit vector has a 0 in it, or 1 in it, or X or Z in either of its 64 bits. 

zero detector: If either of the 64-bits is 0, I will be able to detect it using an AND gate. AND gate output will be 0, when one of its input is 0(active low output). Can also take NAND gate to get an active high output. 

one detector: If either of the 64-bits is 1, I will be able to detect it using an OR gate. Since OR gate output is 1 when one of its input is 1, it is an active high output. 

unknown X detector: If either of the 64-bits is X, I will be able to detect it using an XOR or XNOR gate, any other gates like AND or OR will kill the detection if other bits are 0 or 1 respectively. 

Note: This is only for simulation purposes, synthesis will either result in output 0 or 1, based on if the unknown X lying between 0 to Vil or Vih to 1, only if the unknown signal X lies in between Vil and Vih will we able to detect X in the output, which further gets killed to 0 or 1 based on external noise or further restoring logic. 

