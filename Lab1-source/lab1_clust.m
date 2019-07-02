%REG
N=100;
A_reg =  smallw(N,2,0);
clust_co=[0,0,0,0,0];
% RG
A_rg = erdrey_mit(N,[],500);
A_rg = sparse(A_rg);

%RGG
x = 1000*rand(N,1);
y = 1000*rand(N,1);
crd  = [x,y];
A_rgg = sparse(rgg(crd, N, 250));
B_rgg = sum(A_rgg);
x1 = FindComponents(A_rg,N);
%SF
A_sf=pref(N,4);%path_length(4)= ave_path_length(A_sf);

%SW
A_sw =  smallw(N,2,0.3);

A1 = clustering_coefficients(A_reg);
A2 = clustering_coefficients(A_rg)
A3 = clustering_coefficients(A_rgg);
A4 = clustering_coefficients(A_sf);
A5 = clustering_coefficients(A_sw);
 

clust_co(1)= mean(A1);
clust_co(2)= mean(A2);
clust_co(3)= mean(A3);
clust_co(4)= mean(A4);
clust_co(5)= mean(A5);
bar(clust_co);
title('Clustering Coefficient');
set(gca,'XtickLabel',{'REG', 'RG','RGG','SF','SW'});
pause;
