w = 0.5;
N = 10;
T = 10;
E = 20;
A = erdrey_mit(N,[],E);
A = full(A);
m = 2;
tmp_array = zeros(1,N)
disp(A);
for t=1:T
    r=rand; % epilegoume enan arithmo stin tuxi
    disp(r);
    if r<=w % an r<=w tote  prosthetoume enan komvo
        disp('addition');
        tmp_array = zeros(1,N)
        A = [ A;tmp_array];
        tmp_array = zeros(N+1,1)
        A = [ A,tmp_array]; % kanoume ton pinaka A apo nxn se n+1xn+1
        random_neighbors= randsample(N,m) %epilegoume m ksexwristous geitones apo N arithmous.
      
        for i=1:m 
             neighbor = random_neighbors(i);
             A(neighbor,N+1)=1;
             A(N+1,neighbor)=1; % prosthetoume tis akmes tous kainourgiou komboy me tous kainourgioys geitones
        end
        disp('the adjacency matrix is');
        disp(A);
        N = N + 1; % auksanetai to plithos twn komvwn kata 1
    else           %alliws afairoume enan komvo
         disp('delete');
         ran = randi(N); %epilegoume enan arithmo apo 1 ews N kai diagrafoume tin antistoixi grammi kai stili.
         disp(ran);
         A([ran],:)=[];
         A(:,[ran])=[];
         N= N-1;
         disp('the adjacency matrix is');
         disp(A);
    end   
end
