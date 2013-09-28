function [ A ] = D2Grid( dx )
%2DGRID Summary of this function goes here
%   Detailed explanation goes here

m = floor(1/dx);
Rfinal = [];

for k = 1:m
    if (k==m)
        Rh = zeros(3,m-1);
        Rh(1,:) = ones(1,m-1);
        Rh(2,:) = [0:m-2]+k*m;
        Rh(3,:) = [1:m-1]+k*m;
    else
        Rv
    end
end

A = generateNodalG(R);

end

