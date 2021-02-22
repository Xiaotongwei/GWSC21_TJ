function sigVec = fre_mod(dataX,b,f0,f1,snr)
% Generate a Frequency modulated signal
% S = FRE_MOD(X,b,f0,f1,SNR)
% Generates a sinusoidal signal S. X is the vector of
% time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S 
%f0 and f1 are the frequency 
%b is a constant 

%Xiaotong Wei, Fre 2021

phaseVec = 0;
sigVec = sin(2*pi*dataX*f0 + b*cos(2*pi*f1*dataX));
sigVec = snr*sigVec/norm(sigVec);


