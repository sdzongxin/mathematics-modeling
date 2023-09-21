clear
clc
fujian1=xlsread('����1-͹�ֱ�Ե����.xlsx');
fujian2=[xlsread('����2-�뷧�˶�����.xlsx','A2:B46');[(0.45:0.01:2)',2*ones(156,1)];...
    xlsread('����2-�뷧�˶�����.xlsx','D2:E46');[(2.46:0.01:100)',zeros(9755,1)]];
fujian3=xlsread('����3-����ģ����ѹ��.xlsx');
t=linspace(0,100,10001);%100ms����10^4��
mb=zeros(1,10001);
mg=mb;
mz=zeros(1,10001);
rb=0.871;
rg=[0.850,zeros(1,10000)];
p=@(r)  227.0*tan(6.566*log(1.288*r)) - 53.18;%���ѹǿ-�ܶ����ߣ�����
pb=160;
pg=[100,zeros(1,10000)];
qujian=[0,0,0];
for a=1:240
    for b=a:240
        for i=1:10001
            pg(i)=p(rg(i)); 
            if i>=a&&i<=b
                mb(i)=rb*0.85*0.7*0.7*pi*sqrt(2*(pb-pg(i))/rb);     
            end
            if i<=20
                mz(i)=rg(i)*(i-1);
            elseif i<=220
                mz(i)=rg(i)*20;
            elseif i<=240
                mz(i)=rg(i)*(240-i);
            end
            mg(i)=mb(i)-mz(i);
            rg(i+1)=rg(i)+mg(i)./500./.5./5./pi;
        end
        if abs(pg(i)-100)<=0.5
            qujian=[qujian;a,b,pg(i)];
        end
    end
end
k=139;
for j=1:2
    for i=1:10001
        pg(i)=p(rg(i));
        if i<=k
            mb(i)=rb*0.85*0.7*0.7*pi*sqrt(2*(pb-pg(i))/rb);
        end
        if i<=20
            mz(i)=rg(i)*(i-1);
        elseif i<=220
            mz(i)=rg(i)*20;
        elseif i<=240
            mz(i)=rg(i)*(240-i);
        end
        mg(i)=mb(i)-mz(i);
        rg(i+1)=rg(i)+mg(i)./500./.5./5./pi;
    end
    figure,plot(t,pg)
k=234;
end
