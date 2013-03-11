n = 0.02;
delta = 0.02; 
alpha = 0.33;

s = linspace(0,1,200)

k = (s/(n+delta)).^(1/(1-alpha));
y = k.^alpha;
c = (1-s).*y;

plot(s,c,'-k','linewidth',2)
hold on
plot([alpha alpha],[0 max(c)],'--k')
text(alpha, -.1  , '\alpha');

matlab2tikz('fig2.tikz', 'height', '\figureheight', 'width', '\figurewidth' )
