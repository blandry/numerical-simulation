function [ k ] = provokeOverflow( )
%PROVOKEOVERFLOW Summary of this function goes here
%   Detailed explanation goes here

load('data/test.mat');
x = M*x;
k = 2;
while (x > 0)
    x = M*x;
    k = k+1;
end
k = k-1;

end

