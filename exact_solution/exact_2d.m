d=2;N=30;
x=unifrnd(0,5,[d,N]);
x=abs(randn(d,N));
y=zeros(size(x));
figure(1)
for i=1:N
    if (x(2,i)>x(1,i))
      %  t=x(2,i);
    %   x(2,i)=x(1,i);
       % x(1,i)=t;
    end
    plot([0,x(1,i)],[0,x(2,i)]);hold on;
end
    axis equal;
    

F=@(a) sum(sum(abs(a'*x)));
s=1e8;
opt=1e8;
E=[];
k=1;
for theta=0:0.001:pi/2
    a=[cos(theta),sin(theta)]';
    b=[-sin(theta),cos(theta)]';
    if F(a)+F(b)<s
        s=F(a)+F(b);
        opt=a;
    end
    E(k)=F(a)+F(b);
    k=k+1;
end
plot([0,opt(1)],[0,opt(2)],'r-'); hold on;
figure(2);
plot(0:0.001:pi/2, E)