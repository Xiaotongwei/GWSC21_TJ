%-----------------generate signal of LIGO-----------------
% Number of samples in data, sampling frequency, and sampling times.
nSamples = 2048;%samples
fs = 1024;%Hz (Sampling frequency)
timeVec = (0:(nSamples-1))/fs;
%% Parameters of the signal.
A = 1e-22;
B = 1/2*A;
f0 = 200;
phi0 = pi/2;
% Parameters of the source.
Theta = pi/6;
Phi = pi/3;
Psi = 0;% polarization angle
Sbar = signal(A,B,f0,phi0,Theta,Phi,Psi,timeVec);
