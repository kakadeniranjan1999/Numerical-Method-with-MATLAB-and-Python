function []=Gauss_Seidal(a,d,iter)
    ad=[a d];
    [m,v] =max(abs(a));

    n=length(v);

    R=[ad(v(1),:);ad(v(2),:);ad(v(3),:)];

    x=zeros(n,1);

    for i=1:iter

        for k=1:n
            x(k)=(R(k,end)-R(k,1:k-1)*x(1:k-1)-R(k,k+1:n)*x(k+1:n))/R(k,k);
            disp(x(k))
        end
        disp(['iterartion',num2str(i)]);
    end
end