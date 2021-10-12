import sympy
from sympy import Symbol
import numpy

x = Symbol('x')

xn = []
yn = []

eq = input('Enter equation in variable x : ')
x1 = (float(input('Enter Initial value of x : ')))
h = float(input('Enter Step Value (i.e. h) :  '))
num = float(input('Enter Final Value to be found : '))

eq = sympy.parsing.sympy_parser.parse_expr(eq)

d_eq = eq.diff(x)

yn.append(eq.subs(x, x1))

for i in numpy.arange(x1, num, h):
    xn.append(round(i, 2))

print('Xn Values : ', xn)
k = 1
for j in xn:
    yn.insert(k, round(yn[k - 1] + h * d_eq.subs(x, j), 2))

    k = k + 1

actual = []

for l in range(len(xn)):
    actual.insert(l, round(eq.subs(x, xn[l]), 2))

print('Yn Values : ', yn)

print('actual values :', actual)

print('Final value of y {} = {}'.format(xn[-1], yn[-1]))
