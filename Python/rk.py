import sympy
from sympy import Symbol
import numpy

x = Symbol('x')
y = Symbol('y')
xn = []
yn = []

eq = input('Enter equation dy/dx : ')
x1 = (float(input('Enter Initial value of x : ')))
yn.insert(0, (float(input('Enter Initial value of y : '))))
h = float(input('Enter Step Value : '))
num = float(input('Enter Final Value to be found : '))

eq = sympy.parsing.sympy_parser.parse_expr(eq)

for i in numpy.arange(x1, num, h):
    xn.append(round(i, 2))

for j in range(len(xn)):
    k1 = h * eq.subs({x: xn[j], y: yn[j]})
    k2 = h * eq.subs({x: xn[j] + h, y: yn[j] + k1})

    yn.append(round(yn[j] + 0.5 * (k1 + k2), 2))

print('Final value of y {} = {}'.format(xn[-1], yn[-1]))
