z = zeros(1,44);          
z(1,1) = 1;
z(1,2) = -1/2;
z(1,end) = -1e-13;     
f = @(x) fjpoly(x,z);
x0 = 1;               
itpause = 7;          
xf = newton1d(f,x0,itpause);