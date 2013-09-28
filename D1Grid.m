function [ A ] = D1Grid( dx )
%1DGRID Summary of this function goes here
%   Detailed explanation goes here

m = floor(1/dx);
R = zeros(3,m-1);
R(1,:) = ones(1,m-1);
R(2,:) = [0:m-2];
R(3,:) = [1:m-1];
A = generateNodalG(R);

end

