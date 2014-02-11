function [ Delta ] = deltaCallPrice(N,S,T,r,delta,sigma,a,b)
	Delta = (callPrice(N,S+1,T,r,delta,sigma,a,b) - callPrice(N,S-1,T,r,delta,sigma,a,b))/2;
end