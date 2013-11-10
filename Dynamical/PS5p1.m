N = 500;
dx = 1/N;
x0 = zeros(N+1,1);

dt = 0.001;
tf = 5;

u1 = zeros(N+1,1);
u1(N/2) = 0.01;
u = repmat(u1,1,tf/dt+1);

fhand=@(x,u) fbar(x,u,dx);
dfhand=@(x,u) dfbar(x,u,dx);

x = traprule(fhand,dfhand,u,x0,tf,dt);

plot(1:501,x(:,1001),1:501,x(:,2001),1:501,x(:,3001),1:501,x(:,4001),1:501,x(:,5001));