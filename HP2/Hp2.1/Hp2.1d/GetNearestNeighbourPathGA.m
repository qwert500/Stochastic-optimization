function nearestNeighbourPath=GetNearestNeighbourPathGA(cityLocation)

r=randi(size(cityLocation,1)); %Random starting town
index=r;
tabuList=zeros(size(cityLocation,1),1);

for k=1:size(cityLocation,1)
  
  tabuList(k)=index;
  distance=zeros(size(cityLocation,1)-k,1);
  cityIndex=zeros(size(cityLocation,1)-k,1);
  i=0;
  
  for j=1:size(cityLocation,1)
    
    memberOfTabuList=ismember(j,tabuList);
    
    if memberOfTabuList==0 %evaluate for all unvisited cities
      i=i+1;
      distance(i)=norm(cityLocation(j,:)-cityLocation(tabuList(k),:));
      cityIndex(i)=j;
    end
  end
  if k==size(cityLocation,1)
    
  else
    [value,index]=min(distance); %(Doesn't need 'value')
    index=cityIndex(index);
  end
  nearestNeighbourPath=tabuList;
end



