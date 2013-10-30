N = 100;
x0 = zeros(N,1);
fhand = @(x) fjpoisson(x);
[xf,~,nf] = newtonNd(fhand,x0);
[xfgcr,~,nfgcr] = newtonNdGCR(fhand,x0);
semilogy([1:length(nf)],nf/nf(1),'*-',[1:length(nfgcr)],nfgcr/nfgcr(1),'.-');