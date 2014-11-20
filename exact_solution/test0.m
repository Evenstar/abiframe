b=unifrnd(0,pi/4,1,5);
c=unifrnd(0,5,1,5);
S=1e6;
opt=1e6;
k=1;
E=[];
for a=0:0.001:pi
%     if obj2d(a,b,c)<S
%         S=obj2d(a,b,c);
%         opt=a;
%     end
E(k)=obj2d(a,b,c);
k=k+1;
end
I=0:0.001:pi;
plot(I,E)