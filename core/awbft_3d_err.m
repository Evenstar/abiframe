function err=awbft_3d_err(x,a,b,M)
    v=awbft_3d_dec(x,a,M);
    recx=awbft_3d_rec(v,b);
    err=norm(x(:)-recx(:),'fro');
end