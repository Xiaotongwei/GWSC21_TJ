function sigVec = linear_chirp(frequency,dataX,snr,iniphase)
% Generate a linear_chirp signal
% S = LINEAR_CHIRP(F,X,SNR,C)
% Generates a linear_chirp signal S. SNR is the amplitude of the signal
% X is the vector of time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S and C is initial phase of the signal:
% F is the vector of two coefficients [f0,f1] that parametrize the frequency of the signal
% glli, 02/22/2021
fre=frequency(1).*dataX+frequency(2).*dataX.^2;
sigVec = sin(2*pi*fre+iniphase);
sigVec = snr*sigVec/norm(sigVec);
