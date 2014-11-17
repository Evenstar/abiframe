N=1000;
s=1;
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
rng(1)
[l,h]=wfilters('db6');
B=[l;h];
N=1000;
[c,s]=wavedec(randn(N,1),1,'db6');
len=length(c);
t=sprand(1,len,0.1);
x=waverec(t,s,'db6');
if size(x,1)==1
    x=x';
end
[l,h]=wfilters('db6');
DB=[l',h'];
plot(x)
%%
tic
X=sample_1d(x,2000,r);
[A]=tf_1d_adm(orth(randn(r)),X,1000,0.01);
sum(A,2)
toc
%%
r=4;m=4;eta=50;lambda=1e4;
A=orth(randn(r)); A=A(:,1:m);
%A=DB+randn(size(DB))*0.3;
A0=A;
Tol=1e-4;
maxiter=1000;
tic
[A,E]=bregman_solve_beta(x,A,eta,lambda,Tol,maxiter);
toc
A
sum(A)
hamiltonian_l1(A,x)
%%
c=ones(size(A))/2;
hamiltonian_l1(c,x)
hamiltonian_l1(A,x)













