function [A,f,b]=gen_coef_mat_2d(a,M)
%size of a is (r,r,m)
%M=(M1,M2)
[r,~,m]=size(a);
A=[];
f=[];
t=1;
M1=M(1);
M2=M(2);
%build matrix
for gamma1=0:M1-1
    for gamma2=0:M2-1
        for k1=-r+1:r-1
            for k2=-r+1:r-1
                T=zeros(1,r*r*m);
                for n1=0:ceil((r-gamma1)/M(1))
                    for n2=0:ceil((r-gamma2)/M(2))
                        if 1<=M1*n1+gamma1 && M1*n1+gamma1<=r && 1<=M1*n1+gamma1+k1 && M1*n1+gamma1+k1<=r ...
                                && 1<=M2*n2+gamma2 && M2*n2+gamma2<=r && 1<=M2*n2+gamma2+k2 && M2*n2+gamma2+k2<=r
                            
                            
                            for l=1:m
                                id1=M1*n1+gamma1;
                                id2=M2*n2+gamma2;
                                id3=l;
                                T(v2t(id1,id2,id3,r))=a(id1+k1,id2+k2,id3);
                            end
                        end
                    end
                end
                if norm(T(:))>1e-8
                    A=[A;T];
                    if k1==0 && k2==0
                        f=[f;1];
                    else
                        f=[f;0];
                    end
                end
                t=t+1;
            end
        end
    end
end
b=A\f;
err=norm(A*b-f,1);
if abs(err)>1e-4
    warning('only L_2 solution found');
end
b=vec2mat(b,r,m);
end


