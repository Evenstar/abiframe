function coef=awbft_2d_dec(x,a,M)
    [~,r,m]=size(a);
    coef=zeros(size(x,1)+r-1,size(x,2)+r-1,m);
    for i=1:m
        temp=conv2(x,a(:,:,i));
        coef(1:M(1):end,:,i)=temp(1:M(1):end,:);
        coef(:,1:M(2):end,i)=temp(:,1:M(2):end);
    end
end