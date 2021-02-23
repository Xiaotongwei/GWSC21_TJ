function sigVec = fre_mo(frequency,dataX,snr,b)
% Generate a frequency modulated signal
% S = FRE_MO(F,X,SNR,B)
% Generates a linear_chirp signal S. SNR is the amplitude of the signal.
% X is the vector of time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S and B is a coefficient of the cosin pulse:
% F is the frequency [f0,f1] of the signal
% glli, 02/22/2021
sigVec = sin(2*pi*frequency(1)*dataX+b*cos(2*pi*frequency(2)*dataX));
sigVec = snr*sigVec/norm(sigVec);