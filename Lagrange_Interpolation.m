function []=Lagrange_Interpolation()
    X = input('Enter the independant variable array : ');
    Y = input('Enter the dependant variable array : ');
    interpolation = input('Enter x to find f(x) : ');
    round_off = input('Enter the number of decimal places : ');
    digits(round_off);
    L=[];
    
    for i=1:length(X)
        Ln = 1;
        for j = 1:length(X)
            if j~=i
                Ln = Ln * (interpolation-X(j))/(X(i)-X(j));
            end
        end
        L = [L Ln];
    end
    result = vpa(sum(Y.*L));
    fprintf(['\n' 'Answer : ' num2str(double(result)) '\n']);
end