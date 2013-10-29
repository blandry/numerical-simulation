function [x0,convergence] = newton1d(fhand,x0,itpause,varargin)
% function newton1d(fhand,x0,itpause)
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

if nargin<3
    error('Must provide three input arguments.  Type ''help newton1d'' for details');
end

if (size(varargin,2)>1)
    tolf=varargin{3};          % convergence tolerance
else
    tolf=1e-12;
end
tolx=1e-12;
tolr=1e-12;
if (size(varargin,2)>1)
    maxIters = varargin{2};
else
    maxIters=500;       % max # of iterations
end
x00=x0;             % initial guess

% Newton loop
for iter=1:maxIters
    [f J]=fhand(x0);            % evaluate function
    dx=-f/J;                    % solve linear system
    nf(iter)=abs(f);            % norm of f at step k+1
    ndx(iter)=abs(dx);          % norm of dx at step k+1
    x(iter)=x0+dx;              % solution x at step k+1
    x0=x(iter);                 % set value for next guess
    if (nf(iter)<tolf && ndx(iter)<tolx)
        if (iter>1)
            if (abs(ndx(iter)/x(iter-1))<tolr)
                % check for convergence
                fprintf('Converged to x=%4.12e in %d iterations\n',x0,iter);
                break;
            end
        else
            fprintf('Converged to x=%4.12e in %d iterations\n',x0,iter);
            break;
        end
    end
end

convergence = 1;
if iter==maxIters, % check for non-convergence
    fprintf('Non-Convergence after %d iterations!!!\n',iter); 
    convergence = 0;
end

% stuff for plotting
x=[x00,x];
xmax=max(abs(x));
xrange=linspace(-xmax,xmax,5000);
[frange Jrange]=fhand(xrange);
[fg Jg]=fhand(x);
iters=1:iter;

% plot a few things
if ~isempty(varargin) && strcmp(varargin{1},'off')
else
    plot_newton1d(x,fg,iters,ndx,xrange,frange,itpause);
end