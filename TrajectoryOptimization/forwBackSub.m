function [ x ] = forwBackSub( L, U, b )
%FORWBACKSUB Summary of this function goes here
%   Detailed explanation goes here

y = zeros(length(b),1);
for i=1:length(y)
    rowsum = 0;
    for j=1:i-1
        rowsum = rowsum + L(i,j)*y(j,1);
    end
    y(i,1) = (1/L(i,i))*(b(i,1)-rowsum);
end
x = zeros(length(b),1);
for i=length(x):-1:1
    rowsum = 0;
    for j=i+1:length(x)
        rowsum = rowsum + U(i,j)*x(j,1);
    end
    x(i,1) = (y(i,1)-rowsum)/U(i,i);
end
    
end

