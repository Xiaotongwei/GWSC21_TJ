function [h_cross]=h_cross(B,f0,phi0,t)
h_cross=B*sin(2*pi*f0*t+phi0);
end
