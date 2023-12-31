%本程序用于计算由100MPa升压到150Mpa过程的单向阀工作时间
%请运行，然后输入2,5,10中的一个数
%例如 输入 2 运行结果输出对应升压时长为2s的单向阀工作时间
%本程序每次只能计算一个升压过程对应的时间，如需其他结果请再次运行
clear
clc
T_initial=1000; %初温
t=T_initial;
T_end=eps;    %终止温度
dalta=0.98 ; %温度衰减率
limit=1000;  %概率选择上限
outloop=100;  %外循环次数
inloop=50;  %内循环次数
best_P=0;%最优压强
t_best=0;%最优时间
P_L=0;
P_F=0;
while 1
    x=input('请输入到达150Mpa所需要的时间(单位为秒): ');
    if x==2||x==5||x==10
        break
    else
        disp('输入错误，请重新输入正确值2,5或10')
    end
end
while 1
    for i=1:inloop
        [new_t,new_P]=getnext(t_best,x);
        dE=abs(new_P-150)-abs(best_P-150);
        if(dE<0)
            best_P=new_P;
            t_best=new_t;
            P_L=0;
            P_F=0;
        elseif exp(dE/t)>rand&&exp(dE/t)<1
            best_P=new_P;
            t_best=new_t;
            P_L=P_L+1;
        end
        
        if P_L>limit
            P_F=P_F+1;
            break;
        end
    end
    if(P_F>outloop||t<eps)
        break;
    end
    t=t*dalta;
end
disp(['在',num2str(x),'s后压力将稳定在',num2str(best_P),'Mpa，单向阀开启时长为',num2str(t_best),'ms']);
%画图
t=t_best;
p1=[100,ones(1,20)];
rou1=[0.85,zeros(1,20)];
rou=@(p) 0.7765*exp(0.1523*atan(0.004406*p + 0.2343));
p=@(rou) 3.077*rou + 1572.0*log(rou) + 0.01447*rou^2 + 352.9;
for i=1:x*400
    if mod(i,40)==1
        if p1(i)>=160
            deta=-(rou1(i)*44)/500/5/5/pi;
        else
            deta=(0.85*0.7*0.7*pi*sqrt(2*((160-p1(i)))/rou(160))*t*2.5/(10+t)-rou1(i)*44)/500/5/5/pi;
        end
    else
        if p1(i)>=160
            deta=0;
        else
            deta=(0.85*0.7*0.7*pi*sqrt(2*((160-p1(i)))/rou(160))*t*2.5/(10+t))/500/5/5/pi;
        end
    end
    rou1(i+1)=rou1(i)+deta;
    p1(i+1)=p(rou1(i+1));
end
tt=0:0.0001:x;
pp=p1(1);
for i=2:x*400+1
    pp=[pp,p1(i)*ones(1,25)];
end
plot(tt,pp)
ylabel({'压力/MPa'});
xlabel({'时间/t'});
