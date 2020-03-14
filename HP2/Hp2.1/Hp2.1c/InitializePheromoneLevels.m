function pheromoneLevel=InitializePheromoneLevels(numberOfCities, tau0)

diagonalSubtraction=ones(numberOfCities,1)*tau0;
pheromoneLevel=ones(numberOfCities,numberOfCities)*tau0-diag(diagonalSubtraction);