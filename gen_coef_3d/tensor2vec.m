function v=tensor2vec(a)
r=size(a);
v=zeros(r(1)*r(2)*r(3)*r(4),1);
m=r(4);
for i=1:r(1)
    for j=1:r(2)
        for k=1:r(3)
            for l=1:m
                v(v2t4([i,j,k,l],[r(1),r(2),r(3)]))=a(i,j,k,l);
            end
        end
    end
end
end