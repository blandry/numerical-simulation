function [ G ] = generateNodalG( R )
%GENERATENODALG Summary of this function goes here
%   Detailed explanation goes here

[~,nR] = size(R);
nNodes = max(max(R(2:3,:)));    
G = sparse(nNodes,nNodes);
for ri = 1:nR
    r = R(1,ri);
    ni = R(2,ri);
    nj = R(3,ri);
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

