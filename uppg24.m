% Uppgift 4: Stegvis regression enligt framåtvalsprincipen
% close all, clear, clc;
clear;
clc;

X = [7337  3000  3.6  12.96  64;
    4204  2300  1.2   1.44  69;
    5574  3300  1.3   1.69  72;
    5924  2100  3.2  10.24  71;
    5182  3900  1.1   1.21  40;
    5932  3100  2.0   4.00  74;
    5966  3600  1.6   2.56  69;
    5574  2900  2.5   6.25  85;
    4927  2000  2.6   6.76  70;
    5025  3500  1.3   1.69  74;
    6210  3100  2.3   5.29  79;
    5425  3200  1.5   2.25  75;
    4178  2800  1.3   1.69  62;
    7048  3300  3.3  10.89  62;
    7540  3000  3.9  15.21  70;
    5807  3400  2.4   5.76  81;
    4875  2800  1.7   2.89  77;
    5540  2000  3.4  11.56  67;
    5980  2400  2.9   8.41  68;
    7324  3600  2.9   8.41  84;
    4582  2400  1.9   3.61  75;
    6759  3000  2.8   7.84  63;
    6444  2200  3.6  12.96  78;
    6307  3600  2.4   5.76  73;
    4285  2900  1.1   1.21  85;
    7722  3000  4.4  19.36  69;
    4917  3100  1.8   3.24  54;
    5068  2200  2.1   4.41  75;
    6500  2500  3.9  15.21  61;
    4612  2900  1.1   1.21  74];

x1 = X(:,1);
x2 = X(:,2);
x3 = X(:,3);
x4 = X(:,4);
x5 = X(:,5);

y = [550 461 501 455 503 529 478 562 417 566 494 515 490 537 527 577 490 486 450 674 454 523 469 628 570 564 444 494 479 477]';

s1=std(x1);
s2=std(x2);
s3=std(x3);
s4=std(x4);
s5=std(x5);

disp('---------- Modell 1 ----------')
regr = regstats(y,[x2,x5,x4],'linear','all');
betahat = regr.tstat.beta
se = regr.tstat.se
fstat = regr.fstat
Qres1 = fstat.sse
dfe1 = fstat.dfe
s2 = regr.mse
R2 = regr.rsquare
t = regr.tstat.t
residuals = regr.r;

c1=corrcoef(x1,y)
c2=corrcoef(x2,y)

XtXinv = regr.covb/regr.mse;

disp('---------- Modell 2 ----------')
regr1 = regstats(y,[x1 x2 x3 x4 x5],'linear','all')
fstat = regr1.fstat
Qres2 = fstat.sse
t1 = regr1.tstat.t
betahat1 = regr1.tstat.beta
dfe2 = fstat.dfe


F=((Qres1-Qres2)/2)/(Qres2/(dfe2))
f=finv(0.975,2,24)
c3=corrcoef(x3,x4)

