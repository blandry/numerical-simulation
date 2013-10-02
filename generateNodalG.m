function [ G, Is ] = generateNodalG( R, Isource )
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

if (nargout>1)
    Is = zeros(nNodes, 1);
    [~,nIsource] = size(Isource);
    for i = 1:nIsource
        source = Isource(:, i);
        if source(2) ~= 0
            Is(source(2), 1) = Is(source(2), 1) - source(1);
        end
        if source(3) ~= 0
            Is(source(3), 1) = Is(source(3), 1) + source(1);
        end  
    end
end
    
end

