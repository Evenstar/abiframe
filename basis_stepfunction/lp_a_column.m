function a_hat=lp_a_column(x,a,A)
r=length(a);
cvx_begin quiet
cvx_precision low
cvx_solver sedumi
   variable a(r)
   minimize( norm(conv(a,x),1) )
   subject to
     a(1)==1;
     A'*a==0;
cvx_end
a_hat=a/norm(a,2);
end