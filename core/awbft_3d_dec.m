function coef=awbft_3d_dec(x,a,M)
    [r1,r2,r3,m]=size(a);
    coef=zeros(size(x,1)+r1-1,size(x,2)+r2-1,size(x,3)+r3-1,m);
    for i=1:m
        temp=convn(x,a(:,:,:,i));
        coef(1:M(1):end,:,:,i)=temp(1:M(1):end,:,:);
        coef(:,1:M(2):end,:,i)=temp(:,1:M(2):end,:);
        coef(:,:,1:M(3):end,i)=temp(:,:,1:M(3):end);
    end
end