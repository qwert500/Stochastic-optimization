function NewtonRaphsonStep=NewtonRaphsonStep(b,Fprim,Fbis)
syms x
df= subs(Fprim,x,b); %substitutes symbols for inserted values b and compute df/dx and d^2f/dx^2
ddf= subs(Fbis,x,b);
b= b-df/ddf;% one step, according to course book p.22
NewtonRaphsonStep=b;
