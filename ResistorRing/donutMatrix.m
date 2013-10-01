function [ A ] = donutMatrix( N )
%DOUGHNUTMATRIX Summary of this function goes here
%   Detailed explanation goes here

A = eye(N)*2;
for i = 1:N
    for j = 1:N
        if (abs(i-j)==1)
            A(i,j)=-1;
        end
    end
end
A(1,N) = -1;
A(N,1) = -1;

end

