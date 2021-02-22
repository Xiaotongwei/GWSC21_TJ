function sigVec = amp_mod(dataX,f0,f1,snr,phi0)
% Generate a Amplitude modulated signal
% S = AMP_MOD(X,f0,f1,SNR,pji0)
% Generates a sinusoidal signal S. X is the vector of
% time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S 
%f0 and f1 are the frequency 
%phi0 is a initial phase 

%Xiaotong Wei, Fre 2021

phaseVec = phi0;
sigVec = cos(2*pi*dataX*f1).*sin(f0*dataX + phi0);
sigVec = snr*sigVec/norm(sigVec);


