rng(3)
a=randn(6,6,12);
[H,f,b]=gen_coef_mat_2d(a,[1,2]);
x=double(imread('star.png'))/255;
v=awbft_2d_dec(x,rot90(a,2),[1,2]);
recx=awbft_2d_rec(v,a);
dot(x(:),recx(:))/norm(x(:),2)/norm(recx(:),2)
figure(1)
imdisp(recx)
set(gcf, 'PaperPositionMode', 'auto');
print -depsc2 star_wrong.eps
close;
%%
recx=awbft_2d_rec(v,b);
figure(2)
imdisp(recx)
set(gcf, 'PaperPositionMode', 'auto');
print -depsc2 star_correct.eps
close;