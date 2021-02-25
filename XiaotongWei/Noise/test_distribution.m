% plot the uniform distribution

a0=-2; b0=1;
number=10000;

a1=1.5; b1=2;

y=uniform_noise(a0,b0,number);
y1=normal_noise(a1,b1,number);

P=1/abs(a0-b0);

X = (a1-4*b1):(b1/100):(a1+4*b);
Y =1/sqrt(2*pi*b1^2)*exp(-(X-a1).^2/(2*b1^2));

hold on
plot([a0,b0],[P,P],'--','LineWidth',2);
histogram(y,'normalization','pdf');

figure
hold on
plot(X,Y,'--','LineWidth',2);
histogram(y1,'normalization','pdf');