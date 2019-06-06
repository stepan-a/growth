% Load Maddison data
T = readtable('../../../data/mpd2018.csv');

% Select USA data
srows = find(T.countrycode=="GBR");
gbr_rgdp = [T.year(srows), T.cgdppc(srows)];

% We only use data when they become available every year
srows = find(gbr_rgdp(:,1)>=1700);

% Plot the logged real GDP per capita for FRA (whole sample)
fh1 = figure(1);
plot(gbr_rgdp(srows,1), log(gbr_rgdp(srows,2)), '-k', 'linewidth', 2);
axis tight
box on

hold on
plot([1769 1769], [min(log(gbr_rgdp(srows,2))), ...
                   max(log(gbr_rgdp(srows,2)))], '-r')
hold off

% Save plot
saveas(fh1, '../../../cours/gbr_logged_rgdp_per_capita1', 'epsc2')

% Compute average growth annual rate
G1 = gbr_rgdp(srows(end),2)/gbr_rgdp(srows(1),2);
g1 = (G1^(1/(gbr_rgdp(srows(end),1)-gbr_rgdp(srows(1),1)))-1)*100;

g1
