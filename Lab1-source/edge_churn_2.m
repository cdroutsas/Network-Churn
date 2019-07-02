N = 10;
w = 0.5;
T = 10;
E = 20;

A = erdrey(N,E);
A = full(A);
A_start= A;
Array_zeros = zeros(N^2/2-N,2) ;
Array_ones  = zeros(N^2/2-N,2) ;
zeros = 0;
ones = 0;
count = 0;
[x,y]= getNodeCoordinates(N);

% Arxika, exetazoyme tin anw trigwniki perioxi tou adacency matrix
% gia na ypologisoume thn kathe akmi mono mia fora.

for i=1:N-1
    for j=i+1:N 
        if A(i,j)==0 
                   
                    % Dimiourgoume enan pinaka Array_zeros pou periexei tis
                    % sintetagmenes twn midenikwn.
                    zeros = zeros + 1;% Metritis midenikwn, synolo diladi zeugwn pou den sundeontai me kapoia akmi.
                    Array_zeros(zeros,1)=i;
                    Array_zeros(zeros,2)=j;
                    
          
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
 gplot(A,[x,y],'o-');
 pause;
 for t=1:T
    r=rand;     %Epilegoume enan arithmo sth tyxi apo to 0 mexri 1
        if r<=w %Ean einai katw apo to w tote prosthetoume 1 ston adjacency matrix
             
             ran = randi(zeros); %Epilegoyme stin tuxh ena zeygos komvwn(tmx,tmpy) pou den syndeontai metaxy tous.
             tmpx = Array_zeros(ran,1);
             tmpy = Array_zeros(ran,2);
             A(tmpx,tmpy)=1;     % Topothetoume thn akmi sto zeugos (tmpx,tmpy)
             A(tmpy,tmpx)=1;     % Topothetoume thn akmi sto zeugos (tmpy,tmpx)
               disp(t);
               disp(r);
               disp(tmpx);
               disp(tmpy);
             Array_zeros(ran,1)= Array_zeros(zeros,1);  %Sti thesi tou zeugous pou epilegetai tha bei to teleutaio
                                                        %zeugos tou array_zeros
             Array_zeros(ran,2)= Array_zeros(zeros,2);
             zeros = zeros - 1;                        % plithos midenikwm. Twra pleon exoyme ena ligotero zeygos ston  array_zeros kai den uparxei keno sto pinaka kati pou mas dieukolunei.
             ones = ones + 1;                          % plithos asswn.
             Array_ones(ones,1)=tmpx;                  % mpainei ena kainoyrgio zeugos ston pinaka array_ones
             Array_ones(ones,2)=tmpy;
             
             
             
        else % Alliws afairoyme mia akmi apo ton adjacency matrix. Kanoume akrivws tin antistoixi diadikasia.
             ran = randi(ones);
             tmpx = Array_ones(ran,1);
             tmpy = Array_ones(ran,2);
             disp(t);
             disp(r);
             disp(tmpx);
             disp(tmpy);
             A(tmpx,tmpy)=0;
             A(tmpy,tmpx)=0;
             Array_ones(ran,1)= Array_ones(ones,1);
             Array_ones(ran,2)= Array_zeros(ones,2);
             ones = ones - 1;
             zeros = zeros + 1;
             Array_zeros(zeros,1)=tmpx;
             Array_zeros(zeros,2)=tmpy;
             
             
        end;
        gplot(A,[x,y],'o-'); 
        pause;
 end; 
 A_end = A;