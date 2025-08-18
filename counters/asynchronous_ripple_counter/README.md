RIPPLE COUNTER: 

A ripple counter, also known as asynchronous counter is a type of digital counter where the output of one FF acts as a clock signal for the next FF in the chain. All the FF's in the circuit are not clocked simultaneously. The clock signal propagates from one clock signal to the next.

Also the negated output is fed back to the same flip flop and hence the output of the first ff is toggled at every rising edge of the clock. 
Similarly, the output of the second ff is toggled at every rising edge of the first ff's output. And this process repeats for n number of flip flops present achieving 2^n states. 
