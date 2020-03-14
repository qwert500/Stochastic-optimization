clc,clear all
%=======Parameter Settings=======%
numberOfBoids=40;
numberOfVariables=2;
numberOfTimeSteps=200;
range=[-10 10];
alpha=1;
deltaT=1;
c1=2;%constants for velocity update
c2=2;
q=rand(numberOfBoids,2);%constants for velocity update
r=rand(numberOfBoids,2);
w=1.4; %inertia weight
beta=0.99;%reduces inertia weigt by beta each time step
vMax=0.15; %velocity restrictions
vMin=-vMax;

functionValue=zeros(numberOfBoids,1);
functionValuePB=zeros(numberOfBoids,1);



x=initializePositions(numberOfBoids,numberOfVariables,range);
xPB=x; % x=xPB in the initialization
v=initializeVelocities(alpha,deltaT,numberOfVariables,numberOfBoids,range);

for i=1:numberOfBoids
  functionValue(i)=evaluationOfBoid(x(i,:));
  functionValuePB(i)=evaluationOfBoid(x(i,:));
end

[value,index]=min(functionValue);
xSB=x(index,:);
functionValueSB=value;

for timeStep=1:numberOfTimeSteps
  
  for i=1:numberOfBoids
    functionValue(i)=evaluationOfBoid(x(i,:));
  end
  
  for i=1:numberOfBoids
    if functionValue(i)<functionValuePB(i)
      xPB(i,:)=x(i,:);
      functionValuePB(i)=evaluationOfBoid(x(i,:));
    end
  end
  
  for i=1:numberOfBoids
    if functionValue(i)<functionValueSB
      xSB=x(i,:);
      functionValueSB=evaluationOfBoid(xSB);
    end
  end
  
  v=updateVelocities(v,x,w,deltaT,xPB,xSB,c1,c2,q,r);
  
  %==========Velocity Restrictions==========
  for i=1:numberOfBoids 
    for j=1:numberOfVariables
      if v(i,j)>vMax
        v(i,j)=vMax;
      elseif v(i,j)<vMin
        v(i,j)=vMin;
      end
    end
  end
  
  x=updatePositions(x,v,deltaT);
  w=w*beta;
  
  figure(1)
  clf
  plot(x(:,1),x(:,2),'.')
  axis([-10 10 -10 10])
  pause(0.0001)
end
minimumOfFunction=evaluationOfBoid(xSB);
disp('Minimum Of Function')
disp(minimumOfFunction)
disp('Minimum Point')
disp(xSB)




