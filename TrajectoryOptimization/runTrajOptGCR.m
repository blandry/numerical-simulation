function [ x ] = runTrajOpt( )
%RUNTRAJOPT Summary of this function goes here
%   Detailed explanation goes here

% Generating the problem representation
[ R, Isource, nodes, goalnode ] = robotToCircuit(0.1);
display('Goal node is:');
display(goalnode);
[ G, Is ] = generateNodalG(R,Isource);

% Solving the system
[maxiter,~] = size(G); % GCR is guaranteed to converge within n iterations
Vs = tgcr(G, Is, 1e-7, maxiter);

% Generate trajectory
x = generateTrajectory(R, nodes, Vs, goalnode);
%display('Trajectory is:');
%display(x);
[~,nsteps] = size(x);
plot([1:nsteps],x(1,:),'o');

end

