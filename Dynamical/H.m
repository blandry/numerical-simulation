function [ dx0xf ] = H( x0, T )
%PERIODIC Summary of this function goes here
%   Detailed explanation goes here

fhand=@(x,u) fperiodic(x,u);
dfhand=@(x,u) dfperiodic(x,u);
u=linspace(0,T,200);
x=traprule(fhand,dfhand,u,x0,T,u(2)-u(1));
dx0xf=x0-x(:,end);

end

