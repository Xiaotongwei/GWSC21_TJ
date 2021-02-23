function sigVec = Sine_Gaussian(frequency,sigma,dataX,snr,iniphase)
% Generate a Sine_Gaussian signal
% S = SINE_GAUSSIAN(F,D,X,SNR,C)
% Generates a linear_chirp signal S. SNR is the amplitude of the signal.
% D is the width of the pulse.
% X is the vector of time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S and C is initial phase of the signal:
% F is the frequency of the signal
% glli, 02/22/2021
fre=frequency*dataX;
pulse=exp(-(dataX-dataX(1)).^2/(2*sigma^2));
sigVec = sin(2*pi*fre+iniphase).*pulse;
sigVec = snr*sigVec/norm(sigVec);
