function []=Least_Square_Method()
    types = {'Straight-Line Fitting' 'Quadratic / Parabolic Curve Fitting' 'Power Fitting' 'Exponential Fitting'};
    for i=1:length(types)
        cprintf('*cyan*',[num2str(i) '.' ' ' types{i} '\n']);
    end
    type = input('Enter choice number : ');
    X = input('Enter the independant variable array : ');
    Y = input('Enter the dependant variable array : ');
    round_off = input('Enter the number of decimal places : ');
    digits(round_off);
    if type == 1
        syms a b;
        eqn1 = @(a,b) ((a*length(X)+b*sum(X)-sum(Y)));
        eqn2 = @(a,b) ((a*sum(X)+b*sum(X.^2)-sum(X.*Y)));
        [A B] = equationsToMatrix({eqn1 eqn2}, [a b]);
        values = vpa(linsolve(A,B));
        fprintf(['\n' 'a : ' num2str(double(values(1))) '\n' 'b : ' num2str(double(values(2))) '\n']);
    elseif (type == 2)
        syms a b c;
        eqn1 = @(a,b,c) ((a*sum(X.^2)+b*sum(X)+c*length(X)-sum(Y)));
        eqn2 = @(a,b,c) ((a*sum(X.^3)+b*sum(X.^2)+c*sum(X)-sum(X.*Y)));
        eqn3 = @(a,b,c) ((a*sum(X.^4)+b*sum(X.^3)+c*sum(X.^2)-sum((X.^2).*Y)));
        [A B] = equationsToMatrix({eqn1 eqn2 eqn3}, [a b c]);
        values = vpa(linsolve(A,B));
        fprintf(['\n' 'a : ' num2str(double(values(1))) '\n' 'b : ' num2str(double(values(2))) ' \n' 'c : ' num2str(double(values(3))) '\n']);
    elseif (type == 3 || type ==4)
        Y = log(Y);
        if type == 3
            X = log(X);
        end
        syms a b;
        eqn1 = @(a,b) ((a*length(X)+b*sum(X)-sum(Y)));
        eqn2 = @(a,b) ((a*sum(X)+b*sum(X.^2)-sum(X.*Y)));
        [A B] = equationsToMatrix({eqn1 eqn2}, [a b]);
        values = vpa(linsolve(A,B));
        fprintf(['\n' 'a : ' num2str(double(exp(values(1)))) '\n' 'b : ' num2str(double(values(2))) '\n']);
    end
end