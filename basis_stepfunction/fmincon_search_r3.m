function opt=fmincon_search_r3(a,x,maxiter)
    [r,m]=size(a);
    function e=obj(a)
        a=reshape(a,[r,m]);
        e=energy(a,x);
    end
    
    function [c,ceq]=nonlcon(a)
        a=reshape(a,[r,m]);
        ceq=[norm(a(1,:))-1;
             norm(a(2,:))-1;
             norm(a(3,:))-1;
             a(1,:)*a(2,:)';
             a(1,:)*a(3,:)';
             a(2,:)*a(3,:)'];
         c=[];
    end
    
    function out=energy(a,x)
        out=0;
        for i=1:size(x,2)
            for j=1:m
                out=out+abs(dot(a(:,j),x(:,i)));
            end
        end
    end
options=optimset('Display','off','maxiter',maxiter,'MaxFunEvals',2000000, ...
 'TolCon',1e-4);
opt=fmincon(@obj,a,[],[],[],[],[],[],@nonlcon,options);
energy(opt,x)
opt=reshape(opt,[r,m]);
end