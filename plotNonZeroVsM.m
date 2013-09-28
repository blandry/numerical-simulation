function [ ] = plotNonZeroVsM( n )
%PLOTNONZEROVSM Summary of this function goes here
%   Detailed explanation goes here

ms = [2:n];

dxs = [];
for i=1:length(ms)
    dxs = [dxs,1/ms(i)];
end

nzd1 = [];
nzd2 = [];
nzd3 = [];
for dxi=1:length(dxs)
    dx = dxs(dxi);
    [d1L, d1U] = lu(D1Grid(dx));
    [d2L, d2U] = lu(D2Grid(dx));
    [d3L, d3U] = lu(D3Grid(dx));
    nzd1 = [nzd1,nnz(d1L) + nnz(d1U)];
    nzd2 = [nzd2,nnz(d2L) + nnz(d2U)];
    nzd3 = [nzd3,nnz(d3L) + nnz(d3U)];
end

plot([2:dxi+1], nzd1, 'bx', [2:dxi+1], nzd2, 'go', [2:dxi+1], nzd3, 'r.');

end

