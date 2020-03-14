function functionValue=evaluationOfBoids(x)
functionValue=zeros(size(x,1),1);
for i=1:size(x,1)
functionValue(i)=1+(-13+x(i,1)-x(i,2)^3 +5*x(i,2)^2 -2*x(i,2))^2 ...
+(-29+x(i,1)+x(i,2)^3 +x(i,2)^2 -14*x(i,2))^2;
end
end