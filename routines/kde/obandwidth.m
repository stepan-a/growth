function  h = obandwidth(data, bandwidth, kernelfunction)

% This function gives the optimal bandwidth parameter of a kernel estimator.
%
% INPUTS:
% - data               [double]  n×1 vector of draws.
% - bandwidth          [integer] Scalar equal to 0,-1 or -2.
%                                bandwidth =  0 => Silverman [1986] rule of thumb.
%                                bandwidth = -1 => Sheather and Jones [1991].
%                                bandwidth = -2 => Local bandwith parameters.
% - kernelfunction    [string]  Name of the kernel function: 'gaussian', 'triweight',
%                                'uniform', 'triangle', 'epanechnikov', 'quartic',
%                                'triweight' and 'cosinus'
%
% OUTPUTS:
% - h                  [double]  scalar or vector, optimal window width.
%
% REFERENCES:
% [1] Silverman [1986], "Density estimation for statistics and data analysis".

% Copyright (C) 2004-2017 Dynare Team
% Copyright (C) 2020 Stéphane Adjemian

n = length(data);

% Kernel specifications.
if strcmpi(kernelfunction,'gaussian')
    % Kernel definition
    k    = @(x)inv(sqrt(2*pi))*exp(-0.5*x.^2);
    % Second derivate of the kernel function
    k2   = @(x)inv(sqrt(2*pi))*(-exp(-0.5*x.^2)+(x.^2).*exp(-0.5*x.^2));
    % Fourth derivate of the kernel function
    k4   = @(x)inv(sqrt(2*pi))*(3*exp(-0.5*x.^2)-6*(x.^2).*exp(-0.5*x.^2)+(x.^4).*exp(-0.5*x.^2));
    % Sixth derivate of the kernel function
    k6   = @(x)inv(sqrt(2*pi))*(-15*exp(-0.5*x.^2)+45*(x.^2).*exp(-0.5*x.^2)-15*(x.^4).*exp(-0.5*x.^2)+(x.^6).*exp(-0.5*x.^2));
    mu02 = inv(2*sqrt(pi));
    mu21 = 1;
elseif strcmpi(kernelfunction,'uniform')
    k    = @(x)0.5*(abs(x) <= 1);
    mu02 = 0.5;
    mu21 = 1/3;
elseif strcmpi(kernelfunction,'triangle')
    k    = @(x)(1-abs(x)).*(abs(x) <= 1);
    mu02 = 2/3;
    mu21 = 1/6;
elseif strcmpi(kernelfunction,'epanechnikov')
    k    = @(x)0.75*(1-x.^2).*(abs(x) <= 1);
    mu02 = 3/5;
    mu21 = 1/5;
elseif strcmpi(kernelfunction,'quartic')
    k    = @(x)0.9375*((1-x.^2).^2).*(abs(x) <= 1);
    mu02 = 15/21;
    mu21 = 1/7;
elseif strcmpi(kernelfunction,'triweight')
    k    = @(x)1.09375*((1-x.^2).^3).*(abs(x) <= 1);
    k2   = @(x)(105/4*(1-x.^2).*x.^2-105/16*(1-x.^2).^2).*(abs(x) <= 1);
    k4   = @(x)(-1575/4*x.^2+315/4).*(abs(x) <= 1);
    k6   = @(x)(-1575/2).*(abs(x) <= 1);
    mu02 = 350/429;
    mu21 = 1/9;
elseif strcmpi(kernelfunction,'cosinus')
    k    = @(x)(pi/4)*cos((pi/2)*x).*(abs(x) <= 1);
    k2   = @(x)(-1/16*cos(pi*x/2)*pi^3).*(abs(x) <= 1);
    k4   = @(x)(1/64*cos(pi*x/2)*pi^5).*(abs(x) <= 1);
    k6   = @(x)(-1/256*cos(pi*x/2)*pi^7).*(abs(x) <= 1);
    mu02 = (pi^2)/16;
    mu21 = (pi^2-8)/pi^2;
else
    error('This kernel function is not yet implemented in Dynare!');
end

% Compute the standard deviation of the draws.
sigma = std(data);

% Optimal bandwidth parameter.
if bandwidth == 0  % Rule of thumb bandwidth parameter (Silverman [1986].
    h = 2*sigma*(sqrt(pi)*mu02/(12*(mu21^2)*n))^(1/5);
elseif bandwidth == -1 % Sheather and Jones [1991] plug-in estimation of the optimal bandwidth parameter.
    if strcmp(kernelfunction,'uniform')      || ...
            strcmp(kernelfunction,'triangle')     || ...
            strcmp(kernelfunction,'epanechnikov') || ...
            strcmp(kernelfunction,'quartic')
        error(['I can''t compute the optimal bandwidth with this kernel...' ...
               'Try the gaussian, triweight or cosinus kernels.']);
    end
    Itilda4 = 8*7*6*5/(((2*sigma)^9)*sqrt(pi));
    g3      = abs(2*k6(0)/(mu21*Itilda4*n))^(1/9);
    Ihat3   = 0;
    for i=1:n
        Ihat3 = Ihat3 + sum(k6((data(i,1)-data)/g3));
    end
    Ihat3 = - Ihat3/((n^2)*g3^7);
    g2    = abs(2*k4(0)/(mu21*Ihat3*n))^(1/7);
    Ihat2 = 0;
    for i=1:n
        Ihat2 = Ihat2 + sum(k4((data(i)-data)/g2));
    end
    Ihat2 = Ihat2/((n^2)*g2^5);
    h     = (correction*mu02/(n*Ihat2*mu21^2))^(1/5); % equation (22) in Skold and Roberts [2003].
elseif bandwidth == -2     % Bump killing... I compute local bandwith parameters in order to remove
                           % spurious bumps introduced by long rejecting periods.
    if strcmp(kernelfunction,'uniform')      || ...
            strcmp(kernelfunction,'triangle')     || ...
            strcmp(kernelfunction,'epanechnikov') || ...
            strcmp(kernelfunction,'quartic')
        error(['I can''t compute the optimal bandwidth with this kernel...' ...
               'Try the gaussian, triweight or cosinus kernels.']);
    end
    Itilda4 = 8*7*6*5/(((2*sigma)^9)*sqrt(pi));
    g3      = abs(2*k6(0)/(mu21*Itilda4*n))^(1/9);
    Ihat3   = 0;
    for i=1:n
        Ihat3 = Ihat3 + sum(k6((data(i,1)-data)/g3));
    end
    Ihat3 = -Ihat3/((n^2)*g3^7);
    g2    = abs(2*k4(0)/(mu21*Ihat3*n))^(1/7);
    Ihat2 = 0;
    for i=1:n
        Ihat2 = Ihat2 + sum(k4((data(i)-data)/g2));
    end
    Ihat2 = Ihat2/((n^2)*g2^5);
    h = ((2*T-1)*mu02/(n*Ihat2*mu21^2)).^(1/5); % h is a column vector (local banwidth parameters).
else
    error('Parameter bandwidth must be equal to 0, -1 or -2.');
end