% Load Maddison data
T = readtable('../../../data/mpd2018.csv');

% Select USA data
srows = find(T.countrycode=="USA");
usa_rgdp = [T.year(srows), T.cgdppc(srows)];

% We only use data when they become available every year
srows = find(usa_rgdp(:,1)>=1800);

% Plot the logged real GDP per capita for USA
fh = figure();
plot(usa_rgdp(srows,1), log(usa_rgdp(srows,2)), '-k', 'linewidth', 2);
axis tight
box on

% Save plot
saveas(fh, '../../../cours/usa_logged_rgdp_per_capita', 'epsc2')

% Compute average growth annual rate
G = usa_rgdp(srows(end),2)/usa_rgdp(srows(1),2);
g = (G^(1/length(srows))-1)*100;