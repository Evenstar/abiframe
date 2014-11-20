function a_opt=virgin_opt_a(X,A_orth,maxiter,ntrials)
r=size(X,1);
    function E=obj(a)
        E=sum(abs(a'*X));
    end

    function [c,ceq]=nonlcon(a)
        ceq=[norm(a,2)-1;
            vec(a'*A_orth)];
        c=[-vec(a'*X)];
    end
options=optimset('Display','iter','maxiter',maxiter,'MaxFunEvals',2000000, ...
    'TolCon',1e-9);
s=1e8;
for i=1:ntrials
    a0=randn(r,1);
    a0=a0/norm(a0,2);
    a_hat=fmincon(@obj,a0,[],[],[],[],[],[],@nonlcon,options);
    v=obj(a_hat);
    if v<s
        s=v;
        a_opt=a_hat;
    end
end
end