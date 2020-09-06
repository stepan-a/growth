function [abscissa,f] = kdens(data, m, bandwidth, kernelfunction)

% Estimates a continuous density.
%
% INPUTS
% - data                   [double]   n×1 vector of draws.
% - m                      [integer]  Scalar, number of points where the density is estimated. This (positive) integer must be a power of two.
% - bandwidth              [double]   Real positive scalar.
% - kernelfunction         [string]   Name of the kernel function: 'gaussian', 'triweight', 'uniform', 'triangle', 'epanechnikov', 'quartic', 'triweight' and 'cosinus'
%
% OUTPUTS
% - abscissa               [double]   m×1 vector of values on the abscissa axis.
% - f                      [double]   m×1 vector of values on the ordinate axis, (density estimates).
%
% REFERENCES
% A kernel density estimator is used (see Silverman [1986], "Density estimation for statistics and data analysis")
% The code is adapted from Anders Holtsberg's matlab toolbox (stixbox).

% Copyright (C) 2004-2017 Dynare Team
% Copyright (C) 2020 Stéphane Adjemian

if min(size(data))>1
    error('kernel_density_estimate:: data must be a one dimensional array.');
else
    data = data(:);
end

n = length(data);

test = log(m)/log(2);
if (abs(test-round(test)) > 1e-12)
    error('kernel_density_estimate:: The number of grid points must be a power of 2.');
end

%% Kernel specification.
if strcmpi(kernelfunction,'gaussian')
    kernel = @(x) inv(sqrt(2*pi))*exp(-0.5*x.^2);
elseif strcmpi(kernelfunction,'uniform')
    kernel = @(x) 0.5*(abs(x) <= 1);
elseif strcmpi(kernelfunction,'triangle')
    kernel = @(x) (1-abs(x)).*(abs(x) <= 1);
elseif strcmpi(kernelfunction,'epanechnikov')
    kernel = @(x) 0.75*(1-x.^2).*(abs(x) <= 1);
elseif strcmpi(kernelfunction,'quartic')
    kernel = @(x) 0.9375*((1-x.^2).^2).*(abs(x) <= 1);
elseif strcmpi(kernelfunction,'triweight')
    kernel = @(x) 1.09375*((1-x.^2).^3).*(abs(x) <= 1);
elseif strcmpi(kernelfunction,'cosinus')
    kernel = @(x) (pi/4)*cos((pi/2)*x).*(abs(x) <= 1);
end

%% Non parametric estimation (Gaussian kernel should be used (FFT)).
lower_bound  = min(data) - (max(data)-min(data))/3;
upper_bound  = max(data) + (max(data)-min(data))/3;
abscissa = linspace(lower_bound,upper_bound,m)';
inc = abscissa(2)-abscissa(1);
xi  = zeros(m,1);
xa  = (data-lower_bound)/(upper_bound-lower_bound)*m;
for i = 1:n
    indx = floor(xa(i));
    temp = xa(i)-indx;
    xi(indx+[1 2]) = xi(indx+[1 2]) + [1-temp,temp]';
end
xk = [-m:m-1]'*inc;
kk = kernel(xk/bandwidth);
kk = kk / (sum(kk)*inc*n);
f = ifft(fft(fftshift(kk)).*fft([ xi ; zeros(m,1) ]));
f = real(f(1:m));