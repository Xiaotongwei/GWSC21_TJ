function sigVec = crcbgensinsig(dataX,snr,f0,phi)
    % Generate a sinusoidal signal
    % S=CRCBGENSINSIG(SNR,F,PHI)

    %Xiaokang Li, Feb 2021

    phaseVec = 2*pi*f0*dataX + phi ;
    sigVec = sin(phaseVec);
    sigVec = snr*sigVec/norm(sigVec);