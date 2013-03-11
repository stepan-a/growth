x = linspace(0,5,100);
y = exp(-.25*1./(x+.1));

[junk,idx] = min(abs(y-.7));

T = x(idx);

plot(x,y,'-k','linewidth',2)
hold on
plot([0 5],[.7 .7],'--k')
plot([0 5],[1 1],'--k')
plot([T T],[0 1.3],'--r')
axis([0 5 0 1.3])
text(-0.1, .7, 'c0');
text(-0.1, 1, 'cstar');
text(T,-0.2,'T')

matlab2tikz('fig4.tikz', 'height', '\figureheight', 'width', '\figurewidth' )
