d=3;N=8;
X=unifrnd(0,5,[d,N]);
x=unifrnd(0,5,[d,N]);

for i=1:N
    plot3([0,x(1,i)],[0,x(2,i)],[0,x(3,i)]);hold on;
end
axis equal;
grid on
A_opt=virgin_global(x,5000,5);
B=virgin_opt_a(x,zeros(d,1),5000,5);
max(abs(A'*B))
%%

C=B'*x;
for i=1:N
    C(i)=C(i)/norm(x(:,i));
end
max(abs(C(i)))
%%
for i=1:N
    B(i)=norm(x(:,i));
end
B
%%
for i=1:1
    plot3([0,A(1,i)],[0,A(2,i)],[0,A(3,i)],'r-');hold on;
end

%%
cvx_begin sdp
    variable A(3,3) 
    minimize( sum(sum(A'*(X*X'))))
    subject to
    vec(A'*X)>=0;
    A>=0;
    eye(3)>=A;
cvx_end
[U D V]=svd(A);
U