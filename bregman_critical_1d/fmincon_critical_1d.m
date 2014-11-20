function [a,b]=fmincon_critical_1d(ab,x,maxiter)
[M,r]=size(ab);
m=M/2;
    function e=obj(ab)
        ab=reshape(ab,[2*m,r]);
        a=ab(1:m,:);
        e=hamiltonian(a,x);
    end

    function [c,ceq]=nonlcon(ab)
        ab=reshape(ab,[2*m,r]);
        a=ab(1:m,:);
        b=ab(m+1:end,:);
        [A,f]=inter_gen_coef_1d(a,m);
        N=zeros(m,1);
        for k=1:m
            N(k)=norm(a(k,:),2)-1;
        end
        ceq=[A*vec(b')-f;
            N];
        c=[];
    end
options=optimset('Display','iter','maxiter',maxiter,'MaxFunEvals',2000000, ...
    'Algorithm','Interior-Point','TolCon',1e-9);
opt=fmincon(@obj,ab(:),[],[],[],[],[],[],@nonlcon,options);
opt=reshape(opt,[2*m,r]);
obj(ab)
obj(opt)
a=opt(1:m,:);
b=opt(m+1:end,:);
end

function [A,f]=inter_gen_coef_1d(a,M)
[m,r]=size(a);
A=[];
f=[];
t=1;
%build matrix
for gamma=0:M-1
    for k=-r+1:r-1
        T=zeros(1,m*r);
        for n=0:ceil((r-gamma)/M)
            if 1<=M*n+gamma && M*n+gamma<=r && 1<=M*n+gamma+k && M*n+gamma+k<=r
                for l=1:m
                    T((l-1)*r+M*n+gamma)=a(l,M*n+gamma+k);
                end
            end
            
        end
        if norm(T)>1e-8
            A=[A;T];
            if k==0
                f=[f;1];
            else
                f=[f;0];
            end
        end
        t=t+1;
    end
end
end