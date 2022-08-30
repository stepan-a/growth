debug = false;

T = readtable('../../data/pwt100.csv');

countries = unique(T.countrycode);
variables = T.Properties.VariableNames;
years = unique(T.year);

excludedVariables = {'i_cig', 'i_xm', 'i_xr', 'i_outlier', 'cor_exp', 'statcap', 'i_irr'};
variables = setdiff(variables, excludedVariables, 'stable');

PWT = NaN(length(years), length(countries), length(variables));

for i = 5:length(variables)
    if debug
        fprintf('Current variable: %s\n', variables{i});
    end
    for j = 1:length(countries)
        PWT(:,j,i) = T.(variables{i})(find(strcmp(T.countrycode,countries{j})));
    end
end

save ../../data/pwt100.mat PWT countries variables years