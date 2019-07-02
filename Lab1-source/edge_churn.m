N = 100;
w = 0.5
A = erdrey_mit(N,[],500);
A = full(A);
B_zeros = 0;
B_ones = 0;
E(1)=500; % arxikopoioume to E sthn timh twn akmvn gia t=0
T=20;



for t=1:T 
    
    zeros=1;
    ones=1;
    r=rand;
    for i=1:N-1 % eksetazw thn anw periohi tou pinaka gia na blepw thn kathe akmi mia fora
        for j=i+1:N
            if r<=w 
                if A(i,j)==0 %an theloume na prosthesoume akmi psaxnoume ola ta mhdenika ston A ,
                    B_zeros(zeros,1)=i;%kai apothikeoume tis syntetagmenes wste na epilexoume sthn tuxh ena apo ayta
                    B_zeros(zeros,2)=j;
                    zeros = zeros + 1;
                end   
            else   
                if A(i,j)==1 %an theloume na afairesoume akmi psaxnoume olous tous assous ston A ,
                    B_ones(ones,1)=i;%wste na epilexoume sthn tuxh enan apo aytous
                    B_ones(ones,2)=j;
                    ones = ones + 1;
                end   
            
            end   
               
        end 
        
    end  
         if r<=w %tote ena mhdeniko to metatrepoume se monada ston adjancecy matrix
            if t==1 
                E(t)=E(t)+1;
            else 
                E(t)=E(t-1)+1;
            end    
            ran = randi(zeros);
            tmpx = B_zeros(ran,1);
            tmpy = B_zeros(ran,2);
            A(tmpx,tmpy)=1;
            A(tmpy,tmpx)=1;
         else % alliws enas assos metatrepetai se mhdeniko
           if t==1 
                E(t)=E(t)-1;
            else 
                E(t)=E(t-1)-1;
            end 
           ran = randi(ones);
           tmpx = B_ones(ran,1);
           tmpy = B_ones(ran,2);
           A(tmpx,tmpy)=0;
           A(tmpy,tmpx)=0;
         end
end    

