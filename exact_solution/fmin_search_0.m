function [E,a_hat]=fmin_search_0(a,X,maxiter)
    function E=obj(a)
        E=sum(abs(a'*X));
    end

    function [c,ceq]=nonlcon(a)
        ceq=[a'*a-1];
        c=[];
    end
options=optimset('Display','off','maxiter',maxiter,'MaxFunEvals',2000000, ...
    'Algorithm','Interior-Point','TolCon',1e-6);

a_hat=fmincon(@obj,a,[],[],[],[],[],[],@nonlcon,options);
E=obj(a_hat);
end