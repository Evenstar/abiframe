function P_hat=sub_p(A,C)
%F(P)= \|P-(A+C)\|_2^2 s.t. P^TP=I
[U,~,V]=svd(A+C);
P_hat=U*eye(size(U,1),size(V,1))*V';
end