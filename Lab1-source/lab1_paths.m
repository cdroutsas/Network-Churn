%REG
N=100;
A_reg =  smallw(N,2,0);
path_length = [0,0,0,0,0];

% RG
A_rg = erdrey_mit(100,[],500);
p=int16.empty(100,2);

%RGG
x = 1000*rand(100,1);
y = 1000*rand(100,1);
crd  = [x,y];
A_rgg = sparse(rgg(crd, 100, 250));
B_rgg = sum(A_rgg);
x1 = FindComponents(A_rg,100);
%SF
A_sf=pref(100,4);%path_length(4)= ave_path_length(A_sf);
r=random(1);
%SW
A_sw =  smallw(100,2,0.3);

path_length(1)= ave_path_length(A_reg);
path_length(2)= ave_path_length(A_rg);
path_length(3)= ave_path_length(A_rgg);
path_length(4)= ave_path_length(A_sf);
path_length(5)= ave_path_length(A_sw);
bar(path_length);
title('Average Path Length');
set(gca,'XtickLabel',{'REG', 'RG','RGG','SF','SW'});
pause;
