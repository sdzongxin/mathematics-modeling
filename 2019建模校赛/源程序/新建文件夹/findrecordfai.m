load('raw_data .mat')
  recordfai=[];
  err=[];
for t=1:4
P(t,:)= raw_data.LogMag(10,5,:,t);
fai(t,:)=raw_data.Phase(10,5,:,t);
end
for p=1:4
    for q=1:32
        for i=1:4 
            for j=1:32
       if abs(p-i)==0%%ȷ����������λ��
           err(p,q,i,j)=fai(p,q)-fai(i,j);
       end
       if abs(p-i)==1
           if p>i
            err(p,q,i,j)=90-(fai(p,q)-fai(i,j));
           else err(p,q,i,j)=-90-(fai(p,q)-fai(i,j));
           end
       end
        if abs(p-i)==2
            if p>i 
                err(p,q,i,j)=180-(fai(p,q)-fai(i,j));
            else err(p,q,i,j)=-180-(fai(p,q)-fai(i,j));
            end
        end
        if abs(p-i)==3
            if p>i
             err(p,q,i,j)=270-(fai(p,q)-fai(i,j));
            else err(p,q,i,j)=-270-(fai(p,q)-fai(i,j));
            end
        end
        if abs(err(p,q,i,j))>abs(err(p,q,i,j)+360)||abs(err(p,q,i,j))>abs(err(p,q,i,j)-360)%%����+-360������
            if abs(err(p,q,i,j)+360)<abs(err(p,q,i,j)-360)
                err(p,q,i,j)=err(p,q,i,j)+360;
            else err(p,q,i,j)=err(p,q,i,j)-360;
            end
        end
        if abs(err(p,q,i,j))<=360*0.13&&p~=i&&q~=j%%ɸѡ����¼��������������Ӧ������
        recordfai=[recordfai;p,q,i,j];
       end
            end
        end
    end
end
