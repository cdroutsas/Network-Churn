%REG
N=100;
A_reg =  smallw(N,2,0);
B_reg = sum(A_reg);
node_degree = [0,0,0,0,0];

for i=1:N 
    node_degree(1) = node_degree(1) + B_reg(i);
end

node_degree(1) = node_degree(1)/N;
% RG
A_rg = erdrey_mit(100,[],200);
B_rg = sum(A_rg);
for i=1:N 
    node_degree(2) = node_degree(2) + B_rg(i);
end
node_degree(2) = node_degree(2)/N;
%RGG
x = 1000*rand(100,1);
y = 1000*rand(100,1);
crd  = [x,y];
A_rgg = sparse(rgg(crd, 100, 250));
B_rgg = sum(A_rgg);
for i=1:N 
    node_degree(3) = node_degree(3) + B_rgg(i);
end
node_degree(3) = node_degree(3)/N;
%SF
A_sf=pref(100,4);%path_length(4)= ave_path_length(A_sf);
B_sf = sum(A_sf);
for i=1:N 
    node_degree(4) = node_degree(4) + B_sf(i);
end
node_degree(4) = node_degree(4)/N;
%SW
A_sw =  smallw(100,2,0.3);
B_sw = sum(A_sf);
for i=1:N 
    node_degree(5) = node_degree(5) + B_sw(i);
end
node_degree(5) = node_degree(5)/N
bar(node_degree);
title('Node Degree');
set(gca,'XtickLabel',{'REG', 'RG','RGG','SF','SW'});
pause;


