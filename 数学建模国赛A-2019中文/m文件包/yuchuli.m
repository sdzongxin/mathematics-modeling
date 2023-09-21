clear
close all
clc
fujian1=xlsread('附件1-凸轮边缘曲线.xlsx');
fujian2=[xlsread('附件2-针阀运动曲线.xlsx','A2:B46');[(0.45:0.01:2)',2*ones(156,1)];...
    xlsread('附件2-针阀运动曲线.xlsx','D2:E46');[(2.46:0.01:100)',zeros(9755,1)]];
fujian3=xlsread('附件3-弹性模量与压力.xlsx');
polarplot(fujian1(:,1),fujian1(:,2));
figure,plot(fujian2(:,1),fujian2(:,2));
figure,plot(fujian3(:,1),fujian3(:,2));
x=linspace(0,200,401);
poly1=polyfit(fujian3(:,1),fujian3(:,2),1);
vpa(poly2sym(poly1),4)
f1=polyval(poly1,x);
poly2=polyfit(fujian3(:,1),fujian3(:,2),2);
vpa(poly2sym(poly2),4)
f2=polyval(poly2,x);
rou2=dsolve('Drou=rou/(0.02893*p^2 + 3.077*p + 1572.0)','rou(100)=0.85','p');%2次拟合
ROU=vpa(rou2,4)
p2=dsolve('Dp=(0.02893*p^2 + 3.077*p + 1572.0)/rou','p(0.85)=100','rou');
P=vpa(p2,4)
figure,ezplot(ROU,[0,200]);
figure,ezplot(P,[0.8,0.88]);
rou=@(p) 0.7765*exp(0.1523*atan(0.004406*p + 0.2343));
A=[fujian2(:,1),ones(length(fujian2(:,1)),1)];
A(:,2)=pi.*((1.25+fujian2(:,2).*tan(9/180*pi)).^2-1.25^2);
A1=pi*0.7*0.7;
figure,plot(A(:,1),A(:,2),'o',A(:,1),A1*ones(10001,1));
point=find(abs(A(:,2)-A1)<0.15);
Q=[fujian2(:,1),ones(length(fujian2(:,1)),1)];
Q(1:point(1),2)=0.85*sqrt(2*100/0.85)*A(1:point(1),2);
Q(point(2):point(3),2)=0.85*sqrt(2*100/0.85)*A1;
Q(point(4):end,2)=0.85*sqrt(2*100/0.85)*A(point(4):end,2);
figure,plot(Q(:,1),Q(:,2),'o');
Vzui=trapz(Q(:,1),Q(:,2));