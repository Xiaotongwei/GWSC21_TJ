%% Plot the step fm sinusoid
% Signal parameters
ta=0.5;
f0=10;
f1=20;
A = 2;
%Frequency is constant
maxFreq = f1;
samplFreq = 5*maxFreq;
samplIntrvl = 1/samplFreq;

samplFreq2 = 0.5*maxFreq;
samplIntrvl2 = 1/samplFreq2;

% Time samples
timeVec = 0:samplIntrvl:6.0;
timeVec2 = 0:samplIntrvl2:6.0;
% Number of samples
nSamples = length(timeVec);

% Generate the signal
sigVec = step_fm(timeVec,ta,f0,f1,A);
sigVec2 = step_fm(timeVec2,ta,f0,f1,A);

%Plot the signal 
figure;
subplot(2,1,1);
plot(timeVec,sigVec,'Marker','.','MarkerSize',24);
subplot(2,1,2);
plot(timeVec2,sigVec2,'Marker','.','MarkerSize',24);

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
winLen = 0.5;%sec
ovrlp = 0.4;%sec
%Convert to integer number of samples 
winLenSmpls = floor(winLen*samplFreq);
ovrlpSmpls = floor(ovrlp*samplFreq);
[S,F,T]=spectrogram(sigVec,winLenSmpls,ovrlpSmpls,[],samplFreq);
figure;
imagesc(T,F,abs(S)); axis xy;
xlabel('Time (sec)');
ylabel('Frequency (Hz)');
