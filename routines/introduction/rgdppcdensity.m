debug = false;

addpath ../pwt
addpath ../kde

pwt = load('../../data/pwt100.mat');

init = 1960; last = 2019;

[rgdpo, countries1, years1] = makesample(pwt, 'rgdpo', init:last);
[pop, countries2, years2] = makesample(pwt, 'pop', init:last);

if ~isequal(countries1, countries2)
    error('The two list of countried are different')
end

countries = countries1;

rgdpc = rgdpo./pop;
lrgdpc1 = transpose(log(rgdpc(1,:)));
lrgdpc2 = transpose(log(rgdpc(end,:)));

if debug
    % Display log levels
    [countries, num2cell(lrgdpc1), num2cell(lrgdpc2)]
end

h1 = obandwidth(lrgdpc1, 0, 'gaussian');
h2 = obandwidth(lrgdpc2, 0, 'gaussian');

[x1, f1] = kdens(lrgdpc1, 2^9, h1, 'gaussian');
[x2, f2] = kdens(lrgdpc2, 2^9, h2, 'gaussian');

if debug
    figure()
    plot(x1, f1, '-k')
    hold on
    plot(x2, f2, '-r')
    box on
end

% Save data in a text file (to be used by latex/pgfplots)
fid = fopen('../../data/rgdpc-density-1960.dat', 'w');
fprintf(fid, '%d \t %12.8f\n', [transpose(x1); transpose(f1)]);
fclose(fid);
fid = fopen('../../data/rgdpc-density-2019.dat', 'w');
fprintf(fid, '%d \t %12.8f\n', [transpose(x2); transpose(f2)]);
fclose(fid);