function v=t2v4(t,r)
    v(4)=ceil(t/r(1)/r(2)/r(3));
    R=t-(v(4)-1)*r(1)*r(2)*r(3);
    v(3)=ceil(R/r(1)/r(2));
    R=R-(v(3)-1)*r(1)*r(2);
    v(2)=ceil(R/r(1));
    v(1)=R-(v(2)-1)*r(1);
end