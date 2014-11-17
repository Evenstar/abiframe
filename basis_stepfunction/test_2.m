x=[0 0 1 1 1 1 1 1 1 1 1 1 0 0]';
r=3;m=2;eta=5*1e1;lambda=1e3;
A=orth(randn(r)); A=A(:,1:m);
%A=DB+randn(size(DB))*0.3;
A0=A
Tol=1e-5;
maxiter=100000;
tic
[A,E]=bregman_solve_beta(x,A,eta,lambda,Tol,maxiter);
toc
A
plot(E)
hamiltonian_l1(A,x)
hamiltonian_l1(1/2*[sqrt(2),-sqrt(2)]',x)
hamiltonian_l1([1 0]',x)

%%
% Builds and solves a simple linear program
x=[0 0 1 1 0 0]';
x=randn(1,10000);
tic
echo off
cvx_begin quiet
cvx_precision low
cvx_solver sedumi
   variable a(6)
 %  dual variables  z
   minimize( norm(conv(a,x),1) )
   subject to
   a(1)==1
cvx_end
echo off
a=a/norm(a,2)
toc
%%
N=1000;
r=6;
[c,s]=wavedec(randn(1,N),1,'db3');
len=length(c);
t=sprand(1,len,0.1);
x=waverec(t,s,'db3');
x=x';
m=2;
A=orth(randn(r));A=A(:,1:m);
%%
[l,h]=wfilters('db3');
DB=[l',h'];
DB
Tol=1e-5;
maxiter=10000;
tic
eta=1e2;
lambda=1e3;
[A,E]=bregman_solve_beta(x,A,eta,lambda,Tol,maxiter);
toc
hamiltonian_l1(A,x)
hamiltonian_l1(DB,x)


%%
 A_hat=lp_a(x,A,5)
%%


N=1000;
r=6;
[c,s]=wavedec(randn(1,N),1,'db3');
len=length(c);
t=sprand(1,len,0.1);
x=waverec(t,s,'db3');
x=sin(5*(0.01:0.001:3));
x=x';
m=2;
A=orth(randn(r));A=A(:,1:m);

r=20;m=2;eta=5*1e1;lambda=1e3;
A=orth(randn(r)); A=A(:,1:m);
%A=DB+randn(size(DB))*0.3;
Tol=1e-5;
maxiter=1000;
tic
[A,E]=bregman_solve_beta(x,A,eta,lambda,Tol,maxiter);
toc






