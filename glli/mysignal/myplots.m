clear 
dt=0.1;
dataX=[-125:125]*dt;
snr=1;
iniphase=0.02*pi;
frequency=0.2;
sigma=0.13;
sigVec = Sine_Gaussian(frequency,sigma,dataX,snr,iniphase);
figure;
plot(dataX,abs(sigVec));
frequency=[0.2 0.5];
ta=3;
L=4;
b=13.5;
sigVec = linear_tran_chirp(frequency,dataX,ta,L,snr,b);
figure
plot(dataX,sigVec)
iniphase=b;
sigVec = am_mo(frequency,dataX,snr,iniphase)
figure
plot(dataX,sigVec)

sigVec = linear_chirp(frequency,dataX,snr,iniphase)
figure
plot(dataX,sigVec)
f0=0.34
sigVec = sinusoidal(f0,dataX,snr,iniphase)
figure
plot(dataX,sigVec)

 sigVec = AM_FM(frequency,dataX,snr,b);
 figure
plot(dataX,sigVec)
sigVec = fre_mo(frequency,dataX,snr,b)
figure
plot(dataX,sigVec)
qcCoefs=[1;2;3];
sigVec = crcbgenqcsig(dataX,snr,qcCoefs);
figure
plot(dataX,sigVec)