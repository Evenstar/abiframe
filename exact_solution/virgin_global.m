function A_opt=virgin_global(X,maxiter,ntrials)
r=size(X,1);
    function E=obj(A)
        A=reshape(A,[r,r]);
        E=sum(sum(abs(A'*X)));
    end

    function [c,ceq]=nonlcon(a)
        a=reshape(a,[r,r]);
        ceq=[a'*a-eye(r)];
        c=[-vec(a'*X)];
    end
options=optimset('Display','iter','maxiter',maxiter,'MaxFunEvals',2000000, ...
    'TolCon',1e-9);
s=1e9;
A_opt=zeros(r,r);
for i=1:ntrials
    A0=orth(randn(r));
    a_hat=fmincon(@obj,A0(:),[],[],[],[],[],[],@nonlcon,options);
    v=obj(a_hat);
    b=reshape(a_hat,[r,r]);
    if norm(b'*b-eye(r),'fro')<1e-6 && ...
            abs(sum(vec(b'*X))-sum(vec(abs(b'*X))))<1e-6
    if v<s
        s=v;
        A_opt=a_hat;
    end
    end
end
A_opt=reshape(A_opt,[r,r]);
for k=1:r
    if sum(A_opt(:,k))<0
        A_opt(:,k)=-A_opt(:,k);
    end
end
end