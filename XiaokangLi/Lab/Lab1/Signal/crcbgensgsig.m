function sigVec = crcbgensgsig(dataX,t0,sigma,snr,f0,phi)
    % Generate a Sine-Gaussian signal
    % S=CRCBGENSGSIG(X,T0,SIGMA,SNR,F0,PHI)

    %Xiaokang Li, Feb 2021

    phaseVec = 2*pi*f0*dataX + phi ;
    sigVec = exp(-(dataX-t0).^2/(2*sigma^2))*sin(phaseVec);
    sigVec = snr*sigVec/norm(sigVec);