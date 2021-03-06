function [ solutions ] = multipleGoals( )
%MULTIPLEGOALS Summary of this function goes here
%   Detailed explanation goes here

% Generating the problem representation
[ R, ~, nodes ] = robotToCircuit();

G  = generateNodalG(R);
[~,nG] = size(G);

% Factoring the system's matrix and making sure
% the factors are triangular (changing G and the
% right hand side if necessary since it doesn't 
% affect the problem)
[L,U,P] = lu(G);
G = P*G;

% generating different right hand sides
% first choosing some random goals for the robot
numgoals = 5;
goalnodesi = randsample(length(nodes), numgoals);
% Making a single current source for each goal
Isources = zeros(3, numgoals);
Isources(1,:) = 1000;
Isources(3,:) = goalnodesi;
% Converting the current sources to individual
% right hand side
righthandsides = [];
for i=1:numgoals
    Is = zeros(nG, 1);
    source = Isources(:,i);
    if source(3) ~= 0
        Is(source(3), 1) = Is(source(3), 1) + source(1);
    end
    % premutating if the LU decomposition
    % required it
    Is = P*Is;
    righthandsides = [righthandsides,Is];
end

solutions = [];
for i=1:numgoals
    rhs = righthandsides(:,i);
    solution = forwBackSub(L, U, rhs);
    solutions = [solutions,solution];
end

end

