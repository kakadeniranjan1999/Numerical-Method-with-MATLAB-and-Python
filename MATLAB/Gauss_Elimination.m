function [x]=Gauss_Elimination(a,d)

n=length(d);

for i =1:n
    for k=i+1:n
        f=a(k,i)/a(i,i);
        a(k,:)=a(k,:)-f*a(i,:);
        d(k)=d(k)-f*d(i);
    end
end

x=zeros(n,1);
for i=n:-1:1
    x(i)=(d(i)-a(i,i+1:n)*x(i+1:n))/a(i,i)
    disp(a(i,i+1:n))
%     disp(i)
end