clear ；

hold on  %
Vx=[109 97.5 86 74.5 62.5 52 40.5 28.5 17.5 6.5 -4 -15.5 -26 -35.5 -47 -58 -69 -81 -92 -103.5 -114];
Vm=[5.5 10.5 15.5 21 26 31.5 35.5 41.5 47 51.5];
M=20.*(1:1:10);
x=(-5:0.5:5);

px=polyfit(x,Vx,1);
pm=polyfit(M,Vm,1);
vx=polyval(px,x);

vm=polyval(pm,M);


plot(M,vm,'k-',M,Vm,'k*');%参考word
hold off %关闭 对应hand on
%legend('单桥');%显示右上角的注解（每个线点表示的意义）
title('V-m曲线');%标题
xlabel('m/g');%x轴的解释   \pi作为字符串可以显示Π 
ylabel('V/mv')%Y轴的解释    e^{-x}作为字符串可以输出指数函数
