function[s]=signal(A,B,f0,phi0,Theta,Phi,Psi,tbar)
%generate strain signal

[fPlus,fCross]=fpfc(Theta,Phi,Psi);
s=h_plus(A,f0,tbar).*fPlus+h_cross(B,f0,phi0,tbar).*fCross;
%»­Í¼
figure(1);
plot(tbar,h_plus(A,f0,tbar));
hold on;
plot(tbar,h_cross(B,f0,phi0,tbar));
hold on;
plot(tbar,s);
hold off;
xlabel('t'); 

figure(2);
plot(tbar,s);
xlabel('t'); ylabel('signal');
end
