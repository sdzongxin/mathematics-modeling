clc,clear
m=0;n=60;
for i=1:n
for j=1:n
for k=1:n
if i*j==50 &&i+j+k==n
  disp(i)
  disp(j)
    disp(k)
    m=m+1;
end
end
end
end
m=m/2;