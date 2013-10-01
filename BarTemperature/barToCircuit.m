function [ R, Isource, Vsource ] = barToCircuit( dx, km, ka )
%BARTOCIRCUIT Summary of this function goes here
%   Detailed explanation goes here

% discretizing the bar
nodes = [0];
while (nodes(end)+dx)<1
    nodes = [nodes,nodes(end)+dx];
end
nodes = [nodes,1];
nNodes = length(nodes);
N = nNodes-1;

% there is a resistor between every node
% modeling the heat conductivity along the bar
Rbar = zeros(3,N-1);
Rbar(1,:) = (dx/km)*ones(1,N-1);
Rbar(2,:) = [1:N-1];
Rbar(3,:) = [2:N];

% the is also a resistor at every node
% that is modeling the conductivity
% to the air
Rair = zeros(3,N-2);
Rair(1,:) = (dx/ka)*ones(1,N-2);
Rair(2,:) = [2:N-1];
% the other end of those resitor are
% connected to a voltage source (ambiant air)
% that is constant at 250
Rair(3,:) = (N+1)*ones(1,N-2);

% combining the conductivities
R = [Rbar,Rair];

% there is a source at every node except 1 and N
Isource = zeros(3,N-2);
Isource(1,:) = 35*(cos(2*pi*nodes(3:end-1))).^2;
Isource(3,:) = [2:N-1];

% the is a voltage source at either ends that
% represent the heat sinks
% there is also a voltage source
% that represents the ambiant air
Vsource = [200,200,250;0,0,0;1,N,N+1];

end
