x = linspace(0,5,100);

plot(x,exp(-.25*x)+1,'-k','linewidth',2)
hold on
plot([0 5],[.5 .5],'--k')
plot([0 5],[1.2 1.2],'--k')
axis([0 5 0 2.5])
text(-0.1, .5, 'c0');
text(-0.1, 1.2, 'cstar');

matlab2tikz('fig3.tikz', 'height', '\figureheight', 'width', '\figurewidth' )
