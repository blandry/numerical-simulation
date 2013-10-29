function [ F J ] = fjpoisson( x )
%FJPOISSON Summary of this function goes here
%   Detailed explanation goes here

N = size(x,1); % size of the grid
dx = 1/(N+1);

V = 10; % voltage at each end

F = zeros(N,1);
F(1,1) = 2*x(1,1)-x(2,1)-(-V)+dx^2*(exp(x(1,1))-exp(-x(1,1)));
for i=2:N-1
   F(i,1) = 2*x(i,1)-x(i+1,1)-x(i-1,1)+dx^2*(exp(x(i,1))-exp(-x(i,1))); 
end
F(N,1) = 2*x(N,1)-x(N-1,1)-V+dx^2*(exp(x(N,1))-exp(-x(N,1)));

J = zeros(N);
for i=1:N
    J(i,i)=2+dx^2*(exp(x(i,1))+exp(-x(i,1)));
    if i~=1
        J(i,i-1)=-1;
    end
    if i~=N
        J(i,i+1)=1;
    end
end

end

