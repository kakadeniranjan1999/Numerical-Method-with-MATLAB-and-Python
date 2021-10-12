import sympy
from sympy import Symbol
import numpy

x = Symbol('x')

eq = input('Enter equation in variable x : ')
a = float(input('Enter the lower limit value  : '))
b = float(input('Enter the upper limit value  : '))
n = float(input('Enter the value of n  : '))

eq = sympy.parsing.sympy_parser.parse_expr(eq)

del_x = float((b - a) / n)
print(del_x)

l = []

for i in numpy.arange(a + del_x, b, del_x):
    l.append(2 * eq.subs(x, i))
    print(l)

for j in range(0, len(l), 2):
    l[j] = 2 * l[j]

print(l)
m = sum(l)

print("Ans", ((del_x / 3) * (eq.subs(x, a) + m + eq.subs(x, b))))
