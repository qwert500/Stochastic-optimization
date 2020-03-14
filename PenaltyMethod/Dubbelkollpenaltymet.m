x1=linspace(-10,10);
x2=linspace(-10,10);
my=0;

fp=(x1-1).^2+2*(x2-2).^2+my*(x1.^2+x2.^2-1).^2;
for i=1:length(x1)
  for j=1:length(x2)
    Z(i,j)=(x1(i)-1).^2+2*(x2(j)-2).^2;
  end
end

surf(x1,x2,Z)
