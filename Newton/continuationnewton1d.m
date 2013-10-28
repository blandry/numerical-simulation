function x0  = continuationnewton1d(z,x0,itpause)
%CONTINUATIONNEWTON1D Summary of this function goes here
%   Detailed explanation goes here

maxIters = 500;
lambda = 0;
dlambda = 0.1;
for i=1:maxIters
    if (lambda > 1)
        lambda = 1;
    end
    fhand = @(x) ft(x,z,lambda);
    if (lambda~=1)
        [x0,c] = newton1d(fhand,x0,itpause,'off',10,lambda*1e-12+(1-lambda)*0.01);
    else
        [x0,c] = newton1d(fhand,x0,itpause,'on');
        break;
    end
    if c
        dlambda = dlambda*2.0;
        lambda = lambda + dlambda;
    else
        dlambda = dlambda/2.0;
        lambda = lambda - dlambda;
    end
end

end

function [f J] = ft(x,z,lambda)
     f=lambda*polyval(z,x)+(1-lambda)*x;
     zprime=(length(z)-1:-1:1).*z(1:end-1)*lambda;
     J=polyval(zprime,x)+(1-lambda);
end

