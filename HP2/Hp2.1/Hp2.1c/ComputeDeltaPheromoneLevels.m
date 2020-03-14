function deltaPheromoneLevel=ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)
j=1;
nCities=size(pathCollection,1)/size(pathLengthCollection,1);
deltaPheromoneLevel=zeros(nCities,nCities);

for i=1:size(pathCollection,1)-1
  
  if i==nCities*j-1 %must be 49,99 etc..
    
    deltaPheromoneLevel(pathCollection(i+1),pathCollection(i))=1/pathLengthCollection(j)...
      +deltaPheromoneLevel(pathCollection(i+1),pathCollection(i));
    
    deltaPheromoneLevel(pathCollection(i+1),pathCollection(i+2-nCities))=1/pathLengthCollection(j)...
      +deltaPheromoneLevel(pathCollection(i+1),pathCollection(i));
    
    j=j+1;
  elseif i==nCities*(j-1)
    %not a path
  else
    deltaPheromoneLevel(pathCollection(i+1),pathCollection(i))=1/pathLengthCollection(j)...
      +deltaPheromoneLevel(pathCollection(i+1),pathCollection(i));
  end
  
end
end