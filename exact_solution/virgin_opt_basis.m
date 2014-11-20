function A_opt=virgin_opt_basis(X,maxiter,ntrials)
r=size(X,1);
    function X_comp=complement(a,X)
        X_comp=zeros(size(X));
        for i=1:size(X,2)
            x=X(:,i);
            X_comp(:,i)=x-dot(x,a)/norm(a)/norm(a)*a;
        end
    end

%begin reduction
A_opt=zeros(r,r);
for k=1:r
    if k==1
        a_opt=virgin_opt_a(X,zeros(r,1),maxiter,ntrials);
    else
        a_opt=virgin_opt_a(X,A_opt(:,1:k-1),maxiter,ntrials);
    end
    A_opt(:,k)=a_opt;
    X=complement(a_opt,X);
end
end