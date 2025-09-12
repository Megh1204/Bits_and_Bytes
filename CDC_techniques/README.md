When data D is moving from a sender clock domain to a receiver clock domain that are asynchronous to each other, depending on the relationship between the two clocks, there could be different types of problems in transferring the data from the source clock to the destination clock. The solutions to those different problems would obviously be different too. 

In this folder: 

--> clk1 --> sender clock

--> clk2 --> receiver clock

--> d1 --> data synchronized with clk1 

--> d2 --> data synchronized with clk2

Faster to slower clock domain:

When data is going from a faster clock domain to a slower clock domain, its not just the fact that the data is traversing through an asynchronous interface, but also if the faster clock domain is very fast when compared to slower clock domain, its highly likely that we are going to loose data packets in between. Even if the ratio's of the two clocks are not that large, there will be some point where we will loose some data. So there must be some sort of storage element in between for storing the faster data coming in so that the slower clock can grab it at its earliest convenience. We will use an asynchronous FIFO for this purpose. 

Points to be noted for async fifo: 
The data cannot be continuous. If the faster clock domain is sending data at every rising edge of the clock, there is no way for the slower clock to receive all the data no matter even if it tries to capture data at every rising edge. Hence, the sender data cannot be continous. It must be in the form of bursts. Moreover, there must be a minimum burst-to-burst time to allow the slower clock to capture the remaining data in the FIFO before the next burst transaction arrives. Also, we can send multi-bit data using async fifo if we ensure burst data and min b2b time.  

Slower to Faster clock domain:

When data is going from a slower clock domain to a faster clock domain, since the faster clock domain captures data faster than the slower clock domain, we typically do not need any storage element to store the data. However due to the asynchronous interface, the positive edge of clk1 when data d1 changes at some point will fall within the violation window of clk2 (be it setup or hold) and will lead to metastability and might oscillate for an indefinite amount of time before reaching a stable state and also the stable state is unpredictable and can lead to either 0 or Vdd based on external noise. Hence, we will use a 2FF synchronizer in between to synchronize the data coming in from clk1 to clk2.

The basic idea is that even if the first flop fails to capture the data correctly, by the next event time when second flop tries to capture the data, the data will have stabilized by the next rising edge. However, if the data changed within the event time between data going from 1st flop in synchronizer to 2nd flop in synchronizer, we will not capture it correctly. In order to ensure this, the source data should remain stable for some minimum time, so that the setup and hold time requirements are met with respect to at least one active edge of destination clock.

Points to be noted for 2FF Synchronizer: 
The Mean Time Between Failures (MTBF) depends upon the sender clock frequency (how frequency the data changes in the sender clock domain, basically the activity factor of d1), the frequency of clk2(how frequently the positive edge of clk1 falls within the violation window of clk2(be it setup or hold). Ideal MTBF must be infinity which is not possible however we can improve the MTBF by increaing the number of stages in the synchronizer. i.e., we can use a 3FF synchronizer or 4FF synchronizer to exponentially increase the Mean Time Between Failures (MTBF). 

This style of synchronization is only suitable for single bit data transfers, however if there are multiple bits changing, and if we use a separate 2FF synchronizer for each data bit, due to them being different physical 2FF synchronizers, and even small clock skew can result in incoherency. i.e., for the data to change from 0111 --> 1000, it must go through 3 more transitions in between, 0111 --> 0110 --> 0100 --> 0000 --> 1000 and if I were to capture somewhere in between before all 4 transitions (4-bits toggling), I might end up capturing may be 0100 instead of 1000. However, we would not have a problem if the data is gray encoded. Nevertheless, it is important to ensure the data coherency for multi-bit toggling as well which results in the Req-Ack based Handshaking Protocol. 

Req-Ack based Handshaking: 

Whenever there is a new sender data d1(assuming multi-bit), the sender will assert a REQ signal, the REQ signal is synchronized with clk2(receiver) and thereby capturing multi-bit d1, once captured, the receiver will send an ACK synchronized to clk1 back to the sender. Only when the ACK is sent back will the REQ be allowed to deassert and the ACK will further deassert once it see's the REQ deassert. Also, the multi-bit data must not change during all these 4 cycles(2 clk2 cycles for req to be synchronized and 2 clk1 signals for which ack will be sent). Hence, the bandwidth of communication or the activity factor of the multibit data must be low). This is also called 4-phase handshaking where the data is expected to be stable throughout the 4 clock phases.   
