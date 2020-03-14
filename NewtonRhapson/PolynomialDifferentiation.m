function PolynomialDifferentiation= PolynomialDifferentiation(polynomialCoefficients,k)
numberOfCoefficients=length(polynomialCoefficients); %polynomial degree -1
j=0;
PolynomialDifferentiation= zeros(1,numberOfCoefficients-k);
if k>=numberOfCoefficients
  PolynomialDifferentiation=0;
else
  for i=k:numberOfCoefficients-1
    j=j+1;
    PolynomialDifferentiation(1,j)= polynomialCoefficients(i+1)*factorial(i)/(factorial(i-k));
  end
end