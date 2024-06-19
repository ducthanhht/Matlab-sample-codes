
mainfold = '/Desktop/Github/Sample codes/Matlab';

% addpath(fullfile(mainfold,'Functions'));
% addpath(fullfile(mainfold,'Outputs','Outcomes'));

cd(fullfile(mainfold))

clear RES
for bs = 0:100
    OUT = load(sprintf('OUT_%d.mat',bs),'Table_RFvic');
    RES(bs+1) = OUT.Table_RFvic;
end

Outcomecorfvic1 = tablelatex({RES.Outcomerfvic},[],'%0.3f',false,false);
Outcomecorfvic2= tablelatex({RES.Outcomerfvic},[],'%0.3f',true,true);
tablelatex({[Outcomecorfvic2(1:13,:); Outcomecorfvic1(14,:)]},'OutcomeCoefficientsrfvic.tex',[],false,false);
