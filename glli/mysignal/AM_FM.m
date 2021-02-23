function sigVec = AM_FM(frequency,dataX,snr,b)
% Generate a amplitude and frequency modulated signal
% S = AM_MO(F,X,SNR,B)
% Generates a amplitude modulated signal S. SNR is the amplitude of the signal.
% X is the vector of time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S and B is the coefficient of the cosin pulse:
% F is the frequency [f0,f1] of the signal
% glli, 02/22/2021
sigVec = sin(2*pi*frequency(1)*dataX+b*cos(2*pi*frequency(2)*dataX)).*cos(2*pi*frequency(2)*dataX);
sigVec = snr*sigVec/norm(sigVec);