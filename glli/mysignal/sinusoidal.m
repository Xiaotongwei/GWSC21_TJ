function sigVec = sinusoidal(f0,dataX,snr,iniphase)
% Generate a sinusoidal signal
% S = SINUSOIDAL(X,SNR,C)
% Generates a sinusoidal signal S. SNR is the amplitude of the signal
% X is the vector of time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S and C is initial phase
% of the signal:
% glli, 02/22/2021

sigVec = sin(2*pi*f0.*dataX+iniphase);
sigVec = snr*sigVec/norm(sigVec);
