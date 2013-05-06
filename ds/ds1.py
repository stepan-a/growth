# -*- coding: utf-8 -*-

import numpy as np
from pylab import *

# Set deep parameters.
alpha = .33
delta = .02
n = .02
s = .20

# Steady state.
kstar = (s/(n+delta))**(1.0/(1.0-alpha))

number_of_grid_points = 200
kgrid = np.linspace(0.1*kstar,1.9*kstar,number_of_grid_points)
gross_investment_per_unit_of_capital = s*kgrid**(alpha-1.0)

xlower = .05*kstar
xupper = 1.95*kstar
ylower = 0.0
yupper = max(gross_investment_per_unit_of_capital)


tikz = open('ds1-question-5.tikz', 'w')

tikz.write('\\begin{tikzpicture}[xscale=.4,yscale=40]\n\n')
tikz.write('\\draw [<->] (' + str(xlower) + ',' + str(yupper) + ') -- (' + str(xlower) + ',' + str(ylower) + ') -- (' + str(xupper) +  ',' + str(ylower) + ') node[right] {$k$};\n\n');

# Investissement brut par unité de capital
tikz.write('\\draw [black, thick] ')
for i in range(number_of_grid_points-1):
    tikz.write('(' + str(kgrid[i]) + ', ' + str(gross_investment_per_unit_of_capital[i]) + ') -- ')
tikz.write('(' + str(kgrid[number_of_grid_points-1]) + ', ' + str(gross_investment_per_unit_of_capital[number_of_grid_points-1]) + ');\n\n')

# Taux de dépréciation du capital par tête
tikz.write('\\draw [black] (' + str(xlower) + ', ' + str(n+delta) + ') -- (' + str(kgrid[number_of_grid_points-1]) + ', ' + str(n+delta) + ');\n\n')

# Noms des courbes
tikz.write('\\draw (' + str(xupper-.5) + ', ' + str(gross_investment_per_unit_of_capital[number_of_grid_points-1]) + ') node[right] {$\\frac{i}{k}$};\n')
tikz.write('\\draw (' + str(xlower-3) + ', ' + str(n+delta) + ') node[right] {$n+\delta$};\n')

# Représentation de l'état stationnaire
tikz.write('\\draw [black, thin, dashed]  (' + str(kstar) + ', ' + str(ylower) + ') -- ' + '(' + str(kstar) + ', ' + str(n+delta) +');\n' )
tikz.write('\\draw (' + str(kstar) + ', ' + str(ylower) + ') node[below] {$k^{\star}$};\n\n' )

# Représentation du taux de croissance pour un niveau donné du stock de capital par tête
tikz.write('\\draw [red, <->, thick] (' + str(.3*kstar) + ',' + str(n+delta) + ') -- (' + str(.3*kstar) + ',' + str(.99*s*(.3*kstar)**(alpha-1.0)) + ');\n\n');
tikz.write('\\draw [red] (' + str(.28*kstar) + ', ' + str(.5*(n+delta)+ .5*s*(.3*kstar)**(alpha-1.0)) + ') node[left] {$g_k$};\n\n' )

tikz.write('\\end{tikzpicture}')
tikz.close()
