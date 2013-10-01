n = 10;
mu1 = 22;
sigma1 = 6;
m = 31;
mu2 = 16;
sigma2 = 2;
% Simulera data
%x = normrnd(mu1,sigma1,n,1);
%y = normrnd(mu2,sigma2,m,1);

[H1,P1,CI1,STATS1] = ttest2(x,y,0.05,'both','unequal')
[H2,P2,CI2,STATS2] = vartest2(x,y, 0.05,'both')