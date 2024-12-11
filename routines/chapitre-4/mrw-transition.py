def phiK(h):
    """Frontière dans l'orthant positif (̂h,̂k).

    L'ensemble des points où les variations du capital physique par tête
    efficace sont nulles. Il s'agit d'une fonction monotone croissante et
    concave.
    """
    return (sK/(n+x+d))**(1/(1-alpha))*h**(lambd/(1-alpha))

def phiH(h):
    """Frontière dans l'orthant positif (̂h,̂k).

    L'ensemble des points où les variations du capital humain par tête
    efficace sont nulles. Il s'agit d'une fonction monotone croissante et
    convexe.
    """
    return ((n+x+d)/sH)**(1/alpha)*h**((1-lambd)/alpha)

def dotVariables__(X, t, alpha, lambd, sK, sH, n, x, delta):
    """Système d'équations différentielles à résoudre pour (̂h,̂k).

    Il y a peu de chance de parvenir à une solution avec ce système, car
    l'algorithme (odeint par exemple) va souvent dans des régions où les
    équations ne sont pas définies (par exemple avec un stock de capital
    physique négatif).
    """
    y = X[0]**alpha * X[1]**lambd
    dX = np.zeros(2)
    dX[0] = sK*y - (n+x+delta)*X[0]
    dX[1] = sH*y - (n+x+delta)*X[1]
    return dX

def dotVariables(X, t, alpha, lambd, sK, sH, n, x, delta):
    """Système d'équations différentielles à résoudre pour (log ̂h,log ̂k).

    Système équivalent à dotVariables__, mais ici les variables peuvent
    varier de -∞ à +∞. Le changement de variable permet de résoudre le
    problème de domaine de définiton rencontrés avec dotVariables__. À la
    sortie, il faut prendre l'exponentielle des trajectoires retournées par
    odeint (ou autre algorithme).
    """
    y = np.exp(X[0])**alpha * np.exp(X[1])**lambd   # ̂y
    dX = np.zeros(2)
    dX[0] = sK*y - (n+x+delta)*np.exp(X[0])         # variation de ̂k
    dX[1] = sH*y - (n+x+delta)*np.exp(X[1])         # variation de ̂h
    return dX

import matplotlib.pyplot as plt
import numpy as np
from scipy.integrate import odeint

# Discrétisation du temps
t = np.linspace(0, 70, 1000)

# Étalonnage du modèle
alpha = lambd = .3333333333
sK, sH = .15, .10
n = x = delta = .02

# État stationnaire (utilisé pour définir les conditions initiales)
kstar = (sK**(1-lambd)*sH**lambd/(n+x+delta))**(1/(1-alpha-lambd))
hstar = (sK**alpha*sH**(1-alpha)/(n+x+delta))**(1/(1-alpha-lambd))
ystar = kstar**alpha*hstar**lambd

# Conditions initiales
X0 = np.array([np.log(1.6*kstar), np.log(0.6*hstar)])

# Résolution du système d'équations différentielles
Paths = odeint(dotVariables, X0, t, args=(alpha, lambd, sK, sH, n, x, delta))

# On revient aux variables originales (sans logarithmes)
khat, hhat = np.exp(Paths[:,0]), np.exp(Paths[:,1])
yhat = khat**alpha * hhat**lambd

# Graphique
s = t[t<=50]
plt.plot(s, yhat[0:s.size], 'b-')
plt.plot([0, s[s.size-1]], [ystar, ystar], 'r--')

#import tikzplotlib
plt.savefig("../../pgf/mrw-transition.pgf")
