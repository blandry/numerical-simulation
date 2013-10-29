N = 100;
x0 = zeros(N,1);
fhand = @(x) fjpoisson(x);
%xf = newtonNd(fhand,x0);
xfgcr = newtonNdGCR(fhand,x0);