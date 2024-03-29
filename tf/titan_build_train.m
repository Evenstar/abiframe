function imgPatch=titan_build_train(CImages,M,N)
[m1,m2,n]=size(CImages);
imgPatch=zeros(M,M,N);
for i=1:N
    k=randsample(n,1);
    x=randsample(m1-M+1,1);
    y=randsample(m2-M+1,1);
    patch=CImages(x:x+M-1,y:y+M-1,k);
    imgPatch(:,:,i)=patch;
end
end