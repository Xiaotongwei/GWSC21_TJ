function sigVec = am_mo(frequency,dataX,snr,iniphase)
% Generate a amplitude modulated signal
% S = AM_MO(F,X,SNR,C)
% Generates a amplitude modulated signal S. SNR is the amplitude of the signal.
% X is the vector of time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S and C is the inital phase of the sine:
% F is the frequency [f0,f1] of the signal
% glli, 02/22/2021
sigVec = sin(frequency(1)*dataX+iniphase).*cos(2*pi*frequency(2)*dataX);
sigVec = snr*sigVec/norm(sigVec);