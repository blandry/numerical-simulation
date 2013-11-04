tf = 10;
N = 100;
t = linspace(1,tf,N);
dt = t(2)-t(1);

% x = [x,y,dxdt,dydt]
x0 = [0;0;2;0];

% input of the plane
%u = [1.6*ones(N/4,1);zeros(3*N/4,1)];
u = rand(N,1);

% initial guess for the plane's
% response
xinit = zeros(size(x0,1)*N,1);
%data = load('test.mat');
%xinit = data.traj;

% simulating the plane
fhand = @(x) fjplane(x,x0,u,dt);
traj = newtonNd(fhand,xinit);

xtraj = traj(1:4:end);
ytraj = traj(2:4:end);

plot(xtraj, ytraj, '.:');