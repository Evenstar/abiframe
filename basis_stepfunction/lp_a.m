function A_hat=lp_a(x,A,maxiter)
[~,m]=size(A);
for k=1:maxiter
    for i=1:m
        j=randi(m);
        A_j=A;
        A_j(:,j)=[];
        A(:,j)=lp_a_column(x,A(:,j),A_j);
    end
end
A_hat=A;
end