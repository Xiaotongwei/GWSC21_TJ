function [fPlus,fCross]=fpfc(Theta,Phi,Psi)
%Antenna pattern functions in detector local frame (arms at 90 degrees)
%[Fp,Fc]=FPFC(Theta,Phi,Psi)
%Returns the antenna pattern function values Fp, Fc (corresponding to F_+
%and F_x respectively) for a given sky location in the local frame of a 
%90 degree equal arm length interferometer. The X and Y axes of the frame
%point along the arms. Theta is the polar angle (0 radians on the Z axis) 
%and Phi is the azimuthal angle (0 radians on the X axis). 
%Psi is the   polarization angle 

%GuoPan, Feb 2021


%Obtain the components of the unit vector pointing to the source location
nvec = [sin(Theta)*cos(Phi),sin(Theta)*sin(Phi),cos(Theta)];
       
%Get the wave frame vector components (for multiple sky locations if needed)
n_xVec = [1,0,0];
n_yVec = [0,1,0];
Z = [0,0,1];
xVec = vcrossprod(Z,nvec);
yVec = vcrossprod(xVec,nvec);
%Normalize wave frame vectors
xVec = xVec/norm(xVec);
yVec = yVec/norm(yVec);
%calculate ecross and eplus
ePlus = xVec'*xVec-yVec'*yVec;
eCross = xVec'*yVec+yVec'*xVec;
%Detector tensor of a perpendicular arm interferometer 
detTensor = 1/2*(n_xVec'*n_xVec-n_yVec'*n_yVec);

%calculate fplus and fcross vectors
dPlus = sum(ePlus(:).*detTensor(:));
dCross = sum(eCross(:).*detTensor(:));
fPlus = 1/2*(cos(2*Psi)*dPlus-sin(2*Psi)*dCross);
fCross = 1/2*(sin(2*Psi)*dPlus+cos(2*Psi)*dCross);

end