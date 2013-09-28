function [ G ] = generateNodalG( R )
%GENERATENODALG Summary of this function goes here
%   Detailed explanation goes here

nNodes = max(max(R(2:3,:)));    
G = zeros(nNodes);
for nodei = 1:nNodes
    r = R(1,nodei);
    ni = R(2,nodei);
    nj = R(3,nodei);
    if (ni>0 && nj>0)
        G(ni,nj) = G(ni,ni)+1/r;
        G(ni,nj) = G(ni,nj)-1/r;
        G(nj,ni) = G(nj,ni)-1/r;
        G(nj,nj) = G(nj,nj)+1/r;
    elseif (ni>0)
        G(ni,ni) = G(ni,ni)+1/r;
    else
        G(nj,nj) = G(nj,nj)+1/r;
    end
end

end

