tf = 10;
N = 100;
t = linspace(1,tf,N);
dt = t(2)-t(1);

% x = [x,y,dxdt,dydt]
x0 = [0;0;5;0];

% initial guess for the plane's
% response
xinit = zeros(size(x0,1)*N,1);

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
    [traj, c] = newtonNd(fhand,xinit,120);
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

xtraj = traj(1:4:end);
ytraj = traj(2:4:end);

plot(xtraj, ytraj, '.:');