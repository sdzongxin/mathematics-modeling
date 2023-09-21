close all
eps = 0.00001;
k = 2*pi;%周期函数周期
theta = -pi : pi / 10791 : pi;%设定范围大小
var = sin(theta);
X=[1,2,3,4];
var(X)=1.6667 ;
nelements = 8;%元素个数
d = 1;         %  d = 1;
num = sin((nelements * k * d * 0.5) .* var);
 if(abs(num) <= eps)
   num = eps;
end
den = sin((k* d * 0.5) .* var);
if(abs(den) <= eps)
   den = eps;
end
 pattern = abs(num ./ den);
maxval = max(pattern);
pattern = pattern ./ maxval;
 figure(1)%阵列方向图
theta = theta +pi/2;%留下小思索，自己想想为什么要加pi/2
polar(theta,pattern)
title ('阵列方向图')
 figure(2)%功率方向图
Polar_dB(theta,pattern)
title ('功率方向图')