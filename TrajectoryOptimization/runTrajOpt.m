function [ x ] = runTrajOpt( )
%RUNTRAJOPT Summary of this function goes here
%   Detailed explanation goes here

% Generating the problem representation
[ R, Isource, nodes, goalnode ] = robotToCircuit();
display('Goal node is:');
display(goalnode);
[ G, Is ] = generateNodalG(R,Isource);

% Solving the system
Vs = G\Is;

% Generate trajectory
x = generateTrajectory(R, nodes, Vs, goalnode);
display('Trajectory is:');
display(x);

end

