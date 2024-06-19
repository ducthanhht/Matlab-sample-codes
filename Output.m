
% Define a variable that contains the path to the main folder;
mainfold = '/Desktop/Github/Sample codes/Matlab';

% addpath(fullfile(mainfold,'Data'));
% addpath(fullfile(mainfold, 'Functions'));
% addpath(fullfile(mainfold,'Outputs'))

cd(fullfile(mainfold))

for bs = 0:100
load(sprintf('RF_%d.mat',bs), 'est')

Table_RFall = RFallcoefficients(est);
Table_RFvic = RFviccoefficients(est);

save(sprintf('OUT_%d.mat',bs),'Table_RFall', 'Table_RFvic');

end

