n=16;
N=1000;
mu0 = 5;
sigma = 1.2;
X = normrnd(mu0, sigma, N, n); % Simulera under H0

muhat0 = mean(X,2);
s = std(X,[],2);

u = (muhat0-5)./(s/sqrt(n));

t = tinv(0.975,n-1);

reject0 = sum(u<-t) + sum(u>t)

% b)
reject1 = sum(u<-t) + sum(u>t)

[gammahat, gammaCI] = binofit(reject1,N,0.05)

power = sampsizepwr('t',[5, sigma],6,[],n)