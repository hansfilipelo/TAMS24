% Uppgift 3: Bedömning av lineariteten och tranformation av data
% close all, clear, clc;

x = [4000 4000 4000 5000 5000 5000 6000 6000 6000 7000 7000 7000 8000 8000 8000 9000 9000 9000]';
y = [600 750 550 1850 2000 1750 2700 2650 2650 3650 3800 3600 4400 4550 4350 4900 4800 4850]';



plot(x)
hold on 
plot(y)
regr = regstats(y,x,'linear','all');

figure
plot(x,y,'*')
xlabel('x'), ylabel('y')
lsline % ls = least square, dvs. minsta-kvadrat anpassning

residualer = regr.r;
figure
scatter(x,residualer,'filled')

% Skattad standardavvikelse
sigmahat1 = sqrt(regr.mse)

% Skapa kvadratiska värden
x2 = x.^2;

% Regressionsanalys modell 2
regr2 = regstats(y,[x,x2],'linear','all');
betahat = regr2.tstat.beta
sigmahat2 = sqrt(regr2.mse)

% Plotta "andragradsmodell"
xx = [4000:10:12000]';
xx2 = xx.^2;
yy = [ones(length(xx),1) xx xx2]*betahat;
figure
scatter(x,y,'*')
hold on
plot(xx,yy)

% Residualplot för modell 2
residualer2 = regr2.r;
figure
scatter(x,residualer2,'filled')