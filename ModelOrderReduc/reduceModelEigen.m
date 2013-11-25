function [ At, bt, ct ] = reduceModelEigen( A, b, c, q )
%REDUCEMODELEIGEN Summary of this function goes here
%   Detailed explanation goes here

N = size(A,1);

[eigVecs,eigVals] = eig(A);
eigVals = diag(eigVals);

bt = eigVecs\b;
ct = (c'*eigVecs)';
weights = abs((bt.*ct)./eigVals);

V = zeros(N,q);
for i=1:q
    [~,j] = max(weights);
    V(:,i) = eigVecs(:,j);
    weights(j,1) = 0;
end

At = V\A*V;
bt = V\b;
ct = (c'*V)';

end

