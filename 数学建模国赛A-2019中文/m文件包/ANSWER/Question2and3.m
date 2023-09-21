%��������������2������3�Ľ��ٶȦ����
%������
clear
clc
fujian1=xlsread('����1-͹�ֱ�Ե����.xlsx');
pin1=xlsread('����2-�뷧�˶�����.xlsx','A2:B46');
pin2=xlsread('����2-�뷧�˶�����.xlsx','D2:E46');
fujian2=[xlsread('����2-�뷧�˶�����.xlsx','A2:B46');[(0.45:0.01:2)',2*ones(156,1)];...
    xlsread('����2-�뷧�˶�����.xlsx','D2:E46');[(2.46:0.01:100)',zeros(9755,1)]];%����2��һ��Ϊt�ڶ���Ϊ��Ӧ��h
r_theta=@(theta) 4.826+2.413*cos(theta)-2.676e-06*sin(theta);
A=[fujian2(:,1),ones(length(fujian2(:,1)),1)];
A(:,2)=pi.*((1.25+fujian2(:,2).*tan(9/180*pi)).^2-1.25^2);
A1=pi*0.7*0.7;
point=find(abs(A(:,2)-A1)<0.15);
Q=[fujian2(:,1),ones(length(fujian2(:,1)),1)];
Q(1:point(1),2)=0.85*sqrt(2*100/0.85)*A(1:point(1),2);
Q(point(2):point(3),2)=0.85*sqrt(2*100/0.85)*A1;
Q(point(4):end,2)=0.85*sqrt(2*100/0.85)*A(point(4):end,2);
Vzui=trapz(Q(:,1),Q(:,2));
rmax= max(fujian1(:,2));
rmin=min(fujian1(:,2));
Vmin=20;
Hmin=Vmin/(1.25*1.25*pi);
Hmax=Hmin+rmax-rmin;
Vmax=pi*1.25*1.25*Hmax;
rou=@(p) 0.7765*exp(0.1523*atan(0.004406*p + 0.2343));
Vbc=rou(0.5)*Vmax/rou(100);%�ٽ��ݻ� p=100
Hbc=Vbc/pi/1.25/1.25;
Vbeng=Vbc-Vmin;
mbeng=Vbeng*rou(100);
mzui=Vzui*rou(100);
mlou=0.85*0.7*0.7*sqrt(2*(100-0.5)/rou(100))*rou(100);%1s©
omiga1=mzui/mbeng*2*pi/100;
t=2*mzui/mlou;
omiga2=(mzui*2+t*mlou)/mbeng*2*pi/100;
disp(['����2�Ľ��ٶȦ�Ϊ',num2str(omiga1),'ms']);
disp(['����3�޼�ѹ��ʱ��Ӧ�Ľ��ٶȦ�Ϊ',num2str(2*omiga1),'ms']);
disp(['����3��ѹ��ÿ100ms����ʱ��Ϊ',num2str(t),'msʱ��Ӧ�Ľ��ٶȦ�Ϊ',num2str(omiga2)]);