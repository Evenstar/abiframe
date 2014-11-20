[l,h]=wfilters('db3');
a=zeros(6,6,6,8);
a(:,:,:,1)=reshape(kron(kron(l,l),l),[6,6,6]);
a(:,:,:,2)=reshape(kron(kron(l,l),h),[6,6,6]);
a(:,:,:,3)=reshape(kron(kron(l,h),l),[6,6,6]);
a(:,:,:,4)=reshape(kron(kron(l,h),h),[6,6,6]);
a(:,:,:,5)=reshape(kron(kron(h,l),l),[6,6,6]);
a(:,:,:,6)=reshape(kron(kron(h,l),h),[6,6,6]);
a(:,:,:,7)=reshape(kron(kron(h,h),l),[6,6,6]);
a(:,:,:,8)=reshape(kron(kron(h,h),h),[6,6,6]);
b=a;
for i=1:8
    b(:,:,:,i)=flip(b(:,:,:,i),1);
    b(:,:,:,i)=flip(b(:,:,:,i),2);
    b(:,:,:,i)=flip(b(:,:,:,i),3);
end
x=randn(12,12,6);

v=awbft_3d_dec(x,a,[2,2,2]);
recx=awbft_3d_rec(v,b);
recx=recx;
max(x(:))/max(recx(:))
dot(recx(:),x(:))/norm(x(:))/norm(recx(:))
norm(x(:)-recx(:),'fro');

%%
a=randn(5,5,3,48);
tic
[A,f,b]=gen_coef_mat_3d(a,[2,2,2]);
toc
tic
x=randn(50,50,10);
a=rot3(a);
v=awbft_3d_dec(x,a,[2,2,2]);
recx=awbft_3d_rec(v,rot3(a));
dot(x(:),recx(:))/norm(x(:))/norm(recx(:))
toc