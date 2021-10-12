function []=Bisection_Method()
    eqn = input('Enter the equation in variable x : ','s');
    eqn = inline(eqn,'x');
    x0 = input('Enter the starting root : ');
    n = input('Enter the number of iterations : ');
    round_off = input('Enter the number of decimal places : ');
    digits(round_off);
    iter=[];
    for i = 1:10
        if eqn(x0) <= 0 && eqn(x0+1) >= 0 || eqn(x0) >= 0 && eqn(x0+1) <= 0
            x1=x0+1;
            fprintf('\n');
            cprintf('*cyan*','Approximation roots are : ');
            cprintf('*white*',['[ ' num2str(x0) ' ' num2str(x1) ' ]' '\n']);
            for i=1:n
                xn = (x0+x1)/2;
                if eqn(x0) * eqn(xn) > 0
                    x0 = xn;
                elseif eqn(x1) * eqn(xn) > 0
                    x1 = xn;
                end
                iter=[iter xn];
            end
            for j=1:numel(iter)
                cprintf('*cyan*',['Iteration ' num2str(j) ' : ']);
                disp(vpa(iter(j)));
            end
            break
        end
        x0=x0+1;
    end
end