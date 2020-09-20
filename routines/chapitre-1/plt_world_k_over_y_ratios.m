tikz = true;

addpath ../pwt

pwt = load('../../data/pwt91.mat');

init = 1960; last = 2000;

[rgdpna, countries1, years1] = makesample(pwt, 'rgdpna', init:last);
[rnna, countries2, years2] = makesample(pwt, 'rnna', init:last);
[rgdpo, countries3, years3] = makesample(pwt, 'rgdpo', init:last);
[pop, countries4, years4] = makesample(pwt, 'pop', init:last);

if ~isequal(countries1, countries2)
    error('The two list of countried are different')
end

if ~isequal(countries3, countries4)
    error('The two list of countried are different')
end

if ~isequal(countries1, countries3)
    error('The two list of countried are different')
end

countries = countries1;

% Compute logged output per capita
rgdpc = rgdpo./pop;
lrgdpc = log(rgdpc);

% Compute K/Y
ky = rnna./rgdpna;

% Compute averaged ratios K/Y (per country)
mky = mean(ky);

% Plot growth against initial condition
figure()
plot(lrgdpc(1,:), mky, 'ow');
hold on
for i=1:length(countries)
    text(lrgdpc(1, i), mky(i), countries{i});
end
xlabel(sprintf('Logarithme du PIB par tête en %s', int2str(init)))
ylabel('Ratio K/Y')
hold off
axis tight
box on

if tikz
    addpath ../matlab2tikz/src
    matlab2tikz(sprintf('../../tikz/world-k-y-ratios-%s-%s.tex', int2str(init), int2str(last)))
end