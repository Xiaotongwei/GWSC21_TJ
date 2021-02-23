%% Test harness for FORMULAFP and SKYPLOT
%Azimuthal angle
phiVec = 0:0.1:(2*pi);
%Polar angle
thetaVec = 0:0.1:pi;

%Function handle: F_plus from formula,F_crossfrom formula
fp = @(x,y) formulafp(x,y);
fc = @(x,y) formulafc(x,y);
figure;
skyplot(phiVec,thetaVec,fp);
axis equal;
figure;
skyplot(phiVec,thetaVec,fc);
axis equal;
