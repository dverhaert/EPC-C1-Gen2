# EPC-C1-Gen2
Code which can recognize the data of a EPC C1 Gen2 signal.

The code works by recognizing when the measured signal is high and low, and depending how long that is the signal either represents a 1 or a 0. The signal consists of 4 steps where the Reader (R) communicates with the Tag (T) in the following manner: R=>T, T=>R, R=>T, T=>R. 

Code constructed by Koos Eerden and Danilo Verhaert.
