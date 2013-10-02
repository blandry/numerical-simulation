function [ x ] = generateTrajectory( R, nodes, Vs, goalnode )
%GENERATETRAJECTORY Takes the solution to a the 
% circuit and generate a matrix contraining the
% series of states the robot goes through

goalnodei = find(ismember(nodes',goalnode','rows'),1);
currentnodei = 1;

currentnode = nodes(:,currentnodei);
x = currentnode;
while (~isequal(currentnode, goalnode))
    neighboursi = find(R(2,:)==(currentnodei));
    neighbours = [];
    for i=1:length(neighboursi)
        neighbours = [neighbours,R(:,neighboursi(i))];
    end
    neighbourscurrents = [];
    for i=1:length(neighbours)
        current = (Vs(neighbours(3,i))-Vs(neighbours(2,i)))/neighbours(1,i);
        neighbourscurrents = [neighbourscurrents,current];
    end
    maxnodeindex = find(neighbourscurrents==max(neighbourscurrents));
    if length(maxnodeindex>1)
        maxnodeindex = maxnodeindex(1);
    end
    nextnodei = neighbours(3,maxnodeindex);
    nextnode = nodes(:,nextnodei);
    x = [x,nextnode];
    currentnodei = nextnodei;
    currentnode = nodes(:,currentnodei);
end

end

