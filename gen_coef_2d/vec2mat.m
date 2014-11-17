function a=vec2mat(v,r,m)
    a=zeros(r,r,m);
    for t=1:length(v)
        [i,j,k]=t2v(t,r);
        a(i,j,k)=v(t);
    end
end