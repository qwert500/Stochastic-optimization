polynomialCoefficients=[1];
tolerance=0.001;
startingPoint=2;

x=NewtonRhapson(polynomialCoefficients,startingPoint,tolerance);
PlotIterations(polynomialCoefficients,x);