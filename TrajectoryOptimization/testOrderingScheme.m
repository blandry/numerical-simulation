function [ LU, LUoptimized ] = testOrderingScheme( )
%TESTORDERINGSCHEME Summary of this function goes here
%   Detailed explanation goes here

R = robotToCircuit(0.1);
G = generateNodalG(R);
Goptimized = flipud(fliplr(G));
[m,n] = size(G);

display('computing LU with trivial ordering');
tic
[LU] = lu(G);
toc

display('computing LU with optmized ordering');
tic
[LUoptimized] = lu(Goptimized);
toc

sparseratio = nnz(LU)/(m*n);
sparseratiooptmized = nnz(LUoptimized)/(m*n);

display('sparsity of factored matrix before reordering:');
display(sparseratio);

display('sparsity of factored matrix after reordering:');
display(sparseratiooptmized);

end

