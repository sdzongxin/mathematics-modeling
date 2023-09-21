%��������������ȶ�״̬�µ��򷧿�����ʱ��
%���б����򼴿ɵõ�ʱ��t
clear
close all
clc
fujian1=xlsread('����1-͹�ֱ�Ե����.xlsx');
fujian2=[xlsread('����2-�뷧�˶�����.xlsx','A2:B46');[(0.45:0.01:2)',2*ones(156,1)];...
    xlsread('����2-�뷧�˶�����.xlsx','D2:E46');[(2.46:0.01:100)',zeros(9755,1)]];
fujian3=xlsread('����3-����ģ����ѹ��.xlsx');
poly=polyfit(fujian3(:,1),fujian3(:,2),2);
vpa(poly2sym(poly),4);%���ζ���ʽ���
p=fujian3(:,1);
E=fujian3(:,2);
rou=dsolve('Drou=rou/(0.02893*p^2 + 3.077*p + 1572.0)','rou(100)=0.85','p');
p=dsolve('Dp=(0.02893*rou^2 + 3.077*rou + 1572.0)/rou','p(0.85)=100','rou');
vpa(rou,4);%���ö��׶���ʽ��Ͻ����ע1��΢�ַ���
vpa(p,4);
rou=@(p) 0.7765*exp(0.1523*atan(0.004406*p + 0.2343));%��Ϻ�ⷽ�̵õ���p-�ѹ�ϵ����
syms t
eqn1=0.85*0.7*0.7*pi*sqrt(120/rou(160))*t*100/(t+10)==44;
answer1=solve(eqn1,t);
t1=double(vpa(answer1,4));
eqn2=0.85*0.7*0.7*pi*sqrt(20/rou(160))*t*100/(t+10)==44;
answer2=solve(eqn2,t);
t2=double(vpa(answer2,4));
disp(['�ȶ���100Mpaʱ������ʱ��Ϊt1=' ,num2str(t1),'ms']);
disp(['�ȶ���150Mpaʱ������ʱ��Ϊt2=' ,num2str(t2),'ms']);



