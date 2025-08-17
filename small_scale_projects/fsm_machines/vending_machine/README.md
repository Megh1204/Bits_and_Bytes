Vending Machine Specifications: 

--> The vending machine has to release item after 15 cents are deposited. 

--> There is an input coin sensor to the vending machine that detects when either a dime or a nickel is deposited and inputs it into the vending machine fsm. 

--> No change is given back even if total deposit amount exceeds 15 cents.

--> Nickel - 5 cents and dime - 10 cents

Typical input sequences to release an item are 3 nickels, dime and nickel, nickel and dime, 2 dimes. 

Inputs to the module are N(nickel) , D(dime) and reset. Output to the module is an open chute to implement the release mechanism. 

Assumptions and Corner cases: Considered N=1 and D=1 are asserted for one cycle and see what would happen. Also each state has a self loop for N=D=0.

Our expectation is that at any given time the coin sensor should only detect a nickel or a dime, or it need not detect any coin in which case the state will remain same, but it should not detect both nickel and a dime at the same time instant. If in case that happens, I would consider that a invalid input or there is a glitch in the coin sensor which is causing such input pattern. But for some reason that happens, lets give priority to dime and advance 10 cents. 

Also, the inputs could be synchronous to the clock or asynchronous to the clock. Because in typical vending machines, the coin sensor only considers if the dime or nickel or any typical coin being deposited but in most use cases there might/might not be a notion of the clock inside the vending machine. 

