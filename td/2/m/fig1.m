n = 0.02;
delta = 0.02; 
alpha = 0.33;

s0 = .15;
s1 = .30;

% Initial condition
k0 = (s0/(n+delta))^(1/(1-alpha));
y0 = k0^alpha;
c0 = (1-s0)*y0;

% Steady state
k1 = (s1/(n+delta))^(1/(1-alpha));
y1 = k1^alpha;
c1 = (1-s1)*y1;


kmax = 4*k0;

k = linspace(0,kmax,500);

plot([0 kmax],[0 (n+delta)*kmax],'-k')
hold on
plot(k,s0*k.^alpha,'-k','linewidth',2)
plot(k,s1*k.^alpha,'-r','linewidth',2)
plot([k0 k0],[0 s0*y0],'--k')
plot([k1 k1],[0 s1*y1],'--k')
i=1;
while 1
    plot(k0+i, 0, '>k')
    i = i+1
    if i+k0+1>=k1
        break
    end
end

text(k0, -.05  , 'k(0)', 'Color', 'k');
text(k1, -.05  , 'k^*', 'Color', 'k');
text(kmax+.1, s0*kmax^alpha, '\underline{s}k^{\alpha}')
text(kmax+.1, s1*kmax^alpha, '\overline{s}k^{\alpha}')

matlab2tikz('fig1.tikz', 'height', '\figureheight', 'width', '\figurewidth' )
