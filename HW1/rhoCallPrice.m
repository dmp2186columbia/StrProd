function [ Rho ] = rhoCallPrice(N,S,T,r,delta,sigma,a,b)
	Rho = (callPrice(N,S,T,r+0.0001,delta,sigma,a,b) - callPrice(N,S,T,r-0.0001,delta,sigma,a,b))/0.0002;
end