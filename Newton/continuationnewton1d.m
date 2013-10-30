function x0  = continuationnewton1d(z,x0,itpause)
%CONTINUATIONNEWTON1D Summary of this function goes here
%   Detailed explanation goes here

maxIters = 500;
lambda = 0;
dlambda = 0.1;
xk=[];
dx=[];
fk=[];
for i=1:maxIters
    if (lambda > 1)
        lambda = 1;
    end
    fhand = @(x) ft(x,z,lambda);
    if (lambda~=1)
        [x0,c] = newton1d(fhand,x0,itpause,'off',10,lambda*1e-12+(1-lambda)*0.01);
        fk = [fk,norm(fhand(x0))];
        xk = [xk,norm(x0)];
        if size(xk,2)>1
            dx = [dx,norm(xk(:,end)-xk(:,end-1))];
        end
    else
        [x0,c] = newton1d(fhand,x0,itpause,'off');
        fk = [fk,norm(fhand(x0))];
        xk = [xk,norm(x0)];
        if size(xk,2)>1
            dx = [dx,norm(xk(:,end)-xk(:,end-1))];
        end
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

figure(1);
subplot(2,2,1); plot([1:size(fk,2)],fk,'r*-'); grid on; 
xlabel('iteration #'); ylabel('||f(x)||');
subplot(2,2,2); plot([1:size(xk,2)],xk,'*-'); grid on; 
xlabel('iteration #'); ylabel('||x||');
subplot(2,2,3); plot([1:size(dx,2)],dx,'k*-'); grid on; 
xlabel('iteration #'); ylabel('||dx||');

end

function [f J] = ft(x,z,lambda)
     f=lambda*polyval(z,x)+(1-lambda)*x;
     zprime=(length(z)-1:-1:1).*z(1:end-1)*lambda;
     J=polyval(zprime,x)+(1-lambda);
end

