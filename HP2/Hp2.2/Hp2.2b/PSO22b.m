clc,clear all
%=======Parameter Settings=======%
numberOfBoids=40;
numberOfVariables=5;
numberOfTimeSteps=300;
range=[-30 30];
alpha=1;
deltaT=1;
c1=2;%constants for velocity update
c2=2;
q=rand(numberOfBoids,numberOfVariables);%constants for velocity update
r=rand(numberOfBoids,numberOfVariables);
w=1.5; %inertia weight
beta=0.99;%reduces inertia weigt by beta each time step
vMax=15; %velocity restrictions
vMin=-vMax;

functionValue=zeros(numberOfBoids,1);
functionValuePB=zeros(numberOfBoids,1);



x=initializePositions(numberOfBoids,numberOfVariables,range);
xPB=x; % x=xPB in the initialization
v=initializeVelocities(alpha,deltaT,numberOfVariables,numberOfBoids,range);
for i=1:numberOfBoids
  functionValue(i)=evaluationOfBoid2(x(i,:));
  functionValuePB(i)=evaluationOfBoid2(x(i,:));
end
[value,index]=min(functionValue);
xSB=x(index,:);
functionValueSB=value;

for timeStep=1:numberOfTimeSteps
  
  for i=1:numberOfBoids
    functionValue(i)=evaluationOfBoid2(x(i,:));
  end
  
  for i=1:numberOfBoids
    if functionValue(i)<functionValuePB(i)
      xPB(i,:)=x(i,:);
      functionValuePB(i)=evaluationOfBoid2(x(i,:));
    end
  end
  
  for i=1:numberOfBoids
    if functionValue(i)<functionValueSB
      xSB=x(i,:);
      functionValueSB=evaluationOfBoid2(xSB);
    end
  end
  
  v=updateVelocities(v,x,w,deltaT,xPB,xSB,c1,c2,q,r);
  
  for i=1:numberOfBoids %check of velocity restrictions
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
end
minimumOfFunction=evaluationOfBoid2(xSB);
disp('Minimum Of Function')
disp(minimumOfFunction)
disp('Minimum Point')
disp(xSB)


