debug = true;
tikz = false;

addpath ../pwt

pwt = load('../../data/pwt100.mat');

init = 1960; last = 2019;

[rgdpo, countries1, years1] = makesample(pwt, 'rgdpo', init:last);
[pop, countries2, years2] = makesample(pwt, 'pop', init:last);

if ~isequal(countries1, countries2)
    error('The two list of countried are different')
end

countries = countries1;

% display number of countries in the sample
fprintf('Number of countries observed between %s and %s is %s\n', num2str(init), num2str(last), num2str(length(countries)));

rgdpc = rgdpo./pop;
lrgdpc = log(rgdpc);

% Compute mean annual growth rate for each country
grgdpc = transpose((rgdpc(end,:)./rgdpc(1,:)).^(1/(last-init))-1)*100;

% Display growth rates
list = [countries, num2cell(grgdpc)];

% Min growth rate
[gmin, imin] = min(grgdpc);
fprintf('Min growth rate is %s for %s\n', num2str(gmin), countries{imin});

% Max growth rate
[gmax, imax] = max(grgdpc);
fprintf('Max growth rate is %s for %s\n', num2str(gmax), countries{imax});

% Poorest in year init
[yminInit, iyInit] = min(rgdpc(1,:));
fprintf('Country with smallest GDP/capita in %s is %s (%s)\n', int2str(init), countries{iyInit}, num2str(yminInit));

% Richest in year init
[ymaxInit, iyInit] = max(rgdpc(1,:));
fprintf('Country with highest GDP/capita in %s is %s (%s)\n', int2str(init), countries{iyInit}, num2str(ymaxInit));

fprintf('Level factor in %s is %s\n', int2str(init), num2str(ymaxInit/yminInit))

% Poorest in year last
[yminLast, iyLast] = min(rgdpc(end,:));
fprintf('Country with smallest GDP/capita in %s is %s (%s)\n', int2str(last), countries{iyLast}, num2str(yminLast));

% Richest in year init
[ymaxLast, iyLast] = max(rgdpc(end,:));
fprintf('Country with highest GDP/capita in %s is %s (%s)\n', int2str(last), countries{iyLast}, num2str(ymaxLast));

fprintf('Level factor in %s is %s\n', int2str(last), num2str(ymaxLast/yminLast))

% Disasters
list_d = list(grgdpc<0,:)

if ~isempty(list_d)
    for i=1:size(list_d, 1)
        fprintf('%s (%s%%), ', list_d{i,1}, num2str(list_d{i,2},2))
    end
end

% Miracles
list_m = list(grgdpc>5,:)

if ~isempty(list_m)
    for i=1:size(list_m, 1)
        fprintf('%s (%s%%), ', list_m{i,1}, num2str(list_m{i,2},2))
    end
end

% Max growth rate
[gmax, imax] = max(grgdpc);
fprintf('Max growth rate is %s for %s\n', num2str(gmax), countries{imax});


fprintf('Average growth rate is %s\n', num2str(mean(grgdpc)))
fprintf('Stdev. logged GDP per capita rate in %s is %s\n', int2str(init), num2str(sqrt(var(lrgdpc(1,:)))))
fprintf('Stdev. logged GDP per capita rate in %s is %s\n', int2str(last), num2str(sqrt(var(lrgdpc(end,:)))))

if debug
    % Plot growth against initial condition
    figure()
    hp = plot(lrgdpc(1,:), grgdpc, 'ow');
    hold on
    for i=1:length(countries)
        text(lrgdpc(1, i), grgdpc(i), countries{i});
    end
    xlabel(sprintf('Logarithme du PIB par tête en %s', int2str(init)))
    ylabel('Taux de croissance')
    hold off
    axis tight
    box on
end

if tikz
    addpath ../matlab2tikz/src
    matlab2tikz(sprintf('../../tikz/world-%s-%s.tex', int2str(init), int2str(last)))
end