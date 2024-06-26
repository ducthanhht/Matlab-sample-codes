

mainfold = '/Desktop/Github/Sample codes/Matlab';
% addpath(fullfile(mainfold,'Data'))
% addpath(fullfile(mainfold, 'Main code')) 
% addpath(fullfile(mainfold,'Functions'))

cd(fullfile(mainfold))

load('Young Lives.mat')

%parpool(8)
for bs = 0:100
load(sprintf('OM_%d.mat',bs), 'est')
% load(sprintf('FM_%d',bs),'est')
D = bootsamp(DATA,bs);
    
outcomeY = vertcat(D.Outcomes);

%% ALl types of vicitmization as independent variables
Xall = vertcat(D.Xall);

%% Victim as a independent variable
Xvic = vertcat(D.Xvic);
        
%% ALl types of vicitmization as independent variables

for j = find(~isnan(est.outcomevar))
    Y = outcomeY(:,j);
    outcomenrfall = fitlm(Xall,Y);
    SSR = outcomenrfall.SSR;
    est.outcomevarrfall(j) = SSR/outcomenrfall.NumObservations;
    est.outcomecoefrfall(:,j) = outcomenrfall.Coefficients.Estimate;
    est.noobrfall(:,j) = outcomenrfall.NumObservations;
end   

for j = find(isnan(est.outcomevar))
    Y = outcomeY(:,j);
    outcomenrfall = fitglm(Xall,Y,'link','logit','Distribution','binomial');
    % SSR = outcomej.SSR;
    est.outcomevarrfall(j) = nan;
    est.outcomecoefrfall(:,j) = outcomenrfall.Coefficients.Estimate;
    est.noobrfall(:,j) = outcomenrfall.NumObservations;
end   

%% Victim as a independent variable

for j = find(~isnan(est.outcomevar))
    Y = outcomeY(:,j);
    outcomenrfvic = fitlm(Xvic,Y);
    SSR = outcomenrfvic.SSR;
    est.outcomevarrfvic(j) = SSR/outcomenrfvic.NumObservations;
    est.outcomecoefrfvic(:,j) = outcomenrfvic.Coefficients.Estimate;
    est.noobrfvic(:,j) = outcomenrfvic.NumObservations;
end   


for j = find(isnan(est.outcomevar))
    Y = outcomeY(:,j);
    outcomenrfvic = fitglm(Xvic,Y,'link','logit','Distribution','binomial');
    est.outcomevarrfvic(j) = nan;
    est.outcomecoefrfvic(:,j) = outcomenrfvic.Coefficients.Estimate;
    est.noobrfvic(:,j) = outcomenrfvic.NumObservations;
end  
   
save(sprintf('RF_%d.mat',bs), 'est')

end
