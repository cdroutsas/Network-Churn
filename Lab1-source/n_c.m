clear all ;
w = 0.55;
No = 15;
T = 2500;
E = 65;
mo = 20;
tmp_array = zeros(1,No);
M = 50; % Eksetazoume M deigmata.
Average_path_array_old = zeros(1,M);
Average_path_array_new = zeros(1,M);
Average_clust_coef_old = zeros(1,M);
Average_clust_coef_new = zeros(1,M);
Average_node_degree_old = zeros(1,M);
Average_node_degree_new = zeros(1,M);
Average_closeness_old = zeros(1,M);
Average_closeness_new = zeros(1,M);
Average_betweenness_old = zeros(1,M);
Average_betweenness_new = zeros(1,M);
tmp_node_degrees = zeros(1,3);
diagram = zeros(5,2);

for counter=1:M
    N = No;
    A = erdrey_mit(N,[],E);%smallw(100,6,0.2); %sf
   
    
    A = full(A);
    Average_path_array_old(1,counter) = ave_path_length(A);
    Average_clust_coef_old(1,counter) = clust_coeff(A);
    tmp_node_degrees = degrees(A);
    Average_node_degree_old(1,counter)= tmp_node_degrees(1);
    Average_closeness_old(1,counter)=mean(closeness(A));
    Average_betweenness_old(1,counter)=mean(node_betweenness_faster(A));
    
    for t=1:T
        r=rand; % epilegoume enan arithmo stin tuxi
        disp(r);
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
    disp(counter);
    Average_path_array_new(1,counter) = ave_path_length(A);
   
    Average_clust_coef_new(1,counter) = clust_coeff(A);
    tmp_node_degrees = degrees(A);
    Average_node_degree_new(1,counter)= tmp_node_degrees(1);
    Average_closeness_new(1,counter)=mean(closeness(A));
    Average_betweenness_new(1,counter)=mean(node_betweenness_faster(A));
      
end
% Diagramma average_path_array
 diagram(1,1)= mean(Average_path_array_old(isfinite(Average_path_array_old)));
 diagram(1,2)= mean(Average_path_array_new(isfinite(Average_path_array_new)));
%  bar(diagram);
%  title('Average path length');
%  pause;
% Diagramma clustering coefficient
 diagram(2,1)= mean(Average_clust_coef_old);
 diagram(2,2)= mean(Average_clust_coef_new);
%  bar(diagram);
%  title('Clustering Coefficient');
%  pause;
% 
 %Diagramma node degree
  diagram(3,1)= mean(Average_node_degree_old);
  diagram(3,2)= mean(Average_node_degree_new); % ************************************************************************* τι να κανω με το �?-1 ;;
%   bar(diagram);
%   title('Node degree');
%   pause;
%  
 %Diagramma closeness centrality
  diagram(4,1)= mean(Average_closeness_old);
  diagram(4,2)= mean(Average_closeness_new);
%   bar(diagram);
%   title('Closeness Centrality');
%   pause;
%  
%Diagramma betweenness centrality
  diagram(5,1)= mean(Average_betweenness_old);
  diagram(5,2)= mean(Average_betweenness_new);
%   bar(diagram);
%   title('Betweenness Centrality');
%   pause;
%  
disp(diagram(1,1));
disp(diagram(1,2));
disp(diagram(2,1));
disp(diagram(2,2));
disp(diagram(3,1));
disp(diagram(3,2));
disp(diagram(4,1));
disp(diagram(4,2));
disp(diagram(5,1));
disp(diagram(5,2));

pause;
% % A_end = A;