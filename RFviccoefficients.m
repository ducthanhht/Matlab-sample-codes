function OUTPUT = RFviccoefficients(est)

nf = 2;
load('Young Lives.mat','bullyxinfo')

load('Young Lives.mat','outcomeinfo', 'rfvicxinfo')

outcomesumrfvic = cell(1,numel(outcomeinfo));

for j = 1:numel(outcomeinfo)
outcomecoefrfvic = num2cell(est.outcomecoefrfvic(:,j));

Noob = est.noobrfvic(:,j);
Noob = num2cell(Noob);

outcomenamej = {outcomeinfo(j).outcomename};   
    outcomesumrfvic{j} = [outcomenamej; outcomecoefrfvic; Noob];
    
    clear outcomenamej outcomecoefrfall Noob

end    
  
Vnames = {' ', 'intercept',rfvicxinfo.rfnamevic, 'No. of obs.'};
Vnames = Vnames';

outcomesumrfvic = [Vnames horzcat(outcomesumrfvic{:})];

clear Vnames  

OUTPUT = struct();
OUTPUT.Outcomerfvic = outcomesumrfvic;