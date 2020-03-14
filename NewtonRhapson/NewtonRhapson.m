function NewtonRhapson=NewtonRhapson(polynomialCoefficients,startingPoint,tolerance)
NewtonRhapson=0; % So that no error messanges occurs when fbis=0
xx(1)= startingPoint;
xx(2)= startingPoint*10+1; %temporary value in order for the while loop to start, +1 because of 0

FprimCoef= PolynomialDifferentiation(polynomialCoefficients,1);
Fprim= Polynomial(FprimCoef); %df/dx

FbisCoef= PolynomialDifferentiation(polynomialCoefficients,2);
Fbis= Polynomial(FbisCoef); %d^2f/dx^2

if Fbis==0
  disp('The second derivative of polynomial equals 0 => Newton Rhapsons Method doesn´t work, sets x(j)=0')
  return
end
i=1; % i,j iteration variables
j=1;
while abs(xx(i+1)-xx(i)) > tolerance
  xx(j+1)= NewtonRaphsonStep(xx(j),Fprim,Fbis);
  j=j+1;
  i=j-1;
  if j==100
    disp('Function may not have an optimum or try another guess')
    break
  end
end
NewtonRhapson= xx;
