function sigVec = signal_6(dataX,snr,qcCoefs)
% Generate a quadratic chirp signal
% S = CRCBGENQSIG(X,SNR,C)
% Generates a quadratic chirp signal S. X is the vector of
% time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S and C is the vector of
% three coefficients [a1, a2, a3] that parametrize the phase of the signal:
% a1*t+a2*t^2+a3*t^3.
%Soumya D. Mohanty, May 2018
phaseVec = 2*pi*qcCoefs(2)*dataX+qcCoefs(3)*cos(2*pi*qcCoefs(1)*dataX);
sigVec = cos(2*pi*qcCoefs(1)*dataX).*sin(phaseVec);
sigVec = snr.*sigVec./norm(sigVec);