BINARY to GRAY

Uses/Advantages of Gray code over Binary code: 
1. Two successive values in a Gray code only differ by 1 minimizing bit transitions or the number of bits toggling. 
2. This reduces Switching Power and thus Dynamic Power Dissipation. (This is crucial for Low Power requirements).


Disadvantages of Gray code over Binary code: 
1. Converting from Binary to Gray code requires additional circuitry which can increase the complexity of the design.
2. Gray code is not well suited for arithmetic operations as it requires conversion to binary for calculations.


Industry Applications of Gray code: 
1. Counters
2. Rotary Encoders
3. Positional Encoders
4. Error Correction Codes


This Gray code can also be derived for K-map.

|  0  |  1  |  3  |  2  |

|  4  |  5  |  7  |  6  |

|  C  |  D  |  F  |  E  | 

|  8  |  9  |  B  |  A  | 

This is the positional encoding of a K-map with respect to binary digits 
Go from left to right on first line,
and then from right to left on the second line, 
and then from left to right on the third line, 
and so on in a snake pattern.

Following the snake pattern observed above: 
gray   --> 0-1-3-2-6-7-5-4-c-d-f-e-a-b-9-8
binary --> 0-1-2-3-4-5-6-7-8-9-a-b-c-d-e-f
