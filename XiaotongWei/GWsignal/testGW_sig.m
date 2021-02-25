%% plot the GW signal

nSamples=4096;
samplFreq=1024;
samplIntrvl = 1.0/samplFreq;

% Time samples
timeVec  = 0:samplIntrvl:4.0;

% Generate the signal
theta = pi/3;
phi = pi/4;
psi = 0;

sigVec = GW_sig(timeVec,theta,phi,psi);

plot(timeVec,sigVec)
