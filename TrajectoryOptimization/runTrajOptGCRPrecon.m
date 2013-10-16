function [ x ] = runTrajOptGCRPrecon( )
%RUNTRAJOPTGCRPRECON Summary of this function goes here
%   Detailed explanation goes here

% Generating the problem representation
[ R, Isource, nodes, goalnode ] = robotToCircuit(0.1);
display('Goal node is:');
display(goalnode);
[ G, Is ] = generateNodalG(R,Isource);

% Solving the system
[maxiter,~] = size(G); % GCR is guaranteed to converge within n iterations

% Computing preconditioners
P = zeros(size(G));
for i=1:maxiter
    P(i,i) = 1/G(i,i);
end

display('Without conditioner');
tic
[Vs, r] = tgcr(G, Is, 1e-7, maxiter);
toc
display(nnz(r));
display('With conditioner');
tic
[Vs, r] = tgcr(P*G, P*Is, 1e-7, maxiter);
toc
display(nnz(r));

% Generate trajectory
%x = generateTrajectory(R, nodes, Vs, goalnode);
%display('Trajectory is:');
%display(x);
%[~,nsteps] = size(x);
%plot([1:nsteps],x(1,:),'o');

end

