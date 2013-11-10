function [ df ] = dfbar( x, u, dx )
%DFBAR Summary of this function goes here
%   Detailed explanation goes here

df=zeros(size(x,1),size(x,1));
df(1,1)=-2/dx^2;
df(1,2)=1/dx^2;
for i=2:size(df,1)-1
    df(i,i-1)=1/dx^2;
    df(i,i)=-2/dx^2;
    df(i,i+1)=1/dx^2;
end
df(end,end-1)=1/dx^2;
df(end,end)=-2/dx^2;

end

