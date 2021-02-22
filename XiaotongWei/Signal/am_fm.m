function sigVec = am_fm(dataX,b,f0,f1,snr)
% Generate a AM-FM signal
% S = AM_PM(X,b,f0,f1,SNR)
% Generates a sinusoidal signal S. X is the vector of
% time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S 
%f0 and f1 are the frequency 
%b is a constant 

%Xiaotong Wei, Fre 2021


sigVec = cos(2*pi*dataX*f1).*sin(2*pi*f0*dataX + b*cos(2*pi*f1*dataX));
sigVec = snr*sigVec/norm(sigVec);


