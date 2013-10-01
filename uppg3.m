
% Uppgift 3: J�mf�relse av volatilitet

kurs_NASD = [-0.1053 0.0667 -0.0714 -0.0294 0.0423 -0.0169 -0.0182 -0.1092 0.0192 -0.0707 -0.0396 -0.0381 0.0459 0.0038...
    0.0156 -0.0541 0.0078 -0.0398 0.1176 0.0057 -0.0323 0.0476 0.1224 -0.0390 -0.0563 -0.0139 0.0172 -0.0423 -0.0221 -0.0081]';

kurs_NYSE = [-0.0246 -0.0212 0.0789 -0.0250 -0.0208 -0.0299 0.0060 -0.0290 0.0435 0.0891 -0.0102 0.0266 -0.0490 -0.0100...
    0.0566 0.0632 0.0098 -0.0270 -0.0252 0.0230 -0.0588 -0.0112 0.0484 -0.0178 0.0250 -0.0185 0.0062 0.0057 0.0112 0.0026]';

x = abs(kurs_NASD);
y = abs(kurs_NYSE);

%Ta fram beskrivande statistik för x och y genom att använda normfit och histfit.
[muhatX sX] = normfit(x)
figure
subplot(1,2,1); histfit(x); title('NASD')
[muhatY sY] = normfit(y)
subplot(1,2,2); histfit(y); title('NYSE')

% Transformera shits'n stuff
u = log(x + 0.01);
v = log(y + 0.01);

figure
subplot(1,2,1); histfit(u); title('log-NASD')
subplot(1,2,2); histfit(v); title('log-NYSE')
[muhatU,sU,muU_CI,sigmaU_CI] = normfit(u)
[muhatV,sV,muV_CI,sigmaV_CI] = normfit(v)
alpha=0.05;
[H,P,CI]=ttest2(u,v,0.05,'right')
s1=std(x)
s2=std(y)
e1=mean(x)
e2=mean(y)