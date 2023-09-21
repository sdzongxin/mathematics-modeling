%���������ڼ����ȶ�100MPa���̵ĵ��򷧹���ʱ��
%������
clear
clc
T_initial=1000; %����
t=T_initial;
T_end=eps;    %��ֹ�¶�
dalta=0.98 ; %�¶�˥����
limit=1000;  %����ѡ������
outloop=100;  %��ѭ������
inloop=50;  %��ѭ������
best_P=0;%����ѹǿ
t_best=0;%���ſ�ʱ��
P_L=0;
P_F=0;
x=10;
while 1
    for i=1:inloop
        [new_t,new_P]=getnext(t_best,x);
        dE=abs(new_P-100)-abs(best_P-100);
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
disp(['��',num2str(x),'s��ѹ�����ȶ���',num2str(best_P),'Mpa�����򷧿���ʱ��Ϊ',num2str(t_best),'ms']);
% ��p-tͼ
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
ylabel({'ѹ��/MPa'});
xlabel({'ʱ��/t'});