function [ temp ] = barTemp( dx, km, ka )
%PLOTBAR Summary of this function goes here
%   Detailed explanation goes here

if (nargin<1)
    dx = 0.001;
end
if (nargin<2)
    km = 0.2;
end
if (nargin<3)
    ka = 0.005;
end

[ R, Isource, Vsource ] = barToCircuit( dx, km, ka );
[ A, b ] = generateNodeBranchSystem( R, Isource, Vsource );
x = A\b;

temp = x(end-floor(1/dx-1):end-1);

if (nargout<1)
    plot(temp);
end

end

