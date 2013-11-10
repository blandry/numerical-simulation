function [ f ] = fbar( x, u, dx )
%FBAR Summary of this function goes here
%   Detailed explanation goes here

f=zeros(size(x,1),1);
f(1,1)=u(1,1)+(x(2,1)-2*x(1,1))/dx^2;
for i=2:size(f,1)-1
    f(i,1)=u(i,1)+(x(i+1,1)-2*x(i,1)+x(i-1,1))/dx^2;
end
f(end,1)=u(end,1)+(x(end-1,1)-2*x(end,1))/dx^2;

end

