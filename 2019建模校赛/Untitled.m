close all
eps = 0.00001;
k = 2*pi;%���ں�������
theta = -pi : pi / 10791 : pi;%�趨��Χ��С
var = sin(theta);
X=[1,2,3,4];
var(X)=1.6667 ;
nelements = 8;%Ԫ�ظ���
d = 1;         %  d = 1;
num = sin((nelements * k * d * 0.5) .* var);
 if(abs(num) <= eps)
   num = eps;
end
den = sin((k* d * 0.5) .* var);
if(abs(den) <= eps)
   den = eps;
end
 pattern = abs(num ./ den);
maxval = max(pattern);
pattern = pattern ./ maxval;
 figure(1)%���з���ͼ
theta = theta +pi/2;%����С˼�����Լ�����ΪʲôҪ��pi/2
polar(theta,pattern)
title ('���з���ͼ')
 figure(2)%���ʷ���ͼ
Polar_dB(theta,pattern)
title ('���ʷ���ͼ')