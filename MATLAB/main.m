clear all
clc
methods = {'Bisection Method' 'Newton Raphson Method' 'Curve Fitting' 'Successive Approximation' 'Lagrange Interpolation' 'Gauss Elimination' 'Gauss Seidel'};
for i=1:length(methods)
    cprintf('*cyan*',[num2str(i) '.' ' ' methods{i} '\n']);
end
call = input('Enter choice number : ');
if call == 1
    Bisection_Method();
elseif (call == 2)
    Newton_Raphson_Method();
elseif (call == 3)
    Least_Square_Method();
elseif (call == 4)
    Successive_Approximation();
elseif (call == 5)
    Lagrange_Interpolation();
elseif (call == 6)
    a = input('Enter the a : ');
    d = input('Enter the d : ');
    Gauss_Elimination(a,d);
elseif (call == 7)
    a = input('Enter the a : ');
    d = input('Enter the d : ');
    iter = input('Enter iterations : ');
    Gauss_Seidal(a,d,iter);
end