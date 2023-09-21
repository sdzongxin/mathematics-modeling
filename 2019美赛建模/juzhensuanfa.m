%%
%����������淨
clear A ;clear b;clear x;
A = [1 2 1;2 6 1;1 1 4];
b = [2; 7; 3];
R = rref([A b]);
disp(R);

%%
%��Ax=b����A�ֽ��������A=L����U��������
clear A ;
A = [1 1 1;2 3 5;4 6 8];
[L, U, P] = lu(A);
inv(L)
U;
disp(U);

%%
%����� ��Ax=b ����
clear A ;clear b;clear x;
A = [1 2 1;2 6 1;1 1 4];
b = [2; 7; 3];
x = A\b;
disp(x);

%%
%����Ĭ�������x
clear A ;clear b;clear x;
A = [1 2 1;2 6 1;1 1 4];
b = [2; 7; 3];
x = inv(A)*b;
disp(x);

%%
%�ж�������󣨲��������
clc;clear A;
A =[ 1 2 3 4; 2 4 6 8; ...
9 8 7 6; 1 3 2 8];
det(A);
if det(A)==0
    disp('A������');
else
    inv(A);
    disp('A���棬A����Ϊ');
    disp(inv(A));
end

%%
%����������ֵ����������
clear ;clc;
[v,d]=eig([2 -12;1 -5]);
disp(v);%��������
disp(d);%����ֵ

%%
%��֪�������ͦ�ÿ�=��=
%���y=dx(t)/dt=Ax;
A = [0 -6 -1; 6 2 -16; -5 20 -10];
x0 = [1 1 1]'; X = [];
for t = 0:.01:1
X = [X expm(t*A)*x0];
end
plot3(X(1,:),X(2,:),X(3,:),'-o');
xlabel('x_1'); ylabel('x_2');
zlabel('x_3'); grid on;
axis tight square;