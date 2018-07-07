numData = xlsread('sam.xlsx');
THRESHOLD = 18;
hfaRaw= numData(2,4:57);
cfa= numData(3,4:57);
hfaBin = zeros (1,54);

for i = 1:54
if(hfaRaw(i)>= THRESHOLD)
   hfaBin(i) = 1; 
end
end

truePos = 0;
trueNeg = 0;
falsePos = 0;
falseNeg = 0;

for j= 1:54
    if((hfaBin(j)==1)&&(cfa(j)==1))
        truePos=truePos+1;
    elseif((hfaBin(j)==1)&&(cfa(j)==0))
        falseNeg = falseNeg+1;
    elseif((hfaBin(j)==0)&&(cfa(j)==1))
        falsePos = falsePos+1;
    elseif((hfaBin(j)==0)&&(cfa(j)==0))
         trueNeg=trueNeg+1;
    end 
end

sensitivity = truePos/(truePos+falseNeg)
specificity = trueNeg/(trueNeg+falsePos)
accuracy = (truePos + trueNeg)/ 54

classinfo = {'sam,xlsx','','';'Sensitivity','Specificity','Accuracy';sensitivity,specificity,accuracy}
xlswrite('C3info',classinfo)