load('raw_data .mat')
recorddianping=[];
for t=1:4
P(t,:)= raw_data.LogMag(10,5,:,t);
fai(t,:)=raw_data.Phase(10,5,:,t);
end
N=2;
for p=1:4
    for q=1:32
        for i=1:4 
            for j=1:32
        dianping(p,q,i,j)=sin(N*(fai(p,q)-fai(i,j))/2)./(N.*sin((fai(p,q)-fai(i,j))./2));
        if dianping(p,q,i,j)<=-0.5
        recorddianping=[recorddianping;p,q,i,j];
        end
            end
        end
    end
end
