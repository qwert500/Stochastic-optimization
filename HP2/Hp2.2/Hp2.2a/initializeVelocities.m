function velocities=initializeVelocities(alpha,deltaT,numberOfVariables,numberOfBoids,range)

velocities=zeros(numberOfBoids,numberOfVariables);
for i=1:numberOfBoids
  for j=1:numberOfVariables
    r=rand(1);
    velocities(i,j)=alpha/deltaT*(-(range(2)-range(1))/2+r*(range(2)-range(1)));
  end
end
