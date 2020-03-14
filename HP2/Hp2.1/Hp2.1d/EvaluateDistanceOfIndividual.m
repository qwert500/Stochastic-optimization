function distance=EvaluateDistanceOfIndividual(chromosomeOfIndividual,cityLocation)
distance=0;

for i=1:size(cityLocation,1)-1
  
  index1=chromosomeOfIndividual(i);
  index2=chromosomeOfIndividual(i+1);
  
  location1=cityLocation(index1,:);
  location2=cityLocation(index2,:);
  
  distance=norm(location1-location2)+distance; 
end
%And back to the first city
distance=distance+norm(cityLocation(chromosomeOfIndividual(size(cityLocation,1)),:)...
  -cityLocation(chromosomeOfIndividual(1),:));



