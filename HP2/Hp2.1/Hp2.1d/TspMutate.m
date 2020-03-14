function mutatedChromosome= TspMutate(chromosome,mutationProbability)
nCities=size(chromosome,2);
mutatedChromosome= chromosome;

for i= 1:nCities
    r=rand;
    if (r<mutationProbability)
      swap=randi(nCities);
        mutatedChromosome(i)= chromosome(swap);
        mutatedChromosome(swap)=chromosome(i);
    end
    chromosome=mutatedChromosome;
end

end
