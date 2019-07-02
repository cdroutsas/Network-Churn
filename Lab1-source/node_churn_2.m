clear all ;
w = 0.53;
No = 100;
T = 5000;
E = 500;
mo = 20;
tmp_array = zeros(1,No);
M = 50; % Eksetazoume M deigmata.
tmp_node_degrees = zeros(1,3);
diagram = zeros(1,2);

for counter=1:M
    N = No;
    A = erdrey_mit(N,[],E);
    A = full(A);

    for t=1:T
        r=rand; % epilegoume enan arithmo stin tuxi
        disp(r);
        if r<=w % an r<=w tote  prosthetoume enan komvo
            %disp('addition');
            tmp_array = zeros(1,N)
            A = [ A;tmp_array];
            tmp_array = zeros(N+1,1)
            A = [ A,tmp_array]; % kanoume ton pinaka A apo nxn se n+1xn+1
            random_neighbors= randsample(N,mo) %epilegoume m ksexwristous geitones apo N arithmous.
            
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
    disp(datestr(now));
    Average_path_array_new(1,counter) = ave_path_length(A);
    Average_clust_coef_new(1,counter) = clust_coeff(A);
    tmp_node_degrees = degrees(A);
    Average_node_degree_new(1,counter)= tmp_node_degrees(1);
    Average_closeness_new(1,counter)=mean(closeness(A));
    Average_betweenness_new(1,counter)=mean(node_betweenness_faster(A));
  
end
