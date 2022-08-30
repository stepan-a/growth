function countries = findmaxlistofcountries(data, variable, range)

if range(1)<1950
    error('PWT data are not available before 1950.')
end

if range(end)>2019
    error('PWT data are not available after 2019.')
end

pwt = data.PWT(range(1)-1950+1:range(end)-1950+1,:,find(strcmp(data.variables, variable)));

countries = setdiff(data.countries, data.countries(find(any(isnan(pwt)))), 'stable');