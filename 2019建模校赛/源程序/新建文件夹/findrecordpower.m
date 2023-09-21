load('raw_data .mat')
Power=[];
recordPower=[];
for t=1:4
P(t,:)= raw_data.LogMag(10,5,:,t);
E(t,:)=10.^((P(t,:)/20));
fai(t,:)=raw_data.Phase(10,5,:,t);
end
N=2;
for p=1:4
    for q=1:32
        for i=1:4 
            for j=1:32
        aveE(p,q,i,j)=((E(p,q)+E(i,j))/2);%修改平均振幅公式
        bigE(p,q,i,j)=aveE(p,q,i,j).*abs(sin((fai(p,q)-fai(i,j))*N/2)./sin((fai(p,q)-fai(i,j))/2));
        Power(p,q,i,j)=20.*log10(bigE(p,q,i,j));
        if abs(abs(Power(p,q,i,j))-35)<=0.2*35
        recordPower=[recordPower;p,q,i,j];
        end
            end
        end
    end
end
