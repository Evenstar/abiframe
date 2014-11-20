function [A_hat]=sub_a(x,A,B,C,D,F,eta,lambda,maxiter)
    [r,m]=size(A);
    function e=obj(A)
        A=reshape(A,[r,m]);
        R=zeros(size(D));
        for i=1:m
            R(:,i)=conv(A(:,i),x);
        end
        e1=norm(R-D+F,'fro')^2; %reconstruction error
        [H,f]=inter_gen_coef_1d(A',m);
        e2=norm(H*B(:)-f+C,'fro')^2; %AB relation
        e=eta*e1+lambda*e2;
    end

    function [c,ceq]=nonlcon(A)
        A=reshape(A,[r,m]);
        N=zeros(m,1);
        for k=1:m
            N(k)=norm(A(:,k),2)-1;
        end
        ceq=[N];
        c=[];
    end
    options=optimset('Display','off','maxiter',maxiter,'MaxFunEvals',20000000, ...
        'TolCon',1e-8);
    A_hat=fmincon(@obj,A(:),[],[],[],[],[],[],@nonlcon,options);
    A_hat=reshape(A_hat,[r,m]);
end

