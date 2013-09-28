function [ A ] = D2Grid( dx )
%2DGRID Summary of this function goes here
%   Detailed explanation goes here

m = floor(1/dx);
R = [];
for j=1:m
    for i=1:m
        n = (j-1)*m+(i-1);
        if (i~=m)
            R = [R,[1;n;n+1]];
        end
        if (j~=m)
            R = [R,[1;n;n+m]];
        end
    end
end
A = generateNodalG(R);

end

