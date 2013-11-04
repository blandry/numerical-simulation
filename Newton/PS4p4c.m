tf = 10;
N = 100;
t = linspace(1,tf,N);
dt = t(2)-t(1);

% x = [x,y,dxdt,dydt]
x0 = [0;0;5;0];

% input of the plane
u = [ones(N/4,1);zeros(3*N/4,1)];

% initial guess for the plane's
% response
xinit = zeros(size(x0,1)*N,1);

% simulating the plane
fhand = @(x) fjplane(x,x0,u,dt);
traj = newtonNdGCR(fhand,xinit);

xtraj1 = traj(1:4:end);
ytraj1 = traj(2:4:end);

maxIters = 500;
lambda = 0;
dlambda = 0.1;
for i=1:maxIters
    if (lambda > 1)
        lambda = 1;
    end
    
    % input to the plane
    u = lambda*[2*ones(N/4,1);zeros(3*N/4,1)];
    
    % simulating the plane
    fhand = @(x) fjplane(x,x0,u,dt);
    [traj, c] = newtonNdGCR(fhand,xinit,120);
    if (lambda==1)
        break;
    end
    if c
        dlambda = dlambda*2.0;
        lambda = lambda + dlambda;
    else
        dlambda = dlambda/2.0;
        lambda = lambda - dlambda;
    end
    xinit = traj;
    
end

xtraj2 = traj(1:4:end);
ytraj2 = traj(2:4:end);

plot(xtraj1, ytraj1, '.:', xtraj2, ytraj2, '.:');