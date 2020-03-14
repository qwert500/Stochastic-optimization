function updatedPosition=updatePositions(x,v,deltaT)
updatedPosition=zeros(size(x,1),size(x,2));
for i=1:size(x,1)
  for j=1:size(x,2)
    updatedPosition(i,j)=x(i,j)+v(i,j)*deltaT;
  end
end
end