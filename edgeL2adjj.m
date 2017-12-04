function adj=edgeL2adjj(e)

adj=zeros(max(max(e)));   % initialize adjacency matrix

% across all edges
for i=1:size(e,1)
    adj(e(i,1),e(i,2))=1;
    adj(e(i,2),e(i,1))=1;
end
end