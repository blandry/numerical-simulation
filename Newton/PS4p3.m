N = 100;
x0 = zeros(N,1);
fhand = @(x) fjpoisson(x);
xfgcr = newtonNdGCR(fhand,x0);