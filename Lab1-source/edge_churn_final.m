
clear all ;

N = 100;
w = 0.55;
T = 2500;
E = 1000;
M = 10; % Eksetazoume M senaria
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
Array_zeros = zeros(N^2/2-N,2) ;
Array_ones  = zeros(N^2/2-N,2) ;

for counter=1:M    
    A = smallw(N,12,0.2);
        %smallw(N,d,0.2);
        %rg
        % pref(N,d); %sf
        % smallw(N,d,0.2); % small world
    A = full(A);
 
    tmp_node_degrees = degrees(A);
    Average_node_degree_old(1,counter)= mean(tmp_node_degrees);

     Average_closeness_old(1,counter)=mean(closeness(A));
     Average_betweenness_old(1,counter)=mean(node_betweenness_faster(A));
     Average_path_array_old(1,counter) = ave_path_length(A);
     Average_clust_coef_old(1,counter) = clust_coeff(A);
  
    
    zero = 0;
    ones = 0;
    count = 0;
    %[x,y]= getNodeCoordinates(N);
    
    % Arxika, exetazoyme tin anw trigwniki perioxi tou adacency matrix
    % gia na ypologisoume thn kathe akmi mono mia fora.
    
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
    %Kanoume t metavoles stis akmes.
    %gplot(A,[x,y],'o-');
    %pause;
    for t=1:T
        r=rand;     %Epilegoume enan arithmo sth tyxi apo to 0 mexri 1
        if r<=w %Ean einai katw apo to w tote prosthetoume 1 ston adjacency matrix
           % disp('add');
            ran = randi(zero); %Epilegoyme stin tuxh ena zeygos komvwn(tmx,tmpy) pou den syndeontai metaxy tous.
            tmpx = Array_zeros(ran,1);
            
            tmpy = Array_zeros(ran,2);
            
            A(tmpx,tmpy)=1;     % Topothetoume thn akmi sto zeugos (tmpx,tmpy)
            A(tmpy,tmpx)=1;     % Topothetoume thn akmi sto zeugos (tmpy,tmpx)
            %disp(t);
            %disp(r);
            %disp(tmpx);
            %disp(tmpy);
            Array_zeros(ran,1)= Array_zeros(zero,1);  %Sti thesi tou zeugous pou epilegetai tha bei to teleutaio
            %zeugos tou array_zeros
            Array_zeros(ran,2)= Array_zeros(zero,2);
            zero = zero - 1;                        % plithos midenikwm. Twra pleon exoyme ena ligotero zeygos ston  array_zeros kai den uparxei keno sto pinaka kati pou mas dieukolunei.
            ones = ones + 1;                          % plithos asswn.
            Array_ones(ones,1)=tmpx;                  % mpainei ena kainoyrgio zeugos ston pinaka array_ones
            Array_ones(ones,2)=tmpy;
            
            
            
        else % Alliws afairoyme mia akmi apo ton adjacency matrix. Kanoume akrivws tin antistoixi diadikasia.
            ran = randi(ones);
           % disp('delete');
            tmpx = Array_ones(ran,1);
            
            tmpy = Array_ones(ran,2);
            
            %disp(t);
            %disp(r);
            %disp(tmpx);
            %disp(tmpy);
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
    end;
    
   % disp(datestr(now));
  
    tmp_node_degrees = degrees(A);
    Average_node_degree_new(1,counter)= mean(tmp_node_degrees);
  
  
     
     Average_closeness_new(1,counter)=mean(closeness(A));
     Average_betweenness_new(1,counter)=mean(node_betweenness_faster(A));
    Average_path_array_new(1,counter) = ave_path_length(A);
    
    Average_clust_coef_new(1,counter) = clust_coeff(A);

    
    disp(counter);
end;
% Diagramma average_path_array
 %diagram(1,1)= mean(Average_path_array_old(isfinite(Average_path_array_old)));
 %diagram(1,2)= mean(Average_path_array_new(isfinite(Average_path_array_new)));
%  bar(diagram);
%  title('Average path length');
%  pause;
% Diagramma clustering coefficient
%diagram(2,1)= mean(Average_clust_coef_old);
%diagram(2,2)= mean(Average_clust_coef_new);
%  bar(diagram);
%  title('Clustering Coefficient');


%  pause;
% 
 %Diagramma node degree
  %diagram(3,1)= mean(Average_node_degree_old);
  %diagram(3,2)= mean(Average_node_degree_new);
%   bar(diagram);
%   title('Node degree');
%   pause;
%  
 %Diagramma closeness centrality
 % diagram(4,1)= mean(Average_closeness_old);
 % diagram(4,2)= mean(Average_closeness_new);
%   bar(diagram);
%   title('Closeness Centrality');
%   pause;
%  
%Diagramma betweenness centrality
 % diagram(5,1)= mean(Average_betweenness_old);
 % diagram(5,2)= mean(Average_betweenness_new);
%   bar(diagram);
%   title('Betweenness Centrality');
%   pause;
%  
%bar(diagram);
%set(gca,'XTickLabel',{'AveragePath', 'CC','Node Degree','Closeness Centrality','Betweenness Centrality'});
pause;
% % A_end = A;
