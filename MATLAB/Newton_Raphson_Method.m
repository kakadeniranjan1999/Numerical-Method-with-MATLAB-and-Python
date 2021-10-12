function []=Newton_Raphson_Method()
    eqn_orig = input('Enter the equation in variable x : ','s');
    x0 = input('Enter the starting root : ');
    err = input('Enter the allowed error : ');
    round_off = input('Enter the number of decimal places : ');
    
    eqn = inline(eqn_orig);
    ddx = inline(diff(str2sym(eqn_orig)));
    digits(round_off);
    iter=[];
    for i = 1:10
        if eqn(x0) <= 0 && eqn(x0+1) >= 0 || eqn(x0) >= 0 && eqn(x0+1) <= 0
            x1=x0+1;
            fprintf('\n');
            cprintf('*cyan*','Approximation roots are : ');
            if abs(eqn(x0))>abs(eqn(x0+1))
                x0=x0+1;
                cprintf('*white*',['[ ' num2str(x0) ' ' num2str(x0-1) ' ]' '\n']);
            else
                cprintf('*white*',['[ ' num2str(x0) ' ' num2str(x0+1) ' ]' '\n']);
            end
            while true
                xn = x0 - (eqn(x0)/ddx(x0));
                iter = [iter xn];
                if abs(xn-x0) <= err
                    break
                else
                    x0 = xn;
                    continue
                end
            end
            
            for j=1:length(iter)
                cprintf('*cyan*',['Iteration ' num2str(j) ' : ']);
                disp(vpa(iter(j)));
            end
            break
        end
        x0=x0+1;
    end
end