showstatistics = true;

addpath ../pwt

pwt = load('../../data/pwt91.mat');

init = 1950; last = 2017;

[rgdpna, countries1, years1] = makesample(pwt, 'rgdpna', init:last);
[rnna, countries2, years2] = makesample(pwt, 'rnna', init:last);

if ~isequal(countries1, countries2)
    error('The two list of countried are different')
end

countries = countries1;

ky = rnna./rgdpna;

% Compute France index
idF = strmatch('FRA', countries);

if showstatistics
    fh1 = figure(1);
    plot(init:1:last, ky(:,idF), '-k', 'linewidth', 2);
    axis tight
    box on
end

% Save data for tikz figure.
fid = fopen('../../data/fra_k_over_y_ratio.dat', 'w');
fprintf(fid, '%d \t %12.8f\n', [init:1:last; transpose(ky(:,idF))]);
fclose(fid);