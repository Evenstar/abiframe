function out=equalizer(x,c)
out=0;
    for i=1:size(x,2)
        out=out+norm(x(:,i)-c,'fro');
    end
end