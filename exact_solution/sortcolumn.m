function A_hat=sortcolumn(A)
    a=sum(A);
    [~,b]=sort(a);
    A_hat=A(:,b);
end