function a=vec2tensor(v,r)
a=zeros(r(1),r(2),r(3),r(4));
for t=1:length(v)
    idx=t2v4(t,[r(1),r(2),r(3)]);
    a(idx(1),idx(2),idx(3),idx(4))=v(t);
end
end