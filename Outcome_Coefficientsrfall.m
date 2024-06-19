
mainfold = '/Desktop/Github/Sample codes/Matlab';

% addpath(fullfile(mainfold,'Functions'));
% addpath(fullfile(mainfold,'Outputs'));

cd(fullfile(mainfold))

clear RES
for bs = 0:100
    OUT = load(sprintf('OUT_%d.mat',bs),'Table_RFall');
    RES(bs+1) = OUT.Table_RFall;
end


Outcomecorfall1 = tablelatex({RES.Outcomerfall},[],'%0.3f',false,false);
Outcomecorfall2= tablelatex({RES.Outcomerfall},[],'%0.3f',true,true);
tablelatex({[Outcomecorfall2(1:16,:); Outcomecorfall1(17,:)]},'OutcomeCoefficientsrfall.tex',[],false,false);


