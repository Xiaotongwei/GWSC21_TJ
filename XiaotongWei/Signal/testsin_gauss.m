%% Plot the sine-gaussian signal
% Signal parameters
f0=10;
sigma0=1;
t0=0.5;
phi0=1;
A = 2;
%Frequency is 10
maxFreq = f0;
samplFreq = 5*maxFreq;
samplIntrvl = 1/samplFreq;

samplFreq2 = 0.5*maxFreq;
samplIntrvl2 = 1/samplFreq2;

% Time samples
timeVec = 0:samplIntrvl:3.0;
timeVec2 = 0:samplIntrvl2:3.0;
% Number of samples
nSamples = length(timeVec);

% Generate the signal
sigVec = sin_gauss(timeVec,t0,f0,sigma0,A,phi0);
sigVec2 = sin_gauss(timeVec2,t0,f0,sigma0,A,phi0);

%Plot the signal 
figure;
subplot(2,1,1);
plot(timeVec,sigVec,'Marker','.','MarkerSize',24);
subplot(2,1,2);
plot(timeVec2,sigVec2,'Marker','.','MarkerSize',24);
%
%Plot the periodogram
%--------------
%Length of data 
dataLen = timeVec(end)-timeVec(1);
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

%Plot a spectrogram
%----------------
winLen = 0.3;%sec
ovrlp = 0.15;%sec
%Convert to integer number of samples 
winLenSmpls = floor(winLen*samplFreq);
ovrlpSmpls = floor(ovrlp*samplFreq);
[S,F,T]=spectrogram(sigVec,winLenSmpls,ovrlpSmpls,[],samplFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');
