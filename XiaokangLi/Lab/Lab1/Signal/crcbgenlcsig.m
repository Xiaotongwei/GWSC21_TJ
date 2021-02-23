function sigVec = crcbgenlcsig(dataX,snr,f0,f1,phi)
    % Generate a linear chirp signal
    % S=CRCBGENLCSIG(SNR,F0,F1,PHI)

    %Xiaokang Li, Feb 2021

    phaseVec = 2*pi*(f0*dataX + f1*dataX.^2)+ phi ;
    sigVec = sin(phaseVec);
    sigVec = snr*sigVec/norm(sigVec);