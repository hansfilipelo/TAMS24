n = 80;
p = 0.3;
x = binornd(n,p,1000,1);

phat = x/n;

lower_lim = phat - 1.96*sqrt(phat.*(1-phat)/n);
upper_lim = phat + 1.96*sqrt(phat.*(1-phat)/n);

missar = sum(lower_lim > p) + sum(upper_lim < p)

% Variance
var = n*p*(1-p)
