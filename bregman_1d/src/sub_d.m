function D=sub_d(x,A,B,eta)
%F(D)= \|D\|_{1,1} + \|W_A*x+B-D\|_2^2
    D=zeros(size(B));
    [~,m]=size(A);
    for i=1:m
        a=A(:,i);
        D(:,i)=conv(a,x)+B(:,i);
        D(:,i)=soft(D(:,i),1/eta);
    end
end