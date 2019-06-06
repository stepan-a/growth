pwt = load('../../data/pwt90.mat');

[rgdpo, countries1, years1] = makesample(pwt, 'rgdpo', 1960:2014);
[pop, countries2, years2] = makesample(pwt, 'pop', 1960:2014);

[rgdpo1, countries1, years1] = makesample(pwt, 'rgdpo', 1960:2000);
[pop1, countries2, years2] = makesample(pwt, 'pop', 1960:2000);

if ~isequal(countries1, countries2)
    error('The two list of countried are different')
end

countries = countries1;

rgdpc = rgdpo./pop;
lrgdpc = log(rgdpc);

% Compute mean annual growth rate for each country
grgdpc = transpose((rgdpc(end,:)./rgdpc(1,:)).^(1/(2014-1960))-1)*100;

rgdpc1 = rgdpo1./pop1;
lrgdpc1 = log(rgdpc1);

% Compute mean annual growth rate for each country
grgdpc1 = transpose((rgdpc1(end,:)./rgdpc1(1,:)).^(1/(2000-1960))-1)*100;


% Display growth rates
[countries, num2cell(grgdpc1), num2cell(grgdpc)]

% Plot growth against initial condition
figure(1)
plot(lrgdpc(1,:), grgdpc, 'ow')
hold on
for i=1:length(countries)
    text(lrgdpc(1, i), grgdpc(i), countries{i});%, 'Color', 'red')
    %text(lrgdpc1(1, i), grgdpc1(i), countries{i})
end
hold off
axis tight
box on