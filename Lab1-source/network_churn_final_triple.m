clear all ;
No = 100;
w = 0.55;
T = 2500;
%E = 1000;
M = 10; % Eksetazoume M senaria
mo=20;
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

for metritis=1:1

if metritis==1
 d=4;
elseif metritis==2
d=12;
else d=6;
end

for counter=1:M
    N =100;
    A = erdrey_mit(N,[],2000); %sf sto SF d=4 exasfalizetai an valeis d=2 stin etoimi synartisi
        %erdrey_mit(N,[],E); %rg
        % pref(N,d); %sf
        % smallw(N,d,0.2); % small world
    A = full(A);
%     if counter<=1
%    Average_betweenness_old(1,counter,metritis)=mean(node_betweenness_faster(A));
%    Average_closeness_old(1,counter,metritis)=mean(closeness(A));
%      Average_path_array_old(1,counter,metritis) = ave_path_length(A);
%  Average_clust_coef_old(1,counter,metritis) = clust_coeff(A);
% % %     end
%      tmp_node_degrees = degrees(A);
%      Average_node_degree_old(1,counter,metritis)= mean(tmp_node_degrees);
% %     
    
     %[x,y]= getNodeCoordinates(N);
    
    % Arxika, exetazoyme tin anw trigwniki perioxi tou adacency matrix
    % gia na ypologisoume thn kathe akmi mono mia fora.
    
    
   
    for t=1:T
        network_churn = rand;
        if network_churn <= 0.5 %edge churn
            Array_zeros = zeros(N^2/2-N/2,2) ;
            Array_ones  = zeros(N^2/2-N/2,2) ;
            zero = 0;
            ones = 0;
            for i=1:N-1
                for j=i+1:N
                    if A(i,j)==0
                
                    % Dimiourgoume enan pinaka Array_zeros pou periexei tis
                    % sintetagmenes twn midenikwn.
                    zero = zero + 1;% Metritis midenikwn, synolo diladi zeugwn pou den sundeontai me kapoia akmi.
                    Array_zeros(zero,1)=i;
                    Array_zeros(zero,2)=j;
                
                
                    else
                    % Dimiourgoume enan pinaka Array_zeros pou periexei tis
                    % sintetagmenes twn asswn.
                    ones = ones + 1; % Metritis midenikwn, synolo diladi zeugwn pou  sundeontai me kapoia akmi.
                    Array_ones(ones,1)=i;
                    Array_ones(ones,2)=j;
                
                    end
                end
             end
            
            r=rand;     %Epilegoume enan arithmo sth tyxi apo to 0 mexri 1
            if r<=w %Ean einai katw apo to w tote prosthetoume 1 ston adjacency matrix
            
            ran = randi(zero); %Epilegoyme stin tuxh ena zeygos komvwn(tmx,tmpy) pou den syndeontai metaxy tous.
            tmpx = Array_zeros(ran,1);
            tmpy = Array_zeros(ran,2);
            A(tmpx,tmpy)=1;     % Topothetoume thn akmi sto zeugos (tmpx,tmpy)
            A(tmpy,tmpx)=1;     % Topothetoume thn akmi sto zeugos (tmpy,tmpx)
           
            Array_zeros(ran,1)= Array_zeros(zero,1);  %Sti thesi tou zeugous pou epilegetai tha bei to teleutaio
            %zeugos tou array_zeros
            Array_zeros(ran,2)= Array_zeros(zero,2);
            zero = zero - 1;                        % plithos midenikwm. Twra pleon exoyme ena ligotero zeygos ston  array_zeros kai den uparxei keno sto pinaka kati pou mas dieukolunei.
            ones = ones + 1;                          % plithos asswn.
            Array_ones(ones,1)=tmpx;                  % mpainei ena kainoyrgio zeugos ston pinaka array_ones
            Array_ones(ones,2)=tmpy;
            
            
            
            else % Alliws afairoyme mia akmi apo ton adjacency matrix. Kanoume akrivws tin antistoixi diadikasia.
            ran = randi(ones);
            tmpx = Array_ones(ran,1);
            tmpy = Array_ones(ran,2);
           
            A(tmpx,tmpy)=0;
            A(tmpy,tmpx)=0;
            Array_ones(ran,1)= Array_ones(ones,1);
            Array_ones(ran,2)= Array_zeros(ones,2);
            ones = ones - 1;
            zero = zero + 1;
            Array_zeros(zero,1)=tmpx;
            Array_zeros(zero,2)=tmpy;
            
            
            end;
        %gplot(A,[x,y],'o-');
        %pause;
       
        else
            r=rand; % epilegoume enan arithmo stin tuxi
            if r<=w % an r<=w tote  prosthetoume enan komvo
            
            tmp_array = zeros(1,N);
            A = [ A;tmp_array];
            tmp_array = zeros(N+1,1);
            A = [ A,tmp_array]; % kanoume ton pinaka A apo nxn se n+1xn+1
             
            random_neighbors= randsample(N,mo); %epilegoume m ksexwristous geitones apo N arithmous.
            
            for i=1:mo
                neighbor = random_neighbors(i);
                A(neighbor,N+1)=1;
                A(N+1,neighbor)=1; % prosthetoume tis akmes tous kainourgiou komboy me tous kainourgioys geitones
            end
           
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
            
            
    end
   % disp(datestr(now));
%     if counter<=1
    
Average_betweenness_new(1,counter,metritis)=mean(node_betweenness_faster(A));
%    Average_closeness_new(1,counter,metritis)=mean(closeness(A));
% % %   
% % %        
%       Average_path_array_new(1,counter,metritis) = ave_path_length(A);
% % %    
%     Average_clust_coef_new(1,counter,metritis) = clust_coeff(A);
% % %     end
%     tmp_node_degrees = degrees(A);
%      Average_node_degree_new(1,counter,metritis)= mean(tmp_node_degrees);
% %     
    disp(counter);
    
end
end

% Diagramma average_path_array
%  diagram(1,1,metritis)= mean(Average_path_array_old(isfinite(Average_path_array_old)));
%  diagram(1,2,metritis)= mean(Average_path_array_new(isfinite(Average_path_array_new)));
% %  bar(diagram);
% %  title('Average path length');
% %  pause;
% % Diagramma clustering coefficient
%  diagram(2,1,metritis)= mean(Average_clust_coef_old);
%  diagram(2,2,metritis)= mean(Average_clust_coef_new);
% %  bar(diagram);
% %  title('Clustering Coefficient');
% %  pause;
% % 
%  %Diagramma node degree
%   diagram(3,1,metritis)= mean(Average_node_degree_old);
%   diagram(3,2,metritis)= mean(Average_node_degree_new);
% %   bar(diagram);
% %   title('Node degree');
% %   pause;
% %  
%  %Diagramma closeness centrality
%   diagram(4,1,metritis)= mean(Average_closeness_old);
%   diagram(4,2,metritis)= mean(Average_closeness_new);
% %   bar(diagram);
% %   title('Closeness Centrality');
% %   pause;
% %  
% %Diagramma betweenness centrality
%   diagram(5,1,metritis)= mean(Average_betweenness_old);
%   diagram(5,2,metritis)= mean(Average_betweenness_new);
% %   bar(diagram);
% %   title('Betweenness Centrality');
% %   pause;
% %  

%bar(diagram);
%set(gca,'XTickLabel',{'AveragePath', 'CC','Node Degree','Closeness Centrality','Betweenness Centrality'});
pause;
% % A_end = A;
