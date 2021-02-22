%% Plot the linear chirp signal
% Signal parameters
f0=10;
f1=20;
phi0=1;

A = 2;
%Instantaneous frequency after 1 sec is
maxFreq = f0 + f1;
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
sigVec = Lin_chirp(timeVec,f0,f1,A,phi0);
sigVec2 = Lin_chirp(timeVec2,f0,f1,A,phi0);

%Plot the signal 
figure;
plot(timeVec,sigVec,'Marker','.','MarkerSize',24);
figure;
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
winLen = 0.4;%sec
ovrlp = 0.35;%sec
%Convert to integer number of samples 
winLenSmpls = floor(winLen*samplFreq);
ovrlpSmpls = floor(ovrlp*samplFreq);
[S,F,T]=spectrogram(sigVec,winLenSmpls,ovrlpSmpls,[],samplFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');
