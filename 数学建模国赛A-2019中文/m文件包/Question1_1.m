%本程序用于求解稳定状态下单向阀开启的时间
%运行本程序即可得到时间t
clear
close all
clc
fujian1=xlsread('附件1-凸轮边缘曲线.xlsx');
fujian2=[xlsread('附件2-针阀运动曲线.xlsx','A2:B46');[(0.45:0.01:2)',2*ones(156,1)];...
    xlsread('附件2-针阀运动曲线.xlsx','D2:E46');[(2.46:0.01:100)',zeros(9755,1)]];
fujian3=xlsread('附件3-弹性模量与压力.xlsx');
poly=polyfit(fujian3(:,1),fujian3(:,2),2);
vpa(poly2sym(poly),4);%二次多项式拟合
p=fujian3(:,1);
E=fujian3(:,2);
rou=dsolve('Drou=rou/(0.02893*p^2 + 3.077*p + 1572.0)','rou(100)=0.85','p');
p=dsolve('Dp=(0.02893*rou^2 + 3.077*rou + 1572.0)/rou','p(0.85)=100','rou');
vpa(rou,4);%利用二阶多项式拟合结果解注1的微分方程
vpa(p,4);
rou=@(p) 0.7765*exp(0.1523*atan(0.004406*p + 0.2343));%拟合后解方程得到的p-ρ关系函数
syms t
eqn1=0.85*0.7*0.7*pi*sqrt(120/rou(160))*t*100/(t+10)==44;
answer1=solve(eqn1,t);
t1=double(vpa(answer1,4));
eqn2=0.85*0.7*0.7*pi*sqrt(20/rou(160))*t*100/(t+10)==44;
answer2=solve(eqn2,t);
t2=double(vpa(answer2,4));
disp(['稳定在100Mpa时，开阀时长为t1=' ,num2str(t1),'ms']);
disp(['稳定在150Mpa时，开阀时长为t2=' ,num2str(t2),'ms']);



