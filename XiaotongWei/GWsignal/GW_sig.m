%% gen the GW signal
% Signal parameters

%Xiaotong Wei, Feb 2021
function sigVec = GW_sig(timeVec,theta,phi,psi)
f0=20;
phi0=0;  phi1=1;
A0  =2;  A1  =1;
x_=[1,0,0]; y_=[0,1,0];z_=[0,0,1];

% Generate the signal
hplus = sin_sig(timeVec,f0,A0,phi0);
hcros = sin_sig(timeVec,f0,A1,phi1);

%Detectro tensor
detTensor = 0.5*(x_'*x_ - y_'*y_);

% vec2Src
vec2Src=[sin(theta).*cos(phi),sin(theta).*sin(phi),cos(phi)];

xVec = vcrossprod(z_,vec2Src);
yVec = vcrossprod(xVec,vec2Src);

xVec = xVec/norm(xVec);
yVec = yVec/norm(yVec);

%wave tensor
eplus=xVec'*xVec - yVec'*yVec;
ecros=xVec'*yVec + yVec'*xVec;

%contraction
dplus =sum(eplus(:).*detTensor(:));
dcros =sum(ecros(:).*detTensor(:));

sigVec = hplus*dplus + hcros*dcros;