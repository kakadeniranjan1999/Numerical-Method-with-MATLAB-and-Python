import sympy
import numpy as np

x = sympy.Symbol('x')
mid_vals = []

eqn = input('Enter equation in "x" variable : ')
a = float(input('Enter lower limit : '))
b = float(input('Enter upper limit : '))
n = float(input('Enter number of steps : '))

eqn = sympy.parsing.sympy_parser.parse_expr(eqn)

h = float((b - a) / n)

mid_vals = []

mid_vals = [round(eqn.subs(x, i), 2) for i in np.arange(a + h, b, h)]

mid_vals_summation = 2 * sum(mid_vals)

ans = ((h / 2) * (eqn.subs(x, a) + mid_vals_summation + eqn.subs(x, b)))

print('\nThe value of h is : ' + str(h) + '\n')
print('Array of [x1,x(n-1)] is :' + str(mid_vals) + '\n')
print('Value is : ', ans)
