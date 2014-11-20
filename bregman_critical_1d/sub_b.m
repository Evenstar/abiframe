function [B_hat]=sub_b(A,B,C,maxiter)
[r,m]=size(A);
    function e=obj(B)
        [H,f]=inter_gen_coef_1d(A',m);
        e=norm(H*B(:)-f+C,'fro');
    end
options=optimset('Display','off','maxiter',maxiter,'MaxFunEvals',20000000, ...
    'GradObj','Off');
B_hat=fminunc(@obj,B(:),options);
B_hat=reshape(B_hat,[r,m]);
end