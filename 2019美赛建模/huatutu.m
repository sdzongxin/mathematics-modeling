%%
%����������
x = logspace(-1,1,100);%��1E-1 ��0.1��, 1E1��10����ȡһ�ٸ�����
y = x.^2;
subplot(2,2,1);%ͬʱ���ĸ�ͼ
plot(x,y);%������
title('Plot');
subplot(2,2,2);
semilogx(x,y);%x�������
             set(gca,'XGrid','on');
title('Semilogx');
subplot(2,2,3);
semilogy(x,y);%y�������
             set(gca,'YGrid','on');
title('Semilogy');
subplot(2,2,4);
loglog(x, y);%���Ƕ�����
title('Loglog');
%set(gca,'XGrid','on');%������ ������Ч����ܶ�
%set(gca,'YGrid','on');
%saveas(gcf,'<filename>','<formattype>';
%%
%˫y��ͼ �ſᣡ
x = 0:0.01:20;
y1 = 200*exp(-0.05*x).*sin(x);%����y����
y2 = 0.8*exp(-0.5*x).*sin(10*x);%����y����
[AX,H1,H2] = plotyy(x,y1,x,y2);
set(get(AX(1),'Ylabel'),'String','Left Y-axis')
set(get(AX(2),'Ylabel'),'String','Right Y-axis')
title('�ſ��˫y��');
set(H1,'LineStyle','--'); set(H2,'LineStyle',':');
%saveas(gcf,'<filename>','<formattype>';

%%
% ��״�ֲ�ͳ��ͼ�������壩
y = randn(1,1000);%���������
subplot(2,1,1);
hist(y,10);%�м�������Bins
title('Bins = 10');
subplot(2,1,2);
hist(y,50);
title('Bins = 50');

%%
% ��״ͼ�������壩
x = [1 2 5 4 8]; y = [x;1:5];%��Ҫ�Ƚϵ���ֵ
subplot(2,3,1); bar(x); title('A bargraph of vector x');
subplot(2,3,2); bar(y); title('A bargraph of vector y');
subplot(2,3,3); bar3(y); title('A 3D bargraph');
subplot(2,3,4);bar(y,'stacked');title('Stacked');%����һ���bar 
subplot(2,3,5);barh(y);title('Horizontal');%�������bar
subplot(2,3,6);barh(y,'stacked');title('Horizontal Stacked');%���������һ���bar 

%%
%������ͼ
x = 1:100; theta = x/10; r = log10(x);
subplot(1,4,1); polar(theta,r);%polar(theta,r)������ı�ʾѼ
theta = linspace(0, 2*pi); r = cos(4*theta);
subplot(1,4,2); polar(theta, r);
theta = linspace(0, 2*pi, 17); %linspace ��0��2�����ȷ֣�������Ķ�����N���ΰ�6�ĳ�N+1��N>=4������
r = ones(1,length(theta));
subplot(1,4,3); polar(theta,r);
theta = linspace(0, 2*pi); r = 1-sin(theta);
subplot(1,4,4); polar(theta , r);

%%
% ¥��ͼ�;�״ͼ
x = linspace(0, 4*pi, 40); y = sin(x);
subplot(1,2,1); stairs(y);
subplot(1,2,2); stem(y);

%%
%����ͼ�����bang
load carsmall
subplot(1,2,1);boxplot(MPG, Origin);
%error bar 
x=0:pi/10:pi; y=sin(x);
e=std(y)*ones(size(x));
subplot(1,2,2);errorbar(x,y,e);
%errorbar (x,y,e) x,y��plotһ�� e��������bar�Ĵ�С
%%
%��ͼ�õ�
t =(1:2:15)'*pi/8; x = sin(t); y = cos(t);
fill(x,y,'r'); axis square off;%fill����plot֮�������ͼ����ɫ
text(0,0,'STOP','Color', 'w', 'FontSize', 80, ...
'FontWeight','bold', 'HorizontalAlignment', 'center');

%%
%��ѧRGB��������ɫ��=��=
G = [46 38 29 24 13]; S = [29 27 17 26 8];
B = [29 23 19 32 7]; h = bar(1:5, [G' S' B']);
title('Medal count for top 5 countries in 2012 Olympics');
ylabel('Number of medals'); xlabel('Country');
legend('Gold', 'Silver', 'Bronze')

%%
%��ɫz��ͼ
[x, y] = meshgrid(-3:.2:3,-3:.2:3);
z = x.^2 + x.*y + y.^2; surf( x, y, z); box on;
set(gca,'FontSize', 16); zlabel('z');
 xlim([-4 4]); xlabel('x'); ylim([-4 4]); ylabel('y');%��ά����ɫͼ
figure 
imagesc(z); axis square; xlabel('x'); ylabel('y');%��ά����ɫ��ʾ����ά
%��ɫͼ���Բ顭��û������

%%
%��ά��ͼ����ά���ߣ�
x=0:0.1:3*pi; z1=sin(x); z2=sin(2.*x); z3=sin(3.*x);
y1=zeros(size(x)); y3=ones(size(x)); y2=y3./2;
plot3(x,y1,z1,'r',x,y2,z2,'b',x,y3,z3,'g'); grid on;
xlabel('x-axis'); ylabel('y-axis'); zlabel('z-axis');

figure
t = 0:pi/50:10*pi;
plot3(sin(t),cos(t),t)%�ۣ������꣡
grid on; axis square;

figure
turns = 40*pi;
t = linspace(0,turns,4000);%�ۣ�������
x = cos(t).*(turns-t)./turns;
y = sin(t).*(turns-t)./turns;
z = t./turns;
plot3(x,y,z); grid on;


%%
%�ſ��ɫ��άͼ���棩 �ȸ���ͼ��ͶӰ��
x = -3.5:0.2:3.5;
y = -3.5:0.2:3.5;
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);
subplot(2,3,1);
mesh(X,Y,Z);%�� ֻ����
subplot(2,3,2);
surf(X,Y,Z);%���� �����������ط������е�
axis square;
subplot(2,3,3);
contour(X,Y,Z);%�ȸ���ͼ��ͶӰ��
axis square;
subplot(2,3,4); contour(Z,[-.45:.2:.45]); %�ȸ��ߵ�ѡȡ
axis square;
subplot(2,3,5); [C,h] = contour(Z);%��ʾ�ȸ�����ֵ
clabel(C,h); axis square;
subplot(2,3,6); contourf(Z);%���˸�f��ʾfillͿ����ɫ
axis square;
%%
x = -3.5:0.2:3.5; y = -3.5:0.2:3.5;  %���������άͼ�»��ȸ�ͼ
[X,Y] = meshgrid(x,y); Z = X.*exp(-X.^2-Y.^2);
subplot(1,2,1); meshc(X,Y,Z);
subplot(1,2,2); surfc(X,Y,Z);

%%
%�ӽ�ָ��
sphere(50); shading flat;
light('Position',[1 3 2]);
light('Position',[-3 -1 3]);
material shiny;
axis vis3d off;
set(gcf,'Color',[1 1 1]);
view(-45,20);%�ı��ӽǵĺ�����seita ��-��
%%
%���ָ��
[X, Y, Z] = sphere(64); h = surf(X, Y, Z);
axis square vis3d off;
reds = zeros(256, 3); reds(:, 1) = (0:256.-1)/255;
colormap(reds); shading interp; lighting phong;
set(h, 'AmbientStrength', 0.75, 'DiffuseStrength', 0.5);
L1 = light('Position', [-1, -1, -1]);
%set(L1, 'Position', [-1, -1, 1]);
%set(L1, 'Color', 'g');

%%
%�ռ�����
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
%װ�� ���ɽˮͼ
load cape
X=conv2(ones(9,9)/81,cumsum(cumsum(randn(100,100)),2));
surf(X,'EdgeColor','none','EdgeLighting','Phong',...
'FaceColor','interp');
colormap(map); caxis([-10,300]);
grid off; axis off;