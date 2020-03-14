function population=InsertBestIndividual(tempPopulation,bestIndividual,nc)
population=tempPopulation;

for i=1:nc
  population(i,:)=bestIndividual;
end
end