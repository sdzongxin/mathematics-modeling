%%
%线性拟合
x =[-1.2 -0.5 0.3 0.9 1.8 2.6 3.0 3.5];
y =[-15.6 -8.5 2.2 4.5 6.6 8.2 8.9 10.0];
fit = polyfit(x,y,1);%拟合过程
xfit = x(1):0.1:x(end); yfit = fit(1)*xfit + fit(2);
plot(x,y,'ro',xfit,yfit); set(gca,'FontSize',14);
legend('data points','best-fit');

%%
%相关性检验
x =[-1.2 -0.5 0.3 0.9 1.8 2.6 3.0 3.5];
y =[-15.6 -8.5 2.2 4.5 6.6 8.2 8.9 10.0];
scatter(x,y);%画散点图
box on; axis square;
r=corrcoef(x,y);
disp(r);

%%
%高阶线性拟合
x =[-1.2 -0.5 0.3 0.9 1.8 2.6 3.0 3.5];
y =[-15.6 -8.5 2.2 4.5 6.6 8.2 8.9 10.0];
figure('Position', [50 50 1500 400]);
for i=1:3
subplot(1,3,i); p = polyfit(x,y,i);
xfit = x(1):0.1:x(end); yfit = polyval(p,xfit);%y拟合函数
plot(x,y,'ro',xfit,yfit); set(gca,'FontSize',14);
ylim([-17, 11]); legend('Data points','Fitted curve');
end

%%
%多元拟合
load carsmall;
y = MPG;
x1 = Weight; x2 = Horsepower;
X = [ones(length(x1),1) x1 x2];
b = regress(y,X);
x1fit = min(x1):100:max(x1);
x2fit = min(x2):10:max(x2);
[X1FIT,X2FIT]=meshgrid(x1fit,x2fit);
YFIT=b(1)+b(2)*X1FIT+b(3)*X2FIT;
scatter3(x1,x2,y,'filled'); hold on;
mesh(X1FIT,X2FIT,YFIT); hold off;
xlabel('Weight');
ylabel('Horsepower');
zlabel('MPG'); view(50,10);


%%
%非线性拟合
cftool();%custom eqtion

%%
%以下是插值
%线性内插
x = linspace(0, 2*pi, 40); x_m = x;
x_m([11:13, 28:30]) = NaN; y_m = sin(x_m);
plot(x_m, y_m,'ro', 'MarkerFaceColor', 'r');
xlim([0, 2*pi]); ylim([-1.2, 1.2]); box on;
set(gca,  'FontSize', 16);
set(gca, 'XTick', 0:pi/2:2*pi);
set(gca, 'XTickLabel', {'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});
m_i = ~isnan(x_m);
y_i = interp1(x_m(m_i), ...
y_m(m_i), x);%内插函数
hold on;
plot(x,y_i,'-b', ...
'LineWidth', 2);
hold off;

%%
%平滑内插
x = linspace(0, 2*pi, 40); x_m = x;
x_m([11:13, 28:30]) = NaN; y_m = sin(x_m);
plot(x_m, y_m,'ro', 'MarkerFaceColor', 'r');
xlim([0, 2*pi]); ylim([-1.2, 1.2]); box on;
set(gca,  'FontSize', 16);
set(gca, 'XTick', 0:pi/2:2*pi);
set(gca, 'XTickLabel', {'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});
m_i = ~isnan(x_m);
y_i = spline(x_m(m_i), y_m(m_i), x);
hold on; plot(x,y_i,'-g', 'LineWidth', 2); hold off;
h = legend('Original', 'Linear', 'Spline');
set(h,'FontName', 'Times New Roman');

%%
%另一种内插
x = -3:3; y = [-1 -1 -1 0 1 1 1]; t = -3:.01:3;
s = spline(x,y,t); p = pchip(x,y,t);%Hermite Polynomial一种内插方法=。=
hold on; plot(t,s,':g', 'LineWidth', 2);
plot(t,p,'--b', 'LineWidth', 2);
plot(x,y,'ro', 'MarkerFaceColor', 'r');
hold off; box on; set(gca, 'FontSize', 16);
h = legend('Spline', 'Hermite', 'Original');

%%
%二维内插
xx = -2:.5:2; yy = -2:.5:3;
[X,Y] = meshgrid(xx,yy);
Z = X.*exp(-X.^2-Y.^2);
surf(X,Y,Z); hold on;
plot3(X,Y,Z+0.01,'ok',...
'MarkerFaceColor','r')
xx_i = -2:.1:2; yy_i = -2:.1:3;
[X_i,Y_i] = meshgrid(xx_i,yy_i);
Z_i = interp2(xx,yy,Z,X_i,Y_i);
surf(X_i,Y_i,Z_i); hold on;
plot3(X,Y,Z+0.01,'ok',...
'MarkerFaceColor','r')

%%
%平滑版
xx = -2:.5:2; yy = -2:.5:3; [X,Y] = meshgrid(xx,yy);
Z = X.*exp(-X.^2-Y.^2); xx_i = -2:.1:2; yy_i = -2:.1:3;
[X_i,Y_i] = meshgrid(xx_i,yy_i);
Z_c = interp2(xx,yy,Z,X_i,Y_i,'cubic');
surf(X_i,Y_i,Z_c); hold on;
plot3(X,Y,Z+0.01,'ok', 'MarkerFaceColor','r'); hold off;