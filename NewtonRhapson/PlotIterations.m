function PlotIterations=PlotIterations(polynomialCoefficients,xx)
numberOfIterates= length(xx);%including xx(1)=starting point
F= Polynomial(polynomialCoefficients);
y= linspace(-max(abs(xx))-1,max(abs(xx))+1);%plott linspace of polynomial function
syms x

hold on
for i=1:numberOfIterates
  plot(xx(i),subs(F,x,xx(i)),'o') %plots every iteration point  (x_j,F(x_j))
end

plot(y,subs(F,x,y)) % Plots polynom