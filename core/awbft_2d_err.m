function err=awbft_2d_err(x,a,b,M)
    v=awbft_2d_dec(x,a,M);
    recx=awbft_2d_rec(v,b);
    err=norm(x(:)-recx(:),'fro');
end