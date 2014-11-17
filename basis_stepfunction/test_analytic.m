%%
x=[0 0,ones(1,100), 0 0]';
F=@(a)norm(conv(fliplr(a),x),1);
cvx_begin quiet
cvx_precision low
cvx_solver sedumi
   variable a(4)
   minimize( norm(conv(fliplr(a),x),1) )
   subject to
   a(1)==1;
cvx_end
%%
r=4;
X=sample_1d(x,2000,r);
[A]=tf_1d_adm(orth(randn(r)),X,1000,0.01)
A
sum(A,2)
%%
r=3;m=2;eta=100;lambda=1e4;
A=orth(randn(r)); A=A(:,1:m);
A0=A;
Tol=1e-4;
maxiter=1000;
tic
[A,E]=bregman_solve_beta(x,A,eta,lambda,Tol,maxiter);
toc
plot(E)
hamiltonian_l1(A,x)
hamiltonian_l1(eye(4),x)
sum(A)
%%
a_hat=lp_a_column(x,[1 0 0 0 ],A)
%%
N=1000;
s=2;
p=0.5;
x=[];
for i=1:N
    a=binornd(1,p);
    if a==1
        x=[x;ones(s,1)];
    else
        x=[x;zeros(s,1)];
    end
end
x=x-mean(x);
plot(x)
[l,h]=wfilters('db1');
DB=[l',h'];
%%
r=4;m=2;eta=50;lambda=1e4;
A=orth(randn(r)); A=A(:,1:m);
Tol=1e-4;
maxiter=2000;
tic
[A,E]=bregman_solve_beta(x,A,eta,lambda,Tol,maxiter);
toc
plot(E)
A
hamiltonian_l1(A,x)
hamiltonian_l1([1 1 1 1]/2,x)
sum(A)
%%
x=ones(1,1000);
x(1:3:end)=-1;
x=[0 0 x 0 0];
x=x';
r=3;m=3;eta=50;lambda=1e4;
A=orth(randn(r)); A=A(:,1:m);
A0=A;
Tol=1e-4;
maxiter=1000;
tic
[A,E]=bregman_solve_beta(x,A,eta,lambda,Tol,maxiter);
toc
plot(E)
A
hamiltonian_l1(A,x)
hamiltonian_l1(eye(r),x)
sum(A)
%%
Y=sample_1d(x,30000,4);
[U D V]=svd(Y);
sum(U)

%% 3 Vectors in R3
% DESCRIPTIVE TEXT
x=randn(3,3);

r=3;m=3;eta=100;lambda=1e4;
A=orth(randn(r)); A=A(:,1:m);
A0=A;
Tol=1e-4;
maxiter=1000;
tic
[A,E]=bregman_solve_beta(x,A,eta,lambda,Tol,maxiter);
toc
plot(E)
hamiltonian_l1(A,x)
hamiltonian_l1(eye(4),x)
sum(A)

%%
x=randn(3);
norm(x(:,1))
norm(x(:,2))
norm(x(:,3))

%%
r=3;m=3;eta=100;lambda=1e4;
a=orth(randn(r)); a=a(:,1:m);
a=fmincon_search_r3(a,x,maxiter);
for i=1:3
    for j=1:3
        D(i,j)=dot(a(:,i),x(:,j))/norm(a(:,i),2)/norm(x(:,j),2);
    end
end
D
%%
pro=x(:,2)-dot(x(:,2),x(:,1))/norm(x(:,1))^2*x(:,1)
for i=1:3
    dot(a(:,i),pro)/norm(pro)
end












