function iSelected = TournamentSelect(fitness,tournamentSelectionParameter,tournamentSize)

populationSize= size(fitness,1);
iTmp=zeros(tournamentSize,2);

for i=1:tournamentSize % picks 'tournamentSize' random competitors from the population
  iTmp(i,1)=1 + fix(rand*populationSize);
end

for i=1:tournamentSize % picks out fitness of the selected individuals
  iTmp(i,2)=fitness(iTmp(i,1));
end

iTmp=sortrows(iTmp,-2);

for i=1:size(iTmp,2) % The tournament
  r=rand;
  if r<tournamentSelectionParameter
    iSelected=iTmp(i,1);
    break
  elseif i==size(iTmp,2)
    iSelected=iTmp(i,1);
  end
end

end

