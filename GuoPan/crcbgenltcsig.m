function sigVec = crcbgenltcsig(timeVec,snr,timeOfArrival,f0,f1,fs,phi0,sigLen)
% Generate a linear transient chirp signal
% S = CRCBGENQSIG(SNR,timeOfArrival,f0,f1,phi0,sigLen)
% Generates a linear transient chirp signal S.
% timeVec is the vector of time stamps at which the samples of the signal
% are to be computed.
% SNR is the matched filtering signal-to-noise ratio of S 
% timeOfArrival is the time of the signal arrival in seconds.
% fs is the Sampling frequency.
% f0 is the main frequency of the signal and f1 is the linear parameter 
% two coefficients [f0, f1] that parametrize the phase of the signal:
% phase=f0*(t-timeOfArrival)+f1*(t-timeOfArrival£©^2. 
% phi0 is the initial Phase.
% S = snr*sin(2*pi*phase+phi0)
% t is between [timeOfArrival,timeOfArrival+sigLen]

%GuoPan, Feb 2021
%%
% Find the samples where the signal should start and end. Store the
% corresponding time samples.
startSample = floor(timeOfArrival*fs);
endSample = floor((timeOfArrival+sigLen)*fs);
sigTimeVec = timeVec(startSample:endSample);

%First allocate an empty array that is as long as the data. Then load the
%signal between start and end samples corresponding to the time of arrival
%and the end of the signal.
nSamples = length(timeVec);
sigVec = zeros(1,nSamples);
sigVec(startSample:endSample) = sin(2*pi*(f0*(sigTimeVec-timeOfArrival)+...
                   f1*(sigTimeVec-timeOfArrival).^2)+...
                   phi0);
%%
% Normalize the signal and multiply with the amplitude parameter.
sigVec = snr*sigVec/norm(sigVec);
