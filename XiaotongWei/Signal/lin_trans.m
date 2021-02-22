function sigVec = lin_trans(dataX,ta,f0,f1,snr,phi0,L0)
% Generate a Linear transient chirp signal
% S = LIN_TRANS(X,ta,f0,f1,SNR,phi0,L0)
% Generates a sinusoidal signal S. X is the vector of
% time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S 
%f0 and f1 are the frequency 
%phi0 is a initial phase
%ta and L0 are some settings  

%Xiaotong Wei, Fre 2021

phaseVec =  phi0;
sigVec = sin(2*pi*(f0*(dataX-ta)+f1*(dataX-ta).*(dataX-ta))+phi0).*(dataX>=ta & dataX<=ta+L0);
sigVec = snr*sigVec/norm(sigVec);

