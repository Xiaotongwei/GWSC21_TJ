function sigVec = Lin_chirp(dataX,f0,f1,snr,phi0)
% Generate a linear chirp signal
% S = LIN_CHIRP(X,f0,f1,SNR,phi0)
% Generates a linear chirp signal S. X is the vector of
% time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S 
%f0 and f1 are the frequency 
%phi0 is the initial phase 

%Xiaotong Wei, Fre 2021

phaseVec = phi0;
sigVec = sin(2*pi*(dataX*f0+f1*dataX.*dataX) + phaseVec);
sigVec = snr*sigVec/norm(sigVec);


