w = 0.5;
N = 100;
T = 100;
E = 500;
A = erdrey_mit(N,[],E);
A = full(A);
counter = 1;
y = closeness(A);
Average_closeness_old(1,counter)=mean(y);
x = node_betweenness_faster(A);
Average_betweenness_old(1,counter)=mean(x);


% r=rand; % epilegoume enan arithmo stin tuxi
%         disp(r);
%          if r<=w % an r<=w tote  prosthetoume enan komvo
%               A(N+1,N+1)=0;
%               A(N+1,1)=1;
%               A(1,N+1)=1;
%               disp('addition');
% %             tmp_array = zeros(1,N);
% %             tmp_array(1,1)= 1;
% %             A = [ A;tmp_array];
% %             tmp_array = zeros(N+1,1);
% %             tmp_array(1,1)=1;
% %             A = [ A,tmp_array]; % kanoume ton pinaka A apo nxn se n+1xn+1r=rand; % epilegoume enan arithmo stin tuxi
%            else           %alliws afairoume enan komvo
%            disp('delete');
%             ran = randi(N); %epilegoume enan arithmo apo 1 ews N kai diagrafoume tin antistoixi grammi kai stili.
%             disp(ran);
%             A([ran],:)=[];
%             A(:,[ran])=[];
%             N= N-1;
%             %disp('the adjacency matrix is');
%             %disp(A);
%         end
%  Average_betweenness_new(1,counter)=mean(node_betweenness_faster(A));       