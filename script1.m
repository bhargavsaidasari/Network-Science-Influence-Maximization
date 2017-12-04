%Create the Graph
fid = fopen('facebook_combined.txt', 'r');
 E = fscanf(fid, '%g %g', [2 inf]);
 E=E';
 E=E+1;
 adj=edgeL2adjj(E);
 g=graph(adj,'OmitSelfLoops');
 %%
 %Computing  Centrality 
 degree_centrality=centrality(g,'degree');
 eigen_Centrality =centrality(g,'eigenvector');
 betweenness_centrality=centrality(g,'betweenness');
 pagerank_centrality =centrality(g,'pagerank');
 
 %%
 %Epidemics on Graph
 [~,ind]=sort(degree_centrality,'descend');
 [active_nodes] = independent_cascade(g,1,ind(1:100),0.01);

 