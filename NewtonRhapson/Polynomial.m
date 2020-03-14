function Polynomial= Polynomial(polynomialCoefficients)
syms x
numberOfCoefficients= length(polynomialCoefficients); % Order of polynomial-1
if numberOfCoefficients == 1
  X=1;
else
  for i= 1:numberOfCoefficients
    X(i)=x.^(i-1);
  end
end
Polynomial= X*polynomialCoefficients';

