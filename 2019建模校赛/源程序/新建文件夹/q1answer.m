findrecordpower
findrecordfai
findrecorddianping
record=[];
for i=1:length(recordfai(:,1))
    for j=1:length(recordPower(:,1))
        for k=1:length(recorddianping(:,1))
            if recordPower(j,1)==recordfai(i,1)&&recordfai(i,1)==recorddianping(k,1)...
                &&recordPower(j,2)==recordfai(i,2)&&recordfai(i,2)==recorddianping(k,2)...
                &&recordPower(j,3)==recordfai(i,3)&&recordfai(i,3)==recorddianping(k,3)...
                &&recordPower(j,4)==recordfai(i,4)&&recordfai(i,4)==recorddianping(k,4)
            record=[record;i,j,k];
            end
        end
    end
end
for t=1:length(record(:,1))
    disp(recordfai((record(t,1)),:))
end