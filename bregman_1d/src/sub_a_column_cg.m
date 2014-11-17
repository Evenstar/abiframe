function [a_hat,E]=sub_a_column_cg(x,a,b,c,eta,lambda,tol,maxiter)
% F(a)=eta*|a*x-b|^2+lambda*|a-c|^2
% Conjugate gradient iterations are performed,
% when size of residual is smaller than tol or
% number of iterations has exceeded maxiter,
% program exits.

%compute the derivative
    function df=inter_df(x,a,b,c)
        v=conv(a,x);
        %e=eta*norm(v-b,'fro')^2+lambda*norm(a-c,'fro')^2;
        df=2*eta*conv(v-b,flipud(x),'valid')+2*lambda*(a-c);
    end
%compute the optimal step size
    function alpha=inter_alpha(x,a,b,c,p)
        rv=conv(a,x)-b;
        pv=conv(p,x);
        sa=eta*dot(rv,pv)+lambda*dot(a-c,p);
        sb=eta*norm(pv(:),2)^2+lambda*norm(p(:),2)^2;
        alpha=-sa/sb;
    end

df=inter_df(x,a,b,c);
%initialize search direction
p=-df;

res=1;
k=1;
E=[];
while res>tol && k<maxiter
%    e=eta*norm(v-b,'fro')^2+lambda*norm(a-c,'fro')^2;
%    E(k)=e;
    k=k+1;
    %compute optimal step size
    alpha=inter_alpha(x,a,b,c,p);
    %update primal variable
    a=a+alpha*p;
    %compure size of update
    res=norm(alpha*p,1);
    %compute the new gradient
    ndf=inter_df(x,a,b,c);
    
    beta=norm(ndf(:),2)^2/norm(df(:),2)^2;
    %compute a new search direction
    p=-ndf+beta*df;    
end
a_hat=a;
end