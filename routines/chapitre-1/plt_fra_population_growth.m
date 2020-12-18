showstatistics = false;


% Load Maddison data
warning ('off','all');
T = readtable('../../data/mpd2018.csv');
warning ('on','all');

years = T.year;
srows = (years>=1820);
frows = cellfun(@(x) isequal(x, 'France'), T.country);
Srows = find(srows & frows); 

fra_pop = [years(Srows), 1000*T.pop(Srows)];

if showstatistics
    % Plot the logged population
    fh1 = figure(1);
    plot(fra_pop(:,1), log(fra_pop(:,2)), '-k', 'linewidth', 2);
    axis tight
    box on
    % Plot the logged population
    fh2 = figure(2);
    plot(fra_pop(2:end,1), 100*(log(fra_pop(2:end,2))-log(fra_pop(1:end-1,2))), '-k', 'linewidth', 2);
    m = mean(100*(log(fra_pop(2:end,2))-log(fra_pop(1:end-1,2))));
    hold on
    plot([fra_pop(2,1) fra_pop(end,1)], [m m], '-r')
    hold off
    axis tight
    box on
    % Save plots
    saveas(fh1, '../../img/fra_logged_population', 'epsc2')
    saveas(fh2, '../../img/fra_population_growth', 'epsc2')
    % Display mean growth rate
    m
end

% Save data in a text file (to be used by latex/pgfplots)
fid = fopen('../../data/fra_logged_population.dat', 'w');
fprintf(fid, '%d \t %12.8f\n', [transpose(fra_pop(:,1)); transpose(log(fra_pop(:,2)))]);
fclose(fid);
fid = fopen('../../data/fra_population_growth.dat', 'w');
fprintf(fid, '%d \t %12.8f\n', [transpose(fra_pop(2:end,1)); transpose(100*(log(fra_pop(2:end,2))-log(fra_pop(1:end-1,2))))]);
fclose(fid);