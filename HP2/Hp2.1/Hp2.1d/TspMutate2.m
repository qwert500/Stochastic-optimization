function mutatedChromosome= TspMutate2(chromosome)
%Mutates 3 to 10 genes of chromosome
nCities=size(chromosome,2);
r=randi([3,10],1);
mutatedChromosome= chromosome;

for i= 1:r
  swap1=randi(nCities);
  swap2=randi(nCities);
  
  mutatedChromosome(swap2)= chromosome(swap1);
  mutatedChromosome(swap1)=chromosome(swap2);
  
  chromosome=mutatedChromosome;
end
end
