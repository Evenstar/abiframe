function [opt,A_hat]=fmin_search11(A0,X,maxiter)
    [r,~]=size(A0);
    function E=obj(A)
        A=reshape(A,[r,r]);
        E=sum(sum(abs(A'*X)));
    end
    
    function [c,ceq]=nonlcon(a)
        a=reshape(a,[r,r]);
        ceq=[a'*a-eye(r)];
         c=[];
    end
  options=optimset('Display','off','maxiter',maxiter,'MaxFunEvals',2000000, ...
 'Algorithm','Interior-Point','TolCon',1e-6);

opt=fmincon(@obj,A0(:),[],[],[],[],[],[],@nonlcon,options);
A_hat=reshape(opt,[r,r]);
opt=obj(A_hat(:));
end