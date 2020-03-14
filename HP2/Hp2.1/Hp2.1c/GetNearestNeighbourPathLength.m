function nearestNeighbourPathLength=GetNearestNeighbourPathLength(cityLocation)

r=randi(size(cityLocation,1));
cityLocationsLeft=cityLocation;
index=r;
totalDistance=0;
pathDist=zeros(size(cityLocation,1),1);

for j=1:size(cityLocation,1)
  
    currentPoint=cityLocationsLeft(index,:);
    cityLocationsLeft(index,:)=[];
    distance=size(cityLocationsLeft,1);
    
    for i=1:size(cityLocationsLeft,1)
      distance(i)=norm(currentPoint-cityLocationsLeft(i,:));
    end
    
    [value,index]=min(distance(:));
    pathDist(j)=value;

end
    distance2=norm(cityLocation(r,:)-currentPoint);

for j=1:size(cityLocation,1)
  totalDistance=pathDist(j)+totalDistance;
end

totalDistance=totalDistance+distance2;
nearestNeighbourPathLength=totalDistance;
end

















