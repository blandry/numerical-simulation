function [ A, b ] = generateNodeBranchSystem( R, Isource, Vsource )
%GENERATENODEBRANCH Summary of this function goes here
%   Detailed explanation goes here

[mR, nR] = size(R);
[mIsource, nIsource] = size(Isource);
if (nargin<3)
    mVsource = 0;
    nVsource = 0;
    nNodes = max(max( [R(2:3,:),Isource(2:3,:)] ));    
    branches = R; 
else
    [mVsource, nVsource] = size(Vsource);
    nNodes = max(max( [R(2:3,:),Isource(2:3,:),Vsource(2:3,:)] ));
    branches = [R,Vsource];
end
[mBranches, nBranches] = size(branches);

E = zeros(nNodes, nBranches);
for i = 1:nBranches
    current = branches(:,i);
    if current(2) ~= 0
        E(current(2), i) = 1;
    end
    if current(3) ~= 0
        E(current(3), i) = -1;
    end
end

Is = zeros(nNodes, 1);
for i = 1:nIsource
    source = Isource(:, i);
    if source(2) ~= 0
        Is(source(2), 1) = Is(source(2), 1) - source(1);
    end
    if source(3) ~= 0
        Is(source(3), 1) = Is(source(3), 1) + source(1);
    end  
end

alpha = eye(nBranches);
for i = 1:nR
    alpha(i, i) = 1/R(1,i);
end

% watch out here you seem to have voltage sources reversed compared to lecture
if (nVsource==0)
    b = [zeros(nR,1);Is];
else
    b = [zeros(nR,1);Vsource(1,:)';Is];
end

A = zeros(nNodes+nBranches);
for i = 1:nR
    A(i,i) = 1;
end
A(nBranches+1:end,1:nBranches) = E;
A(1:nBranches,nBranches+1:end) = -alpha*E';
[mA, nA] = size(A);
assert(mA==nA);

end