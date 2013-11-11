N = 500;
dx = 1/N;
x0 = zeros(N+1,1);

dt = 0.001;
tf = 5;

u1 = zeros(N+1,1);
u1(N/2,1) = 1;
u = repmat(u1,1,tf/dt+1);

fhand=@(x,u) fbar(x,u,dx);
dfhand=@(x,u) dfbar(x,u,dx);

x = traprule(fhand,dfhand,u,x0,tf,dt);
%x = foreuler(fhand,dfhand,u,x0,tf,dt);

plot(1:501,x(:,1),1:501,x(:,1001),1:501,x(:,2001),1:501,x(:,3001),1:501,x(:,4001),1:501,x(:,5001));
legend('t=0','t=1','t=2','t=3','t=4','t=5');
%plot(linspace(0,tf,tf/dt+1),x(250,:));