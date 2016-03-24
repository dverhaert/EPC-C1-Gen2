# EPC-C1-Gen2
Code which can recognize the data of a EPC C1 Gen2 signal.

The code works by recognizing when the measured signal is high and low, and depending how long that is the signal either represents a 1 or a 0. The signal consists of 4 steps where the Reader (R) communicates with the Tag (T) in the following manner: R=>T, T=>R, R=>T, T=>R. 

The R=>T communications are fully decoded and supported. One should enter the start time and stop time of these communications (where the code starts, switches to T=>R or ends). The code is able to recognize the preamble (or frame-sync) and consequently recognize the type of command and the data bits. 

For the T=>R communications one should enter the point where the data bits start (after the preamble) as a start time and the part where the code switches to R=>T or ends as the end time. This will cause the code to convert this analog signals to digital numbers and print them to an array.

Code constructed by Koos Eerden and Danilo Verhaert.
