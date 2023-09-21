clear
clc
fujian1=xlsread('附件1-凸轮边缘曲线.xlsx');
pin1=xlsread('附件2-针阀运动曲线.xlsx','A2:B46');
pin2=xlsread('附件2-针阀运动曲线.xlsx','D2:E46');
fujian2=[xlsread('附件2-针阀运动曲线.xlsx','A2:B46');[(0.45:0.01:2)',2*ones(156,1)];...
    xlsread('附件2-针阀运动曲线.xlsx','D2:E46');[(2.46:0.01:100)',zeros(9755,1)]];%附件2第一列为t第二列为对应的h
r_theta=@(theta) 4.826+2.413*cos(theta)-2.676e-06*sin(theta);
A=[fujian2(:,1),ones(length(fujian2(:,1)),1)];
A(:,2)=pi.*((1.25+fujian2(:,2).*tan(9/180*pi)).^2-1.25^2);
A1=pi*0.7*0.7;
point=find(abs(A(:,2)-A1)<0.15);
% plot(A(:,1),A(:,2),'.',A(:,1),A1*ones(1,length(A(:,1))));
Q=[fujian2(:,1),ones(length(fujian2(:,1)),1)];
Q(1:point(1),2)=0.85*sqrt(2*100/0.85)*A(1:point(1),2);
Q(point(2):point(3),2)=0.85*sqrt(2*100/0.85)*A1;
Q(point(4):end,2)=0.85*sqrt(2*100/0.85)*A(point(4):end,2);
% figure,plot(Q(:,1),Q(:,2));
Vzui=trapz(Q(:,1),Q(:,2));
% plot(fujian1(:,1),fujian1(:,2))
rmax= max(fujian1(:,2));
rmin=min(fujian1(:,2));
Vmin=20;
Hmin=Vmin/(1.25*1.25*pi);
Hmax=Hmin+rmax-rmin;
Vmax=pi*1.25*1.25*Hmax;
rou=@(p) 0.7765*exp(0.1523*atan(0.004406*p + 0.2343));
Vbc=rou(0.5)*Vmax/rou(100);%临界容积 p=100
Hbc=Vbc/pi/1.25/1.25;
Vbeng=Vbc-Vmin;
mbeng=Vbeng*rou(100);
mzui=Vzui*rou(100);
mlou=0.85*sqrt(2*(100-0.5)/rou(100))*rou(100);%1s漏
omiga1=mzui/mbeng*2*pi/100;
t=mzui/mlou;
omiga2=(mzui*2+t*mlou)/mbeng*2*pi/100;
% % % n=100*omiga1/2/pi;
% t=0:0.01:100;
% omiga2=(mzui+t*mlou)/mbeng*2*pi/100;
% % plot(t,omiga2)
% p=polyfit(t,omiga2,1);
% Omiga=@(T) 0.0383*T+0.1141;
% ezplot(Omiga,[0,100]);
O1=round(omiga1*10000)/10000;
O2=round(omiga2*10000)/10000;
T=round(t*100)/100;
disp(['问题2的角速度ω为',num2str(O1),'ms']);
disp(['问题3.1角速度ω为',num2str(2*O1),'ms']);
 disp(['问题3.2角速度ω为',num2str(O2),'ms,开启减压阀的时间为',num2str(50-T/2),'ms，其工作时间为',num2str(T),'ms']);