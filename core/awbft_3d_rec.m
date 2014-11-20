function x=awbft_3d_rec(v,b)
    [r1,r2,r3,m]=size(b);
    x=zeros(size(v,1)-r1+1,size(v,2)-r2+1,size(v,3)-r3+1);
    for i=1:m
        x=x+convn(v(:,:,:,i),b(:,:,:,i),'valid');
    end
end