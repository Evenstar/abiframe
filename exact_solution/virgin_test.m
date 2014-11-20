r=4;
N=4;
X=unifrnd(0,5,r,N);
a=orth(randn(r));
A_opt=virgin_opt_basis(X,5000,3);
A_global=virgin_global(X,5000,3);

A_opt=sortcolumn(A_opt);
s_virgin=sum(sum(abs(A_opt'*X)))
A_global=sortcolumn(A_global);
s_global=sum(sum(abs(A_global'*X)))

A_opt'*X;
A_global'*X;
if abs(sum(vec(A_opt'*X)) -sum(abs(vec(A_opt'*X))))>1e-6
    warning('1 Not non-negative')
end
if abs(sum(vec(A_global'*X)) - sum(abs(vec(A_global'*X))))>1e-6
    warning('2 Not non-negative')
end