A carry look ahead adder is an adder that has faster performance when compared to a ripple carry adder. 

Unlike Ripple carry adder, that waits for the previous bit's addition's carry to propagate to add to the current bits, at the cost of introducing additional complex hardware, we can compute the result faster. Although, its not likely that all the bits in the Carry Look Ahead Adder will propagate, the tpd of the carry look ahead adder occurs when all the carry has to propagate from LSB bit to the MSB bit of the output. Nevertheless, in all other cases where the carry is generated somewhere in the middle, the computation is faster than the ripple carry adder. 

PPA of CLA(Carry Look Ahead Adder) vs. RCA(Ripple Carry Adder):

--> Performance: Better than RCA. 

--> Power: Worse than RCA because we now have more complex hardware. More logic gates means more power. 

--> Area: Worse than RCA because we now have more hardware. More hardware requires more area.

Therefore, at the cost of worsening the power and area, we are doing performance efficient addition computation. 

