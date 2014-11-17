A=randn(2,6);
[l,h]=wfilters('db3');
%A=[l;h];
[H,f,B]=gen_coef_mat(A,2);
x=randn(1,1000);
awbft_1d_err(x,fliplr(A),B,2);
[U D V]=svd(H);
D
%%
A=[1,2,3;4 5 6];
[H,f,B]=gen_coef_mat(A,1);
H