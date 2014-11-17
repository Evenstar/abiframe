function [A_hat,E]=bregman_solve(x,A,eta,lambda,Tol,maxiter)
[r,m]=size(A);
D=zeros(length(x)+r-1,m);
B=zeros(size(D));
P=A;
C=zeros(size(A));
k=1;
res=1e9;
while k<maxiter && res>Tol
    for i=1:1
        D=sub_d(x,A,B,eta);
        A=sub_a(x,A,B,C,D,P,eta,lambda,1e-4,5);
    end
    %A=sub_a(x,A,B,C,D,P,eta,lambda,1e-4,5);
    P=sub_p(A,C);
    B_old=B;
    [B,C]=sub_dual(x,A,B,C,D,P);
    res=norm(B_old(:)-B(:),1);
    E(k)=hamiltonian_l1(A,x);
    k=k+1;
end
A_hat=A;

end