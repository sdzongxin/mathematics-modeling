%q1answer
f=3e10;
lamda=(3e8)/f;
beta=2.*pi/lamda;
d=lamda/4;
T=-pi:0.01:pi;
W=beta.*d.*cos(T);
z2=((1/2).*W)-1/2*beta*d;
for i=1:t
    n=recordfai((record(i,1)),2)+recordfai((record(i,1)),4);
switch fix(recordfai((record(i,1)),1)-recordfai((record(i,1)),3)/d/beta)
    case -1; k=-1;
    case 0 ; k=0;
    case 1 ; k=1;  
end
xuanzhuan=abs(asin(k-(recordfai((record(i,1)),1)-recordfai((record(i,1)),3))/d/beta));
z1=((n/2).*W)-n/2*beta*d;
F1=sin(z1)./(n.*sin(z2));
K1=abs(F1);   
figure(i)
polar(T+xuanzhuan,K1);
show=[recordfai((record(i,1)),1);recordfai((record(i,1)),2);recordfai((record(i,1)),3);recordfai((record(i,1)),4)]';
title(show)
end
