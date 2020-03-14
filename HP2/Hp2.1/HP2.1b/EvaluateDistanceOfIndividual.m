function distance=EvaluateDistanceOfIndividual(chromosomeOfIndividual,cityLocations)
distance=0;

for i=1:size(cityLocations,1)-1
  
  index1=chromosomeOfIndividual(i);
  index2=chromosomeOfIndividual(i+1);
  location1=cityLocations(index1,:);
  location2=cityLocations(index2,:);
  distance=norm(location1-location2)+distance;
  
end

distance=distance+norm(cityLocations(chromosomeOfIndividual(size(cityLocations,1)),:)...
  -cityLocations(chromosomeOfIndividual(1),:));



