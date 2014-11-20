function [F_hat,C_hat]=sub_dual(x,A,B,C,D,F)
[r,m]=size(A);
V=zeros(length(x)+r-1,m);
for i=1:m
    V(:,i)=conv(A(:,i),x);
end
[H,f]=inter_gen_coef_1d(A',m);
F_hat=F+V-D;
C_hat=C+H*B(:)-f;
end