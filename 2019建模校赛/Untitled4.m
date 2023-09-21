q1answer
f=3e10;
lamda=(3e8)/f;
beta=2.*pi/lamda;     %//β=2π/λ 波数
n=32;                % //天线阵元数目
t=-pi:0.01:pi;
d=lamda/4;          % //假设阵元间距为波长的四分之一
W=beta.*d.*cos(t);
z1=((n/2).*W)-n/2*beta*d;
z2=((1/2).*W)-1/2*beta*d;
F1=sin(z1)./(n.*sin(z2));
K1=abs(F1);        % //函数对数组元素进行绝对值处理的函数
polar(t+pi,K1);
