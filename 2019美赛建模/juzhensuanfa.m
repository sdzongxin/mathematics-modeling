%%
%增广矩阵求逆法
clear A ;clear b;clear x;
A = [1 2 1;2 6 1;1 1 4];
b = [2; 7; 3];
R = rref([A b]);
disp(R);

%%
%解Ax=b，把A分解成下三角A=L的逆U……不懂
clear A ;
A = [1 1 1;2 3 5;4 6 8];
[L, U, P] = lu(A);
inv(L)
U;
disp(U);

%%
%左除法 算Ax=b 神奇
clear A ;clear b;clear x;
A = [1 2 1;2 6 1;1 1 4];
b = [2; 7; 3];
x = A\b;
disp(x);

%%
%克拉默法则求解x
clear A ;clear b;clear x;
A = [1 2 1;2 6 1;1 1 4];
b = [2; 7; 3];
x = inv(A)*b;
disp(x);

%%
%判断奇异矩阵（不可逆矩阵）
clc;clear A;
A =[ 1 2 3 4; 2 4 6 8; ...
9 8 7 6; 1 3 2 8];
det(A);
if det(A)==0
    disp('A不可逆');
else
    inv(A);
    disp('A可逆，A的逆为');
    disp(inv(A));
end

%%
%矩阵求特征值和特征向量
clear ;clc;
[v,d]=eig([2 -12;1 -5]);
disp(v);%特征向量
disp(d);%特征值

%%
%不知道干嘛的挺好看=。=
%求解y=dx(t)/dt=Ax;
A = [0 -6 -1; 6 2 -16; -5 20 -10];
x0 = [1 1 1]'; X = [];
for t = 0:.01:1
X = [X expm(t*A)*x0];
end
plot3(X(1,:),X(2,:),X(3,:),'-o');
xlabel('x_1'); ylabel('x_2');
zlabel('x_3'); grid on;
axis tight square;