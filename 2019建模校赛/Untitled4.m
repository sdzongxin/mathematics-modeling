q1answer
f=3e10;
lamda=(3e8)/f;
beta=2.*pi/lamda;     %//��=2��/�� ����
n=32;                % //������Ԫ��Ŀ
t=-pi:0.01:pi;
d=lamda/4;          % //������Ԫ���Ϊ�������ķ�֮һ
W=beta.*d.*cos(t);
z1=((n/2).*W)-n/2*beta*d;
z2=((1/2).*W)-1/2*beta*d;
F1=sin(z1)./(n.*sin(z2));
K1=abs(F1);        % //����������Ԫ�ؽ��о���ֵ����ĺ���
polar(t+pi,K1);
