function [A,f,b]=gen_coef_mat_3d(a,M)
[r1,r2,r3,m]=size(a);
M1=M(1);M2=M(2);M3=M(3);
A=[];f=[];
t=1;
%build matrix
for gamma1=0:M1-1
    for gamma2=0:M2-1
        for gamma3=0:M3-1
            for k1=-r1+1:r1-1
                for k2=-r2+1:r2-1
                    for k3=-r3+1:r3-1
                        T=zeros(1,r1*r2*r3*m);
                        for n1=0:ceil((r1-gamma1)/M1)
                            for n2=0:ceil((r2-gamma2)/M2)
                                for n3=0:ceil((r3-gamma3)/M3)
                                    if 1<=M1*n1+gamma1 && M1*n1+gamma1<=r1 && 1<=M1*n1+gamma1+k1 && M1*n1+gamma1+k1<=r1 ...
                                            && 1<=M2*n2+gamma2 && M2*n2+gamma2<=r2 && 1<=M2*n2+gamma2+k2 && M2*n2+gamma2+k2<=r2 ...
                                            && 1<=M3*n3+gamma3 && M3*n3+gamma3<=r3 && 1<=M3*n3+gamma3+k3 && M3*n3+gamma3+k3<=r3
                                        for l=1:m
                                            id1=M1*n1+gamma1;
                                            id2=M2*n2+gamma2;
                                            id3=M3*n3+gamma3;
                                            id4=l;
                                            T(v2t4([id1,id2,id3,id4],[r1,r2,r3]))=a(id1+k1,id2+k2,id3+k3,id4);
                                        end
                                    end
                                end
                            end
                        end
                        if norm(T(:))>1e-8
                            A=[A;T];
                            if k1==0 && k2==0 &&k3==0
                                f=[f;1];
                            else
                                f=[f;0];
                            end
                        end
                    end
                end
            end
            t=t+1;
        end
    end
end
b=A\f;
err=norm(A*b-f,1);
if abs(err)>1e-4
    warning('only L_2 solution found');
end
b=reshape(b,[r1,r2,r3,m]);
end