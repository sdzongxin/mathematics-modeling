clear
clc
fujiansan=xlsread('附件3-弹性模量与压力.xlsx');
p=polyfit(fujiansan(:,1),fujiansan(:,2),2);
vpa(poly2sym(p),4)
R=dsolve('Dr=r/(0.02893*x^2 + 3.077*x + 1572.0)','r(100)=0.85','x');
vpa(R,4) ;
p=finverse(R);
R=@(x) 0.7765*exp(0.1523*atan(0.004406*x + 0.2343));
ezplot(R,[0,200])
vpa(p,4)
P=@(r) 227.0*tan(6.566*log(1.288*r)) - 53.18;
P(500)
