function path=GeneratePath(pheromoneLevel, visibility, alpha, beta)
startingPoint=randi(size(visibility,1));
tabuList=zeros(size(visibility,1),1);
tabuList(1)=startingPoint;
P=zeros(size(visibility,1),1);

for k=1:size(visibility,1)
  denominator=0;
  for l=1:size(visibility,1)
    
    memberOfTabuList=ismember(l,tabuList);
    if memberOfTabuList==0
      denominator=pheromoneLevel(l,tabuList(k))^alpha*visibility(l,tabuList(k))^beta+denominator;
    end
  end
  
  for i=1:size(visibility,1) % 'i' city destination
    memberOfTabuList=ismember(i,tabuList);
    if memberOfTabuList==0
      P(i)=pheromoneLevel(i,tabuList(k))^alpha*visibility(i,tabuList(k))^beta...
        /denominator;
    else
      P(i)=0;
    end
  end
  
  rouletteWheel=cumsum(P); %roulette Wheel selection
  randomNumber=rand(1);
  for i=1:size(rouletteWheel,1)
    if randomNumber<rouletteWheel(i)
      tabuList(k+1)=i;
      break
    end
  end
end
path=tabuList;
end




