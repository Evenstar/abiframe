%% One Layer without downsampling
% DESCRIPTIVE TEXT

rng(10);
a1=randn(6,6,4);
%[H,f,b1]=gen_coef_mat_2d(a1,[1,1]);
x=double(imread('star.png'))/255;
x=(x-min(x(:)))./(max(x(:))-min(x(:)));
v1=awbft_2d_dec(x,rot2(a1),[1,1]);
%v1=(v1-min(v1(:)))./(max(v1(:))-min(v1(:)))-0.5;
%v1=sigm(v1);
recx=awbft_2d_rec(v1,a1);
recx=(recx-min(recx(:)))./(max(recx(:))-min(recx(:)));
psnr(x,recx)
figure(1);
imdisp(recx)
recx=awbft_2d_rec(v1,b1);
recx=(recx-min(recx(:)))./(max(recx(:))-min(recx(:)));
figure(2);
imdisp(recx);
psnr(x,recx)

%%
%% Two Layers with sampling
% DESCRIPTIVE TEXT

rng(10);
%a1=randn(6,6,6);
%[H,f,b1]=gen_coef_mat_2d(a1,[2,2]);
x=double(imread('star.png'))/255;
x=(x-min(x(:)))./(max(x(:))-min(x(:)));
v1=awbft_2d_dec(x,rot2(a1),[1,1]);
%a2=randn(6,6,6,24);
%[H,f,b2]=gen_coef_mat_3d(a2,[2,2,1]);
v2=awbft_3d_dec(v1,rot3(a2),[2,2,1]);
rv1=awbft_3d_rec(v2,a2);
rv2=awbft_3d_rec(v2,b2);
recx=awbft_2d_rec(rv1,a1);
recx=(recx-min(recx(:)))./(max(recx(:))-min(recx(:)));
psnr(x,recx)
figure(1);
imdisp(recx);

recx=awbft_2d_rec(rv2,b1);
recx=(recx-min(recx(:)))./(max(recx(:))-min(recx(:)));
figure(2);
imdisp(recx);
psnr(x,recx)
%%
CImages=double(imread('../barbara.png'))/255;
r=6;
N=10000;
trainImg=titan_build_train(CImages,r,N);

opts.patchSize=[r,r];
opts.numAtoms=30;
opts.lambda=10;
opts.maxIter=200;
[dict,recImg,ratio]=nenya_train(trainImg,opts);
psnr(trainImg,recImg)
ratio
resImg=trainImg-recImg;
L1=sum(abs(resImg(:)))
dict=reshape(dict',[r,r,1,opts.numAtoms]);
%%
[H,f,b]=gen_coef_mat_2d(dict,[1,1]);
m=size(b,3);
y=dict;
y=reshape(y,r*r,m);
cvx_begin
   variable x(r*r,m)
   minimize(norm(x-1/30*y,1))
   subject to
      H * x(:) == f;
cvx_end
b=reshape(x,[r,r,m]);
imdisp(reshape(b,[r,r,1,opts.numAtoms]))
%%
x=double(imread('star.png'))/255;
x=(x-min(x(:)))./(max(x(:))-min(x(:)));
v=awbft_2d_dec(x,rot2(dict),[1,1]);
v=v.*(v>0);
recx=awbft_2d_rec(v,b);
recx=(recx-min(recx(:)))./(max(recx(:))-min(recx(:)));
psnr(x,recx)
imdisp(recx);





