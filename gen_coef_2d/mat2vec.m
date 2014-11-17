function v=mat2vec(a)
[r,~,m]=size(a);
v=zeros(r*r*m,1);
for i=1:r
    for j=1:r
        for k=1:m
            v(v2t(i,j,k,r))=a(i,j,k);
        end
    end
end
end