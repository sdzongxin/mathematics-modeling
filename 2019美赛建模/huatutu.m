%%
%对数坐标轴
x = logspace(-1,1,100);%（1E-1 （0.1）, 1E1（10），取一百个数）
y = x.^2;
subplot(2,2,1);%同时画四个图
plot(x,y);%正常轴
title('Plot');
subplot(2,2,2);
semilogx(x,y);%x轴对数轴
             set(gca,'XGrid','on');
title('Semilogx');
subplot(2,2,3);
semilogy(x,y);%y轴对数轴
             set(gca,'YGrid','on');
title('Semilogy');
subplot(2,2,4);
loglog(x, y);%都是对数轴
title('Loglog');
%set(gca,'XGrid','on');%开网格 开不开效果差很多
%set(gca,'YGrid','on');
%saveas(gcf,'<filename>','<formattype>';
%%
%双y轴图 炫酷！
x = 0:0.01:20;
y1 = 200*exp(-0.05*x).*sin(x);%左轴y函数
y2 = 0.8*exp(-0.5*x).*sin(10*x);%右轴y函数
[AX,H1,H2] = plotyy(x,y1,x,y2);
set(get(AX(1),'Ylabel'),'String','Left Y-axis')
set(get(AX(2),'Ylabel'),'String','Right Y-axis')
title('炫酷的双y轴');
set(H1,'LineStyle','--'); set(H2,'LineStyle',':');
%saveas(gcf,'<filename>','<formattype>';

%%
% 柱状分布统计图（看整体）
y = randn(1,1000);%产生随机数
subplot(2,1,1);
hist(y,10);%有几个柱子Bins
title('Bins = 10');
subplot(2,1,2);
hist(y,50);
title('Bins = 50');

%%
% 柱状图（看个体）
x = [1 2 5 4 8]; y = [x;1:5];%需要比较的数值
subplot(2,3,1); bar(x); title('A bargraph of vector x');
subplot(2,3,2); bar(y); title('A bargraph of vector y');
subplot(2,3,3); bar3(y); title('A 3D bargraph');
subplot(2,3,4);bar(y,'stacked');title('Stacked');%叠在一起的bar 
subplot(2,3,5);barh(y);title('Horizontal');%横过来的bar
subplot(2,3,6);barh(y,'stacked');title('Horizontal Stacked');%横过来叠在一起的bar 

%%
%极坐标图
x = 1:100; theta = x/10; r = log10(x);
subplot(1,4,1); polar(theta,r);%polar(theta,r)极坐标的表示鸭
theta = linspace(0, 2*pi); r = cos(4*theta);
subplot(1,4,2); polar(theta, r);
theta = linspace(0, 2*pi, 17); %linspace （0到2Π六等分）；神奇的东西：N边形把6改成N+1，N>=4有意义
r = ones(1,length(theta));
subplot(1,4,3); polar(theta,r);
theta = linspace(0, 2*pi); r = 1-sin(theta);
subplot(1,4,4); polar(theta , r);

%%
% 楼梯图和茎状图
x = linspace(0, 4*pi, 40); y = sin(x);
subplot(1,2,1); stairs(y);
subplot(1,2,2); stem(y);

%%
%箱子图和误差bang
load carsmall
subplot(1,2,1);boxplot(MPG, Origin);
%error bar 
x=0:pi/10:pi; y=sin(x);
e=std(y)*ones(size(x));
subplot(1,2,2);errorbar(x,y,e);
%errorbar (x,y,e) x,y和plot一样 e是误差就是bar的大小
%%
%画图用的
t =(1:2:15)'*pi/8; x = sin(t); y = cos(t);
fill(x,y,'r'); axis square off;%fill就是plot之后把里面图上颜色
text(0,0,'STOP','Color', 'w', 'FontSize', 80, ...
'FontWeight','bold', 'HorizontalAlignment', 'center');

%%
%刚学RGB用它调颜色吧=。=
G = [46 38 29 24 13]; S = [29 27 17 26 8];
B = [29 23 19 32 7]; h = bar(1:5, [G' S' B']);
title('Medal count for top 5 countries in 2012 Olympics');
ylabel('Number of medals'); xlabel('Country');
legend('Gold', 'Silver', 'Bronze')

%%
%彩色z轴图
[x, y] = meshgrid(-3:.2:3,-3:.2:3);
z = x.^2 + x.*y + y.^2; surf( x, y, z); box on;
set(gca,'FontSize', 16); zlabel('z');
 xlim([-4 4]); xlabel('x'); ylim([-4 4]); ylabel('y');%三维的有色图
figure 
imagesc(z); axis square; xlabel('x'); ylabel('y');%二维用颜色表示第三维
%颜色图可以查……没看懂。

%%
%三维画图（三维的线）
x=0:0.1:3*pi; z1=sin(x); z2=sin(2.*x); z3=sin(3.*x);
y1=zeros(size(x)); y3=ones(size(x)); y2=y3./2;
plot3(x,y1,z1,'r',x,y2,z2,'b',x,y3,z3,'g'); grid on;
xlabel('x-axis'); ylabel('y-axis'); zlabel('z-axis');

figure
t = 0:pi/50:10*pi;
plot3(sin(t),cos(t),t)%哇，极坐标！
grid on; axis square;

figure
turns = 40*pi;
t = linspace(0,turns,4000);%哇，螺旋线
x = cos(t).*(turns-t)./turns;
y = sin(t).*(turns-t)./turns;
z = t./turns;
plot3(x,y,z); grid on;


%%
%炫酷彩色三维图（面） 等高线图（投影）
x = -3.5:0.2:3.5;
y = -3.5:0.2:3.5;
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);
subplot(2,3,1);
mesh(X,Y,Z);%网 只有线
subplot(2,3,2);
surf(X,Y,Z);%表面 除了线其他地方都是有的
axis square;
subplot(2,3,3);
contour(X,Y,Z);%等高线图（投影）
axis square;
subplot(2,3,4); contour(Z,[-.45:.2:.45]); %等高线的选取
axis square;
subplot(2,3,5); [C,h] = contour(Z);%显示等高线数值
clabel(C,h); axis square;
subplot(2,3,6); contourf(Z);%多了个f表示fill涂上颜色
axis square;
%%
x = -3.5:0.2:3.5; y = -3.5:0.2:3.5;  %这个是在三维图下画等高图
[X,Y] = meshgrid(x,y); Z = X.*exp(-X.^2-Y.^2);
subplot(1,2,1); meshc(X,Y,Z);
subplot(1,2,2); surfc(X,Y,Z);

%%
%视角指令
sphere(50); shading flat;
light('Position',[1 3 2]);
light('Position',[-3 -1 3]);
material shiny;
axis vis3d off;
set(gcf,'Color',[1 1 1]);
view(-45,20);%改变视角的函数左seita 右-β
%%
%打光指令
[X, Y, Z] = sphere(64); h = surf(X, Y, Z);
axis square vis3d off;
reds = zeros(256, 3); reds(:, 1) = (0:256.-1)/255;
colormap(reds); shading interp; lighting phong;
set(h, 'AmbientStrength', 0.75, 'DiffuseStrength', 0.5);
L1 = light('Position', [-1, -1, -1]);
%set(L1, 'Position', [-1, -1, 1]);
%set(L1, 'Color', 'g');

%%
%空间多边形
v = [0 0 0; 1 0 0 ; 1 1 0; 0 1 0; 0.25 0.25 1; ...
0.75 0.25 1; 0.75 0.75 1; 0.25 0.75 1];
f = [1 2 3 4; 5 6 7 8; 1 2 6 5; 2 3 7 6; 3 4 8 7; 4 1 5 8];
subplot(1,2,1); patch('Vertices', v, 'Faces', f, ...
'FaceVertexCData', hsv(6), 'FaceColor', 'flat');
view(3); axis square tight; grid on;
subplot(1,2,2); patch('Vertices', v, 'Faces', f, ...
'FaceVertexCData', hsv(8), 'FaceColor', 'interp');
view(3); axis square tight; grid on;

%%
%装逼 随机山水图
load cape
X=conv2(ones(9,9)/81,cumsum(cumsum(randn(100,100)),2));
surf(X,'EdgeColor','none','EdgeLighting','Phong',...
'FaceColor','interp');
colormap(map); caxis([-10,300]);
grid off; axis off;