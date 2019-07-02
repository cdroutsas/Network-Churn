% Betweenness centrality measure: number of shortest paths running though a

% vertex. Compute for all vertices.

% Note: Valid for a general graph. Using 'number of shortest paths through a node' definition

% INPUTS: adjacency (distances) matrix (nxn)

% OUTPUTS: betweeness vector for all vertices (nx1)

%

% GB, October 13, 2009



function betw = node_betweenness_slow(adj)



n = numnodes(adj);

spaths=inf(n,n);



% calculate number of shortest paths

for k=1:n-1

  adjk=adj^k;

  for i=1:n

    for j=1:n

      if adjk(i,j)>0

        spaths(i,j)=min([spaths(i,j) adjk(i,j)]);

      end

    end

  end

end
