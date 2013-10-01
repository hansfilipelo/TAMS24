n=600; 

%kast = randi(6,n,1);
kast(101:115);

% Histogram
figure
hist(kast,[1:6])
ylabel('antal kast')
xlabel('antal ögon på tärningen')

% Stickprovsmedelvärde
medel = mean(kast)
% Stickprovsstandardavvikelse
stdev = std(kast)

% medel =
% 
%     3.4500
% 
% 
% stdev =
% 
%     1.7105

