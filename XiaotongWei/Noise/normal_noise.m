% generate the normal noise
function sigVec = normal_noise(mu,sigma,number)

rng('default')
x=randn(1,number);
sigVec=mu+x*sigma;

