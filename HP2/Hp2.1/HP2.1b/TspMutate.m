function mutatedChromosome= TspMutate(chromosome,mutationProbability)
nCities=size(chromosome,2);
mutatedChromosome= chromosome;

for i= 1:nCities
  r=rand;
  
  if (r<mutationProbability)
    swap1=randi(nCities);
    swap2=randi(nCities);
    
    mutatedChromosome(swap2)= chromosome(swap1);
    mutatedChromosome(swap1)=chromosome(swap2);
  end
  chromosome=mutatedChromosome;
end

end
