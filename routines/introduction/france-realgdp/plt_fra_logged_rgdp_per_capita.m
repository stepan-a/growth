% Load Maddison data
T = readtable('../../../data/mpd2018.csv');

% Select FRA data
srows = find(T.countrycode=="FRA");
fra_rgdp = [T.year(srows), T.cgdppc(srows)];

% We only use data when they become available every year
srows = find(fra_rgdp(:,1)>=1280);

% Plot the logged real GDP per capita for FRA (whole sample)
fh1 = figure(1);
plot(fra_rgdp(srows,1), log(fra_rgdp(srows,2)), '-k', 'linewidth', 2);
axis tight
box on

% Save plots
saveas(fh1, '../../../cours/fra_logged_rgdp_per_capita1', 'epsc2')

% Compute average growth annual rate
G1 = fra_rgdp(srows(end),2)/fra_rgdp(srows(1),2);
g1 = (G1^(1/(fra_rgdp(srows(end),1)-fra_rgdp(srows(1),1)))-1)*100;

g1

% We only use data when from 1800 to 2016
srows = find(fra_rgdp(:,1)>=1800);

% Plot the logged real GDP per capita for FRA
fh2 = figure(2);
plot(fra_rgdp(srows,1), log(fra_rgdp(srows,2)), '-k', 'linewidth', 2);
axis tight
box on

% Save plot
saveas(fh2, '../../../cours/fra_logged_rgdp_per_capita2', 'epsc2')

% Compute average growth annual rate
G2 = fra_rgdp(srows(end),2)/fra_rgdp(srows(1),2);
g2 = (G2^(1/(fra_rgdp(srows(end),1)-fra_rgdp(srows(1),1)))-1)*100;

g2