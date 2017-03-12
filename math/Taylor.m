function answer = Taylor(x,p)

n = 0:p;
approx = (x.^n)./factorial(n);
ans=sum(approx)
%gives a Taylor approximation for e^x