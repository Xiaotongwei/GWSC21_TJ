function sigVec = crcbgenfmsig(dataX,snr,f0,b,f1)
    % Generate a Frequency modulated signal
    % S=CRCBGENSFMSIG(X,SNR,F0,B,F1)
    
    %Xiaokang Li, Feb 2021

    phaseVec = 2*pi*f0*dataX + b*cos(2*pi*f1*dataX);
    sigVec = sin(phaseVec);
    sigVec = snr*sigVec/norm(sigVec);