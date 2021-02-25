function fcross = formulafc(phi,theta)
%F_+ for 90 degree arm interferometer in detector frame
%Fp = FORMULAFC(P,T)
%Calculate the F_+ antenna pattern function of an interferometer with
%perpendicular arms using source direction specified in the detectors local
%frame in which the X and Y axes are oriented along the arms of the
%detector. T and P are scalars containing values of the polar and azimuthal
%angles, respectively, in radians. The calculation of the antenna pattern
%uses the analytical formula.

%Soumya D. Mohanty, Feb 2021


fcross = cos(theta)*sin(2*phi);


