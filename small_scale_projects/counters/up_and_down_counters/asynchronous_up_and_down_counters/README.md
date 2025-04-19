 Asynchronous counters also known as Ripple Counters, are a type of counters where each flip flop is triggered by the output of the previous one, not by a common clock signal.

I designed the verilog for 2,3 and 4 bit asynchronous/ripple up, down and up-down counters.

For up counters, we need to use negedge clk. 
For down counters, we need to use either posedge clk or negedge of ~clk. 
For updown counters, we will introduce a mode, and then count up for mode = 0 or count down for mode = 1. If we want to implement the same using Flip flop logic like I designed in up or down counters then, we can use negedge clk for up mode and negedge ~clk for down mode (~m*q + m*~q) as the clock for next flipflops. 

Note:  If we are trying to manually design the logic using Flipflops, then:
--> We cannot implement "true" asynchronous parametric N bit counter by using loops in synthesizable verilog. 
--> A true asynchronous (ripple) counter means each flip-flop is triggered by the output of the previous flip-flop, and not by the main clock. 
--> Therefore each bit has a different clock and Verilog doesn't allow using variable signals (q[i]) as clocks in a loop during synthesis and hence won't map cleary on a hardware. 
--> If you desire/wish to do so, you can only try to mimic this behaviour with a "for" loop and this will be used for simulatio purposes only.

However, parametric up/down counters can be designed by using behavioral logic, the way I designed updown counters. 
