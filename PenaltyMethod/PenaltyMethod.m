function PenaltyMethod
clc, clear all
format short

muValues=[1 10 100 1000];%Values of my
stepLength=0.0001;
tolerance=10^(-6);
x0=[1 2]; %starting point for the gradient decent, calculated analytically for this problem
tableValues=zeros(4,3);

for i=1:4
  mu=muValues(i);
  x=x0;
  x=GradientDecent(x,mu,stepLength,tolerance);
  tableValues(i,:)=[mu,x(1),x(2)];
end

variableNamesTable={'mu' 'x1' 'x2'};
Table=table(round(tableValues(:,1,:),3),round(tableValues(:,2,:),3),round(tableValues(:,3,:),3),'variableNames',variableNamesTable);
disp(Table) 