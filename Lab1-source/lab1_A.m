%REG
% A_reg =  smallw(100,2,0);
% A_reg =  full(A_reg);
% [x,y]= getNodeCoordinates(100);
% gplot(A_reg,[x,y],'o-');
% pause;
% RG
% A_rg = erdrey(1000,10000); %A = erdrey_mit(N,[],E);
% radial_plot(A_rg,1);
% pause;
% A_rg =  full(A_rg);
% [x,y]= getNodeCoordinates(10);
% gplot(A_rg,[x,y],'o-');
% pause;
% %RGG
% x = 1000*rand(100,1);
% y = 1000*rand(100,1);
% crd  = [x,y];
% A_rgg = rgg(crd, 100, 250);
% gplot(A_rgg,[x,y],'o-');
% pause;
%SF
A_sf=pref(100,4);
[x,y]= getNodeCoordinates(100);
gplot(A_sf,[x,y],'o-');
pause;
%SW
x1 = mean(degrees(A_sf));
 A_sw =  smallw(1000,2,0.3);
A_sw =  full(A_sw);
[x,y]= getNodeCoordinates(100);
x2 = mean(degrees(A_sw));
gplot(A_sw,[x,y],'o-');
%pause;





