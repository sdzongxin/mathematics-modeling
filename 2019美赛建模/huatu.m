%% hold on  %打开 一个图上同时展示几个图 
x=(-4:0.1:4.3);
x2=(-4.4:0.1:4.3);
y=[46 47 47 48 47 47 47 46 46 47 46 ...
47 47 47 47 47 47 47 47 47 47 47 48 48 47 48 48 48 48 ...
49 49 49 50 50 50 50 51 54 53 72 138 134 73 58 61 53 56 53 ...
52 51 51 54 51 53 52 52 53 49 53 49 52 51 49 52 50 50 49 ...
50 49 50 48 49 48 49 47 47 47 47 48 47 48 48 47 47 ];
g=[47 47 47 46 47 47 47 47 47 47 47 47 47 47 47 47 47 47 47 46 47 ...
46 46 46 46 46 47 47 47 47 47 47 47 47 47 47 47 47 48 48 49 52 51 54 57 51 53 55 53 ...
54 56 54 53 55 52 49 48 47 48 48 47 46 47 47 47 47 46 47 47 47 47 48 47 47 47 47 ...
46 47 47 46 47 47 47 47 47 47 47 47];
y=y-41;
g=g-41;
plot(x,y,'r-',x2,g,'k');%参考word
hold off %关闭 对应hand on
legend('单缝衍射','双缝衍射');%显示右上角的注解（每个线点表示的意义）
title('单缝双缝衍射光强分布曲线');%标题
xlabel('x/cm ');%x轴的解释   \pi作为字符串可以显示Π 
ylabel('相对光强I/100%')%Y轴的解释    e^{-x}作为字符串可以输出指数函数

%%  
x = linspace(0,3);
y = x.^2.*sin(x);    plot(x,y);
line([2,2],[0,2^2*sin(2)]);% 画直线的方法 前一个矩阵是存X坐标 后面是Y
str = '$$ \int_{0}^{2} x^2\sin(x) dx $$';%latex的积分表示方法0，2是积分上下限，x^2\sin(x)是被积函数 
text(0.25,2.5,str,'Interpreter','latex');%text指令 前面是坐标位置 后面是文字类型 ，然后是解释程序：latex。
annotation('arrow','X',[0.32,0.5],'Y',[0.6,0.4]);%注解 指令  类型为箭头 

%%
x = -10:0.1:10;% 画好几个图不会被下一个图顶掉的方法
y1 = x.^2 - 8;
y2 = exp(x);
figure, plot(x,y1);%核心在于figure
figure, plot(x,y2);

%%
t = 0:0.1:2*pi; x = 3*cos(t); y = sin(t);%在一个图里展示m×n个图
subplot(2, 2, 1); plot(x, y); axis normal
subplot(2, 2, 2); plot(x, y); axis square
subplot(2, 2, 3); plot(x, y); axis equal
subplot(2, 2, 4); plot(x, y); axis equal tight


%%
%grid on/off  网格线存在/消失
%box on/off   上右线存在/消失
%axis on/off  边界线存在/消失
%figure('Position', [left, bottom, width, height]);图片大小位置
%saveas(gcf,'<filename>','<formattype>');%保存指令
%print(gcf,'<filename>','<formattype>');%保存大文件