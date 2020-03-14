function population=InsertBestIndividual(population,bestIndividual,nc)

for i=1:nc
  population(i,:)=bestIndividual;
end
end