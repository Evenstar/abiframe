rng(0)
wname='db5';
[l,h]=wfilters(wname);
B=[l;h];
N=200;
[c,s]=wavedec(randn(1,N),1,wname);
len=length(c);
t=sprand(1,len,0.2);
x=waverec(t,s,wname);
if size(x,1)==1
    x=x';
end

%%
rng(1)
[l,h]=wfilters('db3');
DB=[l',h'];
r=6;m=2;eta=50;lambda=1000;
A=DB+randn(size(DB))*0.1;
[H_temp,f_temp]=inter_gen_coef_1d(A',m);
C=zeros(size(f_temp));
B=A;
D=zeros(size(x,1)+r-1,m);
F=zeros(size(D));
lambda=1000;
eta=10;
%%
for k=1:100
    k
D=sub_d(x,A,F,eta);
A=sub_a(x,A,B,C,D,F,eta,lambda,1000);
B=sub_b(A,B,C,1000);
[F,C]=sub_dual(x,A,B,C,D,F);
hamiltonian(A',x')
end
%%
hamiltonian(A',x')
hamiltonian(DB',x')