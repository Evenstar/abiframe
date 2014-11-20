function A_hat=sub_a(x,A,B,C,D,P,eta,lambda,tol,maxiter)
[r,m]=size(A);
A_hat=zeros(r,m);
for i=1:m
    %A_hat(:,i)=sub_a_column(x,A(:,i),D(:,i)-B(:,i),P(:,i)-C(:,i),eta,lambda,maxiter);
     A_hat(:,i)=sub_a_column_cg(x,A(:,i),D(:,i)-B(:,i),P(:,i)-C(:,i),eta,lambda,tol,maxiter);

end
end