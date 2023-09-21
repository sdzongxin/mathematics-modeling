function Fitness = GA_TSPfun(chrom)
%% Create City
NumCity = 9;
Fitness = 0;
Dist =[0 2.8946 6.5107 5.5845 5.2429 5.8733 4.4377 2.7627 6.5644;
 2.8946 0 4.3313 5.1381 5.7211 3.1830 2.3729 5.2763 5.0574;
 6.5107 4.3313 0 3.6548 5.2943 1.8590 2.0889 9.2412 8.3103;];

%% Decode:
order = [];
city = 1 : NumCity;
for j = 1 : NumCity 
    order = [order, city(1+rem( chrom(j)-1, length(city)))];
    city(1 + rem(chrom(j)-1, length(city))) = [];
end
for i = 1 : NumCity
    city1 = order(i);
    city2 = order(1 + rem(i, NumCity));
    Fitness = Fitness + Dist((city1-1)*NumCity + city2);
end
end
