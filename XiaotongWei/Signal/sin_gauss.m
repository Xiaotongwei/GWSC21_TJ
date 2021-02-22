function sigVec = sin_gauss(dataX,t0,f0,sigma0,snr,phi0)
% Generate a sine-gaussian signal
% S = SIN_SIG(X,t0,f0,sigma0,SNR,phi0)
% Generates a sinusoidal signal S. X is the vector of
% time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S 
%t0 is the initial time
%f0 is the frequency 
%sigma0 is the standard deviation
%phi0 is the initial phase 

%Xiaotong Wei, Fre 2021

phaseVec = phi0;
expVec = -(dataX-t0).*(dataX-t0) / (2*sigma0.*sigma0);
sigVec = sin(2*pi*dataX*f0 + phaseVec);
sigVec = exp(expVec).*sigVec;
sigVec = snr*sigVec/norm(sigVec);


