function sigVec = sin_sig(dataX,f0,snr,phi0)
% Generate a sinusoidal signal
% S = SIN_SIG(X,f0,SNR,phi0)
% Generates a sinusoidal signal S. X is the vector of
% time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S 
%f0 is the frequency 
%phi0 is the initial phase 

%Xiaotong Wei, Fre 2021

phaseVec = phi0;
sigVec = sin(2*pi*dataX*f0 + phaseVec);
sigVec = snr*sigVec/norm(sigVec);


