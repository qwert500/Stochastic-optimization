function velocities=updateVelocities(v,x,w,deltaT,xPB,xSB,c1,c2,q,r)
velocities=zeros(size(v,1),size(v,2));
for i=1:size(v,1)
  for j=1:size(v,2)
    velocities(i,j)=w*v(i,j)+c1*q(i,j)*((xPB(i,j)-x(i,j))/deltaT)+...
      c2*r(i,j)*((xSB(j)-x(i,j))/deltaT);
  end
end
end