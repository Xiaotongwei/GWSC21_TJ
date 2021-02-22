function sigVec = step_fm(dataX,ta,f0,f1,snr)
% Generate a Step FM signal
% S = step_fm(X,ta,f0,f1)
% Generates a sinusoidal signal S. X is the vector of
% time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S 
%f0 and f1 are the frequency 
%ta is settings  

%Xiaotong Wei, Fre 2021

sigVec = sin(2*pi*f0*dataX).*(dataX<=ta) + sin(2*pi*f1*(dataX-ta)+2*pi*f0*ta).*(dataX>ta);
sigVec = snr*sigVec/norm(sigVec);

