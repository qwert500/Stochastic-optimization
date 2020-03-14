clc,clear all
%=========Parameter Settings=============%
populationSize=100;
numberOfGenerations=5000;
mutationProbability=0.0167*3;
tournamentSelectionParameter=0.8;
tournamentSize=2;
plotParameter=0; 
nCopies=1; 

cityLocation = LoadCityLocations;
nCities = size(cityLocation,1);
fitness=zeros(populationSize,1);
pathDistance=zeros(populationSize,1);

%=========Initialization=========%
population=TspInitializePopulationNN(populationSize,cityLocation);

for i=2:populationSize
  population(i,:)=TspMutate2(population(i,:));
end

for iGeneration=1:numberOfGenerations
  
  maximumFitness=0.0; %assume non negative fitness values
  bestIndividualIndex=0;
  
  %=======Finds Best Individual============%
  for i= 1:populationSize 
    chromosome = population(i,:);
    pathDistance(i)=EvaluateDistanceOfIndividual(chromosome,cityLocation);
    fitness(i)= 1/pathDistance(i);
    if (fitness(i)> maximumFitness)
      maximumFitness=fitness(i);
      bestIndividualIndex=i;
    end
  end
  
  %====================Plot================%
  if fitness(bestIndividualIndex)>plotParameter 
    clf
    plotParameter=fitness(bestIndividualIndex);
    tspFigure = InitializeTspPlot(cityLocation,[0 20 0 20]);
    connection = InitializeConnections(cityLocation);
    PlotPath(connection,cityLocation,population(bestIndividualIndex,:));
  end
  
  
  tempPopulation=population;
  
  %=================Tournament=============%
  for i= 1:2:populationSize  
    i1= TournamentSelect(fitness,tournamentSelectionParameter,tournamentSize);
    i2= TournamentSelect(fitness,tournamentSelectionParameter,tournamentSize);
    
    chromosome1= population(i1,:);
    chromosome2= population(i2,:);
    
    tempPopulation(i,:)=chromosome1;
    tempPopulation(i+1,:)=chromosome2;
    
  end
  
  %================Mutation===============%
  for i =1:populationSize 
    originalChromosome= tempPopulation(i,:);
    mutatedChromosome= TspMutate(originalChromosome,mutationProbability);
    tempPopulation(i,:)=mutatedChromosome;
    
  end

  population=InsertBestIndividual(tempPopulation,population(bestIndividualIndex,:),nCopies);%Elitism
  
end

disp('Shortest Tour')
disp(population(1,:))
disp('Path Length')
shorterstPathLength=EvaluateDistanceOfIndividual(population(1,:),cityLocation);
disp(shorterstPathLength)


