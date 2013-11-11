tf = 20;
N = 200;
t = linspace(0,tf,N);
dt = t(2)-t(1);

% x = [x,y,dxdt,dydt]
x0 = [0;0;5;0];

% input of the plane - thrust vector [dx/dt;dy/dt]
u = [repmat([1;0],1,N/8),zeros(2,N/4),repmat([1;20],1,N/8),zeros(2,N/2)];

f = @(x,u) fplane(x,u);
df = @(x,u) dfplane(x,u);

% simulating the plane
trajTrap = traprule(f,df,u,x0,tf,dt);
xtrajTrap = trajTrap(1:4:end);
ytrajTrap = trajTrap(2:4:end);
trajForEuler = foreuler(f,df,u,x0,tf,dt);
xtrajForEuler = trajForEuler(1:4:end);
ytrajForEuler = trajForEuler(2:4:end);

plot(xtrajTrap, ytrajTrap, '.:', xtrajForEuler, ytrajForEuler, '.:');
legend('Trapezoidal', 'Forward Euler');