function [ ] = runGCRRecycling( )
%RUNGCRRECYCLING Summary of this function goes here
%   Detailed explanation goes here

% Generating the problem representation
[ R, Isource ] = robotToCircuit(0.1);
[ G, Is ] = generateNodalG(R,Isource);

[maxiter,~] = size(G); % GCR is guaranteed to converge within n iterations

% Solving the system (and generating a Krylov subspace)
Vs = tgcrProduce(G, Is, 1e-7, maxiter);

% Making different right hand side
Is(end-1,1) = 50000;

% Solving using the previously
% computed Krylov subspace
Vs = tgcrRecycle(G, Is, 1e-7, maxiter);

% Comparing with solving the same system without
% recycling the Krylov subspace
Vs = tgcr(G, Is, 1e-7, maxiter);

end

