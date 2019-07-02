clear all ;
% for y =1:3
%     if y==1 d=4;
%     else if y==2 d= 8;
%          else d=12; 
%         end
%     end     
             
w = 0.55;
No = 750;
T = 2500;

mo = 20;
tmp_array = zeros(1,No);
M = 5; % Eksetazoume M deigmata.
Average_path_array_old = zeros(1,M,3);
Average_path_array_new = zeros(1,M,3);
Average_clust_coef_old = zeros(1,M,3);
Average_clust_coef_new = zeros(1,M,3);
Average_node_degree_old = zeros(1,M,3);
Average_node_degree_new = zeros(1,M,3);
Average_closeness_old = zeros(1,M,3);
Average_closeness_new = zeros(1,M,3);
Average_betweenness_old = zeros(1,M,3);
Average_betweenness_new = zeros(1,M,3);
tmp_node_degrees = zeros(1,3);
diagram = zeros(5,2,3);
for metritis=1:3

if metritis==1
 d=4 ;
elseif metritis==2
 d=8;
else d=12;
end

for counter=1:M
    N = No;
    A = erdrey_mit(N,[],7500);
  
    %erdrey_mit(N,[],E);%smallw(100,6,0.2); %sf pref(100,6)
   
    
    A = full(A);
    
    tmp_node_degrees = degrees(A);
     Average_node_degree_old(1,counter,metritis)= mean(tmp_node_degrees);
    %if counter<=1
    %Average_clust_coef_old(1,counter,metritis) = clust_coeff(A);
     %Average_path_array_old(1,counter,metritis) = ave_path_length(A);
%      Average_closeness_old(1,counter,metritis)=mean(closeness(A));
     %Average_betweenness_old(1,counter,metritis)=mean(node_betweenness_faster(A));
    % end
    
    for t=1:T
        r=rand; % epilegoume enan arithmo stin tuxi
        %disp(r);
        if r<=w % an r<=w tote  prosthetoume enan komvo
            %disp('addition');
            tmp_array = zeros(1,N);
            A = [ A;tmp_array];
            tmp_array = zeros(N+1,1);
            A = [ A,tmp_array]; % kanoume ton pinaka A apo nxn se n+1xn+1
              %A(N+1,N+1)=0;
            random_neighbors= randsample(N,mo); %epilegoume m ksexwristous geitones apo N arithmous.
            
            for i=1:mo
                neighbor = random_neighbors(i);
                A(neighbor,N+1)=1;
                A(N+1,neighbor)=1; % prosthetoume tis akmes tous kainourgiou komboy me tous kainourgioys geitones
            end
            %disp('the adjacency matrix is');
            %disp(A);
           N = N + 1; % auksanetai to plithos twn komvwn kata 1
         else           %alliws afairoume enan komvo
            %disp('delete');
            ran = randi(N); %epilegoume enan arithmo apo 1 ews N kai diagrafoume tin antistoixi grammi kai stili.
            %disp(ran);
            A([ran],:)=[];
            A(:,[ran])=[];
            N= N-1;
            %disp('the adjacency matrix is');
            %disp(A);
        end
    end
    
    tmp_node_degrees = degrees(A);
    Average_node_degree_new(1,counter,metritis)= mean(tmp_node_degrees);
  %  if counter <=1
    % Average_path_array_new(1,counter,metritis) = ave_path_length(A);    
   % Average_clust_coef_new(1,counter,metritis) = clust_coeff(A);
%     Average_closeness_new(1,counter,metritis)=mean(closeness(A));
   % Average_betweenness_new(1,counter,metritis)=mean(node_betweenness_faster(A));
   % end
    disp(counter); 
end

% Diagramma average_path_array
% diagram(1,1,metritis)= mean(nonzeros(Average_path_array_old(isfinite(Average_path_array_old))));
% diagram(1,2,metritis)= mean(nonzeros(Average_path_array_new(isfinite(Average_path_array_new))));
%  bar(diagram);
%  title('Average path length');
%  pause;
% Diagramma clustering coefficient
% diagram(2,1,metritis)= mean(nonzeros(Average_clust_coef_old));
% diagram(2,2,metritis)= mean(nonzeros(Average_clust_coef_new));
%  bar(diagram);
%  title('Clustering Coefficient');
%  pause;
% 

 %Diagramma node degree
 diagram(3,1,metritis)= mean(nonzeros(Average_node_degree_old));
 diagram(3,2,metritis)= mean(nonzeros(Average_node_degree_new)); % ************************************************************************* τι να κανω με το �?-1 ;;
%   bar(diagram);
%   title('Node degree');
%   pause;
%  
 %Diagramma closeness centrality
 % diagram(4,1)= mean(nonzeros(Average_closeness_old));
  %diagram(4,2)= mean(nonzeros(Average_closeness_new));
%   bar(diagram);
%   title('Closeness Centrality');
%   pause;
%  
%Diagramma betweenness centrality
%  diagram(5,1,metritis)= mean(nonzeros(Average_betweenness_old));
%  diagram(5,2,metritis)= mean(nonzeros(Average_betweenness_new));
%   bar(diagram);
%   title('Betweenness Centrality');
%   pause;
%  
%bar(diagram);
%set(gca,'XTickLabel',{'AveragePath', 'CC','Node Degree','Closeness Centrality','Betweenness Centrality'});
%end
end
pause;
% % A_end = A;