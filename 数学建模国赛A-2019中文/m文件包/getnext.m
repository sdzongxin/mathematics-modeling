function [t,P]=getnext(t_best,x)
t=100*rand;
while t==t_best
    t=100*rand;
end
p1=[100,0];
rou1=[0.85,0];
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
P=p1(x*400+1);