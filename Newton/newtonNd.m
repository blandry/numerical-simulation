function [x0,convergence] = newtonNd(fhand,x0,varargin)
% function newtonNd(fhand,x0,itpause)
% 
% INPUTS:
%   fhand - function handle
%   x0    - initial guess
%   itpause - parameter for plotting
% 
% Use Newton's method to solve the nonlinear function
% defined by function handle fhand with initial guess x0.  
%
% itpause is parameter for plotting and defines the 
% number of Newton steps that are plotted sequentially
% pauses between sub-steps

if nargin<2
    error('Must provide two input arguments.  Type ''help newtonNd'' for details');
end

if (size(varargin,2)>1)
    tolf=varargin{3};          % convergence tolerance
else
    tolf=1e-10;
end
tolx=1e-8;
if (size(varargin,2)>1)
    maxIters = varargin{2};
else
    maxIters=50000;       % max # of iterations
end
x00=x0;             % initial guess

% Newton loop
for iter=1:maxIters
    [f J]=fhand(x0);            % evaluate function
    dx=J\(-f);                    % solve linear system
    nf(iter)=norm(f);            % norm of f at step k+1
    ndx(iter)=norm(dx);          % norm of dx at step k+1
    x(:,iter)=x0+dx;              % solution x at step k+1
    x0=x(:,iter);                 % set value for next guess
    if (nf(iter)<tolf && ndx(iter)<tolx)
        % check for convergence
        fprintf('Converged in %d iterations\n',iter);
        display(x0);
        break;
    end
end

convergence = 1;
if iter==maxIters, % check for non-convergence
    fprintf('Non-Convergence after %d iterations!!!\n',iter); 
    convergence = 0;
end

% stuff for plotting
x=[x00,x];
nx=sqrt(sum(abs(x).^2,1));
iters=0:iter;
plot(iters,nx);
