function sigVec = linear_tran_chirp(frequency,dataX,ta,L,snr,b)
% Generate a linear transient chirp signal
% S = LINEAR_TRAN_CHIRP(F,X,TA,L,SNR,B)
% Generates a amplitude modulated signal S. SNR is the amplitude of the signal.
% X is the vector of time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S and B is the initial phase of the signal:
% F is the frequency [f0,f1] of the signal, TA is the cut off time and L
% is the length of the pulse.
% glli, 02/22/2021

sigVec = sin(2*pi*(frequency(1)*(dataX-ta)+frequency(2)*(dataX-ta).^2)+b).*(ta<dataX).*(dataX<(ta+L));
sigVec = snr*sigVec/norm(sigVec);