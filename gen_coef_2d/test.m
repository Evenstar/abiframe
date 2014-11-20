%% Generate bi-frame
% DESCRIPTIVE TEXT
a=unifrnd(-1,1,5,5,13);
[H,f,b]=gen_coef_mat_2d(a,[2,2]);
x=double(rgb2gray(imread('../star.jpg')))/255;
x=imresize(x,1/8,'cubic');
v=awbft_2d_dec(x,rot90(a,2),[2,2]);
recx=awbft_2d_rec(v,b);
dot(x(:),recx(:))/norm(x(:),2)/norm(recx(:),2)
figure(1)
imdisp(recx)
%%
a=unifrnd(-1,1,5,5,12);
[H,f,b]=gen_coef_mat_2d(a,[2,1]);
x=double(rgb2gray(imread('../star.jpg')))/255;
x=imresize(x,1/8,'cubic');
v=awbft_2d_dec(x,rot90(a,2),[2,1]);
v=v.*(v>0);
recx=awbft_2d_rec(v,b);
dot(x(:),recx(:))/norm(x(:),2)/norm(recx(:),2)
figure(1)
imdisp(recx)
%% An example, Nenya
% DESCRIPTIVE TEXT
CImages=double(imread('barbara.png'))/255;
r=6;
N=5000;
trainImg=titan_build_train(CImages,r,N);
opts.patchSize=[r,r];
opts.numAtoms=9;
opts.lambda=10;
opts.maxIter=200;
[dict,recImg,ratio]=nenya_train(trainImg,opts);
psnr(trainImg,recImg)
ratio
resImg=trainImg-recImg;
L1=sum(abs(resImg(:)))
%%
















