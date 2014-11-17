[l,h]=wfilters('db1');
A=zeros(2,2,4);
A(:,:,1)=l'*l;
A(:,:,2)=l'*h;
A(:,:,3)=h'*l;
A(:,:,4)=h'*h;
x=double(imread('barbara.png'))/255;
B=zeros(size(A));
for i=1:size(A,3)
    B(:,:,i)=rot90(A(:,:,i),2);
end
v=awbft_2d_dec(x,A);
recx=awbft_2d_rec(v,B)/4;
norm(x(:)-recx(:),1)
%%
a=A;
A=[];
A(:,:,1)=[1 2; 3 4];
[H,f,b]=gen_coef_mat_2d(A,[1,1]);