X=unifrnd(0,5,[3,3]);
F=@(A)sum(sum(abs(A'*X)));
A=orth(randn(3));

%%
[opt,A_hat]=fmin_search11(orth(randn(3)),X,100)
%%
cvx_begin sdp
    variable A(3,3) 
    minimize( sum(sum(abs(A'*X))))
    subject to
    A>=0;
    eye(3)-A >=0;
    trace(A(:,1)*A(:,1)')==1;
    vec(A'*X)>=0
cvx_end

%%
n=3;
P=randn(n,n);
cvx_begin sdp
    variable Z(n,n) 
    dual variable Q
    minimize( sum(sum(abs(Z'*X))))
    Z >= 0 : Q;
    Z <= eye(3);
    trace(Z)==3;
cvx_end
%%

n=3;
a=orth(randn(n));

W=zeros(n);
for i=1:n
    for j=1:n
        W=W+a(:,i)*a(:,j)';
    end
end

eigs(W)

%%
P=X*X';
cvx_begin sdp
    variable W(3,3) 
    minimize( trace(W*P))
    subject to
    W>=0;
    trace(W)==3;
cvx_end
















