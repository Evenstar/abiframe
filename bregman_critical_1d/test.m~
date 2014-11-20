%%
rng(0)
wname='db5';
[l,h]=wfilters(wname);
B=[l;h];
N=200;
[c,s]=wavedec(randn(1,N),1,wname);
len=length(c);
t=sprand(1,len,0.2);
x=waverec(t,s,wname);
if size(x,2)==1
    x=x';
end

%%
rng(1)
[l,h]=wfilters('db3');
DB=[l;h];
r=6;m=2;eta=50;lambda=1000;
A=orth(randn(r)); A=A(1:m,:);
a0=DB+randn(size(DB))*0.1;
[~,~,b0]=gen_coef_mat(a0,m);
 for i=1:m
     a0(i,:)=a0(i,:)/norm(a0(i,:));
     b0(i,:)=b0(i,:)/norm(b0(i,:));
 end

ab0=[a0;b0];
maxiter=2000;
[a,b]=fmincon_critical_1d(ab0,x,maxiter);

hamiltonian(DB,x)
%%
awbft_1d_err(x,fliplr(a),b,2)