N = 500;
x = linspace(0,1,N);

A = zeros(size(x,1));
for i=1:N
    A(i,i) = -2;
    if i~=1
        A(i,i-1)=1;
    end
    if i~=N
        A(i,i+1)=1;
    end
end
b = zeros(N,1);
b(250,1) = 1;
c = zeros(N,1);
c(250,1) = 1;

[A2,b2,c2] = reduceModelEigen(A,b,c,2);
[A3,b3,c3] = reduceModelEigen(A,b,c,5);
[A4,b4,c4] = reduceModelEigen(A,b,c,10);

sys1 = ss(A,b,c',0);
sys2 = ss(A2,b2,c2',0);
sys3 = ss(A3,b3,c3',0);
sys4 = ss(A4,b4,c4',0);

bode(sys1,sys2,sys3,sys4);
legend('Unreduced system', 'q=2', 'q=5', 'q=10');
