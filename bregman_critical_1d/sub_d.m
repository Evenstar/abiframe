function D=sub_d(x,A,F,eta)
%F(D)= \|D\|_{1,1} + \eta*\|W_A*x+F-D\|_2^2
    D=zeros(size(F));
    [~,m]=size(A);
    for i=1:m
        a=A(:,i);
        D(:,i)=conv(a,x)+F(:,i);
        D(:,i)=soft(D(:,i),1/eta);
    end
end