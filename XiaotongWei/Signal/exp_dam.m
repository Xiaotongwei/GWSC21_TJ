function sigVec = lin_trans(dataX,ta,f0,tau0,snr,phi0,L0)
% Generate a Exponentially damped sinusoid signal
% S = LIN_TRANS(X,ta,f0,tau0,SNR,phi0,L0)
% Generates a sinusoidal signal S. X is the vector of
% time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S 
%f0 is the frequency 
%phi0 is a initial phase
%ta and L0 and tau0 are some settings  

%Xiaotong Wei, Fre 2021

phaseVec =  phi0;
sigVec = sin(2*pi*f0*dataX+phi0).*(dataX>=ta & dataX<=ta+L0);
sigVec = sigVec.*exp(-(dataX-ta)/tau0);
sigVec = snr*sigVec/norm(sigVec);

