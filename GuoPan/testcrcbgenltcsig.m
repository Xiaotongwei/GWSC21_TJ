%% Plot the linear transient chirp signal
%%
% Number of samples in data, sampling frequency, and sampling times.
nSamples = 2048;%samples
fs = 1024;%Hz (Sampling frequency)
timeVec = (0:(nSamples-1))/fs;
%% 
%Length of data in seconds
dataLen = timeVec(end);

%% Parameters of the linear chirp signal.
f0 = 200;%Hz
f1 = 50; %Hz^2
sigLen = 0.5;%sec
phi0 = pi/3.3;%radians
snr = 10;
timeOfArrival = 0.2;%sec
%%
% Generate the signal
sigVec = crcbgenltcsig(timeVec,snr,timeOfArrival,f0,f1,fs,phi0,sigLen);
%%
%Plot the signal 
figure;
plot(timeVec,sigVec);
%%
%Plot the periodogram
%--------------
%DFT sample corresponding to Nyquist frequency
kNyq = floor(nSamples/2)+1;
% Positive Fourier frequencies
posFreq = (0:(kNyq-1))*(1/dataLen);
% FFT of signal
fftSig = fft(sigVec);
% Discard negative frequencies
fftSig = fftSig(1:kNyq);

%Plot periodogram
figure;
plot(posFreq,abs(fftSig));
xlabel('Frequency (Hz)'); ylabel('|FFT|');
%%
%Plot a spectrogram
%----------------
 %Time-frequency domain (spectrogram)
[S,F,T]= spectrogram(sigVec,32,31,[],fs);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)'); ylabel('Frequency (Hz)');
% winLen = 0.2;%sec
% ovrlp = 0.1;%sec
% %Convert to integer number of samples 
% winLenSmpls = floor(winLen*fs);
% ovrlpSmpls = floor(ovrlp*fs);
% [S,F,T]=spectrogram(sigVec,winLenSmpls,ovrlpSmpls,[],fs);
% figure;
% imagesc(T,F,abs(S)); axis xy;
% xlabel('Time (sec)');
% ylabel('Frequency (Hz)');
