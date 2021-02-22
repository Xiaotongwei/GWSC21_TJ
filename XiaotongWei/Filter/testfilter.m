%% Test the filtering signal
% Signal parameters
f0=100;
f1=200;
f2=300;
phi0=0;
phi1=pi/6;
phi2=pi/4;
A0 = 10;
A1 = 5;
A2 = 2.5;

%Frequency is 1024Hz
samplFreq = 1024;
samplIntrvl = 1/samplFreq;

% Time samples 2048
timeVec = 0:samplIntrvl:2.0;
% Number of samples
nSamples = length(timeVec);

% Generate the signal
sigVec0 = sin_sig(timeVec,f0,A0,phi0);
sigVec1 = sin_sig(timeVec,f1,A1,phi1);
sigVec2 = sin_sig(timeVec,f2,A2,phi2);

sigVec = sigVec0+sigVec1+sigVec2;
%Plot the signal 
figure;
subplot(2,2,1);
plot(timeVec,sigVec0,'Marker','.','MarkerSize',10);
subplot(2,2,2);
plot(timeVec,sigVec1,'Marker','.','MarkerSize',10);
subplot(2,2,3);
plot(timeVec,sigVec2,'Marker','.','MarkerSize',10);
subplot(2,2,4);
plot(timeVec,sigVec, 'Marker','.','MarkerSize',10);

%Design low pass filter
filtOrdr = 30;
freq0=300;
freq2=500;
b0 = fir1(filtOrdr,(freq0/2)/(samplFreq/2),'low');
b1 = fir1(filtOrdr,[(freq0/2)/(samplFreq/2),(freq2/2)/(samplFreq/2)]);
b2 = fir1(filtOrdr,(freq2/2)/(samplFreq/2),'high');
%Apply filter
filtSig0 = fftfilt(b0,sigVec);
filtSig1 = fftfilt(b1,sigVec);
filtSig2 = fftfilt(b2,sigVec);

%Plots
figure
subplot(3,1,1)
hold on
plot(timeVec,sigVec)
plot(timeVec,filtSig0)
subplot(3,1,2)
plot(timeVec,filtSig0)
subplot(3,1,3)
plot(timeVec,sigVec0)

figure
subplot(3,1,1)
hold on
plot(timeVec,sigVec)
plot(timeVec,filtSig1)
subplot(3,1,2)
plot(timeVec,filtSig1)
subplot(3,1,3)
plot(timeVec,sigVec1)

figure
subplot(3,1,1)
hold on
plot(timeVec,sigVec)
plot(timeVec,filtSig2)
subplot(3,1,2)
plot(timeVec,filtSig2)
subplot(3,1,3)
plot(timeVec,sigVec2)
%
%Plot the periodogram
%--------------
%%Length of data 
%dataLen = timeVec(end)-timeVec(1);
%%DFT sample corresponding to Nyquist frequency
%kNyq = floor(nSamples/2)+1;
%% Positive Fourier frequencies
%posFreq = (0:(kNyq-1))*(1/dataLen);
%% FFT of signal
%fftSig = fft(sigVec);
%% Discard negative frequencies
%fftSig = fftSig(1:kNyq);
%
%%Plot periodogram
%figure;
%plot(posFreq,abs(fftSig));
%
%%Plot a spectrogram
%%----------------
%winLen = 0.2;%sec
%ovrlp = 0.1;%sec
%%Convert to integer number of samples 
%winLenSmpls = floor(winLen*samplFreq);
%ovrlpSmpls = floor(ovrlp*samplFreq);
%[S,F,T]=spectrogram(sigVec,winLenSmpls,ovrlpSmpls,[],%samplFreq);
%figure;
%imagesc(T,F,abs(S)); axis xy;
%xlabel('Time (sec)');
%ylabel('Frequency (Hz)');
