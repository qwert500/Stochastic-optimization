function x =DecodeChromosome(chromosome, n, variableRange)
m=size(chromosome,2); %Length of  chromosome
k=fix(m/n); % Number of bits of chromosome per variable

for i=1:n
  x(i)=0.0;
  for j=1:k
    x(i)=x(i)+ chromosome(j+k*(i-1))*2^(-j);
  end
  x(i)=-variableRange + 2*variableRange*x(i)/(1-2^(-k));
end

end
