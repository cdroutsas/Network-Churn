clear all ;
%No = 100;
w = 0.55;
T = 2500;
E = 500;
M = 5; % Eksetazoume M senaria
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
    N = 100;
    A = erdrey_mit(N,[],E); %sf sto SF d=4 exasfalizetai an valeis d=2 stin etoimi synartisi
        %erdrey_mit(N,[],E); %rg
        % pref(100,6); %sf
        % smallw(100,6,0.2); % small world
    A = full(A);
    Average_path_array_old(1,counter) = ave_path_length(A);
    Average_clust_coef_old(1,counter) = clust_coeff(A);
    tmp_node_degrees = degrees(A);
    Average_node_degree_old(1,counter)= tmp_node_degrees(1);
    Average_closeness_old(1,counter)=mean(closeness(A));
    Average_betweenness_old(1,counter)=mean(node_betweenness_faster(A));
    zeros = 0;
    ones = 0;
    count = 0;
   
    
    % Arxika, exetazoyme tin anw trigwniki perioxi tou adacency matrix
    % gia na ypologisoume thn kathe akmi mono mia fora.
    
    
   
    for t=1:T
        network_churn = rand;
        if network_churn <= 0.5 %edge churn
            Array_zeros = zeros(N^2/2-N,2) ;
            Array_ones  = zeros(N^2/2-N,2) ;

       
        else
            r=rand; % epilegoume enan arithmo stin tuxi

            
            tmp_array = zeros(1,N);
            A = [ A;tmp_array];
            tmp_array = zeros(N+1,1);
            A = [ A,tmp_array]; % kanoume ton pinaka A apo nxn se n+1xn+1
             

        end
    end

   
    Average_path_array_new(1,counter) = ave_path_length(A);
   
    Average_clust_coef_new(1,counter) = clust_coeff(A);
    tmp_node_degrees = degrees(A);
    Average_node_degree_new(1,counter)= tmp_node_degrees(1);
    Average_closeness_new(1,counter)=mean(closeness(A));
    Average_betweenness_new(1,counter)=mean(node_betweenness_faster(A));
    disp(counter);
    
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
  diagram(3,2)= mean(Average_node_degree_new);
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
%bar(diagram);
%set(gca,'XTickLabel',{'AveragePath', 'CC','Node Degree','Closeness Centrality','Betweenness Centrality'});
pause;
% % A_end = A;
