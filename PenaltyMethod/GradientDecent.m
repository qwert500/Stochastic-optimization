function gradientDecent=GradientDecent(x,mu,stepLength,tolerance)
%stepLength is fixed => no line search needed
gradfp=Gradient(x(1),x(2),mu);
count=0;

while abs(max(gradfp))>tolerance
  count=count+1;
  gradfp=Gradient(x(1),x(2),mu);
  x=x-stepLength*gradfp;
end

gradientDecent=x;
end