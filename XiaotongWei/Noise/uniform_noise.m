% generate the uniform noise
function sigVec = uniform_noise(a,b,M)

rng('default')
x=rand(1,M);
sigVec=(a-b)*x+b;

