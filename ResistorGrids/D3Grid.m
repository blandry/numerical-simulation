function [ A ] = D3Grid( dx )
%3DGRID Summary of this function goes here
%   Detailed explanation goes here

m = floor(1/dx);
R = [];
for k=1:m
    for j=1:m
        for i=1:m
            n = (k-1)*m^2+(j-1)*m+(i-1);
            if (i~=m)
                R = [R,[1;n;n+1]];
            end
            if (j~=m)
                R = [R,[1;n;n+m]];
            end
            if (k~=m)
                R = [R,[1;n;n+m^2]];
            end
        end
    end
end
A = generateNodalG(R);

end

