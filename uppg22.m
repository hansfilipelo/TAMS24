% Uppgift 2: Anv�ndning av dummy-variabler
% close all, clear, clc;

x1 = [6490 7244 7943 6478 3138 8747 2020 4090 3230 8786 1986 9653 9429 2782 8444 6316 2363 7915 6928 5526 3077 ...
    6600 2732 7014 8321 2422 9581 9326 6818 4831 9630 2905 6308 1908 8542 4750 6056 7052 7794 1701]';

x2 = [zeros(20,1); ones(20,1)];

y = [121 169 172 116 53 177 31 94 72 171 23 177 178 65 146 129 40 167 115 123 44 73 8 90 71 37 111 89 72 35 86 40 44 36 78 47 56 75 46 6]';

figure
plot(x1(1:20),y(1:20),'b*')
hold on
plot(x1(21:40),y(21:40),'r*')

z1 = x1/1000;
z2 = z1.*x2;

disp('---------- Modell 1 ----------')
regr = regstats(y,[z1 x2],'linear','all');
betahat = regr.tstat.beta
fstat = regr.fstat
Qres1 = fstat.sse
dfe1 = fstat.dfe
s2 = regr.mse
R2 = regr.rsquare
residuals = regr.r;
figure; scatter(z1,residuals,'filled'); title('Modell 1: Residualer, x_1')
figure; scatter(x2,residuals,'filled'); title('Modell 1: Residualer, x_2')

XtXinv = regr.covb/regr.mse;

u=[1 6.6 1];

% Prediktionsintervall modell 1 f�r f�retag med s�kerhetsprogram och 6600 anst�llda
upper = u*betahat+2.02*sqrt(1+u*XtXinv*u')*sqrt(s2)
lower = u*betahat-2.02*sqrt(1+u*XtXinv*u')*sqrt(s2)


disp('---------- Modell 2 ----------')
tregr = regstats(y,[z1 z2],'linear','all');
tbetahat = tregr.tstat.beta
tfstat = tregr.fstat
tQres1 = tfstat.sse
tdfe1 = tfstat.dfe
ts2 = tregr.mse
tR2 = tregr.rsquare
tresiduals = tregr.r;
figure; scatter(z1,residuals,'filled'); title('Modell 2: Residualer, x_1')
figure; scatter(z2,residuals,'filled'); title('Modell 2: Residualer, x_2')


tXtXinv = tregr.covb/tregr.mse;

v=[1 6.6 6.6];

% Prediktionsintervall modell 2 f�r f�retag med s�kerhetsprogram och 6600 anst�llda
tupper = v*tbetahat+2.02*sqrt(1+v*tXtXinv*v')*sqrt(ts2)
tlower = v*tbetahat-2.02*sqrt(1+v*tXtXinv*v')*sqrt(ts2)

% Tar fram intervall f�r beta1 och beta2
% f�r att kunna skatta skillnaden i v�ntev�rde som �r beta2*z1
[B,BINT] = regress(y,[z1,z2])

% Eftersom beta2 med 95% s�kerhet �r negativt, ger det att s�kerhetsprogram
% minskar fr�nvaro fr�n arbete. 