%%
rng(1)
[l,h]=wfilters('db3');
B=[l;h];
N=20;
[c,s]=wavedec(randn(1,N),1,'db3');
len=length(c);
t=sprand(1,len,0.2);
x=waverec(t,s,'db3');
if size(x,2)==1
    x=x';
end
[l,h]=wfilters('db3');
DB=[l;h];
%%
rng(1)
r=6;m=2;eta=50;lambda=1000;
A=orth(randn(r)); A=A(1:m,:);
a0=DB;
b0=a0;
ab0=[a0;b0];
maxiter=50;
[a,b]=fmincon_critical_1d(ab0,x,maxiter);