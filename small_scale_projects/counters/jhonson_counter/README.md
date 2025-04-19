Johnson sounter is very similar to a ring counter, but it is a little twisted and hence also known as Twisted Ring Counter. It is also known as switch-tail ring counter or walking ring counter. 
The output of the first flop will be the inverse of the last flip flop and also all FF's will be cleared and no FF will be preset when ORI is driven. Hence, there is a very minimal verilog code change for this when compared to a ring counter. Just adding a not gate between the last FF output(complemented output of the last FF is connected to first Flipflop) and the first FF input and connecting the first FF to CLR just like other FF's (no preset).

The Johnson counter has 2N number of states for any N-number of Flip-Flops. 

Initial state ==> 0000;
State transitions ==> 0000 --> 1000 --> 1100 --> 1110 --> 1111 --> 0111 --> 0011 --> 0001 --> 0000(back to initial state after 2N transitions) 
