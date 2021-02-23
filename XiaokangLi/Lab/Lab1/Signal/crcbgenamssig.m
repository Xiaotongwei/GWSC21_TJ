function sigVec = crcbgenamsig(dataX,snr,f0,f1,phi)
    % Generate a amplitude modulated signal
    % S=CRCBGENSFMSIG(X,SNR,F0,F1,PHI)

    %Xiaokang Li, Feb 2021

    phaseVec = 2*pi*f0*dataX + phi ;
    sigVec = sin(phaseVec)*cos(2*pi*f1*dataX);
    sigVec = snr*sigVec/norm(sigVec);