T=1;
x0=1;
fhand=@(x) H(x,T);
x0=newtonNdGCR(fhand,x0);

% Plot the periodic result
fhand=@(x,u) fperiodic(x,u);
dfhand=@(x,u) dfperiodic(x,u);
u=linspace(0,T,200);
x=traprule(fhand,dfhand,u,x0,T,u(2)-u(1));
plot(linspace(0,T,200),x);