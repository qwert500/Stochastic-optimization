clear all
clc
close all
populationSize=100;
numberOfGenes=60;
crossoverProbability=0.8;
mutationProbability=0.0167;
tournamentSelectionParameter=0.8;
variableRange=5.0;
numberOfGenerations=100;
n=2; %number of variables of the function
nc=1; %number of copies of the best individual in new generation
tournamentSize=2;
numberOfIterations=50;
fitness=zeros(populationSize,1);
bestFitnessOfLastGeneration=zeros(numberOfIterations,1);
bestxValuesOfLastGeneration=zeros(numberOfIterations,2);

fitnessFigureHandle= figure;
hold on;
set(fitnessFigureHandle, 'position', [50 50 500 200]);
set(fitnessFigureHandle, 'DoubleBuffer', 'on');
axis([1 numberOfGenerations 0 0.5]);
bestPlotHandle=plot(1:numberOfGenerations,zeros(1,numberOfGenerations));
textHandle=text(30,2.6,sprintf('best: %4.3f',0.0));
hold off;
drawnow;

surfaceFigureHandle= figure; %surface plot
hold on;
set(surfaceFigureHandle,'DoubleBuffer','on')
delta=0.1;
limit=fix(2*variableRange/delta)+1;
[xValues,yValues]= meshgrid(-variableRange:delta:variableRange,...
  -variableRange:delta:variableRange);
zValues= zeros(limit,limit);
for j=1:limit
  for k=1:limit
    zValues(j,k)=EvaluateIndividual([xValues(j,k) yValues(j,k)]);
  end
end

surfl(xValues,yValues,zValues)
colormap gray;
shading interp;
view([-7 -9 10]);
decodedPopulation= zeros(populationSize,2);
populationPlotHandle= plot3(decodedPopulation(:,1),...
  decodedPopulation(:,2),fitness(:),'kp');
hold off;
drawnow;


for iteration=1:numberOfIterations
  
  population=InitializePopulation(populationSize,numberOfGenes);
  
  for iGeneration=1:numberOfGenerations
    maximumFitness=0.0; %assume non negative fitness values
    xBest= zeros(1,2);%[0 0]
    bestIndividualIndex=0;
    for i= 1:populationSize
      chromosome = population(i,:);
      x=DecodeChromosome(chromosome,n , variableRange);
      decodedPopulation(i,:)=x;
      fitness(i)= EvaluateIndividual(x);
      if (fitness(i)> maximumFitness)
        maximumFitness=fitness(i);
        bestIndividualIndex=i;
        xBest=x;
      end
    end
    
    tempPopulation=population;
    
    for i= 1:2:populationSize
      i1= TournamentSelect(fitness,tournamentSelectionParameter,tournamentSize);
      i2= TournamentSelect(fitness,tournamentSelectionParameter,tournamentSize);
      chromosome1= population(i1,:);
      chromosome2= population(i2,:);
      
      r=rand;
      if(r<crossoverProbability)
        newChromosomePair=Cross(chromosome1,chromosome2);
        tempPopulation(i,:)=newChromosomePair(1,:);
        tempPopulation(i+1,:)=newChromosomePair(2,:);
      else
        tempPopulation(i,:)=chromosome1;
        tempPopulation(i+1,:)=chromosome2;
      end
    end %loop over population
    
    for i =1:populationSize
      originalChromosome= tempPopulation(i,:);
      mutatedChromosome= Mutate(originalChromosome,mutationProbability);
      tempPopulation(i,:)=mutatedChromosome;
    end
    
    
    population=InsertBestIndividual(tempPopulation,population(bestIndividualIndex,:),nc);%Elitism

    
    plotvector= get(bestPlotHandle,'YData');
    plotvector(iGeneration)=maximumFitness;
    set(bestPlotHandle,'YData',plotvector);
    set(textHandle,'String',sprintf('best: %4.3f',maximumFitness));
    set(populationPlotHandle,'XData',decodedPopulation(:,1),'YData',...
      decodedPopulation(:,2),'ZData',fitness)
    drawnow;
    
  end %loop over generations
  bestFitnessOfLastGeneration(iteration)=maximumFitness; %For every iteration
  bestxValuesOfLastGeneration(iteration,:)=xBest; 
end
maximumFitnessAvg=sum(bestFitnessOfLastGeneration)/numberOfIterations;
bestxValuesAvg(1)=sum(bestxValuesOfLastGeneration(:,1));
bestxValuesAvg(2)=sum(bestxValuesOfLastGeneration(:,2));
%print final results
minimumOfgAvg=1/maximumFitnessAvg;
disp('bestxValuesAvg');
disp(xBest);
disp('minimumOfg');
disp(minimumOfgAvg);