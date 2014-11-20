function E=obj2d(a,b,c)
    E=0;
    for i=1:length(b)
        E=E+c(i)*abs(cos(a+b(i)))+c(i)*abs(sin(a+b(i)));
    end
end