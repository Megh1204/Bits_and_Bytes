A ring counter is similiar to a shift register except the fact that the output of the last flip flop in the ring counter is connected to the first flip-flop. Whereas, in a shift register, that would be taken as the output. 

One FF is preset to 1 and all others are cleared to 0 by using an ORI signal. (ORI stands for overriding input). For example in a 4-bit ring counter, driving ORI to 0 will give state = 4'b1000;
When ORI is released, every clock edge, the outputs are right shifted by 1 bit. 1000 --> 0100 --> 0010 --> 0001 --> 1000 (back again to the initial state)
The number of states in the circuit is same as the number of flipflops. 

It is also known as one-hot counter because of the values of the states it produces. 


I designed an asynchronous Overriding ring counter with a positive edge triggered clock. 
