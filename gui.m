a= uigetfile('*.xlsx','Select More than one File','MultiSelect', 'on');

[r,c]=size(a)
for i=1:c
    b= comp(a{i},18);
end