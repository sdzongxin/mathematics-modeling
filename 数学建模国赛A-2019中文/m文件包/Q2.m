clear
clc
fujian1=xlsread('����1-͹�ֱ�Ե����.xlsx');
pin1=xlsread('����2-�뷧�˶�����.xlsx','A2:B46');
pin2=xlsread('����2-�뷧�˶�����.xlsx','D2:E46');
fujian2=[xlsread('����2-�뷧�˶�����.xlsx','A2:B46');[(0.45:0.01:2)',2*ones(156,1)];...
    xlsread('����2-�뷧�˶�����.xlsx','D2:E46');[(2.46:0.01:100)',zeros(9755,1)]];%����2��һ��Ϊt�ڶ���Ϊ��Ӧ��h
theta=fujian1(:,1);
r=fujian1(:,2);
r_theta=@(theta) 4.826+2.413*cos(theta)-2.676e-06*sin(theta);
pV=dsolve('Dp=-(0.02893*p^2+3.077*p+1572)/V','p(43.6896)=0.5','V');
vpa(pV,4)
h_r=@(r) 11.3134-r;
V_h=@(h) pi*2.5^2*h;
p_V=@(V) 227.0*tan(25.03 - 6.566*log(V)) - 53.18;
p_theta=@(theta) p_V(V_h(h_r(r_theta(theta))));
