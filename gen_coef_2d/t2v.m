function [i,j,k]=t2v(t,r)
    k=ceil(t/r/r);
    R=t-(k-1)*r*r;
    j=ceil(R/r);
    i=R-(j-1)*r;
end