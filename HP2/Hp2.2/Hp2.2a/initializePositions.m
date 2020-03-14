function positions=initializePositions(numberOfBoids,numberOfVariables,range)
positions=zeros(numberOfBoids,numberOfVariables);

for i=1:numberOfBoids
  for j=1:numberOfVariables
    r=rand(1);
  positions(i,j)= range(1)+r*(range(2)-range(1));
  end
end

end