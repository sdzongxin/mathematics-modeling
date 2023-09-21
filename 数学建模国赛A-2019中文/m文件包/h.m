function h(t)
fujian2=[xlsread('附件2-针阀运动曲线.xlsx','A2:B46');[(0.45:0.01:2)',2*ones(156,1)];...
    xlsread('附件2-针阀运动曲线.xlsx','D2:E46');[(2.46:0.01:100)',zeros(9755,1)]];
x=fujian2(:,1);
y=fujian2(:,2);
for i=1:length(x)
    h(x(i))=y(i);
end
