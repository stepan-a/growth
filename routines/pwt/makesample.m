function [db, countries, years] = makesample(data, variable, range)

countries = findmaxlistofcountries(data, variable, range);

[~, idx] = ismember(countries, data.countries);

db = data.PWT(range-1950+1, idx, find(strcmp(data.variables, variable)));
years = data.years;