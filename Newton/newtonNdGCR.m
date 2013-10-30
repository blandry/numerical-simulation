function [x0,convergence,nf] = newtonNdGCR(fhand,x0,varargin)
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
    error('Must provide two input arguments.  Type ''help newtonNdGCR'' for details');
end

tolf=1e-10;
tolx=1e-8;
maxIters=500000;       % max # of iterations

x00=x0;             % initial guess

% Newton loop
for iter=1:maxIters
    [f,~]=fhand(x0);          % just to check convergence
    dx=tgcrJFree(fhand,x0);      % solve linear system using GCR
    nf(iter)=norm(f);            % norm of f at step k+1
    ndx(iter)=norm(dx);          % norm of dx at step k+1
    x(:,iter)=x0+dx;              % solution x at step k+1
    x0=x(:,iter);                 % set value for next guess
    if (nf(iter)<tolf && ndx(iter)<tolx)
        % check for convergence
        fprintf('Jacobian-free Newton converged in %d iterations\n',iter);
        break;
    end
end

convergence = 1;
if iter==maxIters, % check for non-convergence
    fprintf('Non-Convergence after %d iterations!!!\n',iter); 
    convergence = 0;
end