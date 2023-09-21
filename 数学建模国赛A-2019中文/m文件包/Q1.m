clear
clc
fujian1=xlsread('����1-͹�ֱ�Ե����.xlsx');
fujian2=[xlsread('����2-�뷧�˶�����.xlsx','A2:B46');[(0.45:0.01:2)',2*ones(156,1)];...
    xlsread('����2-�뷧�˶�����.xlsx','D2:E46');[(2.46:0.01:100)',zeros(9755,1)]];
fujian3=xlsread('����3-����ģ����ѹ��.xlsx');
t_1=linspace(0,1,100001);%1s����10^5��
p=@(r)  227.0*tan(6.566*log(1.288*abs(r))) - 53.18;%���ѹǿ-�ܶ����ߣ�����
mb=zeros(1,100001);
mg=zeros(1,100001);
mz=zeros(1,100001);
rb=0.871;
rg=[0.850,zeros(1,100000)];
pb=160;
pg=[100,zeros(1,100000)];
for i=1:10001
    pg(i)=p(rg(i));
    if mod(i,1000)<=200
       mb(i)=rb*0.85*0.7*0.7*pi*sqrt(2*(pb-pg(i))/rb);
    end
    if mod(i,1000)<=2
        mz(i)=rg(i)*mod((i-1),1000)*10;
    elseif mod(i,1000)<=22
        mz(i)=rg(i)*20;
    elseif mod(i,1000)<=24
        mz(i)=rg(i)*(240-mod(i,1000)*10);
    end
    mg(i)=mb(i)-mz(i);
    rg(i+1)=rg(i)+mg(i)./500./.5./5./pi;
end
plot(t_1,pg)