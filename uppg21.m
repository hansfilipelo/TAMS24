% Uppgift 1: Enkel linjär regression, Old faithful Geyser
% close all, clear, clc;

x = [4.4 3.9 4.0 4.0 3.5 4.1 2.3 4.7 1.7 4.9 1.7 4.6 3.4 4.3 1.7 3.9 3.7 3.1 4.0 1.8 4.1 1.8 3.2 1.9 4.6 2.0 4.5 3.9 4.3 2.3 3.8...
    1.9 4.6 1.8 4.7 1.8 4.6 1.9 3.5 4.0 3.7 3.7 4.3 3.6 3.8 3.8 3.8 2.5 4.5 4.1 3.7 3.8 3.4 4.0 2.3 4.4 4.1 4.3 3.3 2.0 4.3 2.9 4.6...
    1.9 3.6 3.7 3.7 1.8 4.6 3.5 4.0 3.7 1.7 4.6 1.7 4.0 1.8 4.4 1.9 4.6 2.9 3.5 2.0 4.3 1.8 4.1 1.8 4.7 4.2 3.9 4.3 1.8 4.5 2.0 4.2...
    4.4 4.1 4.1 4.0 4.1 2.7 4.6 1.9 4.5 2.0 4.8 4.1]'; % längd senaste utbrott

y = [78 74 68 76 80 84 50 93 55 76 58 74 75 80 56 80 69 57 90 42 91 51 79 53 82 51 76 82 84 53 86 51 85 45 88 51 80 49 82 75 73 67 ...
    68 86 72 75 75 66 84 70 79 60 86 71 67 81 76 83 76 55 73 56 83 57 71 72 77 55 75 73 70 83 50 95 51 82 54 83 51 80 78 81 53 89 ...
    44 78 61 73 75 73 76 55 86 48 77 73 70 88 75 83 61 78 61 81 51 80 79]';% tid till nästa utbrott

plot(x)
hold on 
plot(y)

stats = regstats(y,x,'linear','all');
betahat = stats.tstat.beta
se = stats.tstat.se
t = stats.tstat.t
s2 = stats.mse
fstat = stats.fstat

figure
plot(x,y,'*')
xlabel('x'), ylabel('y')
lsline % ls = least square, dvs. minsta-kvadrat anpassning

residualer = stats.r;
figure
scatter(x,residualer,'filled')
title('Residualer')
figure
hist(residualer)
title('Histogram för residualer')
figure
normplot(residualer)

XtXinv = stats.covb/stats.mse

upper = [1 4]*betahat+sqrt(1+[1 4]*XtXinv*[1;4])*sqrt(s2)
lower = [1 4]*betahat-sqrt(1+[1 4]*XtXinv*[1;4])*sqrt(s2)