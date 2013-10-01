N = 100;
n = 20;
a = 100;
%X = a*rand(N,n); % där a är det värdet som du har valt

ahat1 = 2*mean(X,2);
ahat2 = ((n+1)/n)*max(X,[],2);

figure
plot(ahat1,'b*');
hold on
plot(ahat2,'ro');
legend('Skattning med moment-metoden','Korrigerad MLE-skattning','Location','NorthEastOutside')

% Stickprovsmedelvärde
mean1 = mean(ahat1)
mean2 = mean(ahat2)

% Stickprovsstandardavvikelse
stdev1 = std(ahat1)
stdev2 = std(ahat2)