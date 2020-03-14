function population=TspInitializePopulationNN(populationSize,cityLocation)
numberOfCities=size(cityLocation,1);
population=zeros(populationSize, numberOfCities);

for i=1:populationSize
        population(i,:)=GetNearestNeighbourPathGA(cityLocation);
end
end