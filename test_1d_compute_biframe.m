%%
r=4;
m=3;
N=5000;
f=3;
a=orth(randn(r,r)); 
a=a(1:m,:);
b=orth(randn(r,r));
b=b(1:m,:);
x=randn(1,N);
b=fmin_seek(x,a,b,f,100000);
err=awbft_1d_err(x,a,b,f)
b
%%