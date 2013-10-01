function [ R, Isource ] = robotToCircuit( )
%ROBOTTOCIRCUIT Summary of this function goes here
%   Detailed explanation goes here

ew = 5; % the weight attributed to energy cost
tw = 15; % the weight attributed to time cost

a = [-0.25;0;0.25]; % the different accelerations possible for the robot
dt = 0.05; % the time between each time step
x0 = [0;0]; % the initial state of the robot
t0 = 0; % the initial time
tf = 1; % the final time

R = []; % The edges of the network
terminalnodes = x0; % the nodes that haven't been expanded yet
nodes = x0; % all the nodes in the network

t = t0;
while (t<tf)
    t = t + dt;
    [mterminalnodes, nterminalnodes] = size(terminalnodes);
    newterminalnodes = []; % terminal nodes generated in this timestep
    for i = 1:nterminalnodes
        ax = terminalnodes(:,i);
        axnodei = find(ismember(nodes',ax','rows'),1);
        for j = 1:length(a)
            bx = ax;
            bx(1) = bx(1) + ax(2)*dt; % update position
            bx(2) = bx(2) + a(j)*dt; % update speed
            % now we have an edge from ax to bx
            % first retrieves the node number corresponding to a and b
            bxnodei = find(ismember(nodes',bx','rows'),1);
            if isempty(bxnodei) % this is a new node
                nodes = [nodes,bx];
                bxnodei = find(ismember(nodes',bx','rows'),1);
                newterminalnodes = [newterminalnodes,bx]; % it is new so you will want to expand it
            end
            % now adding the edge
            r = ew*a(j) + tw;
            R = [R,[r;axnodei;bxnodei]];
        end
    end
    terminalnodes = newterminalnodes;
end

% modelling collision could be done here by adding some edges

% now adding a current source at the starting point
Isource = [100;0;1];

% finally adding the ground at the goal location
% for now the goal location is always the last node
[~, goalnodei] = size(nodes);
display('Your goal node is:');
display(nodes(:,goalnodei));
R = [R,[tw;goalnodei;0]];
            
end

