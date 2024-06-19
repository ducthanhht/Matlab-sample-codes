function OUTPUT = RFallcoefficients(est)

load('Young Lives.mat','outcomeinfo', 'rfallxinfo')

outcomesumrfall = cell(1,numel(outcomeinfo));

for j = 1:numel(outcomeinfo)
outcomecoefrfall = num2cell(est.outcomecoefrfall(:,j));

Noob = est.noobrfall(:,j);
Noob = num2cell(Noob);

outcomenamej = {outcomeinfo(j).outcomename};   
    outcomesumrfall{j} = [outcomenamej; outcomecoefrfall; Noob];

    clear outcomenamej outcomecoefrfall Noob

end    
  
Vnames = {' ', 'intercept',rfallxinfo.rfnameall, 'No. of obs.'};
Vnames = Vnames';

outcomesumrfall = [Vnames horzcat(outcomesumrfall{:})];

clear Vnames  

OUTPUT = struct();
OUTPUT.Outcomerfall = outcomesumrfall;