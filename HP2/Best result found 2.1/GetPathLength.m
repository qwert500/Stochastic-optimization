function pathLength=GetPathLength(path,cityLocation)
distance=0;
for i=1:size(path,1)-1
  distance=norm(cityLocation(path(i),:)-cityLocation(path(i+1),:))+distance;
end
pathLength=distance+norm(cityLocation(path(1),:)-cityLocation(path(size(path,1)),:));