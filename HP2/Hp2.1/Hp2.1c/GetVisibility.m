function visibility = GetVisibility(cityLocation)
visibility=zeros(size(cityLocation,1),size(cityLocation,1));

for i=1:size(cityLocation,1)
  for j=1:size(cityLocation,1)
    if i==j
      visibility(i,j)=0;
    else
      visibility(i,j)=1/(norm(cityLocation(i,:)-cityLocation(j,:)));
    end
  end
end

end