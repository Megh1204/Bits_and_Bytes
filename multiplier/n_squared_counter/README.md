I want to create a multiplier that counts numbers as N squared instead of N. 

Count         = 0 , 1 , 2 , 3 , 04 , 05 , 06

Squared count = 0 , 1 , 4 , 9 , 16 , 25 , 36 and so on. 

This waveform shows how a typical n squared multiplier should behave.
![N Squared Counter Wavefrom](images/waveform.png)

Different implementations: 

1. N squared counter: Use a simple multiplier to do the multiplication. However, as we go to large numbers, multiplication results in a much higher compute. As can be seen in the schematic, it uses an adder to add count and 1 at every posedge of clock, 4 registers to maintain the state of count and a 4-bit input multiplier to get an 8-bit multiplied output. 

![Count multiplied count](images/n_squared_counter.png)

2. N squared counter using shift and add: We can still use the same adder to add count and 1 at every posedge of clock along with 4 registers to maintain the state of count. However, instead of using a 4-bit input multiplier to generate an 8-bit multiplied output, will use a shift and add style multiplier. 

1000 x 1001 = 1000x1 + (1000<<1)x0 + (1000<<2)x0 + (1000<<3)x1.

a x b       = a x b[0] + (a<<1) x b[1] + (a<<2) x b[2] + (a<<3) x b[3].

By using this style of multiplier, the multiplier in our conventional N squared counter will be replaced by a bunch of shifters, adders and multiplexers. This is heavily advantageous for multipliers with large input width's to result in less power consumption as a direct multiplier is a heavy compute element. 

![Shift and Add Multiplier](images/n_squared_counter_shift_and_add.png)

3. N squared counter using previous N square: We know that (n+1)^2 is n^2 + 2n + 1. If we remember the state of the present count squared (n^2) and present count n, we can calculate the next count square. This style of counter will remove the heavily compute multiplier however now has to remember the state of both previous count as well as previous count squared to calculate the current N squared. So, a total of countwidth #registers to remember count as well as 2x countwidth #regsiters to also remember the previous N square are required. 

However, at the cost of this additional hardware to store previous n square, now the circuit can run at very high frequencies, since the delay of large countwidth bit input multiplier is replaced by a single left shift and an adder. 

![Count square using previous count square](images/n_squared_counter_using_previous_n_square.png)

