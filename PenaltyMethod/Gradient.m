function gradfp=Gradient(x1,x2,mu)

if (x1^2+x2^2-1)>0
  gradfp=[2*x1-2+mu*4*x1*(x1^2+x2^2-1),...
    4*(x2-2)+mu*4*x2*(x1^2+x2^2-1)];%analytical solution for this particular problem
else
  gradfp=[2*x1-2,4*x2-8];
end
