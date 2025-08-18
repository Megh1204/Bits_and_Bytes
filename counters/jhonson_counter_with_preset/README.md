This is an example of a Jhonson counter with synchronous and actice low preset signal that sets the initial jhsonson value to any desired load count.

The advantage of this style of Jhonson counter is that we need not have just 4'b0000 as the initial state when the system is reset. 

Primary Ports for the Jhonson:

--> Clock

--> Clear : Asynchronous reset and negedge signal. 

--> Preset : Synchronous and active low signal. 

--> Load count : Initialize count value when !preset. 

--> count[3:0] : Output 4-bit count value
